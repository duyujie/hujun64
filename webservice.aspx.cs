using System;
using com.hujun64.type;
namespace com.hujun64
{
    /// <summary>
    /// add_art ��ժҪ˵����
    /// </summary>
    public partial class webservice : PageBase
    {
        protected WebServiceActionType webServiceAction;

        protected void Page_Load(object sender, System.EventArgs e)
        {


            string action = Request.QueryString[Total.QueryStringAction];

            if (action != null && action.Equals(WebServiceActionType.SEARCH_LAWYER.ToString()))
            {
                //��ʦ��������
                webServiceAction = WebServiceActionType.SEARCH_LAWYER;
                return;
            }
            else if (action != null && action.Equals(WebServiceActionType.SEARCH_IP.ToString()))
            {
                //IP��ַ�����ѯ                   
                webServiceAction = WebServiceActionType.SEARCH_IP;
                return;
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
