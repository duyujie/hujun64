<%@ Control Language="c#" Inherits="com.hujun64.index_basj" CodeFile="index_basj.ascx.cs" %>
  
<table align="left" cellpadding="0" cellspacing="0" class="frameIndexBasjTable">
    <tbody>
        <tr>
            <td class="moduleName" colspan="2">
                <%=Total.ImgModuleTitleUrl%>
                <a href="<%=moreUrl %>" target = "_blank" class="module">
                    <%=moduleName%></a>
            </td>
        </tr>
    </tbody>
    <asp:Repeater ID="RepeaterIndexSszz" runat="server">
        <ItemTemplate>
            <tbody>
                <tr>
                    <td width="5%">
                        <img src="images/bullet.gif" alt="" class="imgNoborder" />
                    </td>
                    <td width="95%">
                        <a href="<%# Total.AspxUrlShowdetail %>?<%# Total.QueryStringArticleId %>=<%#Eval( "id")%>" title="<%#Eval("title")%>"
                            target = "_blank" class="navlink">
                            <%# UtilHtml.LeftTitleSubstring(Eval("id").ToString(), Eval("title").ToString(), (DateTime)Eval("addtime"))%></a>
                    </td>
                </tr>
            </tbody>
        </ItemTemplate>
    </asp:Repeater>
    <tbody>
        <tr>
            <td width="100%" align="right" colspan="2">
                <a href="<%=moreUrl %>"  title="<%="更多"+moduleName %>" target = "_blank" class="more">更多&gt;&gt;</a>
            </td>
        </tr>
    </tbody>
</table>
