using System;
using System.Collections.Generic;
using System.Data;
using com.hujun64.po;
using com.hujun64.type;
using com.hujun64.util;
using com.hujun64.logic;

namespace com.hujun64
{

    /// <summary>
    ///		show 的摘要说明。
    /// </summary>
    public partial class show : System.Web.UI.UserControl
    {
        public string articleTitle = "", articleKeywords = "";//,metaDescription = "";
        

        private IArticleService articleService = ServiceFactory.GetArticleService();

        protected string author, newsFrom;
        protected string imgUrl = "";


        protected string articleId = "";
        protected string myLocation = "";

        protected Article prevArticle, nextArticle;
        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!this.IsPostBack)
            {
                Article article;

                articleId = Request.QueryString[Total.QueryStringArticleId];
                if (string.IsNullOrEmpty(articleId) && !string.IsNullOrEmpty(Request.QueryString[Total.QueryStringDeletedArticleId]))
                {

                    article = articleService.GetDeletedArticle(Request.QueryString[Total.QueryStringDeletedArticleId].ToUpper(), true);

                }
                else
                {
                    articleId = articleId.ToUpper();
                    article = articleService.GetArticle(articleId, true);
                }

                if (!string.IsNullOrEmpty(article.id))
                {
                    if (!string.IsNullOrEmpty(article.author))
                    {
                        author = article.author;
                    }
                    else
                    {
                        author = "匿名";
                    }
                    if (!string.IsNullOrEmpty(article.news_from))
                    {
                        newsFrom = article.news_from;
                    }
                    else
                    {
                        newsFrom = "网络";
                    }
                    articleTitle = UtilHtml.RemoveHtmlTag(article.title);
                    articleKeywords = article.keywords;
                    //metaDescription = UtilHtml.ExtractMetaDesc(article);

                    myLocation = UtilHtml.GetPageInfo(article.big_class_id, article.class_id, article.module_class_id).locationHref;



                    if (article.articlePicture != null)
                    {
                        imgUrl = UtilHtml.GetFullImageUrl(article.articlePicture.pic_url, article.articlePicture.pic_alt);
                    }



                    List<Article> articleList = new List<Article>(1);
                    articleList.Add(article);
                    RepeaterNews.DataSource = articleList;
                    RepeaterNews.DataBind();

                    articleService.GetNeighborArticle(articleId, out prevArticle, out nextArticle);
                }
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
