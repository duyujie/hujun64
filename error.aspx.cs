using System;
using com.hujun64.util;
namespace com.hujun64
{
	

	/// <summary>
	/// error 的摘要说明。
	/// </summary>
	public partial class error : System.Web.UI.Page
	{

        private static readonly log4net.ILog log = log4net.LogManager.GetLogger("PageError");
		protected void Page_Load(object sender, System.EventArgs e)
		{
            string errorAspxPath = Request.QueryString["aspxerrorpath"];
            if (errorAspxPath == null)
                errorAspxPath = "未知位置";
            if (!string.IsNullOrEmpty(Request.QueryString[Total.QueryStringAction]) && Request.QueryString[Total.QueryStringAction].ToLower() == "notfound")
            {
                Label1.Text = "对不起，目标网页不存在，可能已经被删除或网址错误，请返回" + UtilHtml.BuildHref(Total.SiteUrl, "首页", "首页") + "，谢谢！";
                Response.Status = "404 Not Found";
            }else
            if (Session["err"] != null)
            {
                log.Error(Session["err"].ToString());

                UtilMail.SendMailAsync("网站错误报告", Session["err"].ToString(), Total.AdminMail, null);

                Label1.Text = Session["err"].ToString();
            }
            else
            {
                log.Error("未知错误！源自" + errorAspxPath,Server.GetLastError());
                
                Label1.Text = "未知错误！源自" + errorAspxPath+":"+Server.GetLastError().Message;
            }
            //if (Total.SiteUrl.Contains("http://www.hujun64.com"))
                Response.Redirect("/index.aspx");
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
