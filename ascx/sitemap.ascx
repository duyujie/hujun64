<%@ Control Language="C#" AutoEventWireup="true" Inherits="com.hujun64.sitemap" CodeFile="sitemap.ascx.cs" %>
  <%@ OutputCache Duration="300" VaryByParam="none" Shared="True" %>
<table id="tableSitemap">
<tbody>
    <tr>
        <td align="left" width="150">
            <div class="fontSitemap">网站地图</div>
        </td>
        <td width="100">
            <a href="<%=Total.AspxUrlIndex %>" target = "_blank">网站首页 </a>
        </td>
        <asp:Repeater ID="repeaterMenuRoot" runat="server">
            <ItemTemplate>
                <td width="100">
                    <a href="<%# Eval("template_url") %>" target = "_blank">
                        <%# Eval("mainClass.class_name")%>
                    </a>
                </td>
            </ItemTemplate>
        </asp:Repeater>
        <td width="100">
            <a href="<%=Total.AspxUrlLinkAll %>" target = "_blank">友情链接 </a>
        </td>
    </tr>
 </tbody>  
</table>
