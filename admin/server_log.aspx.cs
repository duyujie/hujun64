using System;
using System.Data;
using System.Text;
using com.hujun64.logic;
namespace com.hujun64.admin
{
    /// <summary>
    /// art_list 的摘要说明。
    /// </summary>
    public partial class server_log : AdminPageBase
    {


        private ICommonService commonService= ServiceFactory.GetCommonService();


        protected void Page_Load(object sender, System.EventArgs e)
        {

            if (!IsPostBack)
            {
                logDateQuery.Text = DateTime.Now.ToString("yyyy-MM-dd");
                BindList();
                recoverClassCookie();
                logListBind();
            }
        }
        private void saveClassCookie()
        {


            Response.Cookies["log_date"].Value = logDateQuery.Text;
            Response.Cookies["log_level"].Value = levelList.SelectedValue.ToString();
            Response.Cookies["log_logger"].Value = loggerList.SelectedValue.ToString();

          
        }
        private void recoverClassCookie()
        {
            if (Request.Cookies["log_date"] != null)
                logDateQuery.Text = Request.Cookies["log_date"].Value;
            else
                logDateQuery.Text = DateTime.Now.ToString("yyyy-MM-dd");


            if (Request.Cookies["log_level"] != null)
                levelList.SelectedValue = Request.Cookies["log_level"].Value;

            if (Request.Cookies["log_logger"] != null)
                loggerList.SelectedValue = Request.Cookies["log_logger"].Value;

            
        }
        private void BindList()
        {

            DataSet dsLevel = commonService.GetDataSet("select distinct [Level] from [Log]");

            DataRow rowLevelAll= dsLevel.Tables[0].NewRow();
            rowLevelAll[0] = "";
            dsLevel.Tables[0].Rows.InsertAt(rowLevelAll,0);

            levelList.DataSource = dsLevel;
            levelList.DataTextField = "Level";
            levelList.DataValueField = "Level";
            levelList.DataBind();


            DataSet dsLogger = commonService.GetDataSet("select distinct [Logger] from [Log]");

            DataRow rowLoggerAll = dsLogger.Tables[0].NewRow();
            rowLoggerAll[0] = "";
            dsLogger.Tables[0].Rows.InsertAt(rowLoggerAll,0);

            loggerList.DataSource = dsLogger;
            loggerList.DataTextField = "Logger";
            loggerList.DataValueField = "Logger";
            loggerList.DataBind();
        }

        private void logListBind()
        {
            StringBuilder sqlSb = new StringBuilder("select * from [Log] where [Id] is not null ");
            DateTime logDate;
            if (!string.IsNullOrEmpty(logDateQuery.Text) && DateTime.TryParse(logDateQuery.Text, out logDate))
            {
                sqlSb.Append(" and ([Date] >= '");
                sqlSb.Append(logDateQuery.Text);
                sqlSb.Append("' and [Date] < '");
                sqlSb.Append(logDate.AddDays(1).ToString("yyyy-MM-dd"));
                sqlSb.Append("')");
            }
            if(!string.IsNullOrEmpty(levelList.SelectedValue)){
                sqlSb.Append(" and [Level] = '");
                sqlSb.Append(levelList.SelectedValue);
                sqlSb.Append("'");
            }
            if (!string.IsNullOrEmpty(loggerList.SelectedValue))
            {
                sqlSb.Append(" and [Logger] = '");
                sqlSb.Append(loggerList.SelectedValue);
                sqlSb.Append("'");
            }
            sqlSb.Append(" order by [Id] desc");

            int totalCount;
            DataSet ds = commonService.GetPagerDataSet(sqlSb.ToString(), AspNetPager1.CurrentPageIndex, Total.PageSizeDefault,out totalCount);
            AspNetPager1.PageSize = Total.PageSizeDefault;
            AspNetPager1.RecordCount = totalCount;

            loglistDGD.DataSource = ds;
            loglistDGD.DataBind();
        }



        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            saveClassCookie();
            logListBind();
        }
        protected void queryDate_Changed(object sender, System.EventArgs e)
        {
            saveClassCookie();
            logListBind();
        }
        protected void levelList_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            saveClassCookie();
            logListBind();
        }

        protected void loggerList_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            saveClassCookie();
            logListBind();
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
