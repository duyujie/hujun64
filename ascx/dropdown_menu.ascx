<%@ Control Language="C#" AutoEventWireup="true" Inherits="com.hujun64.dropdown_menu"
    CodeFile="dropdown_menu.ascx.cs" %>
<%@ OutputCache Duration="300" VaryByParam="none" Shared="True" %>
<%@ Register TagPrefix="uc1" TagName="guest_ask_top" Src="guest_ask_top.ascx" %>
<%@ Register TagPrefix="uc1" TagName="search" Src="search.ascx" %>
<div class="DivContainer">
    <div class="DivTopmenuLeftSpace" align="left">
        <div class="DivTopmenuTips" align="center">
            <iframe name="frame_todaytips" marginwidth="0" marginheight="0" width="100%" height="55px"
                src="frame_todaytips.aspx" frameborder="0"></iframe>
        </div>
    </div>
    <div class="DivTopmenu">
        <div id="DropdownMenuID" class="DropdownMenu" align="left">
            <table>
                <tr>
                    <asp:Repeater ID="mainMenuRepeater" runat="server">
                        <ItemTemplate>
                            <td>
                                <a href="<%# Eval("template_url") %>" title="<%# Eval("mainClass.class_name") %>"
                                    target='_top'>
                                    <%# Eval("mainClass.class_name")%>
                                </a>
                            </td>
                        </ItemTemplate>
                    </asp:Repeater>
                </tr>
            </table>
        </div>
        <div class="DivTopSearch">
            <uc1:search ID="SearchTop" runat="server"></uc1:search>
        </div>
    </div>
</div>
