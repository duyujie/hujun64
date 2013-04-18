using System;
using com.hujun64.util;
namespace com.hujun64.admin
{
	/// <summary>
	/// ValidateCode 的摘要说明。
	/// </summary>
	public partial class ValidateCode : System.Web.UI.Page
	{
		protected void Page_Load(object sender, System.EventArgs e)
		{
			//如果要在页面a.aspx生成验证码，则在该页面添加一个图片控件，假设命名为：Image1，然后在page_Load事件中写如下代码：
			//ImageButton1.ImageUrl = "ValidateCode.aspx";
			//这样就可以生成验证码了，ValidateCode.aspx页面可以随便放在哪里，不过要注意Image1.src 要写对，同级可以直接写ValidateCode.aspx，上一级写../ValidateCode.aspx，很方便吧。

			if(!IsPostBack)
			{
				//RndNum是一个自定义函数
				//这里的数字4代表显示的是4位的验证字符串！
				//string VNum=RndNum(4); 
				string VNum=Util.GenerateRandom(4);
				Session["VNum"] = VNum;
                Util.ValidateCode(VNum,Response);
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
		/// 设计器支持所需的方法 - 不要使用代码编辑器修改
		/// 此方法的内容。
		/// </summary>
		private void InitializeComponent()
		{    

		}
		#endregion
		

	}}