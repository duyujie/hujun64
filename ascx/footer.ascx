<%@ Control Language="C#" AutoEventWireup="true" Inherits="com.hujun64.footer" CodeFile="footer.ascx.cs" %>
<%@ Register TagPrefix="uc1" TagName="sitemap" Src="sitemap.ascx" %>
<div class="DivContainer">
    <div style="margin-left: 0px; margin-top: 5px; float: left">
        <hr align="center" class="hrwidth" />
        <uc1:sitemap ID="sitemap" runat="server"></uc1:sitemap>
    </div>
    <div style="margin-left: 0px; float: left">
        <hr align="center" class="hrwidth" />
        <div class="DivContainer" align="center">
            声明：网站使用图片、文章除原创外均来源于网络，用于非盈利目的，如果侵犯了您的权益 ，请告之，我们将立即撤换
            <br />
            <%=Total.Copyright%>
            <%=UtilHtml.BuildHref(Total.SiteUrl,Total.SiteName,Total.Description,false) %>
        </div>
        <div class="DivContainer" align="center">
            <%=UtilHtml.BuildHref(Total.BeianUrl,Total.BeianNumber,Total.BeianNumber,true) %>
            网站开发及维护 <a href="mailto:<%=Total.AdminMail%>" title="联系请发mail"><font color="blue">
                <%=Total.AdminMail%></font> </a>
        </div>
    </div>
    <div class="DivContainer" align="center">
        <a href="http://www.cyberpolice.cn/" target="_blank" title="网络110报警服务">
            <img border="0" src="images/110.gif" alt="网络110报警服务" style="margin-top: 15px; margin-bottom: 10px" /></a>
        <a href="http://net.china.com.cn/index.htm" target="_blank" title="不良信息举报中心">
            <img border="0" src="images/jubao.gif" alt="不良信息举报中心" style="margin-top: 15px; margin-bottom: 10px"></a>
        <a href="http://www.12321.cn/" target="_blank" title="12321垃圾信息举报中心">
            <img border="0" src="images/12321.gif" alt="12321垃圾信息举报中心" style="margin-top: 15px;
                margin-bottom: 10px" /></a>
    </div>
</div>
<br />
