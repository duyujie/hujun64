<%@ Control Language="c#" Inherits="com.hujun64.show" CodeFile="show.ascx.cs" %>

<%@ Register TagPrefix="uc1" TagName="guest_ask_top" Src="guest_ask_top.ascx" %>
<div class="DivMyLocation" align="left">
    您的位置：
    <%=myLocation%>
</div>
<div class="DivGuestaskTop" align="left">
    <uc1:guest_ask_top ID="guest_ask_top1" runat="server"></uc1:guest_ask_top>
</div>
<div class="DivContent" align="center" style="margin-bottom: 10px">
    <%=Total.BannerObjectUrl%>
</div>
<div class="DivContent" align="center">
    <table align="left" cellspacing="0" class="frameArticleTable">
        <asp:Repeater ID="RepeaterNews" runat="server">
            <ItemTemplate>
                <tbody>
                    <tr>
                        <td align="center" height="30px" style="vertical-align: top">
                            <div class="aTitle">
                                <h3>
                                    <%#Eval("title")%></h3>
                            </div>
                            <div>
                            日期:
                            <%# ((DateTime)Eval("addtime")).ToString("yyyy-MM-dd")%>
                            &nbsp &nbsp &nbsp &nbsp
                            
                            作者：<%=author%>
                            &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
                           
                            来源：<%=newsFrom%>
                             </div>
                        </td>
                    </tr>
                </tbody>
                <tbody>
                    <tr>
                        <td  height="440px" style="vertical-align: top">
                            <%=imgUrl%> 
                            <br />
                            <%#Eval("content")%>
                            
                           
                        </td>
                    </tr>
                </tbody>
            </ItemTemplate>
        </asp:Repeater>
        <tr>
            <td height="15px">
                <div align="right" class="marginContent">
                    <a href="javascript:window.print()">【打印本页】</a> 【字体：<% = UtilHtml.BuildFontzoomHref(Total.DivIdContent,new FontSizeType(FontSizeEnum.LARGE)) %>
                    <% = UtilHtml.BuildFontzoomHref(Total.DivIdContent, new FontSizeType(FontSizeEnum.MIDDLE))%>
                    <% = UtilHtml.BuildFontzoomHref(Total.DivIdContent, new FontSizeType(FontSizeEnum.SMALL))%>
                    】
                </div>
            </td>
        </tr>
    </table>
</div>
<div class="DivContent" align="left" style="margin-top: 5px">
    <li>上一篇文章：<%if (prevArticle != null)
                {%>
        <%= UtilHtml.BuildHrefArticle(prevArticle, false)%>
        <%}
                else
                { %>无<%} %>
    </li>
    <li>下一篇文章：<%if (nextArticle!= null)
                {%>
        <%= UtilHtml.BuildHrefArticle(nextArticle, false)%>
        <%}
                else
                { %>无<%} %>
    </li>
</div>
<div class="DivContent" align="center" style="margin-top: 5px">
    <%=Total.BannerHireUrl%>
</div>
