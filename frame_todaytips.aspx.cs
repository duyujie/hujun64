using System;
using System.Text;
using System.Web;
using com.hujun64.po;
using com.hujun64.util;

namespace com.hujun64
{
    /// <summary>
    /// guestbook ��ժҪ˵����
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
                TimeSpan SessTimeOut = new TimeSpan(0, 0, System.Web.HttpContext.Current.Session.Timeout, 0, 0);//ȡ��Session�Ĺ���ʱ��   

                weatherTips = InternetWebService.GetWeather().GetDayWeather(0).ToHtml(false, true);
                HttpContext.Current.Cache.Insert(cacheKey, weatherTips, null, DateTime.MaxValue, SessTimeOut, System.Web.Caching.CacheItemPriority.NotRemovable, null);
            }
            sb.Append(weatherTips.ToString());
            return sb.ToString();
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

        }
        #endregion
    }
}
