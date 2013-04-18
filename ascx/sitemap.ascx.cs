using System;
using System.Data;
using com.hujun64.logic;
namespace com.hujun64
{
    
    public partial class sitemap : System.Web.UI.UserControl
    {

      

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                repeaterMenuRoot.DataSource = ServiceFactory.GetMainClassService().GetDropMenuClassByBoot(0, Total.SiteId);
                repeaterMenuRoot.DataBind();
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
           // repeaterMenuRoot.ItemDataBound += new RepeaterItemEventHandler(repeaterMenuRoot_ItemDataBound);
        }
        #endregion

       
    }
}