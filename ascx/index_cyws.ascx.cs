using System;
using System.Data;
using com.hujun64.logic;

namespace com.hujun64
{
  
    /// <summary>
    ///	��������
    /// </summary>
    public partial class index_cyws : System.Web.UI.UserControl
    {


        private IArticleService articleService = ServiceFactory.GetArticleService();
        private IMainClassService classService = ServiceFactory.GetMainClassService();

        protected string moduleName = Total.ModuleNameCyws;
        protected string moduleId;
        protected string moduleUrl;

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!this.IsPostBack)
            {

                RepeaterIndexCyws.DataSource = articleService.GetTopArticleByModuleName(moduleName, Total.MaxRowsIndexCyws);
                RepeaterIndexCyws.DataBind();

                moduleId = classService.GetClassByName(moduleName, Total.SiteId).id;
                moduleUrl = classService.GetModuleUrl(moduleName);
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
