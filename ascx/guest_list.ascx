<%@ Control Language="c#" Inherits="com.hujun64.geust_list" CodeFile="guest_list.ascx.cs" %>
<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager" %>
<%@ Register TagPrefix="uc1" TagName="guest_ask_top" Src="guest_ask_top.ascx" %>
<div class="DivMyLocation" align="left">
    您的位置：
    <%=myLocation%>
</div>
<div class="DivContent" align="center" style="margin-bottom: 10px; margin-top: 10px;">
    <%=Total.BannerHorseUrl%>
</div>
<div class="DivContent">
    &nbsp;&nbsp;&nbsp;&nbsp;
</div>
<div class="DivContent">
    <div class="DivGuestaskTop" align="left">
        <uc1:guest_ask_top ID="guest_ask_top1" runat="server"></uc1:guest_ask_top>
    </div>
    <div align="left" class="DivFreeAskOnGuestlist">
        免费咨询： 
        <b>
            <%=Total.Mobile%>
        </b>
    </div>
</div>
<div class="DivContent">
    <table id="TableGuestlist" cellspacing="0" class="frameGuestlistTable">
        <asp:Repeater ID="RepeaterGuestList" runat="server">
            <ItemTemplate>
                <tbody>
                    <tr>
                        <td width="300px">
                            <img src="images/bullet.gif" alt="" class="imgNoborder" />
                            <span class="mframe-m-text"><a href="<%# Total.AspxUrlGuestbook %>?<%# Total.QueryStringGuestbookId %>=<%# Eval("id") %>"
                                title="<%#UtilHtml.RemoveHtmlTag(Eval("title").ToString(),false)+"\n"+UtilHtml.RemoveHtmlTag(Eval("content").ToString(),true)%>"
                                target="_blank">
                                <%# UtilHtml.TitleSubstring(Eval("id").ToString(), Eval("title").ToString() + " - " + Eval("content").ToString(), 20, (DateTime)Eval("addtime"))%>
                            </a></span>
                        </td>
                        <td width="50px">
                            <div class="articleDate">
                                [<%# String.Format( "{0:MM}/{1:dd}", Eval("addtime"), Eval("addtime") )%>]
                            </div>
                        </td>
                        <td width="250px">
                            <font color="#cc3300">回复：</font>&nbsp <a href="<%# Total.AspxUrlGuestbook %>?<%# Total.QueryStringGuestbookId %>=<%# Eval("id") %>"
                                title="<%# UtilHtml.RemoveHtmlTag(Eval("reply").ToString(),true)%>" target="_blank">
                                <font color="blue">
                                    <%# UtilHtml.TitleSubstring(UtilHtml.FormatHtmlToText(Convert.ToString(Eval("reply"))), 16)%></font>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <div class="DivLine" />
                        </td>
                    </tr>
                </tbody>
            </ItemTemplate>
        </asp:Repeater>
    </table>
    <table align="center">
        <tr>
            <td>
                <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                    CurrentPageButtonPosition="Center" CustomInfoHTML="第%CurrentPageIndex%页，共%PageCount%页，每页%PageSize%条"
                    FirstPageText="首页" LastPageText="尾页" LayoutType="Table" NextPageText="下一页" PageIndexBoxType="DropDownList"
                    PagingButtonLayoutType="Span" PrevPageText="上一页" ShowCustomInfoSection="Left"
                    SubmitButtonText="Go" TextAfterPageIndexBox="页" TextBeforePageIndexBox="转到" UrlPaging="true">
                </webdiyer:AspNetPager>
            </td>
        </tr>
    </table>
</div>
<div class="DivContent" align="center" style="margin-top: 10px">
    <%=Total.BannerObjectUrl%>
</div>
