<%@ Page Language="C#" AutoEventWireup="true" CodeFile="linkapp.aspx.cs" Inherits="com.hujun64.linkapp" EnableViewState="false" EnableViewStateMac="false" %>

<%@ Register TagPrefix="uc1" TagName="topmenu" Src="ascx/dropdown_menu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="index_flash" Src="ascx/index_flash.ascx" %>
<%@ Register TagPrefix="uc1" TagName="index_intro" Src="ascx/index_intro.ascx" %>
<%@ Register TagPrefix="uc1" TagName="index_fee" Src="ascx/index_fee.ascx" %>
<%@ Register TagPrefix="uc1" TagName="index_contact" Src="ascx/index_contact.ascx" %>
<%@ Register TagPrefix="uc1" TagName="guest_ask_top" Src="ascx/guest_ask_top.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="ascx/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="track" Src="ascx/track.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<!--head区开始位置-->
<head runat="server">
    <uc1:header ID="Head2" runat="server"></uc1:header>
  
    <meta name="Keywords" content="<%=Total.Keywords+" "%>" />
    <title>
        <%=Total.ModuleNameSqyqlj + "_" + Total.Title%>
    </title>
</head>
<!--head区结束--位置-->
<body>
     <div class="DivContainer">
        <iframe name="frame_header" class="frameHeader" marginwidth="0" marginheight="0"
            src="frame_header.aspx"  frameborder="0" scrolling="no">
        </iframe>
    </div>
    <form id="bodyForm" runat="server">
    
    <div id="DivContainer" align="center" class="DivContainer">
        <div class="DivLeft">
            <!--左边开始-->
            <div class="DivLeftMenu">
                <uc1:index_flash ID="index_flash" runat="server"></uc1:index_flash>
            </div>
            <div class="DivLeftMenu">
                <uc1:index_intro ID="index_intro" runat="server"></uc1:index_intro>
            </div>
            <div class="DivLeftMenu">
                <uc1:index_fee ID="index_fee" runat="server"></uc1:index_fee>
            </div>
            <div class="DivLeftMenu">
                <uc1:index_contact ID="index_contact" runat="server"></uc1:index_contact>
            </div>
        </div>
        <div id="DivContent" align="center" class="DivContent">
            <div class="DivMyLocation" align="left">
                您的位置：
                <%=myLocation%>
            </div>
            <div class="DivGuestaskTop" align="left">
                <uc1:guest_ask_top ID="guest_ask_top" runat="server"></uc1:guest_ask_top>
            </div>
            <div align="center" class="DivContent" style="margin-bottom: 10px">
                <%=Total.BannerFocusUrl%>
            </div>
            <div align="center" class="DivContent">
                <table align="left" cellspacing="0" rules="all" class="frameLinkAppTable">
                    <tbody>
                        <tr>
                            <td style="line-height: 180%;" width="100%" height="38" colspan="3">
                                <table>
                                    <tr>
                                        <td width="600" align="center">
                                            <h3>
                                                本站信息</h3>
                                        </td>
                                    </tr>
                                </table>
                                <table border="0" width="98%" align="center">
                                    <tr>
                                        <td width="65%" style="line-height: 150%" height="26">
                                            本站名称：<font color="blue"><%=Total.SiteName%></font>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="65%" style="line-height: 150%" height="26">
                                            本站地址：<font color="blue"><%=Total.SiteUrl%></font>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="100%" style="line-height: 150%" height="26" colspan="2">
                                            本站LOGO：<%=UtilHtml.BuildHref(Total.SiteUrl, UtilHtml.GetFullImageUrl(Total.LinkLogo, Total.Title), Total.Title, true)%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="100%" style="line-height: 150%" height="26" colspan="2">
                                            本站说明：<font color="blue"><%=Total.Description%></font>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                    <tbody>
                        <tr>
                            <td colspan="3" height="60px">
                                <div style="margin-left: 1em; color: Red">
                                    <%=applyNotice%></div>
                            </td>
                        </tr>
                    </tbody>
                    <tbody>
                        <tr>
                            <td width="100%" height="30" align="center" colspan="2">
                                <b>请认真填写您需要提交的网站信息</b>（带<font color="#FF3300">*</font>号的项目必填）
                            </td>
                        </tr>
                    </tbody>
                    <tbody>
                        <tr>
                            <td width="18%" height="25" align="right">
                                贵站上显示&nbsp;<br />
                                本站的页面<font color="red">*</font>
                            </td>
                            <td width="82%" height="25">
                                <asp:TextBox ID="myUrl" runat="server" Width="300px" MaxLength="100" ToolTip="您的网站上显示有本站链接的地址，请尽量先做好本站的链接"
                                    ForeColor="#FF3300">http://www.</asp:TextBox>
                                <asp:RequiredFieldValidator ID="validMyUrl" runat="server" ControlToValidate="myUrl"
                                    Display="dynamic" SetFocusOnError="true">本站链接</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </tbody>
                    <tbody>
                        <tr>
                            <td width="18%" height="25" align="right">
                                网站名称<font color="red">*</font>
                            </td>
                            <td width="82%" height="25">
                                <asp:TextBox ID="siteName" runat="server" Width="300px" MaxLength="30" ForeColor="#FF3300"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="siteName"
                                    Display="dynamic" SetFocusOnError="true">网站名称不能为空</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </tbody>
                    <tbody>
                        <tr>
                            <td width="18%" height="25" align="right">
                                验证码<font color="red">*</font>
                            </td>
                            <td>
                                <img alt="" src="admin/ValidateCode.aspx">
                                <asp:TextBox ID="txtValidateCode" runat="server" Width="40px" MaxLength="4" ToolTip="请填写左侧四位一组的验证码！"
                                    onkeyup="value=value.replace(/[^0-9_]/ig, '')" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtValidateCode"
                                    Display="dynamic" SetFocusOnError="true">验证码不能为空</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </tbody>
                    <tbody>
                        <tr>
                            <td width="18%" height="25" align="right">
                                网站地址<font color="red">*</font>
                            </td>
                            <td width="82%" height="25">
                                <asp:TextBox ID="siteUrl" runat="server" Width="300px" MaxLength="100" ForeColor="#FF3300">http://www.</asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="siteUrl"
                                    Display="dynamic" SetFocusOnError="true">网站地址不能为空</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </tbody>
                    <tbody>
                        <tr>
                            <td width="18%" height="25" align="right">
                                LOGO地址
                            </td>
                            <td width="82%" height="25">
                                <asp:TextBox ID="siteLogoUrl" runat="server" Width="300px" MaxLength="100" ForeColor="#FF3300"
                                    ToolTip="您要提交的网站的LOGO地址，有请尽量填写！"></asp:TextBox>
                            </td>
                        </tr>
                    </tbody>
                    <tbody>
                        <tr>
                            <td width="18%" height="25" align="right" valign="top">
                                网站说明<font color="red">*</font>
                            </td>
                            <td width="100%" height="25">
                                <asp:TextBox ID="siteDesc" runat="server" Width="300px" TextMode="MultiLine" Height="120px"
                                    MaxLength="2000"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="siteDesc"
                                    Display="dynamic" SetFocusOnError="true">网站说明不能为空</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </tbody>
                    <tbody>
                        <tr>
                            <td width="18%" height="25" align="right" valign="top">
                            </td>
                            <td width="100%" height="25" align="left">
                                <asp:Button ID="submit_button" runat="server" Text="提 交" ForeColor="Red" OnClick="submit_Click"
                                    ToolTip="点击提交您的链接申请" >
                                </asp:Button>
                                <asp:Button ID="reset_button" runat="server" Text="重 置" OnClick="reset_Click"
                                    ToolTip="点击重置您的链接申请"></asp:Button>
                            </td>
                        </tr>
                    </tbody>
                    <tbody>
                        <tr>
                            <td width="18%" height="25" align="right" valign="top">
                                <font color="silver">提示信息</font>
                            </td>
                            <td colspan="2">
                                <asp:Label ID="MSG" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div align="center" class="DivContent" style="margin-top: 5px">
                <%=Total.BannerObjectUrl%>
            </div>
        </div>
        <!--主要部分结束位置-->
    </div>
     </form>
       
    <div align="center" class="DivFooter">
         <iframe name="frame_footer" marginwidth="0" marginheight="0" class="frameFooter" src="frame_footer.aspx"
            frameborder="0"></iframe>
    </div>
    <uc1:track ID="track" runat="server"></uc1:track>
</body>
</html>
