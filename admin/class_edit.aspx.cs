using System;
using System.Collections.Generic;
using System.Text;
using System.Web.UI.WebControls;
using System.Data;
using com.hujun64.po;
using com.hujun64.logic;
using com.hujun64.util;
using com.hujun64.type;
namespace com.hujun64.admin
{
    /// <summary>
    /// art_list 的摘要说明。
    /// </summary>
    public partial class class_eidt : AdminPageBase
    {


        private IMainClassService classService = ServiceFactory.GetMainClassService();
        protected void Page_Load(object sender, System.EventArgs e)
        {

            if (!IsPostBack)
            {
                siteBind(sender, e);



                bigClassBind();

                smallClassBind();
                moduleClassBind();

            }


        }
        void siteBind(object sender, System.EventArgs e)
        {

            DropDownListSite.DataSource = ServiceFactory.GetCommonService().GetSiteList();
            DropDownListSite.DataBind();

            DropDownListSite_SelectedIndexChanged(sender, e);

        }
        void bigClassBind()//法律业务大类绑定
        {

            DropDownListBigClass.DataSource = classService.GetBigClassList(null, false);
            DropDownListBigClass.DataBind();
        }


        void smallClassBind()//业务细类，随法律业务大类选择的变化动态绑定
        {
            string bigClassId;
            if (DropDownListBigClass.SelectedIndex == -1)
            {
                bigClassId = DropDownListBigClass.Items[0].Value;
            }
            else
            {
                bigClassId = DropDownListBigClass.SelectedValue.ToString();
            }


            if (bigClassId != "" && bigClassId.ToLower() != "all")
            {


                ListBoxSmallClass.DataSource = classService.GetSmallClassList(bigClassId,null);
                ListBoxSmallClass.DataBind();

                ListBoxSmallClass.Visible = true;


            }
            else
            {

                ListBoxSmallClass.Visible = false;

            }
        }

        void moduleClassBind()//版块分类绑定
        {
            ListBoxModuleClass.DataSource = classService.GetModuleClassList(null);
            ListBoxModuleClass.DataBind();

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


        protected void DropDownListBigClassSelected_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            RefreshListBoxSmallClassSelected(sender, e);
        }


        protected void DropDownListSite_SelectedIndexChanged(object sender, System.EventArgs e)
        {


            RefreshDropListBigClassSelected(sender, e);

            RefreshListBoxModuleClassSelected(sender, e);

        }
        private void RefreshDropListBigClassSelected(object sender, System.EventArgs e)
        {


            DropDownListBigClassSelected.DataSource = classService.GetBigClassList(DropDownListSite.SelectedValue, false);
            DropDownListBigClassSelected.DataBind();

            DropDownListBigClassSelected_SelectedIndexChanged(sender, e);
        }
        private void RefreshListBoxSmallClassSelected(object sender, System.EventArgs e)
        {
            ListBoxSmallClassSelected.DataSource = classService.GetSmallClassList( DropDownListBigClassSelected.SelectedValue,DropDownListSite.SelectedValue);

            ListBoxSmallClassSelected.DataBind();

        }
        private void RefreshListBoxModuleClassSelected(object sender, System.EventArgs e)
        {

            ListBoxModuleClassSelected.DataSource = classService.GetModuleClassList(DropDownListSite.SelectedValue);
            ListBoxModuleClassSelected.DataBind();


        }
        protected void DropDownListBigClass_SelectedIndexChanged(object sender, System.EventArgs e)
        {


            smallClassBind();
            foreach (ListItem li in DropDownListBigClassSelected.Items)
            {
                if (li.Value == DropDownListBigClass.SelectedValue)
                {
                    DropDownListBigClassSelected.SelectedValue = li.Value;
                    RefreshListBoxSmallClassSelected(sender, e);
                }
            }


        }



        protected void ButtonRemoveBigClass_Click(object sender, System.EventArgs e)
        {

            classService.RemoveSiteClass(DropDownListSite.SelectedValue, DropDownListBigClassSelected.SelectedValue);

            RefreshDropListBigClassSelected(sender, e);

        }
        protected void ButtonRemoveSmallClass_Click(object sender, System.EventArgs e)
        {
            List<string> toRemoveSmallClassIdList = new List<string>();
            foreach (ListItem li in ListBoxSmallClassSelected.Items)
            {
                if (li.Selected)
                {
                    toRemoveSmallClassIdList.Add(li.Value);
                }
            }
            if (toRemoveSmallClassIdList.Count > 0)
            {
                foreach (string smallId in toRemoveSmallClassIdList)
                {
                    classService.RemoveSiteClass(DropDownListSite.SelectedValue, smallId);
                }
                RefreshDropListBigClassSelected(sender, e);
            }



        }
        protected void ButtonRemoveModuleClass_Click(object sender, System.EventArgs e)
        {
            List<string> toRemoveModuleClassIdList = new List<string>();
            foreach (ListItem li in ListBoxModuleClassSelected.Items)
            {
                if (li.Selected)
                {
                    toRemoveModuleClassIdList.Add(li.Value);
                }
            }
            if (toRemoveModuleClassIdList.Count > 0)
            {
                foreach (string moduleId in toRemoveModuleClassIdList)
                {
                    classService.RemoveSiteClass(DropDownListSite.SelectedValue, moduleId);
                }
                RefreshListBoxModuleClassSelected(sender, e);
            }


        }
        protected void ButtonAddBigClass_Click(object sender, System.EventArgs e)
        {
            bool existsBigClass = false;
            foreach (ListItem item in DropDownListBigClassSelected.Items)
            {
                if (DropDownListBigClass.SelectedValue.Equals(item.Value))
                {
                    existsBigClass = true;
                    break;
                }
            }
            if (!existsBigClass)
            {
                classService.AddSiteClass(DropDownListSite.SelectedValue, DropDownListBigClass.SelectedValue,null);
                RefreshDropListBigClassSelected(sender, e);
            }
        }
        protected void ButtonAddSmallClass_Click(object sender, System.EventArgs e)
        {

            List<string> toAddSmallClassIdList = new List<string>();
            foreach (ListItem li in ListBoxSmallClass.Items)
            {
                if (li.Selected)
                {
                    toAddSmallClassIdList.Add(li.Value);
                }
            }


            if (toAddSmallClassIdList.Count > 0)
            {
                foreach (string smallId in toAddSmallClassIdList)
                {
                    classService.AddSiteClass(DropDownListSite.SelectedValue, smallId, null);
                }
                RefreshListBoxSmallClassSelected(sender, e);
            }
        }
        protected void ButtonAddModuleClass_Click(object sender, System.EventArgs e)
        {
            List<string> toAddModuleClassIdList = new List<string>();
            foreach (ListItem li in ListBoxModuleClass.Items)
            {
                if (li.Selected)
                {
                    toAddModuleClassIdList.Add(li.Value);
                }
            }


            if (toAddModuleClassIdList.Count > 0)
            {
                foreach (string moduleId in toAddModuleClassIdList)
                {
                    classService.AddSiteClass(DropDownListSite.SelectedValue, moduleId, null);
                }
                RefreshListBoxModuleClassSelected(sender, e);
            }
        }
    }
}
