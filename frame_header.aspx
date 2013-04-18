<%@ Page Language="c#" Inherits="com.hujun64.frame_header" CodeFile="frame_header.aspx.cs"
    CodeFileBaseClass="com.hujun64.PageBase" EnableViewState="false" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="ascx/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header_frame" Src="ascx/header_frame.ascx" %>
<%@ Register TagPrefix="uc1" TagName="dropdown_menu" Src="ascx/dropdown_menu.ascx" %>

<html>
<head>
<uc1:header ID="header" runat="server"></uc1:header>
</head>
<body scroll="no">    
    <uc1:header_frame ID="header_frame" runat="server"></uc1:header_frame>
    <uc1:dropdown_menu ID="dropdown_menu" runat="server"></uc1:dropdown_menu>  
</body>
</html>