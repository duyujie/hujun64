using System;
using com.hujun64.logic;
namespace com.hujun64
{
    /// <summary>
    /// guestbook ��ժҪ˵����
    /// </summary>
    public partial class guestbook : PageBase
    {
        protected string title = Total.ModuleNameFlzx;
       
        protected bool isGuestShow = false;
        protected string metaDescription = "";
        protected string bigClassId = null, smallClassId = null;

        protected void Page_Load(object sender, System.EventArgs e)
        {
            string gid = Request.QueryString[Total.QueryStringGuestbookId];


            if (gid!=null && gid != "")
            {
                isGuestShow = true;                
            }

            if (!string.IsNullOrEmpty(Request.QueryString[Total.QueryStringBigClassId]))
            {
                bigClassId = Request.QueryString[Total.QueryStringBigClassId];
            }
            else if (!string.IsNullOrEmpty(Request.QueryString[Total.QueryStringSmallClassId]))
            {
                smallClassId = Request.QueryString[Total.QueryStringSmallClassId];
            }
            else
            {
                return;
            }

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
