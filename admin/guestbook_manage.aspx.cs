using System;
using System.Drawing;
using System.Text;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web;
using System.Collections.Generic;
using System.Threading;
using com.hujun64.logic;
using com.hujun64.po;
using com.hujun64.type;
using com.hujun64.util;

namespace com.hujun64.admin
{
    /// <summary>
    /// guestbook_del 的摘要说明。
    /// </summary>
    public partial class guestbook_manage : AdminPageBase
    {

        private IMainClassService classService = ServiceFactory.GetMainClassService();
        private IGuestbookService guestbookService = ServiceFactory.GetGuestbookService();
        protected void Page_Load(object sender, System.EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                //AsyncTask.UpdateIpProvinceAsync("", "");
                dgd_bind();
                bigClassBind();
            }


        }
        private void dgd_bind()
        {

            StringBuilder sqlSb = new StringBuilder();
            sqlSb.AppendFormat("select v.id,title,contact,author,sex,isnull(class_name,'其他') as big_class,v.addtime,click,province_from,case when reply is not null then 'Y' else 'N' end as is_replied from view_guestbook v  left outer join main_class m on v.big_class_id=m.id  where v.enabled=1 and site_id='{0}' order by v.addtime desc", Total.SiteId);
            int totalCount;
            DataSet ds = ServiceFactory.GetCommonService().GetPagerDataSet(sqlSb.ToString(), AspNetPager1.CurrentPageIndex, Total.PageSizeDefault, out totalCount);
            AspNetPager1.RecordCount = totalCount;
            AspNetPager1.PageSize = Total.PageSizeDefault;
            DataGridTitle.DataSource = ds;
            DataGridTitle.DataBind();


        }
        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            dgd_bind();
        }


        //通知咨询者
        private void email_guest(Guestbook guestbook)
        {

            if (!string.IsNullOrEmpty(guestbook.email) && !string.IsNullOrEmpty(guestbook.reply))
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("<style type=\"text/css\"> p {text-indent:2em;margin-top:1em;margin-bottom:1em} </style>");
                sb.Append("尊敬的 ");
                sb.Append(guestbook.author);
                sb.Append("：<p>您好！胡律师已经回复了您于");
                sb.Append(guestbook.addtime.ToString("yyyy-MM-dd HH:mm:ss"));
                sb.Append("提交的咨询“");
                sb.Append(guestbook.title);
                sb.Append("”<br /><br /><p>");

                sb.Append("详情请访问： ");
                sb.Append(UtilHtml.BuildHref(Total.CurrentSiteRootUrl + UtilHtml.GetAspxUrl(guestbook.id, PageType.GUESTBOOK_TYPE)));

                sb.Append("<br />本邮件为系统自动发送，请勿回复！");
                sb.Append("</p>");
                UtilMail.SendMailAsync("法律咨询回复 - " + guestbook.title, sb.ToString(), guestbook.email, null);


            }

        }
        protected void reply_Click(object sender, System.EventArgs e)
        {
            if (string.IsNullOrEmpty(guestId.Value))
                return;


            Guestbook guestbook = guestbookService.GetGuestbook(guestId.Value.ToString(), true);
            guestbook.reply = reply.Text.Trim();
            guestbook.big_class_id = bigClassRadioList.SelectedValue;
            guestbook.keywords = UtilHtml.FormatKeywords(keywords.Text);
            guestbook.title = guesttitle.Text.Trim();
            guestbook.content = content.Text.Trim();
            guestbook.is_static = false;



            guestbookService.ReplyGuestbook(guestbook);
            if (guestbook.big_class_id == classService.GetClassByName(Total.BigClassNameJjfc, Total.SiteId).id)
            {

                AsyncTaskService.PostGuestbook2ShfclawyerAsync(guestbook);
            }


            //自动通知咨询者
            if (email_guest_check.Checked)
                email_guest(guestbook);

            //更新网站
            AsyncTaskService.UpdateSiteAsync(RefreshType.ONLY_CHANGED);

            //更新搜索索引
            //LuceneSearcher.WriteIndex(guestbook,false);

            MSG.Text = "回复成功！";
            Response.Write("<script>javascript:alert('" + MSG.Text + "');</script>");

            dgd_bind();

            LaebelSelectedId.Text = "";
            guestId.Value = "";
            guesttitle.Text = "";
            author.Text = "";
            contact.Text = "";
            sex.Text = "";
            addtime.Text = "";
            keywords.Text = "";
            content.Text = "";
            reply.Text = "";
            replytime.Text = "";
            ipProvince.Text = "";
            email.Text = "";
        }
        protected void DataGridTitle_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.SelectedItem)
            {
                System.Data.DataRowView rowv = (System.Data.DataRowView)e.Item.DataItem;
                e.Item.Cells[1].Text = UtilHtml.BuildHref("../" + UtilHtml.GetAspxUrl(rowv["id"].ToString(), PageType.GUESTBOOK_TYPE), rowv["title"].ToString(), rowv["title"].ToString(), true);

                if (e.Item.Cells[7].Text == "N")
                {
                    e.Item.Cells[7].ForeColor = Color.Red;
                }


                if (e.Item.Cells[4].Text.Contains("上海市"))
                {
                    e.Item.Cells[4].ForeColor = Color.Red;
                }

            }

        }

        private void bigClassBind()//法律业务大类绑定
        {
            bigClassRadioList.DataSource = classService.GetBigClassList(Total.SiteId, false);
            bigClassRadioList.DataBind();

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
            this.DataGridTitle.DeleteCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGrid1_DeleteCommand);
            DataGridTitle.ItemDataBound += new DataGridItemEventHandler(DataGridTitle_ItemDataBound);

        }
        #endregion

        protected void DataGrid1_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            string id = DataGridTitle.SelectedItem.Cells[0].Text;
            LaebelSelectedId.Text = id;
            Guestbook guestbook = guestbookService.GetGuestbook(id, true);

            if (guestbook != null)
            {
                guestId.Value = guestbook.id;
                guesttitle.Text = guestbook.title;
                keywords.Text = guestbook.keywords;
                author.Text = guestbook.author;
                sex.Text = guestbook.sex;
                contact.Text = guestbook.contact;
                email.Text = guestbook.email;
                ipProvince.Text = guestbook.province_from;
                if (guestbook.addtime != DateTime.MinValue)
                    addtime.Text = guestbook.addtime.ToString();
                else
                    addtime.Text = "";

                content.Text = guestbook.content;
                reply.Text = guestbook.reply;
                try
                {
                    bigClassRadioList.SelectedValue = guestbook.big_class_id;
                }
                catch (Exception)
                {
                    bigClassRadioList.SelectedIndex = bigClassRadioList.Items.Count - 1;

                }

                if (guestbook.replytime != DateTime.MinValue)
                {
                    replytime.Text = guestbook.replytime.ToString();

                }
                else
                {
                    replytime.Text = "";
                    if (string.IsNullOrEmpty(guestbook.big_class_id))
                    {
                        Response.Write("<script>javascript:alert('请确认法律业务分类是否正确');</script>");

                    }
                }

                reply.Focus();

            }




        }

        private void DataGrid1_DeleteCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            string id = DataGridTitle.DataKeys[e.Item.ItemIndex].ToString();

            try
            {

                string htmlUrl = UtilHtml.GetHtmlUrl(id, PageType.GUESTBOOK_TYPE);
                if (guestbookService.DeleteGuestbook(id))
                {
                    //AsyncTaskService.DeleteArticle4ShfclawyerAsync(id);
                    string filePath = HttpContext.Current.Server.MapPath("~/") + htmlUrl;
                    if (File.Exists(filePath))
                    {
                        File.Delete(filePath);
                    }


                    UtilSitemap.DeleteSitemapXml(HttpContext.Current.Server.MapPath("~/") + Total.Sitemap, filePath, SitemapType.Google);

                    ServiceFactory.GetGuestbookService().RefreshCachedGuestbook();
                    UtilStatic.GetInstance().ConvertAll(RefreshType.ONLY_GUESTASK);
                }
                MSG.Text = "<font color=red>删除成功！</font>";
                Response.Write("<script>javascript:alert('删除成功！');</script>");
            }
            catch (Exception ex)
            {
                MSG.Text = "<font color=red>" + ex.Message.ToString() + "</font>";//输出错误信息
            }
            finally
            {

                dgd_bind();
            }
        }
    }
}
