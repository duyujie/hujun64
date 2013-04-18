using System;
using System.Drawing;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using com.hujun64.logic;
using com.hujun64.po;
using com.hujun64.type;
using com.hujun64.util;
namespace com.hujun64.admin
{
    /// <summary>
    /// guestbook_del 的摘要说明。
    /// </summary>
    public partial class link_manage : AdminPageBase
    {


        private ILinkService linkService = ServiceFactory.GetLinkService();
        protected void Page_Load(object sender, System.EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                dgd_bind();

            }

        }
        void dgd_bind()
        {
            string sql = "select id,site_name,site_url,site_logo,my_url,addtime,approve_status,case when approve_status=0 then '等待审核' when approve_status=1 then '审核通过' else '审核拒绝' end as status,approve_time from link where site_id='"+Total.SiteId+"' and enabled=1 order by sort_seq asc,addtime desc";


            DataGridTitle.DataSource = ServiceFactory.GetCommonService().GetDataSet(sql);
            DataGridTitle.DataBind();
            DataGridTitle.Items[DataGridTitle.Items.Count - 1].Cells[8].Enabled = false;


        }

        private void resetForm()
        {
            linkId.Value = "";
            my_url.Text = "";
            my_url_edit.Text = "";
            site_name.Text = "";
            site_name_edit.Text = "";
            site_url_edit.Text = "";
            site_logo.Text = "";
            site_logo_edit.Text = "";
            site_desc.Text = "";
            addtime.Text = "";
            status.Text = "";
            approve_time.Text = "";


        }
        protected void approve_Click(object sender, System.EventArgs e)
        {

            linkService.ApproveLink(linkId.Value, ApproveStatus.APPROVED);

            //异步更新网站
            AsyncTaskService.UpdateSiteAsync(RefreshType.ONLY_CHANGED);


            Response.Write("<script>javascript:alert('审核通过成功！');</script>");

            resetForm();
            dgd_bind();

        }
        protected void update_Click(object sender, System.EventArgs e)
        {

            Link link = linkService.GetLink(linkId.Value);
            link.my_url = my_url_edit.Text;
            link.link_site_logo = site_logo_edit.Text;
            link.link_site_name = site_name_edit.Text;
            link.link_site_url = site_url_edit.Text;
            link.link_description = site_desc.Text;

            linkService.UpdateLink(link);


            //更新网站
            //异步更新网站
            AsyncTaskService.UpdateSiteAsync(RefreshType.ONLY_CHANGED);


            Response.Write("<script>javascript:alert('链接更新成功！');</script>");

            resetForm();
            dgd_bind();

        }
        protected void reject_Click(object sender, System.EventArgs e)
        {
            linkService.ApproveLink(linkId.Value, ApproveStatus.REJECTED);

            //更新网站
            UtilStatic aspx2Html = UtilStatic.GetInstance();
            aspx2Html.ConvertAll(RefreshType.ONLY_CHANGED);


            Response.Write("<script>javascript:alert('审核拒绝成功！');</script>");

            dgd_bind();
            resetForm();
        }
        protected void DataGridTitle_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.SelectedItem)
            {
                if (e.Item.ItemIndex == 0)
                {
                    e.Item.Cells[7].Enabled = false;
                }


                System.Data.DataRowView rowv = (System.Data.DataRowView)e.Item.DataItem;


                if (ApproveStatus.WAITING.Equals((ApproveStatus)Convert.ToInt32(rowv["approve_status"])))
                {

                    e.Item.Cells[3].ForeColor = Color.Red;
                }


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
            this.DataGridTitle.DeleteCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGrid1_DeleteCommand);
            DataGridTitle.ItemDataBound += new DataGridItemEventHandler(DataGridTitle_ItemDataBound);



        }
        #endregion


        protected void DataGrid1_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            string id = DataGridTitle.SelectedItem.Cells[0].Text;
            Link link = linkService.GetLink(id);

            if (link != null)
            {
                linkId.Value = link.link_id;

                my_url.Text = UtilHtml.BuildHref(link.my_url, "本站", link.my_url, true);
                my_url_edit.Text = link.my_url;

                site_name.Text = UtilHtml.BuildHref(link.link_site_url, link.link_site_name, link.link_site_url, true);
                site_name_edit.Text = link.link_site_name;

                site_url_edit.Text = link.link_site_url;

                if (link.link_site_logo != "")
                {
                    site_logo.Text = UtilHtml.GetFullImageUrl(link.link_site_logo, link.link_site_name);
                    site_logo_edit.Text = link.link_site_logo;
                }
                else
                {
                    site_logo.Text = "";
                    site_logo_edit.Text = "";
                }

                site_desc.Text = link.link_description;

                status.Text = DataGridTitle.SelectedItem.Cells[3].Text;
                if (link.addtime != DateTime.MinValue)
                    addtime.Text = link.addtime.ToString();
                else
                    addtime.Text = "";


                if (link.approve_time != DateTime.MinValue)
                    approve_time.Text = link.approve_time.ToString();
                else
                    approve_time.Text = "";


            }

            approve_button.Focus();
        }
        protected void DataGrid1_SortCommand(object sender, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            if (e.CommandName == "SortUp" || e.CommandName == "SortDown")
            {


                string idCurrent = DataGridTitle.DataKeys[e.Item.ItemIndex].ToString();
                string idOther;
                Link linkCurrent, linkOther;
                SortObject sortCurrent, sortOther;
                try
                {
                    linkCurrent = linkService.GetLink(idCurrent);
                    sortCurrent = new SortObject(linkCurrent.link_id, linkCurrent.sort_seq);

                    if (e.CommandName == "SortUp")
                    {
                        idOther = DataGridTitle.DataKeys[e.Item.ItemIndex - 1].ToString();
                    }
                    else
                    {
                        idOther = DataGridTitle.DataKeys[e.Item.ItemIndex + 1].ToString();
                    }

                    linkOther = linkService.GetLink(idOther);
                    sortOther = new SortObject(linkOther.link_id, linkOther.sort_seq);

                    if (e.CommandName == "SortUp")
                    {
                        sortOther = sortCurrent.ExchangeUpSortSeq(sortOther);
                    }
                    else
                    {
                        sortOther = sortCurrent.ExchangeDownSortSeq(sortOther);
                    }

                    linkCurrent.sort_seq = sortCurrent.sortSeq;
                    linkOther.sort_seq = sortOther.sortSeq;


                    linkService.UpdateLink(linkCurrent);
                    linkService.UpdateLink(linkOther);



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
        private void DataGrid1_DeleteCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            string id = DataGridTitle.DataKeys[e.Item.ItemIndex].ToString();

            try
            {
                linkService.DeleteLink(id);
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
