<%@ Control Language="c#" Inherits="com.hujun64.fee_show" CodeFile="fee_show.ascx.cs" %>

<%@ Register TagPrefix="uc1" TagName="guest_ask_top" Src="guest_ask_top.ascx" %>
<div class="DivMyLocation" align="left">
    ����λ�ã�
    <%=myLocation%>
</div>
<div class="DivGuestaskTop" align="left">
    <uc1:guest_ask_top ID="guest_ask_top1" runat="server"></uc1:guest_ask_top>
</div>
<div align="center" class="DivContent">
    <%=Total.BannerObjectUrl%>
</div>
<div align="center" class="DivContent">
    <table width="600" align="left" cellspacing="0" class="frameFeeTable">
        <asp:Repeater ID="RepeaterFee" runat="server">
            <ItemTemplate>
                <tbody>
                    <tr>
                        <td align="center" height="30px">
                            <div class="aTitle">
                                <h3>
                                    <%#Eval("title")%></h3>
                            </div>
                        </td>
                    </tr>
                </tbody>
                <tbody>
                    <tr>
                        <td style="vertical-align: top">
                            <%#Eval("content")%>
                        </td>
                    </tr>
                </tbody>
            </ItemTemplate>
        </asp:Repeater>
        <tbody>
            <tr>
                <td height="15px">
                    <div class="marginContent" align="right">
                        <a href="javascript:window.print()">����ӡ��ҳ��</a> �����壺<% = UtilHtml.BuildFontzoomHref(Total.DivIdContent,new FontSizeType(FontSizeEnum.LARGE)) %>
                        <% = UtilHtml.BuildFontzoomHref(Total.DivIdContent, new FontSizeType(FontSizeEnum.MIDDLE))%>
                        <% = UtilHtml.BuildFontzoomHref(Total.DivIdContent, new FontSizeType(FontSizeEnum.SMALL))%>
                        ��
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
</div>
<div class="DivContent" align="left" style="margin-top: 5px">
    <li>��һƪ���£�<%if (prevArticle != null)
                {%>
        <%= UtilHtml.BuildHrefArticle(prevArticle, false)%>
        <%}
                else
                { %>��<%} %>
    </li>
    <li>��һƪ���£�<%if (nextArticle != null)
                {%>
        <%= UtilHtml.BuildHrefArticle(nextArticle, false)%>
        <%}
                else
                { %>��<%} %>
    </li>
</div>
<div align="center" class="DivContent">
    <%=Total.BannerProfessionalUrl%>
</div>