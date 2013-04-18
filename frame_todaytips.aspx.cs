using System;
using System.Text;
using System.Web;
using com.hujun64.po;
using com.hujun64.util;

namespace com.hujun64
{
    /// <summary>
    /// guestbook 的摘要说明。
    /// </summary>
    public partial class frame_todaytips : PageBase
    {
        protected string todayTips;
        private string cacheKey = "Weather";
        protected void Page_Load(object sender, System.EventArgs e)
        {
            todayTips = GetTodayTips();
            
        }
        private string GetTodayTips()
        {

            StringBuilder sb = new StringBuilder(UtilHtml.GetFullImageUrl("images/ebschedule_18.gif", "", "18px", "18px"));
            sb.Append(UtilString.GetDayTips());
            sb.Append("<br />");

            object weatherTips = HttpContext.Current.Cache.Get(cacheKey);
            if (weatherTips == null)
            {
                TimeSpan SessTimeOut = new TimeSpan(0, 0, System.Web.HttpContext.Current.Session.Timeout, 0, 0);//取得Session的过期时间   

                weatherTips = InternetWebService.GetWeather().GetDayWeather(0).ToHtml(false, true);
                HttpContext.Current.Cache.Insert(cacheKey, weatherTips, null, DateTime.MaxValue, SessTimeOut, System.Web.Caching.CacheItemPriority.NotRemovable, null);
            }
            sb.Append(weatherTips.ToString());
            return sb.ToString();
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
