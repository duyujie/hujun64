using System;
using System.Text;
using com.hujun64.po;

using com.hujun64.logic;

namespace com.hujun64
{
    
    /// <summary>
    ///	��������
    /// </summary>
    public partial class index_basj : System.Web.UI.UserControl
    {

        private IArticleService articleService = ServiceFactory.GetArticleService();
        private IMainClassService classService = ServiceFactory.GetMainClassService();

        protected string moduleName = Total.ModuleNameBasj;
        protected string moduleId,moduleUrl;
        protected string moreUrl;


        protected void Page_Load(object sender, System.EventArgs e)
        {
            string bigClassId = Request.QueryString[Total.QueryStringBigClassId];
            string smallClassId = Request.QueryString[Total.QueryStringSmallClassId];
            if (string.IsNullOrEmpty(bigClassId) && !string.IsNullOrEmpty (smallClassId))
            {
                bigClassId = classService.GetBigClassBySmall(smallClassId).id;
            }

            moduleId = classService.GetClassByName(moduleName,Total.SiteId).id;
            moduleUrl = classService.GetModuleUrl(moduleName);


            StringBuilder moreUrlSb = new StringBuilder(moduleUrl);
            if (!string.IsNullOrEmpty(bigClassId))
            {
                moreUrlSb.Append("&");
                moreUrlSb.Append(Total.QueryStringBigClassId);
                moreUrlSb.Append("=");
                moreUrlSb.Append(bigClassId);
            }
            if(!string.IsNullOrEmpty(smallClassId)){
                moreUrlSb.Append("&");
                moreUrlSb.Append(Total.QueryStringSmallClassId);
                moreUrlSb.Append("=");
                moreUrlSb.Append(smallClassId);
            }
            moreUrl = moreUrlSb.ToString();


          

            RepeaterIndexSszz.DataSource = articleService.GetTopArticle(bigClassId, smallClassId, moduleId, 1, Total.MaxRowsIndexBasj);
            RepeaterIndexSszz.DataBind();



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
