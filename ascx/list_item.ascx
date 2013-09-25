<%@ Control Language="c#" Inherits="com.hujun64.list_item" CodeFile="list_item.ascx.cs" %>

<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager" %>
<%@ Register TagPrefix="uc1" TagName="guest_ask_top" Src="guest_ask_top.ascx" %>
<div class="DivMyLocation" align="left">
    ����λ�ã�
    <%=myLocation%>
</div>
<script type="text/javascript" src="js/jScroll/jquery.jScroll.js"></script>
<link href="js/jScroll/css.css" rel="stylesheet" type="text/css" media="screen" />
<div class="DivGuestaskTop" align="left">
    <uc1:guest_ask_top ID="guest_ask_top" runat="server"></uc1:guest_ask_top>
</div>
<div class="DivProfile" align="left" id="divLawyerInfo">
    <ul>
        <li>
            <div class="DivProfile" align="left">
                <div class="DivCertificate" style="margin-left: 50px">
                    ��ʦִҵ֤��&nbsp;&nbsp;<%=Total.Sn%>
                </div>
                <div class="DivProfileText" align="left">
                    <%=Total.Profile %>
                    <div align="right">
                        <a href="<%=Total.AspxUrlIntro %>" class="more" title="���B��ʦ��ϸ����">��ϸ&gt;&gt;</a>
                    </div>
                </div>
                <div class="DivProfileImg" align="center">
                    <a href="<%=Total.AspxUrlIntro %>" target="_blank">
                        <img border="0" src="<%=Total.ImgProfileUrl %>" alt="<%=Total.Title %>" /></a>
                </div>
            </div>
        </li>
    </ul>
</div>


<div class="DivListItemContainer">
    <table cellspacing="0" cellpadding="0">
        <asp:Repeater ID="RepeaterArticles" runat="server">
            <ItemTemplate>
                <tbody>
                    <tr>
                        <td>
                            <div class="DivLine">
                            </div>
                            <div class="DivListItemLeft">
                                <img src="images/bullet.gif" alt="" class="imgNoborder" />
                                <a href="<%# Total.AspxUrlShowdetail %>?<%# Total.QueryStringArticleId %>=<%# Eval("id") %>"
                                    title="<%=pageMetaName %>��<%#UtilHtml.RemoveHtmlTag(Eval("title").ToString(),true)%>" target = "_blank">
                                    <%# UtilHtml.RemoveHtmlTag(Eval("title").ToString(), true)%><%#UtilHtml.GetImageOfNewArticle(Eval("id").ToString(),(DateTime)Eval("addtime")) %>
                                </a>
                            </div>
                            <div class="DivListItemRight">
                                [<%# String.Format( "{0:yyyy-MM-dd}", Eval( "addtime"))%>]
                            </div>
                        </td>
                    </tr>
                </tbody>
            </ItemTemplate>
        </asp:Repeater>
    </table>
</div>
<div class="DivLisitemContent">
    <table align="center" cellspacing="5px">
        <tbody>
            <tr>
                <td>
                    <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                        CurrentPageButtonPosition="Center" CustomInfoHTML="��%CurrentPageIndex%ҳ����%PageCount%ҳ��ÿҳ%PageSize%��"
                        FirstPageText="��ҳ" LastPageText="βҳ" LayoutType="Table" NextPageText="��һҳ" PageIndexBoxType="DropDownList"
                        PagingButtonLayoutType="Span" PrevPageText="��һҳ" ShowCustomInfoSection="Left"
                        SubmitButtonText="Go" TextAfterPageIndexBox="ҳ" TextBeforePageIndexBox="ת��" UrlPaging="true">
                    </webdiyer:AspNetPager>
                </td>
            </tr>
        </tbody>
    </table>
</div>
<div class="DivContent" align="center">
    <%=Total.BannerObjectUrl%>
</div>