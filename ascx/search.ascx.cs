
using System;
using System.Web;

using com.hujun64.util;

namespace com.hujun64
{
    /// <summary>
	///		search ��ժҪ˵����
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
		///		�����֧������ķ��� - ��Ҫʹ�ô���༭��
		///		�޸Ĵ˷��������ݡ�
		/// </summary>
		private void InitializeComponent()
		{

		}
		#endregion

      
	}
}
