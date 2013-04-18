using System;
using System.Text;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Collections.Generic;
using com.hujun64.util;
using com.hujun64.logic;
using com.hujun64.po;

namespace com.hujun64
{
    /// <summary>
    /// index 的摘要说明。
    /// </summary>
    public partial class index : PageBase
    {
        public string title = "", url = "", id = "";



       
        private IMainClassService classService = ServiceFactory.GetMainClassService();
        private IArticleService articleService = ServiceFactory.GetArticleService();
        private IArticleService subArticleService = ServiceFactory.GetArticleService(); 

        protected System.Web.UI.WebControls.DataList DataList1;
        protected System.Web.UI.WebControls.DataList DataList2;


        protected string hotClassName = Total.ModuleNameFzrd;
        protected string hotClassId;

        protected void Page_Load(object sender, System.EventArgs e)
        {
             
            
            //法治热点


            hotRepeater.DataSource = articleService.GetTopArticleByModuleName(hotClassName, Total.MaxRowsIndexHot);
            hotRepeater.DataBind();    

            hotClassId = classService.GetClassByName(Total.ModuleNameFzrd, Total.SiteId).id;


            //大类带文章部分循环开始
            //频道
            List<string> moduleNameList=new List<string>();
            moduleNameList.Add(Total.ModuleNameJdal);
            moduleNameList.Add(Total.ModuleNameBasj);
            moduleNameList.Add(Total.ModuleNameSyfg);
            moduleNameList.Add(Total.ModuleNameGrsb);

            dlCategories.DataSource = classService.GetSiteClassByMain(classService.GetModuleClassListByModuleNameList(moduleNameList, Total.SiteId), Total.SiteId);
            dlCategories.DataBind();
         

            //大类带文章循环部分结束


        }


        private int moduleRowCount = 1;
        protected void dlCategories_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (moduleRowCount ==2)
            {
                StringBuilder imgSb = new StringBuilder();
                imgSb.Append("<div align=\"center\">");
                imgSb.Append(Total.BannerObjectUrl);
                imgSb.Append("</div>");
                e.Item.Controls.Add(new LiteralControl(imgSb.ToString()));

            }else if(moduleRowCount ==4)
            {
                StringBuilder imgSb = new StringBuilder();
                imgSb.Append("<div align=\"center\">");
                imgSb.Append(Total.BannerProfessionalUrl);
                imgSb.Append("</div>");
                e.Item.Controls.Add(new LiteralControl(imgSb.ToString()));

            }

            moduleRowCount++;

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {


                Repeater repeaterImgNews = (Repeater)e.Item.FindControl("RepeaterImgNews");
                Repeater repeaterNoImgNews = (Repeater)e.Item.FindControl("RepeaterNoImgNews");
                //找到分类Repeater关联的数据项 
                SiteClass scClass = (SiteClass)e.Item.DataItem;
                //提取分类ID 
                string moduleClassId = scClass.mainClass.id;



                
                repeaterImgNews.DataSource = subArticleService.GetTopArticle(null, null, moduleClassId, 1, Total.MaxRowsIndexImageArticle);
                repeaterImgNews.DataBind();



                repeaterNoImgNews.DataSource = subArticleService.GetTopArticle(null, null, moduleClassId, Total.MaxRowsIndexImageArticle + 1, Total.MaxRowsIndexAllArticle - Total.MaxRowsIndexImageArticle);
                repeaterNoImgNews.DataBind();
                
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
            dlCategories.ItemDataBound += new RepeaterItemEventHandler(dlCategories_ItemDataBound);
        }
        #endregion
    }
}
