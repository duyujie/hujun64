using System;
using System.Text;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using com.hujun64.logic;
using com.hujun64.util;
using com.hujun64.po;
namespace com.hujun64
{
   
    /// <summary>
    ///		��ҳ����ʾ������������Ŀ
    /// </summary>
    public partial class list_class : System.Web.UI.UserControl
    {


        public string title;
        public PageMeta pageMeta;
        public string pageMetaName;
        protected string myLocation = "";
        protected string classImgUrl = "";
        protected string queryStringBigSmallClass = "";
        protected string bigClassId = "";
        protected string smallClassId = "";
        private IArticleService articleService = ServiceFactory.GetArticleService();
        private IMainClassService classService = ServiceFactory.GetMainClassService();

        protected void Page_Load(object sender, System.EventArgs e)
        {

            if (!this.IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString[Total.QueryStringBigClassId]))
                {
                    bigClassId = Request.QueryString[Total.QueryStringBigClassId];
                }
                else if (!string.IsNullOrEmpty(Request.QueryString[Total.QueryStringSmallClassId]))
                {
                    smallClassId = Request.QueryString[Total.QueryStringSmallClassId];
                } 

                if (string.IsNullOrEmpty(bigClassId) && !string.IsNullOrEmpty(smallClassId))
                {
                    bigClassId = classService.GetBigClassBySmall(smallClassId).id;
                }

               
                if (!string.IsNullOrEmpty(smallClassId))
                {
                    pageMetaName = classService.GetClassById(smallClassId).class_name;
                }
                else
                {
                    pageMetaName = classService.GetClassById(bigClassId).class_name;
                }

                pageMeta = UtilPageMeta.GetPageMeta(pageMetaName);

                StringBuilder querySb = new StringBuilder();
                if (!string.IsNullOrEmpty(bigClassId))
                {
                    querySb.Append("&");
                    querySb.Append(Total.QueryStringBigClassId);
                    querySb.Append("=");
                    querySb.Append(bigClassId);
                }
                if (!string.IsNullOrEmpty(smallClassId))
                {
                    querySb.Append("&");
                    querySb.Append(Total.QueryStringSmallClassId);
                    querySb.Append("=");
                    querySb.Append(smallClassId);
                }
                queryStringBigSmallClass = querySb.ToString();

                PageInfo pageInfo = UtilHtml.GetPageInfo(bigClassId, smallClassId, "");

                myLocation = pageInfo.locationHref;
                title = pageInfo.title;

               
                classImgUrl = UtilHtml.GetFullImageUrl(Total.ImgProfileUrl, UtilHtml.RemoveHtmlTag(Total.Profile));



                //��������²���ѭ����ʼ
                //Ƶ��            
                List<string> moduleNameList = new List<string>();
                moduleNameList.Add(Total.ModuleNameJdal);
                moduleNameList.Add(Total.ModuleNameBasj);
                moduleNameList.Add(Total.ModuleNameSyfg);
                moduleNameList.Add(Total.ModuleNameGrsb);

                dlCategories.DataSource = classService.GetSiteClassByMain(classService.GetModuleClassListByModuleNameList(moduleNameList,Total.SiteId),Total.SiteId);
                dlCategories.DataBind();
                //���������ѭ�����ֽ���

            }


        }

        private int moduleRowCount = 0;
        protected void dlCategories_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (moduleRowCount == 2)
            {
                StringBuilder imgSb = new StringBuilder("</div>");
                imgSb.Append("<div align=\"center\">");
                imgSb.Append(Total.BannerObjectUrl);
                imgSb.Append("</div><div class=\"DivModuleContainer\">");
                e.Item.Controls.Add(new LiteralControl(imgSb.ToString()));
            }
            else if (moduleRowCount == 4)
            {
                StringBuilder imgSb = new StringBuilder("</div>");
                imgSb.Append("<div align=\"center\">");
                imgSb.Append(Total.BannerHorseUrl);
                imgSb.Append("</div><div class=\"DivModuleContainer\">");
                e.Item.Controls.Add(new LiteralControl(imgSb.ToString()));

            }
            else if (moduleRowCount == 6)
            {
                StringBuilder imgSb = new StringBuilder();
                imgSb.Append("<div align=\"center\">");
                imgSb.Append(Total.BannerProfessionalUrl);
                imgSb.Append("</div>");
                e.Item.Controls.Add(new LiteralControl(imgSb.ToString()));
            }

            moduleRowCount++;

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                Repeater repeaterNoImgNews = (Repeater)e.Item.FindControl("RepeaterNoImgNews");
                SiteClass scClass = (SiteClass)e.Item.DataItem;
                //��ȡ����ID 
                string moduleClassId = scClass.mainClass.id;



                
                repeaterNoImgNews.DataSource = articleService.GetTopArticle(bigClassId, smallClassId, moduleClassId, 1, Total.MaxRowsListClass);
                repeaterNoImgNews.DataBind();
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
            dlCategories.ItemDataBound += new RepeaterItemEventHandler(dlCategories_ItemDataBound);
        }
        #endregion
    }
}
