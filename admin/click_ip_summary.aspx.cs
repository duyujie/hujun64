using System;
using System.Data;
using com.hujun64.logic;
namespace com.hujun64.admin
{
    /// <summary>
    /// visited_history 的摘要说明。
    /// </summary>
    public partial class click_ip_summary : AdminPageBase
    {
        private IClientService clientService = ServiceFactory.GetClientService();
        private int defaultPeriodDays = 0, defaultTopRows = 50;
       


        protected void Page_Load(object sender, System.EventArgs e)
        {


            if (!IsPostBack)
            {
                dateTo.Text = DateTime.Today.ToString("yyyy-MM-dd");
                dateFrom.Text = DateTime.Today.AddDays(-defaultPeriodDays).ToString("yyyy-MM-dd");

                topRows.Text = defaultTopRows.ToString();
             

                listBind();
            }

        }
        protected void submit_Click(object sender, System.EventArgs e)
        {
            listBind();
        }
        private void listBind()
        {
            DateTime summaryDateFrom = DateTime.Parse(dateFrom.Text);
            DateTime summaryDateTo = DateTime.Parse(dateTo.Text);
            ClickIpSummary clickSummary = clientService.SummaryClickIp(summaryDateFrom, summaryDateTo);
            LabelClick.Text = clickSummary.click.ToString();
            LabelIp.Text = clickSummary.ip.ToString();
            LabelIpShanghai.Text = clickSummary.ip_shanghai.ToString();

            DataSet ds = clientService.SummaryClickSource(summaryDateFrom, summaryDateTo, Convert.ToInt32(topRows.Text));
            listDGD.DataSource = ds;
            listDGD.DataBind();

        }



        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
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
