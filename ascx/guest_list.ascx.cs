using System;
using System.Collections.Generic;
using com.hujun64.logic;
using com.hujun64.po;
using com.hujun64.type;
using com.hujun64.util;
namespace com.hujun64
{
   

    public partial class geust_list : System.Web.UI.UserControl
    {

        
        
        
        public string title = "", metaDescription = "������ѯ���⼰�ش��б�";


        protected string myLocation = "", currentPageIndex = "";
        
        protected string moduleName = Total.ModuleNameFlzx;
        protected string bigClassId;
        protected string contactId;
        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!this.IsPostBack)
            {
                bigClassId = Request.QueryString[Total.QueryStringBigClassId];
                IMainClassService classService = ServiceFactory.GetMainClassService();
                string moduleId = classService.GetClassByName(moduleName, Total.SiteId).id;
                PageInfo pageInfo = UtilHtml.GetPageInfo(bigClassId, null, moduleId, PageType.GUESTBOOK_TYPE);
                myLocation = pageInfo.locationHref;
                title = pageInfo.title;

                IArticleService articleService = ServiceFactory.GetArticleService();
                contactId = articleService.GetArticleByTitle(com.hujun64.Total.ContactWorkdayArticleTitle, false).id;

                RPDataBind();
            }

        }
        private void RPDataBind()
        {
            AspNetPager1.AlwaysShow = true;
            AspNetPager1.PageSize = Total.PageSizeGuestbook;

            if (AspNetPager1.CurrentPageIndex > 1)
                currentPageIndex = "_��" + AspNetPager1.CurrentPageIndex.ToString() + "ҳ";
            else
                currentPageIndex = "";

            title += currentPageIndex;

            
           int totalCount;
           IGuestbookService guestbookService = ServiceFactory.GetGuestbookService();
            List<Guestbook> guestbookList=guestbookService.GetTopGuestbookList(bigClassId, (AspNetPager1.CurrentPageIndex - 1) * Total.PageSizeGuestbook+1, Total.PageSizeGuestbook,out totalCount);
            AspNetPager1.RecordCount = totalCount;
            RepeaterGuestList.DataSource = guestbookList;
            RepeaterGuestList.DataBind();

          
            
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

        }
        #endregion
    }
}
