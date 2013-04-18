<%@ Page Language="c#" Inherits="com.hujun64.guestbook" CodeFile="guestbook.aspx.cs"
    CodeFileBaseClass="com.hujun64.PageBase" EnableViewState="false" %>

<%@ Register TagPrefix="uc1" TagName="topmenu" Src="ascx/dropdown_menu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="guest_show" Src="ascx/guest_show.ascx" %>
<%@ Register TagPrefix="uc1" TagName="guest_list" Src="ascx/guest_list.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="ascx/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="index_flzx" Src="ascx/index_flzx.ascx" %>
<%@ Register TagPrefix="uc1" TagName="index_flash" Src="ascx/index_flash.ascx" %>
<%@ Register TagPrefix="uc1" TagName="index_fee" Src="ascx/index_fee.ascx" %>
<%@ Register TagPrefix="uc1" TagName="index_intro" Src="ascx/index_intro.ascx" %>
<%@ Register TagPrefix="uc1" TagName="index_sszz" Src="ascx/index_sszz.ascx" %>
<%@ Register TagPrefix="uc1" TagName="track" Src="ascx/track.ascx" %>
<%--<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager" %>--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <uc1:header ID="Head1" runat="server"></uc1:header>
    
    <meta name="Keywords" content="<%=Total.Keywords+"|"+guest_show.guestbookKeywords%>" />
    <title>
        <%if (isGuestShow)
          { %>
        <%=guest_show.title + "_" + Total.Title%>
        <%}
          else
          { %>
        <%=guest_list.title + "_" + Total.Title%>
        <%}  %>
    </title>
</head>
<body>
    <div class="DivContainer">
        <iframe name="frame_header" class="frameHeader" marginwidth="0" marginheight="0"
            src="frame_header.aspx" frameborder="0" scrolling="no"></iframe>
    </div>
    <form id="bodyForm" runat="server">
    <font face="宋体">
        <div id="DivContainer" align="center" class="DivContainer">
            <div id="DivLeft" class="DivLeft" align="center">
                <!--左边开始-->
                <%if (isGuestShow)
                  { %>
                <div class="DivLeftMenu">
                    <iframe name="frame_flzx" marginwidth="0" marginheight="0" width="100%" height="250px"
                        src="<%=UtilHtml.GetFrameHtmlUrl(PageType.FRAME_FLZX,bigClassId, null)%> "
                        frameborder="0"></iframe>
                </div>
                <%}
                  else
                  {%>
                <div class="DivLeftMenu">
                    <uc1:index_flash ID="index_flash" runat="server"></uc1:index_flash>
                </div>
                <%}%>
                <div class="DivLeftMenu">
                    <uc1:index_sszz ID="index_sszz" runat="server"></uc1:index_sszz>
                </div>
                <div class="DivLeftMenu">
                    <uc1:index_intro ID="index_intro" runat="server"></uc1:index_intro>
                </div>
                <div class="DivLeftMenu">
                    <uc1:index_fee ID="index_fee" runat="server"></uc1:index_fee>
                </div>
            </div>
            <div id="DivContent" align="center" class="DivContent">
                <!--主要部分开始-->
                <%if (isGuestShow)
                  { %>
                <uc1:guest_show ID="guest_show" runat="server"></uc1:guest_show>
                <%}
                  else
                  { %>
                <uc1:guest_list ID="guest_list" runat="server"></uc1:guest_list>
                <%}  %>
                <!--主要部分结束-->
            </div>
            <!--主要部分结束位置-->
        </div>
    </font>
    </form>
    <div align="center" class="DivFooter">
        <iframe name="frame_footer" marginwidth="0" marginheight="0" class="frameFooter"
            src="frame_footer.aspx" frameborder="0"></iframe>
    </div>
    <uc1:track ID="track" runat="server"></uc1:track>
</body>
</html>
