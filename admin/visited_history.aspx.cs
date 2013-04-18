using System;
using System.Data;
using System.Text;
using com.hujun64.logic;
namespace com.hujun64.admin
{
    /// <summary>
    /// visited_history 的摘要说明。
    /// </summary>
    public partial class visited_history : AdminPageBase
    {


        private ICommonService commonService=  ServiceFactory.GetCommonService();

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!IsPostBack)
            {
                recoverClassCookie();
                listBind();
            }

        }
        private void saveClassCookie()
        {


            Response.Cookies["visited_date"].Value = logDateQuery.Text;


        }
        private void recoverClassCookie()
        {
            if (Request.Cookies["visited_date"] != null)
                logDateQuery.Text = Request.Cookies["visited_date"].Value;
            else
                logDateQuery.Text = DateTime.Now.ToString("yyyy-MM-dd");

        }
        private void listBind()
        {
            DateTime logDate;

            StringBuilder sqlSb = new StringBuilder("select * from view_visited_history where id is not null ");
            if (!string.IsNullOrEmpty(logDateQuery.Text) && DateTime.TryParse(logDateQuery.Text, out logDate))
            {
                sqlSb.Append(" and (visited_time >= '");
                sqlSb.Append(logDateQuery.Text);
                sqlSb.Append("' and visited_time < '");
                sqlSb.Append(logDate.AddDays(1).ToString("yyyy-MM-dd"));
                sqlSb.Append("')");
            }
            sqlSb.Append(" order by visited_time desc");


            int totalCount;
            
            DataSet ds = commonService.GetPagerDataSet(sqlSb.ToString(), AspNetPager1.CurrentPageIndex, Total.PageSizeDefault, out totalCount);
            AspNetPager1.PageSize=Total.PageSizeDefault;
            AspNetPager1.RecordCount = totalCount;

            listDGD.DataSource = ds;
            listDGD.DataBind();
        }


        protected void queryDate_Changed(object sender, System.EventArgs e)
        {
            saveClassCookie();
            listBind();
        }
        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            saveClassCookie();
            listBind();
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
