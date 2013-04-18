using System;
using System.Text;
using System.Data;
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
    public partial class add_cgw : AdminPageBase
    {
        private ICgwService cgwService = ServiceFactory.GetCgwService();



        protected void Page_Load(object sender, System.EventArgs e)
        {

            if (!IsPostBack)
            {
                getCgwWordsList();
            }

        }
        protected void submit_Click(object sender, System.EventArgs e)
        {


            if (string.IsNullOrEmpty(TextBoxOriginalWords.Text.Trim()) || string.IsNullOrEmpty(TextBoxNewWords.Text.Trim()))
            {
                MSG.Text = "敏感词和替代词不能为空！";

            }
            else
            {
                CgwWords words = new CgwWords();
                words.original_words = TextBoxOriginalWords.Text.Trim();
                words.new_words = TextBoxNewWords.Text.Trim();

                int i = cgwService.InsertOrUpdateCgwWords(words);
                MSG.Text = i.ToString() + "条记录被更新！";
                cgwService.RefreshCacheCgw();
                getCgwWordsList();
            }


            Response.Write("<script>javascript:alert('" + MSG.Text + "');</script>");

        }
        private void getCgwWordsList()
        {
            List<CgwWords> cgwWordsList= cgwService.GetAllWordsList();

            StringBuilder sb = new StringBuilder();
            foreach (CgwWords words in cgwWordsList)
            {
                sb.AppendFormat("<div>{0} : {1} - {2}</div>", words.id, words.original_words, words.new_words);
            }
            ContentEditor.Text = sb.ToString();
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
