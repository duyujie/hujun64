using System;
using System.Text;
using System.Collections.Generic;
using com.hujun64.logic;
using com.hujun64.po;
using com.hujun64.util;
using com.hujun64.type;
namespace com.hujun64.admin
{
    /// <summary>
    /// bulk_mail 的摘要说明。
    /// </summary>
    public partial class bulk_sms : AdminPageBase
    {


        private IClientService clientService = ServiceFactory.GetClientService();
        private static readonly log4net.ILog log = log4net.LogManager.GetLogger("BulkSMS");
        private string MyMobileCode = Total.Mobile.Replace(" ", "");
        private string MyMobileCode2 = Total.Mobile2.Replace(" ", "");
        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!this.IsPostBack)
            {
                StringBuilder sb = new StringBuilder("祝您节日快乐！<br />如有任何法律问题，请您联系上海胡律师，电话");
                sb.Append(MyMobileCode);
                sb.Append("，");
                sb.Append(Total.SiteUrl);
                ContentEditor.Text = sb.ToString();


                SpecMobileSend.Text = MyMobileCode + "," + MyMobileCode2;
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



        protected void submit_query(object sender, System.EventArgs e)
        {
            try
            {
                //查询余额
                int i = InternetWebService.SmsQuery();
                MSG.Text = "余额： " + i.ToString() + "条短信。";
            }
            catch (Exception ex)
            {
                log.Error("查询短信余额出错！", ex);
                MSG.Text = "查询短信余额出错： " + ex.Message;
            }
            Response.Write("<script>javascript:alert('" + MSG.Text + "');</script>");
        }
        protected void submit_changepw(object sender, System.EventArgs e)
        {
            if (PasswordNew.Text.Equals(PasswordNewRepeat.Text))
            {
                try
                {
                    //更改密码
                    bool bSuccessed = InternetWebService.SmsChangePassword(PasswordNew.Text);
                    log.Info("更改短信密码成功！");
                    MSG_Password.Text = "更改短信密码成功，请修改对应的配置文件。";

                }
                catch (Exception ex)
                {
                    log.Error("更改短信密码出错！", ex);
                    MSG_Password.Text = "更改短信密码出错： " + ex.Message;
                }
                Response.Write("<script>javascript:alert('" + MSG_Password.Text + "');</script>");
            }
        }
        protected void submit_all(object sender, System.EventArgs e)
        {

            bulkSms(ContentEditor.Text, false, false);
        }
        protected void submit_shanghai(object sender, System.EventArgs e)
        {

            bulkSms(ContentEditor.Text, true, false);
        }
        protected void submit_spec(object sender, System.EventArgs e)
        {

            bulkSms(ContentEditor.Text, true, true);
        }



        //通知咨询者
        private void bulkSms(string notice, bool isOnlyShanghai, bool isOnlyTest)
        {
            notice = UtilHtml.RemoveHtmlTag(UtilHtml.RemoveEnterBreak(notice));

            if (string.IsNullOrEmpty(notice) || notice.Length > Total.MaxSmsMsgSize)
            {
                MSG.Text = "短信内容不能为空，也不能超过" + Total.MaxSmsMsgSize.ToString() + "字！";
                Response.Write("<script>javascript:alert('" + MSG.Text + "');</script>");
                return;
            }



            List<string> mobileCodeList = new List<string>();

            if (isOnlyTest)
            {
                string[] specMobileArray = SpecMobileSend.Text.Trim().Split(',');
                foreach (string specMobile in specMobileArray)
                {
                    if (!string.IsNullOrEmpty(specMobile))
                        mobileCodeList.Add(specMobile);
                }
            }
            else
            {
                List<Client> clientList = ServiceFactory.GetClientService().GetAllClients(isOnlyShanghai);
                foreach (Client client in clientList)
                {
                    if (client.status == ClientStatus.SMS_ENABLED)
                        mobileCodeList.Add(client.mobile_code);
                }

                if (!mobileCodeList.Contains(MyMobileCode))
                    mobileCodeList.Insert(0, MyMobileCode);

                if (!mobileCodeList.Contains(MyMobileCode2))
                    mobileCodeList.Add(MyMobileCode2);


            }

            int iSuccess = 0;
            try
            {
                //发送短信              
                iSuccess = InternetWebService.SmsSend(notice, mobileCodeList);

                MSG.Text = "发送短信完成： " + iSuccess.ToString() + "/" + mobileCodeList.Count.ToString();
                log.Info(MSG.Text);

            }
            catch (Exception ex)
            {
                log.Error("群发短信出错！", ex);
                MSG.Text = "群发短信出错： " + ex.Message;
            }


            Response.Write("<script>javascript:alert('" + MSG.Text + "');</script>");
        }

    }
}
