using System;
using com.hujun64.po;
using com.hujun64.type;
using com.hujun64.util;
using com.hujun64.logic;

namespace com.hujun64
{
    /// <summary>
    /// news_show 的摘要说明。
    /// </summary>
    public partial class showdetail : PageBase
    {
        protected string bigClassId = null, smallClassId = null;
        private IArticleService articleService = ServiceFactory.GetArticleService();
        private IMainClassService classService = ServiceFactory.GetMainClassService();

        protected void Page_Load(object sender, System.EventArgs e)
        {
            string articleId = Request.QueryString[Total.QueryStringArticleId];
           
            Article article = articleService.GetArticle(articleId, true);
            if (article != null && string.IsNullOrEmpty(article.content) && article.articlePicture != null)
            {
                Response.Redirect("img_show.aspx?" + Total.QueryStringArticleId + "=" + articleId, true);
                return;
            }

            smallClassId = article.class_id;
            bigClassId = article.big_class_id;

            if (!string.IsNullOrEmpty(article.class_id) && string.IsNullOrEmpty(article.big_class_id))
            {
                smallClassId = article.class_id;
                bigClassId = classService.GetBigClassBySmall(article.class_id).id;
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
