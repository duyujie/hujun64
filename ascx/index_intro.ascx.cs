using System;
using System.Data;
using com.hujun64.logic;

namespace com.hujun64
{
   
    /// <summary>
    ///	��ʦ����
    /// </summary>
    public partial class index_intro : System.Web.UI.UserControl
    {

        private IArticleService articleService = ServiceFactory.GetArticleService();
 

        protected string moduleName = Total.ModuleNameLsjs;       
        protected string moduleUrl = com.hujun64.Total.AspxUrlIntro;
       
        protected void Page_Load(object sender, System.EventArgs e)
        {

            if (!this.IsPostBack)
            {
                RepeaterIndexIntro.DataSource = articleService.GetTopArticleByModuleName(moduleName, Total.MaxRowsIndexIntro);
                RepeaterIndexIntro.DataBind();


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
