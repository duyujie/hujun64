<%@ Page Language="C#" AutoEventWireup="true" CodeFile="linkall.aspx.cs" Inherits="com.hujun64.linkall"
    EnableViewState="false" %>

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
        <%=Total.ModuleNameYqlj + "_" + Total.Title%>
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
                <uc1:guest_ask_top ID="guest_ask_top1" runat="server"></uc1:guest_ask_top>
            </div>
            <div align="center" class="DivContent" style="margin-bottom: 10px;">
                <%=Total.BannerFocusUrl%>
            </div>
            <div align="left" class="DivContent"">
                <div style="margin-left: 10px; margin-right:10px">
                    <div style="height: 40px; text-align:middle">
                        <a href="<%=Total.AspxUrlLinkApp %>" class="more">自助申请友情链接 </a>
                    </div>
                    <div style="height: 40px">
                        <strong>文字链接</strong>
                    </div>
                    <div style="height: 200px;width:580px;float:left">
                        <asp:Repeater ID="RepeaterTextLink" runat="server">
                            <ItemTemplate>
                            <div style="width: 140px;float:left">
                                <a href="<%# Eval("link_site_url") %>" title="<%# Eval("link_description") %>" target="_blank"
                                    class="myLink">
                                    <%#Eval("link_site_name")%>
                                </a>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div style="float:none">
                    </div>
                    <div style="height: 40px;float:left">
                        <strong>图标展现</strong>
                    </div>
                    <div style="height: 200px;width:580px;float:left">
                        <asp:Repeater ID="RepeaterImgLink" runat="server">
                            <ItemTemplate>
                            <div style="width: 140px;float:left">
                                <%#UtilHtml.BuildHref(Eval("link_site_url").ToString(), UtilHtml.GetFullImageUrl(Eval("link_site_logo").ToString(), Eval("link_site_name").ToString(), "88px", "31px"), Eval("link_site_name").ToString(), true)%>
                            </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
            <div align="center" class="DivContent" style="margin-top: 10px">
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
