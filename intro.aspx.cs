using System;
using com.hujun64.type;
using com.hujun64.util;
namespace com.hujun64
{
   
    /// <summary>
    ///		ascx_contact ��ժҪ˵����
    /// </summary>
    public partial class intro : PageBase
    {

        protected string myLocation = "";
        private string moduleName = Total.ModuleNameLsjs;
        protected void Page_Load(object sender, EventArgs e)
        {
            myLocation = UtilHtml.GetPageInfo(moduleName, PageType.INTRO_TYPE).locationHref;
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