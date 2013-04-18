using System;
using com.hujun64.logic;
namespace com.hujun64
{
	/// <summary>
	/// ListItem ��ժҪ˵����
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

		}
		#endregion
	}
}
