using System;
using System.Data;
using System.Web;
using System.Web.UI;
using com.hujun64.logic;
namespace com.hujun64.admin
{
    /// <summary>
    /// global_edit 的摘要说明。
    /// </summary>
    public partial class global_edit : System.Web.UI.Page
    {
       
       
        private string str_webconfig;
        protected void Page_Load(object sender, System.EventArgs e)
        {
            str_webconfig = HttpContext.Current.Server.MapPath(Request.ApplicationPath + "/") + "web.config";
            if (Request.Cookies["uname"] != null && Request.Cookies["upass"] != null)//如果不存在 cookies
            {
                bool mark = false;
                IAdminService adminService = ServiceFactory.GetAdminService();

                string username = Request.Cookies["uname"].Value, userpass = Request.Cookies["upass"].Value;
                mark = adminService.Islogin(username, userpass);
                if (mark == true)
                {

                    if (!Page.IsPostBack)
                    {
                        config_bind();

                    }
                }
                else
                {
                    //window.parent.location.href="login.aspx";
                    Response.Write("<script>javascript:alert('登录超时！！！');window.parent.location.href=('admin.aspx');</script>");
                }
            }
            else
            {
                Response.Write("<script>javascript:alert('登录超时！！！');window.parent.location.href=('admin.aspx');</script>");
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
        void config_bind()
        {

            DataSet dsxml = new DataSet();
            dsxml.ReadXml(str_webconfig);
            foreach (DataTable table in dsxml.Tables)
            {
                if (table.TableName.Equals("add"))
                {

                    foreach (DataRow row in table.Rows)
                    {

                        if (row["key"] == null)
                            continue;
                        string key = row["key"].ToString();

                        if (key.Equals("sitename"))
                        {
                            sitename.Text = (string)row["value"];
                        }
                        if (key.Equals("sitelink"))
                        {
                            sitelink.Text = (string)row["value"];
                        }
                        if (key.Equals("sitetitle"))
                        {
                            sitetitle.Text = (string)row["value"];
                        }
                        if (key.Equals("title"))
                        {
                            pagetitle.Text = (string)row["value"];
                        }
                        if (key.Equals("adminname"))
                        {
                            adminname.Text = (string)row["value"];
                        }
                        if (key.Equals("copyright"))
                        {
                            theright.Text = (string)row["value"];
                        }
                        if (key.Equals("adminmail"))
                        {
                            adminmail.Text = (string)row["value"];
                        }
                        if (key.Equals("keywords"))
                        {
                            keywords.Text = (string)row["value"];
                        }



                    }
                }
            }



        }

        protected void updatebtn_Click(object sender, System.EventArgs e)
        {
            DataSet dsxml = new DataSet();
            try
            {               
                dsxml.ReadXml(str_webconfig);
                foreach (DataTable table in dsxml.Tables)
                {
                    if (table.TableName.Equals("add"))
                    {

                        foreach (DataRow row in table.Rows)
                        {
                            if (row["key"] == null)
                                continue;
                            string key = row["key"].ToString();


                            if (key.Equals("sitename"))
                            {
                                row["value"] = sitename.Text;
                            }
                            if (key.Equals("sitelink"))
                            {
                                row["value"] = sitelink.Text;
                            }
                            if (key.Equals("sitetitle"))
                            {
                                row["value"] = sitetitle.Text;
                            }
                            if (key.Equals("title"))
                            {
                                row["value"] = pagetitle.Text;
                            }
                            if (key.Equals("adminname"))
                            {
                                row["value"] = adminname.Text;
                            }
                            if (key.Equals("copyright"))
                            {
                                row["value"] = theright.Text;
                            }
                            if (key.Equals("adminmail"))
                            {
                                row["value"] = adminmail.Text;
                            }
                            if (key.Equals("keywords"))
                            {
                                row["value"] = keywords.Text;
                            }
                        }
                    }

                }

                dsxml.AcceptChanges();
                dsxml.WriteXml(str_webconfig);
                dsxml.Clear();
                Message.Text = "<p align=center><font color=red>系统设置修改成功！！</font></p>";
            }
            catch (Exception exc)
            {
                Message.Text = "<p align=center><font color=red>写入文件发生错误！！</font><br />错误如下：</p>" + exc.ToString();
            }
        }
    }
}
