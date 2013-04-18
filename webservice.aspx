<%@ Page Language="C#" AutoEventWireup="true" CodeFile="webservice.aspx.cs" Inherits="com.hujun64.webservice" %>

<%@ Register TagPrefix="uc1" TagName="topmenu" Src="ascx/dropdown_menu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="ascx/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="index_flzx" Src="ascx/index_flzx.ascx" %>
<%@ Register TagPrefix="uc1" TagName="index_fee" Src="ascx/index_fee.ascx" %>
<%@ Register TagPrefix="uc1" TagName="index_intro" Src="ascx/index_intro.ascx" %>
<%@ Register TagPrefix="uc1" TagName="index_contact" Src="ascx/index_contact.ascx" %>
<%@ Register TagPrefix="uc1" TagName="lawyer_search" Src="ascx/lawyer_search.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ip_search" Src="ascx/ip_search.ascx" %>
<%@ Register TagPrefix="uc1" TagName="track" Src="ascx/track.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<!--head区开始位置-->
<head id="Head1" runat="server">
    <uc1:header ID="Head2" runat="server"></uc1:header>
   
    <meta name="Keywords" content="<%=Total.Keywords%>" />
    <title>
        <%if (webServiceAction == WebServiceActionType.SEARCH_LAWYER)
          { %>
        <%=lawyer_search.title+ "_"+ Total.Title%>
        <%}
          else if (webServiceAction == WebServiceActionType.SEARCH_IP)
          {%>
        <%=ip_search.title + "_" + Total.Title%>
        <%} %>
    </title>
</head>
<!--head区结束--位置-->
<body>
     <div class="DivContainer">
        <iframe name="frame_header" class="frameHeader" marginwidth="0" marginheight="0"
            src="frame_header.aspx"  frameborder="0">
        </iframe>
    </div>
    <form id="bodyForm" runat="server">
    
    <div id="DivContainer" align="center" class="DivContainer">
        <div class="DivLeft">
            <!--左边开始-->
            <div class="DivLeftMenu">
                <uc1:index_flzx ID="index_flzx" runat="server"></uc1:index_flzx>
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
            <%if (webServiceAction == WebServiceActionType.SEARCH_LAWYER)
              { %>
            <uc1:lawyer_search ID="lawyer_search" runat="server"></uc1:lawyer_search>
            <%}
              else if (webServiceAction == WebServiceActionType.SEARCH_IP)
              {%>
            <uc1:ip_search ID="ip_search" runat="server"></uc1:ip_search>
            <%} %>
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
