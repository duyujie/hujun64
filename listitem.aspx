<%@ Page Language="c#" Inherits="com.hujun64.listitem" CodeFile="listitem.aspx.cs"
    CodeFileBaseClass="com.hujun64.PageBase" EnableViewState="false" %>

<%@ Register TagPrefix="uc1" TagName="topmenu" Src="ascx/dropdown_menu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="track" Src="ascx/track.ascx" %>
<%@ Register TagPrefix="uc1" TagName="index_flash" Src="ascx/index_flash.ascx" %>
<%@ Register TagPrefix="uc1" TagName="index_sszz" Src="ascx/index_sszz.ascx" %>
<%@ Register TagPrefix="uc1" TagName="index_pfcs" Src="ascx/index_pfcs.ascx" %>
<%@ Register TagPrefix="uc1" TagName="index_flzx" Src="ascx/index_flzx.ascx" %>
<%@ Register TagPrefix="uc1" TagName="index_fee" Src="ascx/index_fee.ascx" %>
<%@ Register TagPrefix="uc1" TagName="index_contact" Src="ascx/index_contact.ascx" %>
<%@ Register TagPrefix="uc1" TagName="list_item" Src="ascx/list_item.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="ascx/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="fzb" Src="ascx/fzb.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<!--head����ʼλ��-->
<head runat="server">
    <uc1:header ID="header" runat="server"></uc1:header>
    <meta name="Author" content="�Ϻ���ʦ���B hujun64"/>
    <meta name="keywords" content="<%=list_item.pageMeta.keywords+" "%>" />
    <meta name="description" content="<%=list_item.pageMeta.description+" "%>" />
    <title>
        <%=list_item.pageMeta.title + " "%>
    </title>
</head>
<body>
     <div class="DivContainer">
        <iframe name="frame_header" class="frameHeader" marginwidth="0" marginheight="0"
            src="frame_header.aspx"  frameborder="0" scrolling="no">
        </iframe>
    </div>
    <form id="bodyForm" runat="server">
    
    <div id="DivContainer" align="center" class="DivContainer">
        <div id="DivLeft" class="DivLeft" align="center">
            <!--��߿�ʼ-->
            <div class="DivLeftMenu">
                <iframe name="frame_flzx" marginwidth="0" marginheight="0"   width="100%" height="250px"src="frame_flzx.aspx" frameborder="0"></iframe>
            </div>
            <div class="DivLeftMenu">
                <uc1:index_sszz ID="index_sszz" runat="server"></uc1:index_sszz>
            </div>
            <div class="DivLeftMenu">
                <uc1:index_pfcs ID="index_pfcs" runat="server"></uc1:index_pfcs>
            </div>
            <div class="DivLeftMenu">
                <uc1:index_fee ID="index_fee" runat="server"></uc1:index_fee>
            </div>
            <div class="DivLeftMenu">
                <uc1:index_contact ID="index_contact" runat="server"></uc1:index_contact>
            </div>
        </div>
        <div id="DivContent" align="center" class="DivContent">
            <!--��Ҫ���ֿ�ʼ-->
            <uc1:list_item ID="list_item" runat="server"></uc1:list_item>
        </div>
        <!--��Ҫ���ֽ���λ��-->
    </div>
     </form>
 <div align="center" class="DivFooter">
        <uc1:fzb ID="fzb" runat="server"></uc1:fzb>
    </div>       
    <div align="center" class="DivFooter">
         <iframe name="frame_footer" marginwidth="0" marginheight="0" class="frameFooter" src="frame_footer.aspx"
            frameborder="0"></iframe>
    </div>
    <uc1:track ID="track" runat="server"></uc1:track>
</body>
</html>
