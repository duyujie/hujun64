using System;
using System.Data;
using com.hujun64.logic;

namespace com.hujun64
{
   
    /// <summary>
    ///	收费标准
    /// </summary>
    public partial class index_fee : System.Web.UI.UserControl
    {


        private IArticleService articleService = ServiceFactory.GetArticleService();
        private IMainClassService classService = ServiceFactory.GetMainClassService();

        protected string moduleName = Total.ModuleNameSfbz;
        protected string moduleUrl = com.hujun64.Total.AspxUrlFee;
        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!this.IsPostBack)
            {

                string bigClassId = Request.QueryString[Total.QueryStringBigClassId];
                string smallClassId = Request.QueryString[Total.QueryStringSmallClassId];



                if (string.IsNullOrEmpty(bigClassId) && !string.IsNullOrEmpty(smallClassId))
                {
                    bigClassId = classService.GetBigClassBySmall(smallClassId).id;
                }

                int maxRows = Total.MaxRowsIndexFee;
                if (Request.CurrentExecutionFilePath.Contains(Total.AspxUrlFee))
                {
                    maxRows = Int32.MaxValue;
                }
                string moduleClassId = classService.GetClassByName(moduleName, Total.SiteId).id;


                RepeaterIndexFee.DataSource = articleService.GetTopArticle(bigClassId, smallClassId, moduleClassId, 1, maxRows);
                RepeaterIndexFee.DataBind();
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
