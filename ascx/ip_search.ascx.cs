namespace com.hujun64
{
    using System;
    using com.hujun64.util;
    /// <summary>
    ///		show ��ժҪ˵����
    /// </summary>
    public partial class ip_search : System.Web.UI.UserControl
    {


        public string title = "IP����λ�ò�ѯ";

        protected string myLocation = "IP����λ�ò�ѯ";
        protected string moduleName = "IP����λ�ò�ѯ";
       
        protected void Page_Load(object sender, System.EventArgs e)
        {
            

        }
        protected void submit_Click(object sender, System.EventArgs e)
        {
            if (!this.IsPostBack)
            {
                string ipProvince = InternetWebService.GetCountryCityByIp(ip.Text.Trim());

                ipProvinceLable.Text = "<font color=red>" + ipProvince + "</font>";
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
