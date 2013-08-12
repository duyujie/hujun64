using System;
using System.IO;
using System.Text;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using com.hujun64.logic;
using com.hujun64.po;
using com.hujun64.util;
using com.hujun64.type;
namespace com.hujun64.admin
{
    /// <summary>
    /// add_art 的摘要说明。
    /// </summary>
    public partial class add_art : AdminPageBase
    {
        private ICommonService commonService = ServiceFactory.GetCommonService();
        private IMainClassService classService = ServiceFactory.GetMainClassService();
        private IArticleService articleService = ServiceFactory.GetArticleService();

        private readonly string BIG_CLASS_ALL = "";
        protected string IMG_UPLOAD_PATH = @"~\images\upload\";
        protected static string uploadImgUrl;

        protected void Page_Load(object sender, System.EventArgs e)
        {

            if (!IsPostBack)
            {
                uploadImgUrl = "";

                bigClassBind();
                smallClassBind();
                moduleClassBind();
                moduleClassList.SelectedValue = Total.ModuleNameJdal;

                string articleId = Request.QueryString[Total.QueryStringArticleId];
                string deletedArticleId = Request.QueryString[Total.QueryStringDeletedArticleId];



                if (string.IsNullOrEmpty(articleId) && string.IsNullOrEmpty(deletedArticleId))
                {
                    recoverClassCookie();
                    author.Text = Total.Author;
                    submit_button.Text = "标准格式发表";
                    definedSubmit_button.Text = "自定义格式发表";

                }
                else
                {
                    submit_button.Text = "标准格式更新";
                    definedSubmit_button.Text = "自定义格式更新";


                    if (!string.IsNullOrEmpty(deletedArticleId))
                    {

                        getUpdateNews(deletedArticleId, true);
                    }
                    else
                    {
                        getUpdateNews(articleId, false);
                    }
                }
                if (moduleClassList.SelectedItem.Text.Trim().Equals(Total.ModuleNameFzrd))
                {
                    author.Text = "";
                    artFrom.Text = "";
                }
            }


        }
        protected void ReferenceFile(object sender, EventArgs E)
        {
            uploadImgUrl = refImgUrl.Text.Trim();
        }
        protected void UploadFile(object sender, EventArgs E)
        {
            //检查上传文件不为空 
            if (imgFile.PostedFile != null)
            {
                try
                {
                    string filename = UtilString.GetPureFilename(imgFile.PostedFile.FileName);
                    bool isFzb = false;
                    if (this.moduleClassList.SelectedItem.Text.Contains("法治报"))
                    {
                        isFzb = true;
                        IMG_UPLOAD_PATH = @"~\pdf\";
                        if (!filename.ToLower().EndsWith(".pdf"))
                        {
                            Response.Write("<script>javascript:alert('法治报 版块必须上传PDF格式文件！');</script>");
                            refImgUrl.Text = "";
                            return;
                        }
                    }

                    StringBuilder destFilepathSb = new StringBuilder(IMG_UPLOAD_PATH);


                    destFilepathSb.Append(filename);
                    string destFullpath = Server.MapPath(destFilepathSb.ToString());


                    imgFile.PostedFile.SaveAs(destFullpath);

                    if (isFzb)
                    {
                        string pdfImgDir = destFullpath.Replace(filename, "");
                        string pdfImgFilename = filename.ToLower().Replace(".pdf", "");

                        IList<string> imgFileList = UtilFile.ConvertPDF2Image(destFullpath, pdfImgDir, pdfImgFilename, 1, 1, ImageFormat.Jpeg, UtilFile.Definition.One);

                        if (imgFileList != null && imgFileList.Count > 0)
                        {
                            string jpgFilename = destFullpath.ToLower().Replace(".pdf", ".jpg");
                            string smallFilename = jpgFilename + ".jpg";
                            if (File.Exists(smallFilename))
                                File.Delete(smallFilename);
                            File.Move(imgFileList[0], smallFilename);
                            UtilFile.ConvertPDF2Image(destFullpath, pdfImgDir, pdfImgFilename, 1, 1, ImageFormat.Jpeg, UtilFile.Definition.Four);

                            if (File.Exists(jpgFilename))
                                File.Delete(jpgFilename);
                            File.Move(imgFileList[0], jpgFilename);
                            destFilepathSb = new StringBuilder(IMG_UPLOAD_PATH);
                            destFilepathSb.Append(UtilString.GetPureFilename(jpgFilename));
                            uploadImgUrl = "../" + destFilepathSb.Replace(@"~\", "").Replace(@"\", "/").ToString() + ".jpg";
                        }

                    }

                    refImgUrl.Text = destFilepathSb.Replace(@"~\", "").Replace(@"\", "/").ToString();



                    Response.Write("<script>javascript:alert('相关文件上传成功！');</script>");
                    MSG.Text = "<font color=red>相关文件上传成功！</font>";

                }
                catch (Exception ex)
                {
                    Response.Write("<script>javascript:alert('" + ex.Message + "');</script>");
                    MSG.Text = "<font color=red>" + ex.Message + "</font>";
                }

            }
        }
        private void getUpdateNews(string nid, bool isDeleted)
        {

            Article article;
            bool isRefArticle = false;
            if (isDeleted)
                article = articleService.GetDeletedArticle(nid, true);
            else
                article = articleService.GetArticle(nid, true);

            if (article.articlePicture != null && !string.IsNullOrEmpty(article.articlePicture.pic_url))
            {
                refImgUrl.Text = article.articlePicture.pic_url;
                uploadImgUrl = article.articlePicture.pic_url;
            }


            TextBoxAticleId.Text = article.id;
            if (!string.IsNullOrEmpty(article.ref_id))
            {

                isRefArticle = true;
                RefArticleId.Text = article.ref_id;
                RefCheckBox.Checked = true;
                RefArticleChecked();

            }
            newsId.Value = nid;
            string smallClassId = smallClassList.SelectedValue.ToString();
            string bigClassId = bigClassList.SelectedValue.ToString();
            string moduleClassId = moduleClassList.SelectedValue.ToString();

            if (article.is_all_class)
            {
                bigClassList.SelectedValue = BIG_CLASS_ALL;
            }
            else
            {
                bigClassList.SelectedValue = article.big_class_id;
            }
            smallClassBind();
            smallClassList.SelectedValue = article.class_id;
            moduleClassList.SelectedValue = article.module_class_id;


            if (!isRefArticle)
            {
                arttitle.Text = article.title;
                ContentEditor.Text = article.content;

                author.Text = article.author;
                artFrom.Text = article.news_from;
                keywords.Text = article.keywords;
            }
            if (article.articlePicture != null)
            {
                refImgUrl.Text = article.articlePicture.pic_url;
                uploadImgUrl = article.articlePicture.pic_url;

            }
        }

        void bigClassBind()//法律业务大类绑定
        {
            bigClassList.DataSource = classService.GetBigClassList(Total.SiteId, true);
            bigClassList.DataBind();

        }
        void smallClassBind()//业务细类，随法律业务大类选择的变化动态绑定
        {
            string id;
            if (bigClassList.SelectedIndex == -1)
            {
                id = bigClassList.Items[0].Value;
            }
            else
            {
                id = bigClassList.SelectedValue.ToString();
            }
            bool existSmallList = false;
            if (id != "" && id.ToLower() != BIG_CLASS_ALL)
            {

                smallClassList.DataTextField = "class_name";
                smallClassList.DataValueField = "id";

                List<MainClass> smallList = classService.GetClassByParent(id, null);
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

        void moduleClassBind()//版块分类绑定
        {

            moduleClassList.DataSource = classService.GetModuleClassList(Total.SiteId);
            moduleClassList.DataBind();

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


        protected void bigClassList_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            smallClassBind();
            saveClassCookie();
        }
        protected void moduleClassList_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            if (moduleClassList.SelectedItem.Text == Total.ModuleNameFzrd || moduleClassList.SelectedItem.Text == Total.ModuleNameGrsb)
            {
                ignoreBigClass.Checked = true;
                ignoreSmallClass.Checked = true;

            }
            saveClassCookie();
        }

        protected void ignoreBigClass_SelectedIndexChanged(object sender, System.EventArgs e)
        {

            if (ignoreBigClass.Checked && ignoreModuleClass.Checked)
            {
                alterIngnore();
            }
            if (ignoreBigClass.Checked)
            {
                ignoreSmallClass.Checked = true;
            }
            saveClassCookie();
        }
        protected void ignoreSmallClass_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            if (ignoreBigClass.Checked && !ignoreSmallClass.Checked)
            {
                Response.Write("<script >function window.onload() {alert('大类已经忽略，小类必须忽略！');}</script>");
                ignoreSmallClass.Checked = true;
            }

            if (ignoreSmallClass.Checked && ignoreModuleClass.Checked)
            {
                alterIngnore();
            }
            saveClassCookie();
        }
        private void alterIngnore()
        {
            Response.Write("<script >function window.onload() {alert('不能所有分类都忽略，至少选择一个分类！');}</script>");

        }

        protected void ignoreModule_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            if (ignoreBigClass.Checked && ignoreModuleClass.Checked)
            {
                alterIngnore();
            }
            saveClassCookie();
        }
        protected void RefCheckBox_Selected(object sender, System.EventArgs e)
        {
            RefArticleChecked();

        }
        private void RefArticleChecked()
        {
            hiddenArticle(!RefCheckBox.Checked);
            displayRefArticle();
            if (!RefCheckBox.Checked)
                resetForm();

        }
        protected void RefId_Changed(object sender, System.EventArgs e)
        {
            displayRefArticle();

        }
        private void displayRefArticle()
        {
            RefArticleId.Text = RefArticleId.Text.Trim();
            if (RefCheckBox.Checked && !string.IsNullOrEmpty(RefArticleId.Text))
            {

                Article article = articleService.GetArticle(RefArticleId.Text, false);
                arttitle.Text = article.title;
                artFrom.Text = article.news_from;
                author.Text = article.author;
                keywords.Text = article.keywords;
            }
        }
        private void hiddenArticle(bool enabled)
        {
            arttitle.Enabled = enabled;
            artFrom.Enabled = enabled;
            author.Enabled = enabled;
            keywords.Enabled = enabled;
            ContentEditor.Visible = enabled;
            definedSubmit_button.Enabled = enabled;
        }

        private void resetForm()
        {
            newsId.Value = "";
            arttitle.Text = "";
            ContentEditor.Text = "";
            author.Text = Total.Author;
            artFrom.Text = Total.ByOriginal;
            keywords.Text = "";
            uploadImgUrl = "";
            refImgUrl.Text = "";
            //ignoreBigClass.Checked = false;
            //ignoreSmallClass.Checked = false;
            //ignoreModule.Checked = false;

        }

        protected void reset_Click(object sender, System.EventArgs e)
        {
            resetForm();
        }
        private void setArticleClass(Article article)
        {
            string smallClassId = smallClassList.SelectedValue.ToString();
            string bigClassId = bigClassList.SelectedValue.ToString();
            string moduleClassId = moduleClassList.SelectedValue.ToString();

            if (ignoreBigClass.Checked && ignoreModuleClass.Checked)
            {
                alterIngnore();
                return;
            }


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

            if (bigClassId.ToLower() == BIG_CLASS_ALL)
            {
                bigClassId = "";
                article.is_all_class = true;
            }
            else
            {
                article.is_all_class = false;
            }
            article.big_class_id = bigClassId;
            article.class_id = smallClassId;
            article.module_class_id = moduleClassId;


        }
        private void saveClassCookie()
        {

            DateTime cookieExpires = DateTime.Now.AddDays(Total.CookieExpiresDays);

            Response.Cookies["add_smallClassId"].Value = smallClassList.SelectedValue.ToString(); Response.Cookies["add_smallClassId"].Expires = cookieExpires;
            Response.Cookies["add_bigClassId"].Value = bigClassList.SelectedValue.ToString(); Response.Cookies["add_bigClassId"].Expires = cookieExpires;
            Response.Cookies["add_moduleClassId"].Value = moduleClassList.SelectedValue.ToString(); Response.Cookies["add_moduleClassId"].Expires = cookieExpires;

            Response.Cookies["add_ignoreSmallClass"].Value = ignoreSmallClass.Checked.ToString(); Response.Cookies["add_ignoreSmallClass"].Expires = cookieExpires;
            Response.Cookies["add_ignoreBigClass"].Value = ignoreBigClass.Checked.ToString(); Response.Cookies["add_ignoreBigClass"].Expires = cookieExpires;
            Response.Cookies["add_ignoreModuleClass"].Value = ignoreModuleClass.Checked.ToString(); Response.Cookies["add_ignoreModuleClass"].Expires = cookieExpires;



        }
        private void recoverClassCookie()
        {
            if (Request.Cookies["add_smallClassId"] != null && !string.IsNullOrEmpty(Request.Cookies["add_smallClassId"].Value))
                smallClassList.SelectedValue = Request.Cookies["add_smallClassId"].Value;

            if (Request.Cookies["add_bigClassId"] != null)
                bigClassList.SelectedValue = Request.Cookies["add_bigClassId"].Value;

            if (Request.Cookies["add_moduleClassId"] != null)
                moduleClassList.SelectedValue = Request.Cookies["add_moduleClassId"].Value;

            smallClassBind();

            if (Request.Cookies["add_ignoreSmallClass"] != null)
                ignoreSmallClass.Checked = Convert.ToBoolean(Request.Cookies["add_ignoreSmallClass"].Value);

            if (Request.Cookies["add_ignoreBigClass"] != null)
                ignoreBigClass.Checked = Convert.ToBoolean(Request.Cookies["add_ignoreBigClass"].Value);

            if (ignoreBigClass.Checked)
            {
                ignoreSmallClass.Checked = true;
            }

            if (Request.Cookies["add_ignoreModuleClass"] != null)
                ignoreModuleClass.Checked = Convert.ToBoolean(Request.Cookies["add_ignoreModuleClass"].Value);





        }
        private void submit(object sender, System.EventArgs e, bool isStandard)
        {
            List<string> siteIdList = new List<string>();

            siteIdList.Add(Total.SiteId);

            if (!string.IsNullOrEmpty(refImgUrl.Text.Trim()))
            {
                uploadImgUrl = refImgUrl.Text.Trim();
            }

            if (RefCheckBox.Checked && !string.IsNullOrEmpty(RefArticleId.Text))
            {

                if (string.IsNullOrEmpty(arttitle.Text))
                {

                    MSG.Text = "对不起，您输入的引用文章ID无效，请重新输入正确的文章ID！";
                    Response.Write("<script>javascript:alert('" + MSG.Text + "');</script>");
                    RefArticleId.Focus();
                    return;
                }
                else if (string.IsNullOrEmpty(TextBoxAticleId.Text))
                {
                    Article articleRef = new Article();
                    articleRef.ref_id = RefArticleId.Text.Trim();
                    Article article = articleService.GetArticle(articleRef.ref_id, false);

                    articleRef.articlePicture = article.articlePicture;
                    setArticleClass(articleRef);


                    articleRef.site_list = siteIdList;


                    articleService.InsertArticleRef(articleRef);



                    //异步更新网站
                    AsyncTaskService.UpdateSiteAsync(RefreshType.ONLY_CHANGED);
                    AsyncTaskService.PostArticle2ShfclawyerAsync(articleRef);

                    MSG.Text = "添加文章引用成功！";

                    Response.Write("<script>javascript:alert('" + MSG.Text + "');</script>");
                    return;

                }
                else
                {
                    Article articleRef = articleService.GetArticle(TextBoxAticleId.Text);
                    articleRef.ref_id = RefArticleId.Text.Trim();
                    setArticleClass(articleRef);
                    articleRef.site_list = siteIdList;
                    articleService.UpdateArticle(articleRef);



                    //异步更新网站
                    AsyncTaskService.UpdateSiteAsync(RefreshType.ONLY_CHANGED);
                    AsyncTaskService.PostArticle2ShfclawyerAsync(articleRef);

                    MSG.Text = "更新文章引用成功！";

                    Response.Write("<script>javascript:alert('" + MSG.Text + "');</script>");
                    return;

                }
            }
            else

                if ((this.moduleClassList.SelectedItem.Text.Contains("法治报") && !string.IsNullOrEmpty(uploadImgUrl) &&  arttitle.Text.Trim() != "") || (arttitle.Text.Trim() != "" && ContentEditor.Text != ""))
                {
                    Article article;
                    try
                    {


                        if (newsId.Value.ToString() != "")
                        {
                            article = articleService.GetArticle(newsId.Value.ToString(), false);
                            if (string.IsNullOrEmpty(article.id))
                            {
                                article = articleService.GetDeletedArticle(newsId.Value.ToString(), false);
                                arttitle.Enabled = true;
                            }

                        }
                        else
                        {
                            article = new Article();
                        }




                        setArticleClass(article);
                        article.site_list = siteIdList;
                        if (!string.IsNullOrEmpty(ContentEditor.Text))
                            article.content = UtilHtml.FormatArticleContent(ContentEditor.Text, isStandard);
                        else
                            article.content = "";




                        article.title = arttitle.Text.Trim();
                        article.author = author.Text.Trim();
                        article.news_from = artFrom.Text.Trim();
                        if (string.IsNullOrEmpty(article.news_from))
                        {
                            article.news_from = "网络转引";
                        }


                        article.is_static = false;
                        article.enabled = true;


                        article.keywords = UtilHtml.FormatKeywords(keywords.Text);


                        if (newsId.Value.ToString() != "")
                        {
                            if (article.articlePicture != null)
                            {
                                article.articlePicture.pic_url = uploadImgUrl;
                            }
                            else if (!string.IsNullOrEmpty(uploadImgUrl))
                            {
                                article.articlePicture = new ArticlePicture();
                                article.articlePicture.pic_url = uploadImgUrl;
                            }
                            articleService.UpdateArticle(article);
                            ContentEditor.Text = article.content;

                            //异步更新网站
                            AsyncTaskService.UpdateSiteAsync(RefreshType.ONLY_CHANGED);
                            AsyncTaskService.PostArticle2ShfclawyerAsync(article);
                            MSG.Text = "更新成功！";


                        }
                        else
                        {
                            if (articleService.ExistsTitle(article.title, true))
                            {
                                MSG.Text = "已经存在相同标题的文章，请更改标题！";
                                Response.Write("<script>javascript:alert('" + MSG.Text + "');</script>");
                                return;
                            }


                            article.id = articleService.GenerateId();
                            if (!string.IsNullOrEmpty(uploadImgUrl))
                            {
                                article.articlePicture = new ArticlePicture();
                                article.articlePicture.pic_url = uploadImgUrl;
                            }


                            articleService.InsertArticle(article);

                            //异步更新网站
                            AsyncTaskService.UpdateSiteAsync(RefreshType.ONLY_CHANGED);
                            AsyncTaskService.PostArticle2ShfclawyerAsync(article);
                            MSG.Text = "添加成功！";

                            resetForm();

                        }

                        //更新搜索索引
                        //LuceneSearcher.WriteIndex(article,false);

                        article = articleService.GetArticle(article.id, false);
                        Response.Write("<script>javascript:if(confirm('操作成功！是否浏览该文章？')){window.open('../" + UtilHtml.GetAspxUrl(article.id, article.page_type) + "');}</script>");



                    }
                    catch (Exception ex)
                    {
                        MSG.Text = "<font color=red>" + ex.Message.ToString() + "</font>";//输出错误信息
                        Response.Write("<script>javascript:alert('错误信息：" + ex.Message.ToString() + "');</script>");
                    }

                }
                else
                {
                    MSG.Text = "请选择分类！标题和内容不能为空！";
                    Response.Write("<script>javascript:alert('" + MSG.Text + "');</script>");
                }
        }
        protected void definedSubmit_Click(object sender, System.EventArgs e)
        {
            submit(sender, e, false);
        }
        protected void submit_Click(object sender, System.EventArgs e)
        {

            submit(sender, e, true);

        }



    }
}
