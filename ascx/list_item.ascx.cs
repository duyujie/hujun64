using System;
using System.Collections.Generic;
using System.Text;
using System.Web.UI.WebControls;
using com.hujun64.logic;
using com.hujun64.po;
using com.hujun64.util;



namespace com.hujun64
{


    /// <summary>
    ///		��ҳ����ʾ������������Ŀ
    /// </summary>
    public partial class list_item : System.Web.UI.UserControl
    {


        public string title = "";



        protected string bigClassId = "";
        protected string smallClassId = "";

        protected string moduleClassId;
        protected string myLocation = "";
        protected string classImgUrl;
        protected string currentPageIndex = "";
        public PageMeta pageMeta;
        public string pageMetaName;
        private IArticleService articleService = ServiceFactory.GetArticleService();
        private IMainClassService classService = ServiceFactory.GetMainClassService();

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!this.IsPostBack)
            {
                moduleClassId = Request.QueryString[Total.QueryStringModuleClassId];
                bigClassId = Request.QueryString[Total.QueryStringBigClassId];
                smallClassId = Request.QueryString[Total.QueryStringSmallClassId];

                if (string.IsNullOrEmpty(bigClassId) && !string.IsNullOrEmpty(smallClassId))
                {
                    bigClassId = classService.GetBigClassBySmall(smallClassId).id;
                }



                pageMetaName = classService.GetClassById(moduleClassId).class_name;


                pageMeta = UtilPageMeta.GetPageMeta(pageMetaName);


                PageInfo pageInfo = UtilHtml.GetPageInfo(bigClassId, smallClassId, moduleClassId);

                myLocation = pageInfo.locationHref;
                title = pageInfo.title;




                classImgUrl = UtilHtml.GetFullImageUrl(Total.ImgProfileUrl, UtilHtml.RemoveHtmlTag(Total.Profile));

                RPDataBind();
            }

        }
        private int itemRowCount = 0;
        protected void RepeaterArticles_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (itemRowCount == 10)
            {
                StringBuilder imgSb = new StringBuilder();
                imgSb.Append("<tbody><tr><td>");
                imgSb.Append(Total.BannerNoMatterUrl);
                imgSb.Append("</td></tr></tbody>");
                // e.Item.Controls.Add(new LiteralControl(imgSb.ToString()));
            }

            itemRowCount++;
        }
        private void RPDataBind()
        {
            if (AspNetPager1.CurrentPageIndex > 1)
                currentPageIndex = "_��" + AspNetPager1.CurrentPageIndex.ToString() + "ҳ";
            else
                currentPageIndex = "";

            title += currentPageIndex;

            AspNetPager1.AlwaysShow = true;
            AspNetPager1.PageSize = Total.PageSizeListitem;


            int totalCount = 0;
            List<Article> articleList = articleService.GetTopArticle(bigClassId, smallClassId, moduleClassId, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1) + 1, AspNetPager1.PageSize, out totalCount);
            AspNetPager1.RecordCount = totalCount;
            RepeaterArticles.DataSource = articleList;
            RepeaterArticles.DataBind();



        }

        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            RPDataBind();
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
            RepeaterArticles.ItemDataBound += new RepeaterItemEventHandler(RepeaterArticles_ItemDataBound);
        }
        #endregion
    }
}
