using System;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Data;

using com.hujun64.po;
using com.hujun64.type;
using com.hujun64.logic;
namespace com.hujun64
{


    /// <summary>
    ///		head1 的摘要说明。
    /// </summary>
    public partial class header_frame : System.Web.UI.UserControl
    {

       
        protected string contactIdWorkday = "", contactIdWeekend = "";

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!this.IsPostBack)
            {
                loadNavigateMenu();

                IArticleService articleService = ServiceFactory.GetArticleService();

                Article articleWorkday = articleService.GetArticleByTitle(com.hujun64.Total.ContactWorkdayArticleTitle, false);
                contactIdWorkday = articleWorkday.id;

                Article articleWeekend = articleService.GetArticleByTitle(com.hujun64.Total.ContactWeekendArticleTitle, false);
                contactIdWeekend = articleWeekend.id;
            }
        }



        #region loadNavigateMenu
        protected void loadNavigateMenu()
        {
            IMainClassService mcSerivce=ServiceFactory.GetMainClassService();
            navigateMenuDataList.DataSource = mcSerivce.GetSiteClassByMain(mcSerivce.GetTopMenuClass(Total.SiteId),Total.SiteId);
            navigateMenuDataList.DataBind();

        }
        #endregion

        protected int menuRowCount = 1;
        protected void navigateMenuDataList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (menuRowCount % 2 == 0)
            {
                if (menuRowCount == 10) { }
                else
                {
                    e.Item.Controls.Add(new LiteralControl("</tr></tbody><tbody><tr>"));
                }

            }
            menuRowCount++;

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
            navigateMenuDataList.ItemDataBound += new RepeaterItemEventHandler(navigateMenuDataList_ItemDataBound);
        }
        #endregion






    }
}
