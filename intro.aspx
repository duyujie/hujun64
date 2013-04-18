<%@ Page Language="C#" AutoEventWireup="true" CodeFile="intro.aspx.cs" Inherits="com.hujun64.intro"
    EnableViewState="false" %>

<%@ Register TagPrefix="uc1" TagName="topmenu" Src="ascx/dropdown_menu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="introshow" Src="ascx/intro_show.ascx" %>
<%@ Register TagPrefix="uc1" TagName="index_flash" Src="ascx/index_flash.ascx" %>
<%@ Register TagPrefix="uc1" TagName="index_intro" Src="ascx/index_intro.ascx" %>
<%@ Register TagPrefix="uc1" TagName="index_contact" Src="ascx/index_contact.ascx" %>
<%@ Register TagPrefix="uc1" TagName="index_fee" Src="ascx/index_fee.ascx" %>
<%@ Register TagPrefix="uc1" TagName="index_pfcs" Src="ascx/index_pfcs.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="ascx/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="track" Src="ascx/track.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<!--head区开始位置-->
<head runat="server">
    <uc1:header ID="Head2" runat="server"></uc1:header>
  
    <meta name="Keywords" content="<%=Total.Keywords+" "%>" />
    <title>
        <%=introshow.articleTitle + "_" + Total.Title%>
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
        <div id="DivLeft" class="DivLeft" align="center">
            <!--左边开始-->
            <div class="DivLeftMenu">
                <uc1:index_flash ID="index_flash" runat="server">
                </uc1:index_flash>
            </div>
            
            <div class="DivLeftMenu">
                <uc1:index_intro ID="index_intro" runat="server">
                </uc1:index_intro>
            </div>
            <div class="DivLeftMenu">
                <uc1:index_fee ID="index_fee" runat="server">
                </uc1:index_fee>
            </div>
            <div class="DivLeftMenu">
                <uc1:index_contact ID="index_contact" runat="server">
                </uc1:index_contact>
            </div>
        </div>
        <div id="DivContent" align="center" class="DivContent">
            <!--主要部分开始-->
            <uc1:introshow ID="introshow" runat="server"></uc1:introshow>
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
