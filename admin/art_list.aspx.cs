using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Web.UI.WebControls;
using System.IO;
using System.Threading;
using System.Web;
using com.hujun64.po;
using com.hujun64.logic;
using com.hujun64.util;
using com.hujun64.type;
namespace com.hujun64.admin
{
    /// <summary>
    /// art_list ��ժҪ˵����
    /// </summary>
    public partial class art_list : AdminPageBase
    {


        IMainClassService mainClassService = ServiceFactory.GetMainClassService();
        private IArticleService articleService = ServiceFactory.GetArticleService();

        private readonly int INDEX_SORT_UP = 7, INDEX_SORT_DOWN = 8;
        private readonly int INDEX_REF_ID = 3, INDEX_REF_BY = 4;
        static Dictionary<string, int> storedPageIndexCollection = new Dictionary<string, int>();

        protected string navigateUrlFormatString = "add_art.aspx?" + Total.QueryStringArticleId + "={0}";

        protected void Page_Load(object sender, System.EventArgs e)
        {

            if (!IsPostBack)
            {
                bigClassBind();
                smallClassBind();
                moduleClassBind();
                moduleClassList.SelectedValue = Total.ModuleNameJdal;


                recoverClassCookie();

                getNewsList();
            }
            else
            {
                recoverPageIndex();
                AspNetPager1.CurrentPageIndex = AspNetPager1.StoredPageIndex;
            }

        }
        void bigClassBind()//����ҵ������
        {

            bigClassList.DataSource = mainClassService.GetBigClassList(Total.SiteId, true);

            bigClassList.DataBind();
        }
        void smallClassBind()//ҵ��ϸ�࣬�淨��ҵ�����ѡ��ı仯��̬��
        {
            string bigClassId;
            if (bigClassList.SelectedIndex == -1)
            {
                bigClassId = bigClassList.Items[0].Value;
            }
            else
            {
                bigClassId = bigClassList.SelectedValue.ToString();
            }

            bool existSmallList = false;
            if (bigClassId != "" && bigClassId.ToLower() != "all")
            {

                List<MainClass> smallList = mainClassService.GetClassByParent(bigClassId, null);
                if (smallList.Count > 0)
                {
                    existSmallList = true;

                    smallClassList.DataSource = smallList;
                    smallClassList.DataBind();

                    ignoreSmallClass.Checked = false;
                    smallClassList.Visible = true;
                    ignoreSmallClass.Visible = true;
                    ignoreSmallClassLabel.Visible = true;
                }

            }
            if (!existSmallList)
            {
                ignoreSmallClass.Checked = true;
                smallClassList.Visible = false;
                ignoreSmallClass.Visible = false;
                ignoreSmallClassLabel.Visible = false;
            }
        }

        void moduleClassBind()//�������
        {

            moduleClassList.DataSource = mainClassService.GetModuleClassList(Total.SiteId);
            moduleClassList.DataBind();


        }

        private string getStoredPageIndexKey()
        {
            StringBuilder keySb = new StringBuilder();
            keySb.Append(bigClassList.SelectedValue.ToString());
            keySb.Append(smallClassList.SelectedValue.ToString());
            keySb.Append(moduleClassList.SelectedValue.ToString());
            keySb.Append(ignoreSmallClass.Checked.ToString());
            keySb.Append(ignoreBigClass.Checked.ToString());
            keySb.Append(ignoreModuleClass.Checked.ToString());
            return keySb.ToString();

        }
        private void saveClassCookie()
        {
            DateTime cookieExpires = DateTime.Now.AddDays(Total.CookieExpiresDays);

            Response.Cookies["list_smallClassId"].Value = smallClassList.SelectedValue.ToString(); Response.Cookies["list_smallClassId"].Expires = cookieExpires;
            Response.Cookies["list_bigClassId"].Value = bigClassList.SelectedValue.ToString(); Response.Cookies["list_bigClassId"].Expires = cookieExpires;
            Response.Cookies["list_moduleClassId"].Value = moduleClassList.SelectedValue.ToString(); Response.Cookies["list_moduleClassId"].Expires = cookieExpires;

            Response.Cookies["list_ignoreSmallClass"].Value = ignoreSmallClass.Checked.ToString(); Response.Cookies["list_ignoreSmallClass"].Expires = cookieExpires;
            Response.Cookies["list_ignoreBigClass"].Value = ignoreBigClass.Checked.ToString(); Response.Cookies["list_ignoreBigClass"].Expires = cookieExpires;
            Response.Cookies["list_ignoreModuleClass"].Value = ignoreModuleClass.Checked.ToString(); Response.Cookies["list_ignoreModuleClass"].Expires = cookieExpires;

            string key = getStoredPageIndexKey();
            if (storedPageIndexCollection.ContainsKey(key))
            {
                storedPageIndexCollection[key] = AspNetPager1.CurrentPageIndex;
            }
            else
            {
                storedPageIndexCollection.Add(key, AspNetPager1.CurrentPageIndex);
            }


        }
        private void recoverClassCookie()
        {
            if (Request.Cookies["list_smallClassId"] != null && !string.IsNullOrEmpty(Request.Cookies["list_smallClassId"].Value))
                smallClassList.SelectedValue = Request.Cookies["list_smallClassId"].Value;

            if (Request.Cookies["list_bigClassId"] != null)
                bigClassList.SelectedValue = Request.Cookies["list_bigClassId"].Value;

            if (Request.Cookies["list_moduleClassId"] != null)
                moduleClassList.SelectedValue = Request.Cookies["list_moduleClassId"].Value;

            smallClassBind();

            if (Request.Cookies["list_ignoreSmallClass"] != null)
                ignoreSmallClass.Checked = Convert.ToBoolean(Request.Cookies["list_ignoreSmallClass"].Value);

            if (Request.Cookies["list_ignoreBigClass"] != null && !string.IsNullOrEmpty((Request.Cookies["list_ignoreBigClass"].Value)))
                ignoreBigClass.Checked = Convert.ToBoolean(Request.Cookies["list_ignoreBigClass"].Value);

            if (ignoreBigClass.Checked)
            {
                ignoreSmallClass.Checked = true;
            }

            if (Request.Cookies["list_ignoreModuleClass"] != null)
                ignoreModuleClass.Checked = Convert.ToBoolean(Request.Cookies["list_ignoreModuleClass"].Value);


            recoverPageIndex();


        }
        private void recoverPageIndex()
        {
            string key = getStoredPageIndexKey();
            if (storedPageIndexCollection.ContainsKey(key))
            {
                AspNetPager1.StoredPageIndex = storedPageIndexCollection[key];
            }
            else
            {
                AspNetPager1.StoredPageIndex = 1;
                storedPageIndexCollection.Add(getStoredPageIndexKey(), 1);
            }
        }
        private void getNewsList()
        {
            string smallClassId = smallClassList.SelectedValue.ToString();
            string bigClassId = bigClassList.SelectedValue.ToString();
            string moduleClassId = moduleClassList.SelectedValue.ToString();


            if (ignoreBigClass.Checked)
            {

                bigClassId = "";
            }
            if (ignoreSmallClass.Checked)
            {
                smallClassId = "";

            }
            if (ignoreModuleClass.Checked)
            {
                moduleClassId = "";

            }
            int totalCount = 0;
            List<Article> articleList = articleService.GetTopArticle(bigClassId, smallClassId, moduleClassId, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1) + 1, AspNetPager1.PageSize, out totalCount);
            newsListBind(articleList, totalCount);

        }
        private void newsListBind(List<Article> articleList, int totalCount)
        {
            ;


            AspNetPager1.AlwaysShow = true;
            AspNetPager1.PageSize = Total.PageSizeDefault;



            AspNetPager1.RecordCount = totalCount;
            newlistDGD.DataSource = articleList;
            newlistDGD.DataBind();


            //���һ�в��ܽ���
            if (newlistDGD.Items.Count > 0)
                newlistDGD.Items[newlistDGD.Items.Count - 1].Cells[INDEX_SORT_DOWN].Enabled = false;
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
            this.newlistDGD.DeleteCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.newlistDGD_DeleteCommand);
            newlistDGD.ItemDataBound += new DataGridItemEventHandler(newlistDGD_ItemDataBound);

        }
        #endregion

        protected void bigClassList_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            ignoreBigClass.Checked = false;

            smallClassBind();

            saveClassCookie();

            getNewsList();

        }

        protected void moduleList_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            if (moduleClassList.SelectedItem.Text == Total.ModuleNameFzrd || moduleClassList.SelectedItem.Text == Total.ModuleNameGrsb)
            {
                ignoreBigClass.Checked = true;
                ignoreSmallClass.Checked = true;
            }
            saveClassCookie();
            getNewsList();

        }
       
        protected void smallClassList_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            saveClassCookie();
            newlistDGD.Visible = true;
            getNewsList();


        }
        protected void ignoreBigClass_SelectedIndexChanged(object sender, System.EventArgs e)
        {


            if (ignoreBigClass.Checked)
            {
                ignoreSmallClass.Checked = true;
            }
            saveClassCookie();
            getNewsList();

        }
        protected void ignoreSmallClass_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            if (ignoreBigClass.Checked && !ignoreSmallClass.Checked)
            {
                Response.Write("<script >function window.onload() {alert('�����Ѿ����ԣ�С�������ԣ�');}</script>");
                ignoreSmallClass.Checked = true;
            }

            saveClassCookie();
            getNewsList();
        }

        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            saveClassCookie();
            getNewsList();
        }

        private void newlistDGD_DeleteCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {

            try
            {
                string id = newlistDGD.DataKeys[e.Item.ItemIndex].ToString();
                Article article = articleService.GetArticle(id, false);
                string htmlUrl = UtilHtml.GetHtmlUrl(id, article.page_type);
                if (articleService.DeleteArticle(id))
                {
                    //AsyncTaskService.DeleteArticle4ShfclawyerAsync(id);
                    string filePath = HttpContext.Current.Server.MapPath("~/") + htmlUrl;
                    if (File.Exists(filePath))
                    {
                        File.Delete(filePath);
                    }

                    MSG.Text = "ɾ���ɹ���";
                }
                else
                    MSG.Text = "ɾ��ʧ�ܣ�";
                Response.Write("<script>javascript:alert('" + MSG.Text + "');</script>");

            }
            catch (Exception ex)
            {
                MSG.Text = ex.Message.ToString();//���������Ϣ
            }
            finally
            {

                getNewsList();
            }

        }
        protected void newlistDGD_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                if (e.Item.ItemIndex == 0)
                {
                    //��һ�в��ܽ�������
                    e.Item.Cells[INDEX_SORT_UP].Enabled = false;
                }
                Article article = (Article)e.Item.DataItem;
                if (!string.IsNullOrEmpty(article.ref_id))
                {
                    string refId = article.ref_id;

                    StringBuilder refUrlSb = new StringBuilder();

                    refUrlSb.AppendFormat("add_art.aspx?nid={0}", refId);



                    string refPageInfo = UtilHtml.FormatHtmlToText(UtilHtml.GetPageInfo(articleService.GetArticle(refId, false)).locationHref);


                    e.Item.Cells[INDEX_REF_ID].Text = UtilHtml.BuildHref(refUrlSb.ToString(), refId, refPageInfo, false);
                }
                if (!string.IsNullOrEmpty(article.ref_by_list))
                {
                    string[] refByArray = article.ref_by_list.Split(' ');
                    StringBuilder sb = new StringBuilder();
                    foreach (string refById in refByArray)
                    {
                        string refByUrl = Total.ApplicationPath + "/" + UtilHtml.GetAspxUrl(refById, PageType.ARTICLE_TYPE);
                        string refByPageInfo = UtilHtml.FormatHtmlToText(UtilHtml.GetPageInfo(articleService.GetArticle(refById, false)).locationHref);
                        sb.Append(UtilHtml.BuildHref(refByUrl, refById, refByPageInfo, true)); sb.Append(" ");
                    }
                    e.Item.Cells[INDEX_REF_BY].Text = sb.ToString();
                }



            }

        }
        protected void standardFormat_Click(object sender, System.EventArgs e)
        {
            formatContent(true);


        }
        protected void definedFormat_Click(object sender, System.EventArgs e)
        {
            formatContent(false);


        }
        private void formatContent(bool isStandard)
        {
            string HtmlSpace = "&nbsp;";
            try
            {
                for (int i = 0; i < newlistDGD.Items.Count; i++)
                {
                    if (string.IsNullOrEmpty(newlistDGD.Items[i].Cells[INDEX_REF_ID].Text.Replace(HtmlSpace, "")))
                    {
                        string id = newlistDGD.DataKeys[i].ToString();
                        Article article = articleService.GetArticle(id, true);
                        article.content = UtilHtml.FormatArticleContent(article.content, isStandard);
                        article.is_static = false;
                        articleService.UpdateArticle(article);
                    }
                }
                //�첽������վ
                AsyncTaskService.UpdateSiteAsync(RefreshType.ONLY_CHANGED);

                MSG.Text = "�ɹ���ʽ����ϣ�";
                Response.Write("<script>javascript:alert('" + MSG.Text + "');</script>");

            }
            catch (Exception ex)
            {
                MSG.Text = ex.Message.ToString();//���������Ϣ
            }
        }
        protected void newlistDGD_Command(object sender, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            string idCurrent, idOther;
            int indexOther;
            Article articleCurrent, articleOther;
            SortObject sortCurrent, sortOther;


            idCurrent = newlistDGD.DataKeys[e.Item.ItemIndex].ToString();




            if (e.CommandName == "SortUp" || e.CommandName == "SortDown")
            {
                try
                {
                    articleCurrent = articleService.GetArticle(idCurrent, false);

                    sortCurrent = new SortObject(articleCurrent.id, articleCurrent.sort_seq);

                    if (e.CommandName == "SortUp")
                    {
                        indexOther = e.Item.ItemIndex - 1;
                    }
                    else
                    {
                        indexOther = e.Item.ItemIndex + 1;
                    }

                    idOther = newlistDGD.DataKeys[indexOther].ToString();

                    articleOther = articleService.GetArticle(idOther, false);

                    sortOther = new SortObject(articleOther.id, articleOther.sort_seq);

                    if (e.CommandName == "SortUp")
                    {
                        sortOther = sortCurrent.ExchangeDownSortSeq(sortOther);
                    }
                    else
                    {
                        sortOther = sortCurrent.ExchangeUpSortSeq(sortOther);
                    }

                    articleCurrent.sort_seq = sortCurrent.sortSeq;
                    articleOther.sort_seq = sortOther.sortSeq;

                    articleService.UpdateSortSeq(idCurrent, articleCurrent.sort_seq);
                    articleService.UpdateSortSeq(idOther, articleOther.sort_seq);

                }
                catch (Exception ex)
                {
                    MSG.Text = ex.Message.ToString();//���������Ϣ
                    Response.Write("<script>javascript:alert('" + MSG.Text + "');</script>");
                }
                finally
                {
                    getNewsList();
                }
            }
            else if (e.CommandName == "Open")
            {
                Article article = articleService.GetArticle(idCurrent, false);

                Response.Write("<script>javascript:window.open('../" + UtilHtml.GetAspxUrl(article.id, article.page_type) + "');</script>");
            }
        }
    }
}
