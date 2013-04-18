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
    ///	link ��ժҪ˵����
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
            RepeaterTextLink.ItemDataBound += new RepeaterItemEventHandler(RepeaterTextLink_ItemDataBound);
            RepeaterImgLink.ItemDataBound += new RepeaterItemEventHandler(RepeaterImgLink_ItemDataBound);
        }
        #endregion
    }

}
