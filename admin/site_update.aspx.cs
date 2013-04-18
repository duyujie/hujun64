using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Web;
using com.hujun64.logic;
using com.hujun64.type;
using com.hujun64.util;
using com.hujun64.po;

namespace com.hujun64.admin
{
    /// <summary>
    /// add_art 的摘要说明。
    /// </summary>
    public partial class site_update : AdminPageBase
    {


        private static readonly log4net.ILog log = log4net.LogManager.GetLogger("SiteUpdate");

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!this.IsPostBack)
            {
                DropDownlistUpdateSite.Items.Add(RefreshType.ONLY_CHANGED);
                DropDownlistUpdateSite.Items.Add(RefreshType.ONLY_GUESTASK);
                DropDownlistUpdateSite.Items.Add(RefreshType.ALL_FRAME_HTML);
                DropDownlistUpdateSite.Items.Add(RefreshType.ALL_MODULE_LIST);
                DropDownlistUpdateSite.Items.Add(RefreshType.ALL_ARTICLE);
                DropDownlistUpdateSite.Items.Add(RefreshType.ALL_GUESTBOOK);
                DropDownlistUpdateSite.Items.Add(RefreshType.ALL_SITE);





                DropDownlistUpdateSite.SelectedValue = RefreshType.ONLY_CHANGED;
            }
        }
        protected void refreshCache_Click(object sender, System.EventArgs e)
        {
            ServiceFactory.RefreshAllCache();
            MSG.Text = "<font color=red>缓存已经成功更新！</font>";
            Response.Write("<script>javascript:alert('缓存已经成功更新！');</script>");

        }
        protected void ButtonTest_Click(object sender, System.EventArgs e)
        {
            //ServiceFactory.GetBackupService().BackupArticleGuestbook();
        }
        protected void ButtonSyncMirror_Click(object sender, System.EventArgs e)
        {
            DateTime beginTime = System.DateTime.Now;

            ServiceFactory.GetBackupService().BackupArticleGuestbook();

            DateTime endTime = System.DateTime.Now;
            TimeSpan span = endTime - beginTime;

            int spanSeconds = span.Minutes * 60 + span.Seconds;
            MSG.Text = "<font color=red>镜像网站同步已经成功完成！ 耗时:" + spanSeconds.ToString() + "秒</font>";
        }
        protected void refreshSite_Click(object sender, System.EventArgs e)
        {
            //异步获取IP归属地
            AsyncTaskService.GetIpProvinceAsync();

            //异步获取客户手机归属地
            AsyncTaskService.GetClientMobileProvinceAsync();

            //备份网站文章和留言
            //ServiceFactory.GetBackupService().BackupArticleGuestbook();


            UtilStatic aspx2Html = UtilStatic.GetInstance();

            DateTime beginTime = System.DateTime.Now;
            int pageConverted = 0;
            try
            {
                pageConverted = aspx2Html.ConvertAll(DropDownlistUpdateSite.SelectedValue);


                DateTime endTime = System.DateTime.Now;
                TimeSpan span = endTime - beginTime;

                int spanSeconds = span.Minutes * 60 + span.Seconds;


                MSG.Text = pageConverted + "个静态页面已经成功更新！ 耗时:" + spanSeconds.ToString() + "秒";

            }
            catch (Exception ex)
            {
                log.Error("更新出错", ex);
                MSG.Text = ex.ToString();

            }
            Response.Write("<script>javascript:alert('" + MSG.Text + "');</script>");
            ButtonRefreshSite.Enabled = true;




        }
        protected void updateIndex_Click(object sender, System.EventArgs e)
        {


            DateTime beginTime = System.DateTime.Now;

            int indexCount = 0;

            List<ArticleBase> articleList = ServiceFactory.GetArticleService().GetAllArticlesIndex();
            LuceneSearcher.WriteIndex(articleList, true);
            indexCount = articleList.Count;


            DateTime endTime = System.DateTime.Now;
            TimeSpan span = endTime - beginTime;

            int spanSeconds = span.Minutes * 60 + span.Seconds;


            MSG.Text = "<font color=red>" + indexCount + "篇文章已经成功更新索引！ 耗时:" + spanSeconds.ToString() + "秒</font>";
            Response.Write("<script>javascript:alert('" + indexCount + "篇文章已经成功更新索引！" + "');</script>");


            ButtonRefreshSite.Enabled = true;




        }
        private void displayFileInfo(string destFullpath)
        {
            //得到这个文件的相关属性:文件名,文件类型,文件大小 
            fname.Text = destFullpath;
            fenc.Text = myFile.PostedFile.ContentType;
            fsize.Text = myFile.PostedFile.ContentLength.ToString("###,##0");
        }
        protected void UploadFile(object sender, EventArgs E)
        {
            //检查上传文件不为空 
            if (myFile.PostedFile != null)
            {

                try
                {
                    string filename = UtilString.GetPureFilename(myFile.PostedFile.FileName);

                    if (string.IsNullOrEmpty(destFilepath.Value))
                        destFilepath.Value = "~\\uploads\\";

                    StringBuilder destFilepathSb = new StringBuilder(destFilepath.Value.Trim());
                    if (!destFilepathSb.ToString().EndsWith("\\"))
                        destFilepathSb.Append("\\");

                    destFilepathSb.Append(filename);
                    string destFullpath = Server.MapPath(destFilepathSb.ToString());

                    myFile.PostedFile.SaveAs(destFullpath);
                    Response.Write("<script>javascript:alert('文件上传成功！');</script>");
                    MSG_File.Text = "<font color=red>文件上传成功！</font>";
                    displayFileInfo(destFullpath);
                }
                catch (Exception ex)
                {
                    MSG_File.Text = "<font color=red>" + ex.Message + "</font>";
                }

            }
        }
        protected void ImportClientInfo(object sender, EventArgs E)
        {
            if (string.IsNullOrEmpty(ClientFilePath.Value))
                return;

            string csvFilepath = Server.MapPath(ClientFilePath.Value);


            IClientService clientService = ServiceFactory.GetClientService();


            int iSucessed = clientService.ImportClient(csvFilepath);


            LabelImport.Text = "导入客户信息成功： " + iSucessed.ToString() + "条！";
            Response.Write("<script>javascript:alert('" + LabelImport.Text + "');</script>");

            File.Delete(csvFilepath);
        }


        #region Web 窗体设计器生成的代码
        override protected void OnInit(EventArgs e)
        {
            //
            // CODEGEN: 该调用是 ASP.NET Web 窗体设计器所必需的。
            //
            InitializeComponent();
            base.OnInit(e);
        }

        /// <summary>
        /// 设计器支持所需的方法 - 不要使用代码编辑器修改
        /// 此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {


        }
        #endregion
    }
}
