<%@ Control Language="c#" Inherits="com.hujun64.list_class" CodeFile="list_class.ascx.cs" %>
<%@ Register TagPrefix="uc1" TagName="guest_ask_top" Src="guest_ask_top.ascx" %>
<div class="DivMyLocation" align="left">
    您的位置：
    <%=myLocation%>
</div>
<script type="text/javascript" src="js/jScroll/jquery.jScroll.js"></script>
<link href="js/jScroll/css.css" rel="stylesheet" type="text/css" media="screen" />
<div class="DivGuestaskTop" align="left">
    <uc1:guest_ask_top ID="guest_ask_top1" runat="server"></uc1:guest_ask_top>
</div>
<div class="DivProfile" align="left" id="divLawyerInfo">
    <ul>
        <li>
            <div class="DivProfile" align="left">
                <div class="DivCertificate" style="margin-left: 50px">
                    律师执业证号&nbsp;&nbsp;<%=Total.Sn%>
                </div>
                <div class="DivProfileText" align="left">
                    <%=Total.Profile %>
                    <div align="right">
                        <a href="<%=Total.AspxUrlIntro %>" class="more" title="胡珺律师详细介绍">详细&gt;&gt;</a>
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

<div class="DivModuleContainer" align="center">
    <!--大分类循环开始-->
    <asp:Repeater runat="server" ID="dlCategories">
        <HeaderTemplate>
        </HeaderTemplate>
        <ItemTemplate>
            <div class="DivModuleClass">
                <table class="frameModuleClassTable">
                    <tbody>
                        <tr>
                            <td colspan="4">
                                <div class="nowidthModuleName">
                                    <div class="classModuleName">
                                        <a href="<%# Eval("template_url") %><%#queryStringBigSmallClass %>" target="_blank"
                                            class="module">
                                            <%#Total.ImgModuleTitleUrl%>
                                            <%# Eval("mainClass.class_name") %></a>
                                    </div>
                                    <div style="float: left; margin-top: 6px">
                                        <a href="<%# Eval("template_url") %><%#queryStringBigSmallClass %>" target="_blank"
                                            class="more">更多&gt;&gt;</a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                    <asp:Repeater runat="server" ID="RepeaterNoImgNews">
                        <ItemTemplate>
                            <tbody>
                                <tr valign="top">
                                    <td colspan="3">
                                        <div style="margin: 0px; float: left; width: 250px; vertical-align: middle;">
                                            <img src="images/bullet.gif" alt="" class="imgNoborder" />
                                            <a href="<%# Total.AspxUrlShowdetail %>?<%# Total.QueryStringArticleId %>=<%# Eval("id") %>"
                                                title="<%=pageMetaName %>：<%#UtilHtml.RemoveHtmlTag(Eval("title").ToString(),true)%>"
                                                target="_blank">
                                                <%#UtilHtml.NoImgTitleSubstring(Eval("id").ToString(), Eval("title").ToString(), (DateTime)Eval("addtime"))%>
                                            </a>
                                        </div>
                                        <div class="articleDate">
                                            [<%# String.Format("{0:MM}/{1:dd}", Eval( "addtime"), Eval( "addtime"))%>]
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </ItemTemplate>
                    </asp:Repeater>
                    <!-- 嵌套datalist结束-->
                </table>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <!--大分类结束-->
</div>
