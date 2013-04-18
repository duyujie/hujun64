using System;
using com.hujun64.logic;
namespace com.hujun64
{
	/// <summary>
	/// ListItem 的摘要说明。
	/// </summary>
    public partial class listitem : PageBase 
	{

        protected string bigClassId = null, smallClassId = null;

		protected void Page_Load(object sender, System.EventArgs e)
		{
            bigClassId = Request.QueryString[Total.QueryStringBigClassId];
            smallClassId = Request.QueryString[Total.QueryStringSmallClassId];

            if (string.IsNullOrEmpty(bigClassId) && !string.IsNullOrEmpty(smallClassId))
            {

                bigClassId = ServiceFactory.GetMainClassService().GetBigClassBySmall(smallClassId).id;
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
	}
}
