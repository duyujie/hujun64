using System;
using System.Data;
using System.Web.UI.WebControls;
using System.Text;
using System.Collections.Generic;
using com.hujun64.logic;
using com.hujun64.po;
namespace com.hujun64
{


    public partial class dropdown_menu : System.Web.UI.UserControl
    {
        private IMainClassService classService = ServiceFactory.GetMainClassService();
        protected string todayTips;
        protected DataView mydv = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                 

                mainMenuRepeater.DataSource = classService.Get1stDropMenuClass( Total.SiteId);
                mainMenuRepeater.DataBind();
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