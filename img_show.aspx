<%@ Page Language="c#" Inherits="com.hujun64.img_show" CodeFile="img_show.aspx.cs"
    CodeFileBaseClass="com.hujun64.PageBase" EnableViewState="false" %>

<%@ Register TagPrefix="uc1" TagName="topmenu" Src="ascx/dropdown_menu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="ascx/header.ascx" %>  
<%@ Register TagPrefix="uc1" TagName="show" Src="ascx/show.ascx" %>
<%@ Register TagPrefix="uc1" TagName="track" Src="ascx/track.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<!--head区开始位置-->
<head runat="server">
    <uc1:header ID="Head2" runat="server"></uc1:header>
    
     <meta name="Keywords" content="<%=Show.articleKeywords+"|"+Total.Keywords%>" />
    <title>
        <%= Show.articleTitle + "_" + Total.Title%>
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
        
            <!--主要部分开始-->
            <uc1:show ID="Show" runat="server"></uc1:show>
        
    </div>
     </form>
       
    <div align="center" class="DivFooter">
         <iframe name="frame_footer" marginwidth="0" marginheight="0" class="frameFooter" src="frame_footer.aspx"
            frameborder="0"></iframe>
    </div>
    <uc1:track ID="track" runat="server"></uc1:track>
</body>
</html>
