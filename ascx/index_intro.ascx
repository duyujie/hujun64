<%@ Control Language="c#" Inherits="com.hujun64.index_intro" CodeFile="index_intro.ascx.cs" %>
  
<table align="left" cellpadding="0" cellspacing="0" class="frameIndexIntroTable">
    <tbody>
        <tr>
            <td class="moduleName" colspan="2">
                <%=Total.ImgModuleTitleUrl%>
                <a href="<%=moduleUrl%>" target = "_blank" class="module">
                    <%=moduleName%></a>
            </td>
        </tr>
    </tbody>
    <asp:Repeater ID="RepeaterIndexIntro" runat="server">
        <ItemTemplate>
            <tbody>
                <tr>
                    <td width="5%">
                        <img src="images/bullet.gif" alt="" class="imgNoborder" />
                    </td>
                    <td width="95%">
                        <a href="<%# Total.AspxUrlIntro %>?<%#Total.QueryStringIntroId %>=<%#Eval( "id")%>" title="<%#Eval("title")%>"
                            target = "_blank" class="navlink">
                            <%# UtilHtml.LeftTitleSubstring(Eval("id").ToString(),Eval( "title").ToString(), (DateTime)Eval("addtime"))%></a>
                    </td>
                </tr>
            </tbody>
        </ItemTemplate>
    </asp:Repeater>
    <tbody>
        <tr>
            <td width="5%">
                <img src="images/bullet.gif" alt="" class="imgNoborder" />
            </td>
            <td width="95%">
                <a href="<%= Total.AspxUrlWebService %>?<%=Total.QueryStringAction %>=<%=WebServiceActionType.SEARCH_LAWYER.ToString() %>"
                    title="律师及律师事务所信息查询" target = "_blank" class="navlink">律师及律师事务所信息查询</a>
            </td>
        </tr>
    </tbody>
    <tbody>
        <tr>
            <td width="100%" align="right" colspan="2">
                <a href="<%=moduleUrl%>"  title="<%="详细"+moduleName %>"  target = "_blank" class="more">详细&gt;&gt;</a>
            </td>
        </tr>
    </tbody>
</table>
