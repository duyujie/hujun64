using System;
using System.Data;
using com.hujun64.logic;

namespace com.hujun64
{
   
    /// <summary>
    ///	�շѱ�׼
    /// </summary>
    public partial class index_fee : System.Web.UI.UserControl
    {


        private IArticleService articleService = ServiceFactory.GetArticleService();
        private IMainClassService classService = ServiceFactory.GetMainClassService();

        protected string moduleName = Total.ModuleNameSfbz;
        protected string moduleUrl = com.hujun64.Total.AspxUrlFee;
        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!this.IsPostBack)
            {

                string bigClassId = Request.QueryString[Total.QueryStringBigClassId];
                string smallClassId = Request.QueryString[Total.QueryStringSmallClassId];



                if (string.IsNullOrEmpty(bigClassId) && !string.IsNullOrEmpty(smallClassId))
                {
                    bigClassId = classService.GetBigClassBySmall(smallClassId).id;
                }

                int maxRows = Total.MaxRowsIndexFee;
                if (Request.CurrentExecutionFilePath.Contains(Total.AspxUrlFee))
                {
                    maxRows = Int32.MaxValue;
                }
                string moduleClassId = classService.GetClassByName(moduleName, Total.SiteId).id;


                RepeaterIndexFee.DataSource = articleService.GetTopArticle(bigClassId, smallClassId, moduleClassId, 1, maxRows);
                RepeaterIndexFee.DataBind();
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
