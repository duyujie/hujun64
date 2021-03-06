using System;
using System.Data;

using com.hujun64.logic;

namespace com.hujun64
{
    
    /// <summary>
    ///	法律知识
    /// </summary>
    public partial class index_pfcs : System.Web.UI.UserControl
    {


        private IArticleService articleService = ServiceFactory.GetArticleService();
        private IMainClassService classService = ServiceFactory.GetMainClassService();

        protected string moduleName = Total.ModuleNameFlzs;
        protected string moduleId;
        protected string moduleUrl;

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!this.IsPostBack)
            {

                RepeaterIndexPfcs.DataSource = articleService.GetTopArticleByModuleName(moduleName, Total.MaxRowsIndexPfzs);
                RepeaterIndexPfcs.DataBind();


                moduleId = classService.GetClassByName(moduleName, Total.SiteId).id;
                moduleUrl = classService.GetModuleUrl(moduleName);
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
        ///		设计器支持所需的方法 - 不要使用代码编辑器
        ///		修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {

        }
        #endregion
    }
}
