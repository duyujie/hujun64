using System;
using com.hujun64.type;
namespace com.hujun64
{
    /// <summary>
    /// add_art 的摘要说明。
    /// </summary>
    public partial class webservice : PageBase
    {
        protected WebServiceActionType webServiceAction;

        protected void Page_Load(object sender, System.EventArgs e)
        {


            string action = Request.QueryString[Total.QueryStringAction];

            if (action != null && action.Equals(WebServiceActionType.SEARCH_LAWYER.ToString()))
            {
                //律师律所检索
                webServiceAction = WebServiceActionType.SEARCH_LAWYER;
                return;
            }
            else if (action != null && action.Equals(WebServiceActionType.SEARCH_IP.ToString()))
            {
                //IP地址地域查询                   
                webServiceAction = WebServiceActionType.SEARCH_IP;
                return;
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
