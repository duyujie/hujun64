using System;
using System.Text;
using System.Data;
using com.hujun64.po;
using com.hujun64.logic;

namespace com.hujun64
{

    /// <summary>
    ///	������ѯ
    /// </summary>
    public partial class index_flzx : System.Web.UI.UserControl
    {

      

        protected string moduleName = Total.ModuleNameFlzx;
        protected string moreUrl;

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!this.IsPostBack)
            {

                string bigClassId = Request.QueryString[Total.QueryStringBigClassId];
                string smallClassId = Request.QueryString[Total.QueryStringSmallClassId];
                string articleId = Request.QueryString[Total.QueryStringArticleId];

                if (!string.IsNullOrEmpty(articleId))
                {

                    Article article = ServiceFactory.GetArticleService().GetArticle(articleId, false);

                    bigClassId = article.big_class_id;
                    smallClassId = article.class_id;
                }



                if (string.IsNullOrEmpty(bigClassId) && !string.IsNullOrEmpty(smallClassId))
                {
                    bigClassId = ServiceFactory.GetMainClassService().GetBigClassBySmall(smallClassId).id;
                }



                StringBuilder moreUrlSb = new StringBuilder(Total.AspxUrlGuestbook);
                if (!string.IsNullOrEmpty(bigClassId))
                {
                    moreUrlSb.Append("?");
                    moreUrlSb.Append(Total.QueryStringBigClassId);
                    moreUrlSb.Append("=");
                    moreUrlSb.Append(bigClassId);
                }

                moreUrl = moreUrlSb.ToString();




                IGuestbookService guestboookService = ServiceFactory.GetGuestbookService();
                RepeaterIndexFlzx.DataSource = guestboookService.GetTopGuestbookList(bigClassId, Total.MaxRowsIndexFlzx);
                RepeaterIndexFlzx.DataBind();
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
