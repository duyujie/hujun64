namespace com.hujun64
{
    using System;
    using com.hujun64.type;
    using com.hujun64.util;
    /// <summary>
    ///		show 的摘要说明。
    /// </summary>
    public partial class lawyer_search : System.Web.UI.UserControl
    {


        public string title = "律师及律师事务所信息查询";

        protected string myLocation = "";
        protected string moduleName = Total.ModuleNameLsjs;

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!this.IsPostBack)
            {
                myLocation = UtilHtml.GetPageInfo(moduleName, PageType.INTRO_TYPE).locationHref;
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
