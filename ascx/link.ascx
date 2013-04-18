<%@ Control Language="C#" AutoEventWireup="true" Inherits="com.hujun64.link" CodeFile="link.ascx.cs" %>
<hr align="center" class="hrwidth" />
<table border="0" cellpadding="0" cellspacing="0" style="width: 800px; margin-top: 5px;">
    <tbody>
        <tr>
            <td align="left">
                <asp:Repeater ID="RepeaterLink" runat="server">
                    <ItemTemplate>
                         <a href="<%# Eval("link_site_url") %>" title="<%# Eval("link_description") %>"
                            target="_blank" class="myLink">
                            <%#Eval("link_site_name")%>
                        </a>&nbsp;&nbsp;&nbsp;&nbsp;
                    </ItemTemplate>
                </asp:Repeater>
            </td>
        </tr>
        <tr>
            <td colspan="6" align="right">
                <a href="<%=Total.AspxUrlLinkAll %>" target="_blank" class="more">¸ü¶àÁ´½Ó&gt;&gt;</a>
            </td>
        </tr>
    </tbody>
</table>
