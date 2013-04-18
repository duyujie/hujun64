using System;
using System.Web.Security;
using com.hujun64.logic;
namespace com.hujun64.admin
{
    /// <summary>
    /// pass_change 的摘要说明。
    /// </summary>
    public partial class pass_change : AdminPageBase
    {

        private IAdminService adminService = ServiceFactory.GetAdminService();
        protected void Page_Load(object sender, System.EventArgs e)
        {

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

        protected void Button1_Click(object sender, System.EventArgs e)
        {
            string username = Request.Cookies["uname"].Value;


            string pass = adminService.GetPassword(username);
            if (pass != null)
            {
                if (FormsAuthentication.HashPasswordForStoringInConfigFile(PasswordOld.Text, "MD5") == pass)
                {
                    string userpass = FormsAuthentication.HashPasswordForStoringInConfigFile(PasswordNew.Text, "MD5");
                    if (adminService.ChangePassword(username, userpass))
                    {
                        DateTime cookieExpires=DateTime.Now ;
                        if (Response.Cookies["saveLogin"].Value!=null && Response.Cookies["saveLogin"].Value.Equals("on"))
                        {                           
                            cookieExpires = Convert.ToDateTime(Response.Cookies["cookieExpires"].Value);
                        }
                        Response.Cookies["uname"].Value = username;
                        Response.Cookies["uname"].Expires = cookieExpires;

                        Response.Cookies["upass"].Value = userpass;
                        Response.Cookies["upass"].Expires = cookieExpires;

                        MSG.Text = "修改成功！";
                    }
                    else
                        MSG.Text = "修改失败！";

                    
                }
                else
                {
                    MSG.Text = "原密码错误，请重新输入！";
                }

                Response.Write("<script>javascript:alert('" + MSG.Text + "');</script>");
            }
            else
            {
                Response.Write("<script>javascript:alert('非法用户！！！');window.parent.location.href=('admin.aspx');</script>");
            }


        }
    }
}
