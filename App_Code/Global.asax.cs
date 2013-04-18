using System;
using System.Collections.Generic;
using System.Threading;
using System.Timers;
using System.Net;
using System.Text;
using System.Web;
using System.IO;
using com.hujun64.logic;
using com.hujun64.util;
using com.hujun64.po;
using com.hujun64.type;
using System.IO.Compression;

namespace com.hujun64
{
    /// <summary>
    /// Global 的摘要说明。
    /// </summary>
    public class Global : System.Web.HttpApplication
    {
        /// <summary>
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;
        private log4net.ILog log = log4net.LogManager.GetLogger("Global");
        private bool hasTaskInstanceRunnig = false;


        private static DateTime lastLogPurgeDate;
        private DateTime lastSiteUpdateDate;
        private List<int> refreshSiteHoursList = new List<int>(Total.RefreshSiteHoursArray.Length);


        public Global()
        {
            InitializeComponent();
        }

        protected void Application_Start(Object sender, EventArgs e)
        {
            try
            {

                if (Total.EnableCGW)
                    Total.CGWFileapth = Server.MapPath(Total.CGWFileapth);

                log4net.Config.XmlConfigurator.Configure();


                Total.SiteId = ServiceFactory.GetCommonService().GetSiteIdByName(Total.SiteName);

                foreach (string h in Total.RefreshSiteHoursArray)
                {
                    refreshSiteHoursList.Add(Convert.ToInt32(h));
                }


                log.Info("Application Start!");


                log.Debug("服务器名：" + HardwareInfo.GetHostName());

                StringBuilder sb = new StringBuilder();
                foreach (string serverIp in Total.ServerIpList)
                {
                    sb.Append(serverIp);
                    sb.Append("\n");
                }
                log.Info("服务器IP地址：\n" + sb.ToString());

                //定义定时器 
                log.Debug("启动定时器...");
                System.Timers.Timer myTimer = new System.Timers.Timer(Total.TimerInterval);
                myTimer.Elapsed += new ElapsedEventHandler(Timer_Elapsed);
                myTimer.Enabled = true;
                myTimer.AutoReset = true;
                log.Info("成功启动定时器！");


                ServiceFactory.GetCommonService().SetGlobalConfigValue(Total.CONVERTING_CONFIG, Boolean.FalseString);




                ServiceFactory.GetCommonService().CheckSiteStatus(Total.MonitorUrl);


                //备份网站文章和留言
                ServiceFactory.GetBackupService().BackupArticleGuestbook();



            }
            catch (Exception ex)
            {
                log.Error(ex.Message, ex);
            }
        }
        private void Timer_Elapsed(object source, ElapsedEventArgs e)
        {

            try
            {
                log.Info("定时器正常运行中！");
                if (!hasTaskInstanceRunnig)
                {

                    hasTaskInstanceRunnig = true;


                    Log_Purge();

                    Site_Update();

                    ServiceFactory.GetCommonService().CheckSiteStatus(Total.MonitorUrl);

                    ServiceFactory.GetBackupService().BackupArticleGuestbook();


                    hasTaskInstanceRunnig = false;

                }
                else
                {
                    log.Debug("已经有一个定时任务实例在运行，跳过！");
                }
            }
            catch (Exception ex)
            {
                hasTaskInstanceRunnig = false;
                log.Error("定时任务运行异常！", ex);
            }
        }
        //根据配置定义的时间点进行网站所有页面更新
        private void Site_Update()
        {
            string LAST_UPDATE_SITE_DATE = "LAST_SITE_UPDATE_DATE";


            try
            {
                ICommonService commonService = ServiceFactory.GetCommonService();


                string lastDateString = commonService.GetGlobalConfigValue(LAST_UPDATE_SITE_DATE);
                if (string.IsNullOrEmpty(lastDateString))
                {
                    lastSiteUpdateDate = DateTime.MinValue;
                }
                else
                {
                    lastSiteUpdateDate = Convert.ToDateTime(lastDateString);
                }
                if (lastSiteUpdateDate < (DateTime.Now.AddHours(-1)) && refreshSiteHoursList.Contains(DateTime.Now.Hour))
                {

                    log.Info("开始定时更新网站...");

                    GlobalConfig globalConfig = new GlobalConfig();
                    globalConfig.config_name = LAST_UPDATE_SITE_DATE;
                    globalConfig.config_value = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

                    //维护GlobalConfig     
                    commonService.MaintainGlobalConfig(globalConfig);






                    //异步获取IP归属地
                    AsyncTaskService.GetIpProvinceAsync();

                    //异步获取客户手机归属地
                    AsyncTaskService.GetClientMobileProvinceAsync();


                    //异步更新网站
                    AsyncTaskService.UpdateSiteAsync(RefreshType.ALL_FRAME_HTML);
                    Thread.Sleep(5 * 1000);
                    AsyncTaskService.UpdateSiteAsync(RefreshType.ALL_MODULE_LIST);


                    //重建索引
                    List<ArticleBase> articleList = ServiceFactory.GetArticleService().GetAllArticlesIndex();
                    LuceneSearcher.WriteIndex(articleList, true);

                }
            }
            catch (Exception ex)
            {
                log.Error("定时更新网站出错！", ex);
            }

        }




        //删除过期日志
        private void Log_Purge()
        {
            if (lastLogPurgeDate < (DateTime.Now.AddDays(-1)))
            {
                lastLogPurgeDate = DateTime.Now;

                log.Debug("开始删除过期日志...");


                int logPurged = ServiceFactory.GetCommonService().PurgeLog(Total.ExpiresLog);
                log.Debug("成功删除" + logPurged + "条日志！");
            }
        }



        protected void Session_Start(Object sender, EventArgs e)
        {
            if (Total.CurrentSiteUrl == null || !Total.CurrentSiteUrl.Contains(Total.SiteUrl))
            {

                foreach (string serverIp in Total.ServerIpList)
                {
                    foreach (string definedIp in Total.SiteIpArray)
                    {
                        if (serverIp.Trim().Equals(definedIp.Trim()))
                        {
                            Total.IsDefinedServer = true;
                            break;
                        }
                    }
                    if (Total.IsDefinedServer)
                        break;
                }

                Total.CurrentSiteUrl = "http://" + Request.Url.Authority;

                if (Total.IsDefinedServer)
                {
                    //Total.CurrentSiteUrl = Total.SiteUrl;
                    //Total.CurrentSiteRootUrl = Total.CurrentSiteUrl + "/";

                    Total.CurrentSiteRootUrl = Total.CurrentSiteUrl + "/";
                }
                else
                {
                    Total.CurrentSiteRootUrl = Total.CurrentSiteUrl + Request.ApplicationPath;
                }

                if (!Total.CurrentSiteRootUrl.EndsWith("/"))
                    Total.CurrentSiteRootUrl += "/";

            }
            if (string.IsNullOrEmpty(Total.ApplicationPath))
            {
                Total.ApplicationPath = Request.ApplicationPath;
            }
        }

        protected void Application_BeginRequest(Object sender, EventArgs e)
        {
            UtilHttp.CheckSqlHacker(Request, Response);
        }

        protected void Application_EndRequest(Object sender, EventArgs e)
        {

            //if (Request.CurrentExecutionFilePath.EndsWith("html"))
            //{
            //    FileGlobal.UpdateExecutingStatus(Request.CurrentExecutionFilePath, false);
            //}

        }

        protected void Application_AuthenticateRequest(Object sender, EventArgs e)
        {

        }

        protected void Application_Error(Object sender, EventArgs e)
        {

        }

        protected void Session_End(Object sender, EventArgs e)
        {


        }

        protected void Application_End(Object sender, EventArgs e)
        {
            log.Info("Application End!");




            //同步数据库点击数据
            //int i = PageGlobal.SyncClickToDB();
            //log.Info("同步数据库点击数据：" + i.ToString() + "条数据被更新！");

            //FileGlobal.ResetAllExecutingStatus();


            //下面的代码是关键，可解决IIS应用程序池自动回收的问题
            Thread.Sleep(1000);
            //这里设置你的web地址，可以随便指向你的任意一个aspx页面甚至不存在的页面，目的是要激发Application_Start


            UtilHttp.ExecHttpWebRequestUrlGet(Total.SiteUrl, Total.EncodingDefault);


        }

        #region Web 窗体设计器生成的代码
        /// <summary>
        /// 设计器支持所需的方法 - 不要使用代码编辑器修改
        /// 此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
        }
        #endregion
    }
}

