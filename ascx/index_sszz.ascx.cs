using System;
using System.Text;
using System.Collections.Generic;
using com.hujun64.po;
using com.hujun64.logic;

namespace com.hujun64
{
   
    /// <summary>
    ///	��������
    /// </summary>
    public partial class index_sszz : System.Web.UI.UserControl
    {

        private IArticleService articleService = ServiceFactory.GetArticleService();
        private IMainClassService classService = ServiceFactory.GetMainClassService();

        protected string moduleName = Total.ModuleNameSszz;
        protected string moduleId,moduleUrl;
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

                    Article article = articleService.GetArticle(articleId, false);

                    bigClassId = article.big_class_id;
                    smallClassId = article.class_id;
                }
                if (string.IsNullOrEmpty(bigClassId) && !string.IsNullOrEmpty(smallClassId))
                {
                    bigClassId = classService.GetBigClassBySmall(smallClassId).id;
                }

                moduleId = classService.GetClassByName(moduleName, Total.SiteId).id;
                moduleUrl = classService.GetModuleUrl(moduleName);


                StringBuilder moreUrlSb = new StringBuilder(moduleUrl);
                if (!string.IsNullOrEmpty(bigClassId))
                {
                    moreUrlSb.Append("&");
                    moreUrlSb.Append(Total.QueryStringBigClassId);
                    moreUrlSb.Append("=");
                    moreUrlSb.Append(bigClassId);
                }
                if (!string.IsNullOrEmpty(smallClassId))
                {
                    moreUrlSb.Append("&");
                    moreUrlSb.Append(Total.QueryStringSmallClassId);
                    moreUrlSb.Append("=");
                    moreUrlSb.Append(smallClassId);
                }
                moreUrl = moreUrlSb.ToString();



                List<Article> articleList;
                if (Request.CurrentExecutionFilePath.Contains(Total.AspxUrlIndex) || Request.CurrentExecutionFilePath.Contains(Total.AspxUrlBigClass))
                    articleList = articleService.GetTopArticle(bigClassId, smallClassId, moduleId, 1, Total.MaxRowsIndexSszzIndex);
                else
                    articleList = articleService.GetTopArticle(bigClassId, smallClassId, moduleId, 1, Total.MaxRowsIndexSszz);



                RepeaterIndexSszz.DataSource = articleList;
                RepeaterIndexSszz.DataBind();

            }

        }

        #region Web ������������ɵĴ���
        override protected void OnInit(EventArgs e)
        {
            //
            // CODEGEN: �õ����� ASP.NET Web ���������������ġ�
            //
            InitializeComponent();
            base.OnInit(e);
        }

        /// <summary>
        ///		�����֧������ķ��� - ��Ҫʹ�ô���༭��
        ///		�޸Ĵ˷��������ݡ�
        /// </summary>
        private void InitializeComponent()
        {

        }
        #endregion
    }
}
