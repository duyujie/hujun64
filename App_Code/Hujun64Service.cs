using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Services;
using com.hujun64.po;
using com.hujun64.logic;
using com.hujun64.util;
namespace com.hujun64.Web.Service
{
    [WebService(Namespace = "http://www.hujun64.com/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]

    public class Hujun64Service : System.Web.Services.WebService
    {
        public Hujun64Service()
        {

            //如果使用设计的组件，请取消注释以下行 
            //InitializeComponent(); 
        }


        /// <summary>
        /// 网上留言提问
        /// </summary>
        /// <param name="guestbook">提问的内容</param>
        /// <returns>返回结果</returns>
        [WebMethod]  //声明此函数为web service方法，可以供外界调用
        public bool PostGuestbook(String userName, String md5Password, Guestbook guestbook)
        {
            IAdminService adminService = ServiceFactory.GetAdminService();
            if (!adminService.Islogin(userName, md5Password))
                return false;

            guestbook.big_class_id = ServiceFactory.GetMainClassService().GetClassByName(Total.BigClassNameJjfc,Total.SiteId).id;

            IGuestbookService guestbookService = ServiceFactory.GetGuestbookService();
            Guestbook thisGuestbook = guestbookService.GetGuestbook(guestbook.id);
            if (thisGuestbook != null && !String.IsNullOrEmpty(thisGuestbook.id))
            {
                return guestbookService.ReplyGuestbook(guestbook);
            }
            else
            {
                return guestbookService.InsertGuestbook(guestbook);
            }
        }

        [WebMethod]  //声明此函数为web service方法，可以供外界调用
        public bool DeleteGuestbook(String userName, String md5Password, String guestbookId)
        {
            IAdminService adminService = ServiceFactory.GetAdminService();
            if (!adminService.Islogin(userName, md5Password))
                return false;

            IGuestbookService guestbookService = ServiceFactory.GetGuestbookService();

            return guestbookService.DeleteGuestbook(guestbookId);
        }
        [WebMethod]  //声明此函数为web service方法，可以供外界调用
        public void SendMail(String userName, String md5Password, String subject,String content,String receiver,String[] cc)
        {
            IAdminService adminService = ServiceFactory.GetAdminService();
            if (!adminService.Islogin(userName, md5Password))
                return;

            UtilMail.SendMailAsync(subject, content, receiver, cc);
        }
        [WebMethod]  //声明此函数为web service方法，可以供外界调用
        public bool PostArticle(String userName, String md5Password, Article article)
        {
            IAdminService adminService = ServiceFactory.GetAdminService();
            if (!adminService.Islogin(userName, md5Password))
                return false;
            IArticleService articleService = ServiceFactory.GetArticleService();
            Article thisArticle = articleService.GetArticle(article.id);


            if (thisArticle != null && !String.IsNullOrEmpty(thisArticle.id))
            {
                return articleService.UpdateArticle(article);
            }
            else if (String.IsNullOrEmpty(article.ref_id))
            {
                return articleService.InsertArticle(article);
            }
            else
            {
                return articleService.InsertArticleRef(article);
            }


        }


        [WebMethod]  //声明此函数为web service方法，可以供外界调用
        public bool DeleteArticle(String userName, String md5Password, String articleId)
        {
            IAdminService adminService = ServiceFactory.GetAdminService();
            if (!adminService.Islogin(userName, md5Password))
                return false;
            IArticleService articleService = ServiceFactory.GetArticleService();
            return articleService.DeleteArticle(articleId);
        }
    }
}