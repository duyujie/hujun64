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
            ��������վʹ��ͼƬ�����³�ԭ�������Դ�����磬���ڷ�ӯ��Ŀ�ģ�����ַ�������Ȩ�� �����֮�����ǽ���������
            <br />
            <%=Total.Copyright%>
            <%=UtilHtml.BuildHref(Total.SiteUrl,Total.SiteName,Total.Description,false) %>
        </div>
        <div class="DivContainer" align="center">
            <%=UtilHtml.BuildHref(Total.BeianUrl,Total.BeianNumber,Total.BeianNumber,true) %>
            ��վ������ά�� <a href="mailto:<%=Total.AdminMail%>" title="��ϵ�뷢mail"><font color="blue">
                <%=Total.AdminMail%></font> </a>
        </div>
    </div>
    <div class="DivContainer" align="center">
        <a href="http://www.cyberpolice.cn/" target="_blank" title="����110��������">
            <img border="0" src="images/110.gif" alt="����110��������" style="margin-top: 15px; margin-bottom: 10px" /></a>
        <a href="http://net.china.com.cn/index.htm" target="_blank" title="������Ϣ�ٱ�����">
            <img border="0" src="images/jubao.gif" alt="������Ϣ�ٱ�����" style="margin-top: 15px; margin-bottom: 10px"></a>
        <a href="http://www.12321.cn/" target="_blank" title="12321������Ϣ�ٱ�����">
            <img border="0" src="images/12321.gif" alt="12321������Ϣ�ٱ�����" style="margin-top: 15px;
                margin-bottom: 10px" /></a>
    </div>
</div>
<br />
