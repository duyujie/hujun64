using System;
using System.Web;
using System.Web.UI;
namespace com.hujun64.admin
{
    /// <summary>
    /// serverCheck 的摘要说明。
    /// </summary>
    public partial class serverCheck : AdminPageBase
    {

        public void Page_Load(Object sender, EventArgs e)
        {
            Response.Expires = 0;
            Response.CacheControl = "no-cache";
            if (!Page.IsPostBack)
            {


                //取得页面执行开始时间
                DateTime stime = DateTime.Now;


                //取得服务器相关信息
                servername.Text = Server.MachineName;
                serverip.Text = Request.ServerVariables["LOCAL_ADDR"];
                server_name.Text = Request.ServerVariables["SERVER_NAME"];

                //以下就是取值不准的地方，因为用了HTTP_USER_AGENT当做服务器信息。
                //1.0 final 使用Environment类属性，彻底解决了这一问题
                //char[] de = {';'};
                //string allhttp=Request.ServerVariables["HTTP_USER_AGENT"].ToString();
                //string[] myFilename = allhttp.Split(de);
                //servernet.Text=myFilename[myFilename.Length-1].Replace(")"," ");
                int build, major, minor, revision;
                build = Environment.Version.Build;
                major = Environment.Version.Major;
                minor = Environment.Version.Minor;
                revision = Environment.Version.Revision;
                servernet.Text = ".NET CLR  " + major + "." + minor + "." + build + "." + revision;
                serverms.Text = Environment.OSVersion.ToString();
                //服务器端浏览器版本暂时不知道怎么取得，原有不准，故删除
                //1.0 final 修改
                //serverie.Text=myFilename[1];

                serversoft.Text = Request.ServerVariables["SERVER_SOFTWARE"];
                serverport.Text = Request.ServerVariables["SERVER_PORT"];
                serverout.Text = Server.ScriptTimeout.ToString();
                //语言应该是浏览者信息，1.0 final 修改
                cl.Text = Request.ServerVariables["HTTP_ACCEPT_LANGUAGE"];
                servertime.Text = DateTime.Now.ToString();
                serverppath.Text = Request.ServerVariables["APPL_PHYSICAL_PATH"];
                Total.PhysicalRootPath = Request.ServerVariables["APPL_PHYSICAL_PATH"];

                servernpath.Text = Request.ServerVariables["PATH_TRANSLATED"];
                serverhttps.Text = Request.ServerVariables["HTTPS"];
                if (chkobj("ADODB.RecordSet"))
                {
                    serveraccess.Text = "支持";
                }
                else { serveraccess.Text = "不支持"; }
                if (chkobj("Scripting.FileSystemObject"))
                {
                    serverfso.Text = "支持";
                }
                else { serverfso.Text = "不支持"; }
                if (chkobj("CDONTS.NewMail"))
                {
                    servercdonts.Text = "支持";
                }
                else { servercdonts.Text = "不支持"; }
                servers.Text = Session.Contents.Count.ToString();
                servera.Text = Application.Contents.Count.ToString();

                //0.1版添加的组件验证，原有组件并未转移过来，请原谅。 
                if (chkobj("JMail.SmtpMail"))
                {
                    jmail.Text = "支持";
                }
                else { jmail.Text = "不支持"; }

                if (chkobj("Persits.MailSender"))
                {
                    aspemail.Text = "支持";
                }
                else { aspemail.Text = "不支持"; }

                if (chkobj("Geocel.Mailer"))
                {
                    geocel.Text = "支持";
                }
                else { geocel.Text = "不支持"; }

                if (chkobj("SmtpMail.SmtpMail.1"))
                {
                    smtpmail.Text = "支持";
                }
                else { smtpmail.Text = "不支持"; }

                if (chkobj("Persits.Upload.1"))
                {
                    aspup.Text = "支持";
                }
                else { aspup.Text = "不支持"; }

                if (chkobj("aspcn.Upload"))
                {
                    aspcnup.Text = "支持";
                }
                else { aspcnup.Text = "不支持"; }

                if (chkobj("LyfUpload.UploadFile"))
                {
                    lyfup.Text = "支持";
                }
                else { lyfup.Text = "不支持"; }

                if (chkobj("SoftArtisans.FileManager"))
                {
                    soft.Text = "支持";
                }
                else { soft.Text = "不支持"; }

                if (chkobj("w3.upload"))
                {
                    dimac.Text = "支持";
                }
                else { dimac.Text = "不支持"; }

                if (chkobj("W3Image.Image"))
                {
                    dimacimage.Text = "支持";
                }
                else { dimacimage.Text = "不支持"; }

                //取得用户浏览器信息
                HttpBrowserCapabilities bc = Request.Browser;
                ie.Text = bc.Browser.ToString();
                cookies.Text = bc.Cookies.ToString();
                frames.Text = bc.Frames.ToString();
                javaa.Text = bc.JavaApplets.ToString();
                //javas.Text = bc.JavaScript.ToString();
                ms.Text = bc.Platform.ToString();
                vbs.Text = bc.VBScript.ToString();
                vi.Text = bc.Version.ToString();

                //取得浏览者ip地址,1.0 final 加入
                cip.Text = Request.ServerVariables["REMOTE_ADDR"];

                //取得页面执行结束时间
                DateTime etime = DateTime.Now;


                //计算页面执行时间
                runtime.Text = ((etime - stime).TotalMilliseconds).ToString();
            }
        }

        //组件支持验证代码

        bool chkobj(string obj)
        {
            try
            {
                object meobj = Server.CreateObject(obj);
                return (true);
            }
            catch (Exception objex)
            {
                objex.ToString();
                return (false);
            }
        }

        //100万次循环测试，由0.1sn bulid 021203开始加入

        public void turn_chk(Object Sender, EventArgs e)
        {
            DateTime ontime = DateTime.Now;
            int sum = 0;
            for (int i = 1; i <= 10000000; i++)
            {
                sum = sum + i;
            }
            DateTime endtime = DateTime.Now;
            l1000.Text = ((endtime - ontime).TotalMilliseconds).ToString() + "毫秒";
        }

        //自定义组件检测0.1版加入

        public void chkzujian(Object Sender, EventArgs e)
        {
            string obj = zujian.Text;
            if (chkobj(obj))
            {
                l001.Text = "检测结果：支持组件" + obj;
            }
            else { l001.Text = "检测结果：不支持组件" + obj; }
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
