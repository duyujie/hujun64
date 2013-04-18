using System;
using com.hujun64.po;
using com.hujun64.logic;
namespace com.hujun64
{
    
    public partial class index_contact : System.Web.UI.UserControl
    {
        protected string contactIdWorkday = "", contactIdWeekend="";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                IArticleService articleService = ServiceFactory.GetArticleService();
                Article articleWorkday = articleService.GetArticleByTitle(com.hujun64.Total.ContactWorkdayArticleTitle, false);
                contactIdWorkday = articleWorkday.id;

                Article articleWeekend = articleService.GetArticleByTitle(com.hujun64.Total.ContactWeekendArticleTitle, false);
                contactIdWeekend = articleWeekend.id;
            }
        }
    }
}