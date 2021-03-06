<%@ Control Language="C#" AutoEventWireup="true" Inherits="com.hujun64.fzb" CodeFile="fzb.ascx.cs" %>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<div style="float: none; clear: both; margin-top: 10px;">
</div>
<div align="center" class="DivFooter" style="margin-top: 20px">
    <div class="nowidthModuleName"  align="center">
        <div class="moduleName">
            <a href="listitem.aspx?module_id=80" target="_blank" class="module">《上海法治报》胡珺律师专栏</a>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="listitem.aspx?module_id=80" target="_blank" class="more">更多&gt;&gt;</a>
        </div>
        <br />
    </div>
    <asp:Repeater runat="server" ID="RepeaterFzb">
        <ItemTemplate>
            <div class="pdfClass">
                <a href="<%# Total.AspxUrlShowdetail %>?<%# Total.QueryStringArticleId %>=<%# Eval("id") %>"
                    title="<%#UtilHtml.RemoveHtmlTag(Eval("title").ToString(),true)%>" target="_blank">
                    <%#UtilHtml.NoImgTitleSubstring(Eval("title").ToString())%>
                </a>
                <br />
                <a href="<%# Total.AspxUrlShowdetail %>?<%# Total.QueryStringArticleId %>=<%# Eval("id") %>"
                    title="<%#UtilHtml.RemoveHtmlTag(Eval("title").ToString(),true)%>" target="_blank">
                    <img src="<%# Eval("articlePicture.pic_url") %>.jpg" width="250" height="320" alt='<%#UtilHtml.NoImgTitleSubstring(Eval("title").ToString())%>' />
                </a>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
