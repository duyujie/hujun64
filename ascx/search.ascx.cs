
using System;
using System.Web;

using com.hujun64.util;

namespace com.hujun64
{
    /// <summary>
	///		search 的摘要说明。
	/// </summary>
	public partial class search : System.Web.UI.UserControl
	{
        protected string appPath;
		protected void Page_Load(object sender, System.EventArgs e)
		{
            if (!this.IsPostBack)
            {
                appPath = UtilHttp.GetApplicationPath(HttpContext.Current);
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
