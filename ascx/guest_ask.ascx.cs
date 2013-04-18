using System;
using System.Text;
using System.Web;
using System.Data;
using System.Text.RegularExpressions;
using com.hujun64.logic;
using com.hujun64.po;
using com.hujun64.type;
using com.hujun64.util;

namespace com.hujun64
{


    /// <summary>
    ///		show 的摘要说明。
    /// </summary>
    public partial class guest_ask : System.Web.UI.UserControl
    {

        private IMainClassService classService = ServiceFactory.GetMainClassService();
        private IGuestbookService guestbookService = ServiceFactory.GetGuestbookService();

        protected string myLocation = "";
        protected string moduleName = "法律咨询";

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!this.IsPostBack)
            {

                bigClassBind();
                myLocation = UtilHtml.GetPageInfo(moduleName, PageType.GUESTBOOK_TYPE).locationHref;
            }
        }

        void addguestbook()
        {

            Guestbook guestbook = new Guestbook();

            string id = guestbookService.GenerateId();
            guestbook.id = id;
            guestbook.author = author.Text.Trim();
            guestbook.contact = contact.Text.Trim();
            guestbook.email = email.Text.Trim();
            guestbook.title = guesttitle.Text.Trim();
            guestbook.content = content.Text.TrimEnd();
            if (Request["sex"] != null)
                guestbook.sex = Request["sex"];
            else
                guestbook.sex = "";


            guestbook.content = UtilHtml.RemoveHtmlTag(guestbook.content.Trim());
            guestbook.ip_from = Request.UserHostAddress;
            guestbook.keywords = "";

            guestbook.big_class_id = Request["bigClassRadioList"] == null ? "" : Request["bigClassRadioList"].Trim();



          bool success=  guestbookService.InsertGuestbook(guestbook);

            if (success)
            {
                StringBuilder sb = new StringBuilder();
                sb.AppendFormat("咨询详细内容点击链接：{0}<br />", UtilHtml.BuildHrefArticle(guestbook, true, true));
                sb.AppendFormat("回复咨询点击链接：{0}<br />", UtilHtml.BuildHref(Total.SiteUrl + "/admin/guestbook_manage.aspx", "留言管理", "留言管理"));
                UtilMail.SendMailAsync("网站咨询自动提示：" + guestbook.title, sb.ToString(), Total.Email, new string[] { Total.AdminMail,Total.Email });
            } 
            if(guestbook.big_class_id==Total.BigClassNameJjfc || string.IsNullOrEmpty(guestbook.big_class_id))
                AsyncTaskService.PostGuestbook2ShfclawyerAsync(guestbook);

            if (!string.IsNullOrEmpty(guestbook.contact))
            {
                Regex regExp = new Regex(@"^1[0-9]{10}$");
                if (regExp.IsMatch(guestbook.contact))
                {
                    Client client = new Client(guestbook.author, guestbook.contact);

                    AsyncTaskService.InsertClientAsync(client);
                }
            }
        }


        protected void addbtn_Click(object sender, System.EventArgs e)
        {
            if (Session["VNum"] == null)
            {
                //重复提交，忽略处理


            }
            else if (Session["VNum"].ToString() != txtValidateCode.Text)
            {
                //验证码不正确
                Response.Write("<script>javascript:alert('验证码不正确！');</script>");
                txtValidateCode.Text = "";
                txtValidateCode.Focus();
                return;

            }

            else
            {
                //重置验证码状态，防止重复提交
                Session["VNum"] = null;


                addguestbook();

                //更新网站            
                //try
                //{
                //    UtilStatic.GetInstance().ConvertAll(RefreshType.ONLY_GUESTASK);
                //}
                //catch (Exception)
                //{

                //}

                //异步更新网站
                AsyncTaskService.UpdateSiteAsync(RefreshType.ONLY_GUESTASK);

            }


            MSG.Text = "<font color=red>非常感谢您的留言！</font>";

            //Response.Write("<script>javascript:if(confirm('非常感谢您的留言！转到咨询列表...')){window.navigate('" + UtilHtml.ConvertAspxWithHtml(Total.AspxUrlGuestbook) + "');}</script>");
            Response.Write("<script>javascript:if(confirm('非常感谢您的留言！转到咨询列表...')){window.navigate('" + Total.AspxUrlGuestbook + "');}</script>");


            guesttitle.Text = "";
            content.Text = "";
        }

        private void resetForm()
        {
            contact.Text = "";
            author.Text = "";
            guesttitle.Text = "";
            content.Text = "";

        }


        private void bigClassBind()//法律业务大类绑定
        {

            RepeaterBigClass.DataSource = classService.GetRadioBigClassList(Total.SiteId, false);
            RepeaterBigClass.DataBind();


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
