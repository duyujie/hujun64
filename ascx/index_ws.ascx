<%@ Control Language="c#" Inherits="com.hujun64.index_ws" CodeFile="index_ws.ascx.cs" %>
 
<table align="left" cellpadding="0" cellspacing="0" width="100%">
    <tbody>
        <tr>
            <td class="moduleName" colspan="2">
                <%=Total.ImgModuleTitleUrl%>
                <a href="#" class="module">����֧�ֹ���</a>
            </td>
        </tr>
    </tbody>
    <tbody>
        <tr>
            <td width="5%">
                <img src="images/bullet.gif" alt="" class="imgNoborder" />
            </td>
            <td width="95%">
                <a href="<%= Total.AspxUrlWebService %>?<%=Total.QueryStringAction %>=<%=WebServiceActionType.SEARCH_LAWYER.ToString() %>"
                    title="��ʦ����ʦ��������Ϣ��ѯ" target = "_blank" class="navlink">
                    <%=UtilHtml.LeftTitleSubstring("��ʦ����ʦ��������Ϣ��ѯ")%></a>
            </td>
        </tr>
    </tbody>
    <tbody>
        <tr>
            <td width="5%">
                <img src="images/bullet.gif" alt="" class="imgNoborder" />
            </td>
            <td width="95%">
                <a href="<%= Total.AspxUrlWebService %>?<%=Total.QueryStringAction %>=<%=WebServiceActionType.SEARCH_IP.ToString() %>"
                    title="IP��ַ����λ�ò�ѯ" target = "_blank" class="navlink">
                    <%=UtilHtml.LeftTitleSubstring("��ַ����λ�ò�ѯ")%></a>
            </td>
        </tr>
    </tbody>
</table>
