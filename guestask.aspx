<%@ Page Language="c#" Inherits="com.hujun64.guestask" CodeFile="guestask.aspx.cs" CodeFileBaseClass="com.hujun64.PageBase" EnableViewState="false" EnableViewStateMac="false" %>

<%@ Register TagPrefix="uc1" TagName="topmenu" Src="ascx/dropdown_menu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="guest_ask" Src="ascx/guest_ask.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="ascx/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="index_flzx" Src="ascx/index_flzx.ascx" %>
<%@ Register TagPrefix="uc1" TagName="index_fee" Src="ascx/index_fee.ascx" %>
<%@ Register TagPrefix="uc1" TagName="index_intro" Src="ascx/index_intro.ascx" %>
<%@ Register TagPrefix="uc1" TagName="index_contact" Src="ascx/index_contact.ascx" %>
<%@ Register TagPrefix="uc1" TagName="track" Src="ascx/track.ascx" %>
<%--<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager" %>--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <uc1:header ID="Head1" runat="server"></uc1:header>
 
    <meta name="Keywords" content="<%=Total.Keywords+" "%>" />
    <title>
        <%="法律咨询_" + Total.Title%>
    </title>
</head>
<body>
     <div class="DivContainer">
        <iframe name="frame_header" class="frameHeader" marginwidth="0" marginheight="0"
            src="frame_header.aspx"  frameborder="0" scrolling="no">
        </iframe>
    </div>
   
    
    <div id="DivContainer" align="center" class="DivContainer">
        <div class="DivLeft">
            <!--左边开始-->
            <div class="DivLeftMenu">
                <iframe name="frame_flzx" marginwidth="0" marginheight="0"   width="100%" height="250px" src="<%=UtilHtml.GetFrameHtmlUrl(PageType.FRAME_FLZX,bigClassId, null)%> " frameborder="0"></iframe>
            </div>            
            <div class="DivLeftMenu">
                <uc1:index_intro ID="index_intro" runat="server"></uc1:index_intro>
            </div>
            <div class="DivLeftMenu">
                <uc1:index_fee ID="index_fee" runat="server"></uc1:index_fee>
            </div>
            <div class="DivLeftMenu">
                <uc1:index_contact ID="Index_contact" runat="server"></uc1:index_contact>
            </div>
        </div>
        <div id="DivContent" align="center" class="DivContent">
            <!--主要部分开始-->
            <uc1:guest_ask ID="guest_ask" runat="server"></uc1:guest_ask>
        </div>
        <!--主要部分结束位置-->
    </div>
    
    <div align="center" class="DivFooter">
         <iframe name="frame_footer" marginwidth="0" marginheight="0" class="frameFooter" src="frame_footer.aspx"
            frameborder="0"></iframe>
    </div>
    <uc1:track ID="track" runat="server"></uc1:track>
</body>
</html>
