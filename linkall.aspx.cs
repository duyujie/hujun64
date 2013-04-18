using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using com.hujun64.type;
using com.hujun64.util;
using com.hujun64.logic;

namespace com.hujun64
{
   
    /// <summary>
    ///	link 的摘要说明。
    /// </summary>
    public partial class linkall : PageBase
    {
       
        protected string myLocation = "";
        private string moduleName = Total.ModuleNameYqlj;
    
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Redirect(Total.AspxUrlBuilding);
            myLocation = UtilHtml.GetPageInfo(moduleName, PageType.LINK_ALL_TYPE).locationHref;

            RPDataBind();
        }


        private void RPDataBind()
        {
            ILinkService linkService = ServiceFactory.GetLinkService();

            
     

            RepeaterTextLink.DataSource = linkService.GetTopLink(ApproveStatus.APPROVED,Int32.MaxValue);
            RepeaterTextLink.DataBind();


            
            RepeaterImgLink.DataSource = linkService.GetTopLogoLink(ApproveStatus.APPROVED, Int32.MaxValue);
            RepeaterImgLink.DataBind();
         
        }

        protected int moduleTextRowCount = 1;
        protected void RepeaterTextLink_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            int columNumDefined = 4;
            if (moduleTextRowCount % columNumDefined == 0)
            {
                e.Item.Controls.Add(new LiteralControl("</tr></tbody><tbody><tr>"));

            }
            moduleTextRowCount++;
            
        }

        protected int moduleImgRowCount = 1;
        protected void RepeaterImgLink_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            int columNumDefined = 4;
            if (moduleImgRowCount % columNumDefined == 0)
            {
                e.Item.Controls.Add(new LiteralControl("</tr></tbody><tbody><tr>"));

            }
            moduleImgRowCount++;

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
        /// 设计器支持所需的方法 - 不要使用代码编辑器修改
        /// 此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            RepeaterTextLink.ItemDataBound += new RepeaterItemEventHandler(RepeaterTextLink_ItemDataBound);
            RepeaterImgLink.ItemDataBound += new RepeaterItemEventHandler(RepeaterImgLink_ItemDataBound);
        }
        #endregion
    }

}
