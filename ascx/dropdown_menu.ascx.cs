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


        




        #region Web 窗体设计器生成的代码
        override protected void OnInit(EventArgs e)
        {
            //
            // CODEGEN: 该调用是 ASP.NET Web 窗体设计器所必需的。
            //
            InitializeComponent();
            base.OnInit(e);
        }

        /// <summary>
        ///		设计器支持所需的方法 - 不要使用代码编辑器
        ///		修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
             
        }
        #endregion
    }


}
