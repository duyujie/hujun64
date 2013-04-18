<%@ Control Language="c#" Inherits="com.hujun64.index_fee" CodeFile="index_fee.ascx.cs" %>
  
<table align="left" cellpadding="0" cellspacing="0" class="frameIndexFeeTable">
    <tbody>
        <tr>
            <td class="moduleName" colspan="2">
               <%=Total.ImgModuleTitleUrl%>
                <a href="<%=moduleUrl%>" target = "_blank" class="module">
                    <%=moduleName%></a>
            </td>
        </tr>
    </tbody>
    <asp:Repeater ID="RepeaterIndexFee" runat="server">
        <ItemTemplate>
            <tbody>
                <tr>
                    <td width="5%">
                        <img src="images/bullet.gif" alt="" class="imgNoborder" />
                    </td>
                    <td width="95%">
                        <a href="<%# Total.AspxUrlFee %>?<%# Total.QueryStringFeeId %>=<%#Eval( "id")%>" title="<%#Eval("title")%>"
                            target = "_blank" class="navlink">
                            <%# UtilHtml.LeftTitleSubstring(Eval("id").ToString(),Eval( "title").ToString(), (DateTime)Eval("addtime"))%></a>
                    </td>
                </tr>
            </tbody>
        </ItemTemplate>
    </asp:Repeater>
    <tbody>
        <tr>
            <td width="100%" align="right" colspan="2">
                <a href="<%=moduleUrl%>"  title="<%="ÏêÏ¸"+moduleName %>"  target = "_blank" class="more">ÏêÏ¸&gt;&gt;</a>
            </td>
        </tr>
    </tbody>
</table>
