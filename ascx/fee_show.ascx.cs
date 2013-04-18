using System;
using System.Data;
using System.Collections.Generic;
using com.hujun64.po;
using com.hujun64.type;
using com.hujun64.util;
using com.hujun64.logic;

namespace com.hujun64
{
    
    /// <summary>
    ///		show 的摘要说明。
    /// </summary>
    public partial class fee_show : System.Web.UI.UserControl
    {
        public string articleTitle = "", articleKeywords = "", metaDescription = "";


        private IArticleService articleService = ServiceFactory.GetArticleService();
        private IMainClassService classService = ServiceFactory.GetMainClassService();
        protected bool hasAuthor = false;

       
        protected string myLocation = "";
        private string moduleName = Total.ModuleNameSfbz;
        protected string articleId = "";
        protected   Article  prevArticle,nextArticle;
        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!this.IsPostBack)
            {
                articleId = Request.QueryString[Total.QueryStringFeeId];
                string moduleId = classService.GetClassByName(moduleName, Total.SiteId).id;

                Article article;
                if (articleId == null)
                {
                    int maxSortSeq = articleService.GetMaxSortSeqOfModule(moduleId);
                    article = articleService.GetArticleByModueSeq(moduleId, maxSortSeq);

                }
                else
                {
                    article = articleService.GetArticle(articleId, true);
                }

                if (article != null && !string.IsNullOrEmpty(article.id))
                {
                    articleId = article.id;
                    if (!string.IsNullOrEmpty(article.author))
                    {
                        hasAuthor = true;
                    }

                    articleTitle = article.title;
                    articleKeywords = article.keywords;
                    //metaDescription = UtilHtml.ExtractMetaDesc(article);


                    myLocation = UtilHtml.GetPageInfo(moduleName, PageType.FEE_TYPE).locationHref;

                    if (string.IsNullOrEmpty(article.content))
                        article = articleService.GetArticle(article.id, true);


                    List<Article> articleList = new List<Article>(1);
                    articleList.Add(article);

                    RepeaterFee.DataSource = articleService.GetArticleList(articleId, true);
                    RepeaterFee.DataBind();

                    articleService.GetNeighborArticle(articleId, out prevArticle, out nextArticle);
                }
                else
                {
                    Response.Redirect(Total.SiteUrl);
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
