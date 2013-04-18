using System;
using com.hujun64.util;
using com.hujun64.type;
namespace com.hujun64
{
    /// <summary>
    /// add_art 的摘要说明。
    /// </summary>
    public partial class asynctask_page : PageBase
    {


        protected void Page_Load(object sender, System.EventArgs e)
        {

            //接收本地服务器通过url直接过来的网站页面更新请求
            if (!Request.UserHostAddress.Equals("127.0.0.1") && !Total.ServerIpList.Contains(Request.UserHostAddress))
            {
                log4net.LogManager.GetLogger("AsyncTaskPage").Warn("非服务器地址("+Request.UserHostAddress+")提交，属于非法的异步更新请求！");
                return;
            }

            string action = Request.Form[Total.QueryStringAction];
            try
            {

                if (action != null && action.Equals(AsyncTaskActionType.UPDATE_SITE.ToString()))
                {
                    //更新网站页面
                    string refreshQueryString = Request.Form[Total.QueryStringRefreshType];

                    if (!string.IsNullOrEmpty(refreshQueryString))
                    {
                        log4net.LogManager.GetLogger("AsyncTaskPage").Info("开始进行页面内容更新-异步");
                        UtilStatic aspx2Html = UtilStatic.GetInstance();
                        aspx2Html.ConvertAll(refreshQueryString);

                        return;
                    }
                }


            }
            catch (Exception ex)
            {
                log4net.LogManager.GetLogger(this.ToString()).Error("后台异步任务出错！", ex);
            }
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
