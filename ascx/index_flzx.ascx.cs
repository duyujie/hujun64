using System;
using System.Text;
using System.Data;
using com.hujun64.po;
using com.hujun64.logic;

namespace com.hujun64
{

    /// <summary>
    ///	法律咨询
    /// </summary>
    public partial class index_flzx : System.Web.UI.UserControl
    {

      

        protected string moduleName = Total.ModuleNameFlzx;
        protected string moreUrl;

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!this.IsPostBack)
            {

                string bigClassId = Request.QueryString[Total.QueryStringBigClassId];
                string smallClassId = Request.QueryString[Total.QueryStringSmallClassId];
                string articleId = Request.QueryString[Total.QueryStringArticleId];

                if (!string.IsNullOrEmpty(articleId))
                {

                    Article article = ServiceFactory.GetArticleService().GetArticle(articleId, false);

                    bigClassId = article.big_class_id;
                    smallClassId = article.class_id;
                }



                if (string.IsNullOrEmpty(bigClassId) && !string.IsNullOrEmpty(smallClassId))
                {
                    bigClassId = ServiceFactory.GetMainClassService().GetBigClassBySmall(smallClassId).id;
                }



                StringBuilder moreUrlSb = new StringBuilder(Total.AspxUrlGuestbook);
                if (!string.IsNullOrEmpty(bigClassId))
                {
                    moreUrlSb.Append("?");
                    moreUrlSb.Append(Total.QueryStringBigClassId);
                    moreUrlSb.Append("=");
                    moreUrlSb.Append(bigClassId);
                }

                moreUrl = moreUrlSb.ToString();




                IGuestbookService guestboookService = ServiceFactory.GetGuestbookService();
                RepeaterIndexFlzx.DataSource = guestboookService.GetTopGuestbookList(bigClassId, Total.MaxRowsIndexFlzx);
                RepeaterIndexFlzx.DataBind();
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
