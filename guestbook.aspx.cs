using System;
using com.hujun64.logic;
namespace com.hujun64
{
    /// <summary>
    /// guestbook 的摘要说明。
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
