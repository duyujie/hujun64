namespace com.hujun64
{
    using System;
    using com.hujun64.type;
    using com.hujun64.util;
    /// <summary>
    ///		show ��ժҪ˵����
    /// </summary>
    public partial class lawyer_search : System.Web.UI.UserControl
    {


        public string title = "��ʦ����ʦ��������Ϣ��ѯ";

        protected string myLocation = "";
        protected string moduleName = Total.ModuleNameLsjs;

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!this.IsPostBack)
            {
                myLocation = UtilHtml.GetPageInfo(moduleName, PageType.INTRO_TYPE).locationHref;
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
        /// �����֧������ķ��� - ��Ҫʹ�ô���༭���޸�
        /// �˷��������ݡ�
        /// </summary>
        private void InitializeComponent()
        {

        }
        #endregion



    }
}
