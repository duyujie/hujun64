using System;
using System.Text;
using System.Collections.Generic;
using com.hujun64.logic;
using com.hujun64.po;
using com.hujun64.util;
namespace com.hujun64.admin
{
    /// <summary>
    /// bulk_mail 的摘要说明。
    /// </summary>
    public partial class bulk_email : AdminPageBase
    {


        
        private string MyMobileCode = Total.Mobile.Replace(" ", "");
        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!this.IsPostBack)
            {
                noticeTitle.Text = "胡律师的节日祝福";

                StringBuilder sb = new StringBuilder("&nbsp;&nbsp;&nbsp;&nbsp;祝您节日快乐，旅途开心，生活愉快！<br />&nbsp;&nbsp;&nbsp;&nbsp;如果您在生活工作中遇到任何法律问题，您可以直接联系上海胡珺律师，电话：");
                sb.Append(MyMobileCode);
                sb.Append("，胡律师会亲自帮您解答！");

                ContentEditor.Value = sb.ToString();
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





        protected void submit_all(object sender, System.EventArgs e)
        {

            bulkEmail(noticeTitle.Text, ContentEditor.Value, false);
        }
        protected void submit_shanghai(object sender, System.EventArgs e)
        {

            bulkEmail(noticeTitle.Text, ContentEditor.Value, true);
        }
        //通知咨询者
        private void bulkEmail(string title, string notice, bool isOnlyShanghai)
        {
            if (string.IsNullOrEmpty(notice))
            {
                MSG.Text = "请输入标题！";
                Response.Write("<script>javascript:alert('" + MSG.Text + "');</script>");
                return;
            }
            IGuestbookService guestbookService = ServiceFactory.GetGuestbookService();
            Dictionary<string, string> guestEmailDict = guestbookService.GetAllGuestEmailDict(isOnlyShanghai);

            //Dictionary<string, string> guestEmailDict = new Dictionary<string, string>();
            //guestEmailDict.Add("杜宇杰", "yujied@gmail.com");


            StringBuilder sb = new StringBuilder();
            int iSuccess = 0;
            foreach (string guestName in guestEmailDict.Keys)
            {
                try
                {
                    sb.Remove(0, sb.Length);
                    sb.Append("<style type=\"text/css\"> p {text-indent:2em;margin-top:1em;margin-bottom:1em} </style>");
                    sb.Append("尊敬的 ");
                    sb.Append(guestName);
                    sb.Append("：<br />");

                    //群发内容
                    sb.Append(notice);



                    UtilMail.SendMailAsync(title, sb.ToString(), guestEmailDict[guestName], null);
                    iSuccess++;
                }
                catch (Exception ex)
                {
                    log4net.LogManager.GetLogger(this.ToString()).Error("发送 " + guestName + " 出错：", ex);
                }

            }
            MSG.Text = "发送邮件完成： " + iSuccess.ToString() + "/" + guestEmailDict.Count.ToString();
            Response.Write("<script>javascript:alert('" + MSG.Text + "');</script>");
        }

    }
}
