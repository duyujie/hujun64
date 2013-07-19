namespace com.hujun64
{
    using System;
    using System.Data.SqlClient;
    using com.hujun64.po;
    using com.hujun64.type;
    using com.hujun64.util;
    using com.hujun64.logic;
    /// <summary>
    ///	linkapp 的摘要说明。
    /// </summary>
    public partial class linkapp : PageBase
    {

        protected string myLocation = "";
        private string moduleName = Total.ModuleNameSqyqlj;
        protected string prefixUrl = "http://www.";
        protected string applyNotice = "提交申请前烦请先按下面的说明在您的网站上做好本站的链接，谢谢！<br /><br />已做好本站链接的申请将会更快的通过审核，胡律师对已提交的申请有审核权和最终解释权，如果您的链接无法通过审核，烦请见谅。";

        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Redirect(Total.AspxUrlBuilding);
            myLocation = UtilHtml.GetPageInfo(moduleName, PageType.LINK_APP_TYPE).locationHref;


        }


        private void resetForm()
        {
            myUrl.Text = prefixUrl;
            siteName.Text = "";
            siteUrl.Text = prefixUrl;
            siteLogoUrl.Text = "";
            siteDesc.Text = "";
        }
        protected void reset_Click(object sender, System.EventArgs e)
        {
            resetForm();
        }
        protected void submit_Click(object sender, System.EventArgs e)
        {
            if (!myUrl.Text.Trim().StartsWith("http://"))
            {
                Response.Write("<script>javascript:alert('请输入本站在贵站页面的正确链接地址！');</script>");

                myUrl.Focus();
                return;
            }


            if (Session["VNum"] == null || Session["VNum"].ToString() != txtValidateCode.Text)
            {
                //验证码不正确
                Response.Write("<script>javascript:alert('验证码不正确！');</script>");
                txtValidateCode.Text = "";
                txtValidateCode.Focus();
                return;
            }

            Link link = new Link();

            link.enabled = true;
            link.link_site_name = siteName.Text.Trim();
            link.link_site_url = siteUrl.Text.Trim();
            link.link_site_logo = siteLogoUrl.Text.Trim();
            link.link_description = UtilHtml.FormatTextToHtml(siteDesc.Text.TrimEnd());
            link.my_url = myUrl.Text.Trim();
            link.is_static = false;

            try
            {
                ILinkService linkService = ServiceFactory.GetLinkService();
                linkService.InsertLink(link);
                txtValidateCode.Text = "";
                UtilMail.SendMailAsync("申请友好链接", UtilHtml.BuildHref(link.link_site_url, link.link_site_name, link.link_site_name, true), Total.AdminMail, null);
            }
            catch (Exception ex)
            {
                Response.Write("<script>javascript:alert('" + ex.Message + "');</script>");
                siteUrl.Focus();
                return;
            }

            MSG.Text = "<font color=red>非常感谢您的申请！稍后我们会对此进行审核。</font>";
            Response.Write("<script>javascript:alert('非常感谢您的申请！稍后我们会对此进行审核。');</script>");
            resetForm();

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

        }
        #endregion
    }
}
