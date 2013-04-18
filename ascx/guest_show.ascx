<%@ Control Language="c#" Inherits="com.hujun64.guest_show" CodeFile="guest_show.ascx.cs" %>

<%@ Register TagPrefix="uc1" TagName="guest_ask_top" Src="guest_ask_top.ascx" %>
<div class="DivMyLocation" align="left">
    您的位置：
    <%=myLocation%>
</div>
<div class="DivGuestaskTop" align="left">
    <uc1:guest_ask_top ID="guest_ask_top1" runat="server"></uc1:guest_ask_top>
</div>
<div class="DivContent" align="center">
    <%=Total.BannerObjectUrl%>
</div>
<div class="DivContent" align="center">
    <table id="Table3" align="left" cellspacing="0" class="frameGuestookTable" width="100%">
        <asp:Repeater ID="RepeaterNews" runat="server">
            <ItemTemplate>
                <tbody>
                    <tr>
                        <td align="center" style="height: 40px;">
                            <div class="aTitle">
                                <h3>
                                    <%#Eval("title")%></h3>
                            </div>
                            <div>
                            【<%=bigClassName%>】
                            </div>
                        <div>
                                <%#UtilString.ConvertAuthorName(Eval("author").ToString(), Eval("sex").ToString())%>
                                &nbsp;咨询于
                                <%#((DateTime)Eval("addtime")).ToString("yyyy-MM-dd HH:mm:ss")%>
                         </div>
                        </td>
                    </tr>
                </tbody>
                <tbody>
                    <tr>
                        <td class="guestShowAsk">
                            <div id="askContent" class="defaultContent">
                                <%#UtilHtml.FormatTextToHtmlWithParagraph(Eval("content").ToString(),true)%>
                            </div>
                        </td>
                    </tr>
                </tbody>
                <tbody>
                    <tr>
                        <td class="guestShowMiddle">
                            <div id="authorContent" class="marginContent">
                                <%=Total.Author %>回复如下：
                            </div>
                        </td>
                    </tr>
                </tbody>
                <tbody>
                    <tr>
                        <td class="guestShowReply">
                            <div id="replyContent" class="defaultContent">
                                <%#UtilHtml.FormatTextToHtmlWithParagraph(Eval("reply").ToString(),true)%>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </ItemTemplate>
        </asp:Repeater>
        <tbody>
            <tr>
                <td height="15px">
                    <div class="marginContent" align="right">
                        <a href="javascript:window.print()">【打印本页】</a> 【字体：<% = UtilHtml.BuildFontzoomHref(new string[] { "askContent", "authorContent", "replyContent" }, new FontSizeType(FontSizeEnum.LARGE))%>
                        <% = UtilHtml.BuildFontzoomHref(new string[] { "askContent", "authorContent", "replyContent" }, new FontSizeType(FontSizeEnum.MIDDLE))%>
                        <% = UtilHtml.BuildFontzoomHref(new string[] { "askContent", "authorContent", "replyContent" }, new FontSizeType(FontSizeEnum.SMALL))%>
                        】
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
</div>
<div class="DivContent" align="left" style="margin-top: 5px">
    <li>
        上一篇咨询：<%if (prevGuestbook!=null)
                {%>
        <%= UtilHtml.BuildHrefArticle(prevGuestbook, false)%>
        <%}
                else
                { %>无<%} %>
    </li>
    <li>
        下一篇咨询：<%if (nextGuestbook!=null)
                {%>
        <%= UtilHtml.BuildHrefArticle(nextGuestbook, false)%>
        <%}
                else
                { %>无<%} %>
    </li>
</div>
<div class="DivContent" align="center">
    <%=Total.BannerHireUrl%>
</div>
