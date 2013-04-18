using System;
using System.Data;
using System.Text;
using System.Web;
using System.Collections.Generic;
using com.hujun64.util;
using com.hujun64.po;
using com.hujun64.logic;
using com.hujun64.type;


namespace com.hujun64
{
    
    /// <summary>
    ///		result ��ժҪ˵����
    /// </summary>
    public partial class result : System.Web.UI.UserControl
    {
        
        protected string keywords, selectstr;
        protected int resultCount;
        protected string currentPageIndex = "";

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!this.IsPostBack)
            {
                keywords = Request.QueryString["key"];
                selectstr = Request.QueryString["selectstr"];
            }

           
            
        }
       
        private void RPDataBind()
        {
            if (String.IsNullOrEmpty(keywords.Trim()))
                return;

            if (AspNetPager1.CurrentPageIndex > 1)
                currentPageIndex = "_��" + AspNetPager1.CurrentPageIndex.ToString() + "ҳ";
            else
                currentPageIndex = "";

            

            AspNetPager1.AlwaysShow = true;
            AspNetPager1.PageSize = Total.PageSizeListitem;
            SearchResult sr=null;
            resultCount = 0;
            IArticleService articleService = ServiceFactory.GetArticleService();
            if (selectstr == SearchType.ALL)
            {

                sr = articleService.SearchArticle(keywords, selectstr);
                sr.Merge(LuceneSearcher.SearchArticle(keywords), "id"); 
            }
            else if (selectstr == SearchType.TITLE || selectstr == SearchType.AUTHOR)
            {
                sr = articleService.SearchArticle(keywords, selectstr);

            }
            else if (selectstr == SearchType.KEYWORDS)
            {
                sr = LuceneSearcher.SearchArticle(keywords);

            }
            else
            {
                return;
            }
            

            if (sr != null)
            {
                resultCount = sr.ResultCount;
                

                DataSet ds = sr.ResultDataSet;
                DataTable table = UtilData.GetPagedTable(sr.ResultDataSet.Tables[0], AspNetPager1.CurrentPageIndex, AspNetPager1.PageSize);

                DataListResult.DataSource = table;
                DataListResult.DataBind();


            }
            AspNetPager1.RecordCount = resultCount;
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
