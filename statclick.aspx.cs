using System;
using com.hujun64.logic;
using com.hujun64.type;
using com.hujun64.util;

namespace com.hujun64
{
    
    /// <summary>
    ///		stat 的摘要说明。
    /// </summary>
    public partial class statclick : PageBase
    {
       
        protected int clickTimes=1;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            try
            {
                    
           
                PageInfo pageInfo = UtilHtml.GetPageInfoOfRequet(Request);
            
                AsyncTaskService.VisitPageAsync(pageInfo);    
            }
            catch (Exception)
            {

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

        }
        #endregion
    }
}
