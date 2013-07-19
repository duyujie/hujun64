<%@ Control Language="C#" AutoEventWireup="true" CodeFile="index_contact.ascx.cs"
    Inherits="com.hujun64.index_contact" %>
<table align="left" cellpadding="0" cellspacing="0" class="frameIndexContactTable">
    <tbody>
        <tr>
            <td class="moduleName" colspan="3">
                <%=Total.ImgModuleTitleUrl%>
                <a href="<%=Total.AspxUrlIntro +"?"+ Total.QueryStringIntroId +"="+contactIdWorkday %>"
                    target="_blank" class="module">
                    <%=Total.ContactWorkdayArticleTitle%></a>
            </td>
        </tr>
    </tbody>
    <tbody>
        <tr>
            <td class="indexContactColLeft">
                �ֻ�
            </td>
            <td>
                <%=Total.Mobile%>
            </td>
            <td>
                <span style="color: cornflowerblue">�����ѯ</span>
            </td>
        </tr>
    </tbody>
    <tbody>
        <tr>
            <td class="indexContactColLeft">
                ����
            </td>
            <td colspan="2">
                <%=Total.Fax%>
            </td>
        </tr>
    </tbody>
    <tbody>
        <tr>
            <td class="indexContactColLeft">
                ����
            </td>
            <td colspan="2">
                <div class="indexContact">
                    <a href="mailto:<%=Total.Email%>" class="indexContact">
                        <%=Total.Email%></a>
                </div>
            </td>
        </tr>
    </tbody>
     <tbody>
        <tr>
            <td class="indexContactColLeft">
                QQ
            </td>
            <td colspan="2">
                <%=Total.Qq%>
            </td>
        </tr>
    </tbody>
    <tbody>
        <tr>
            <td class="indexContactColLeft">
                ��ַ
            </td>
            <td colspan="2">
                <span class="indexContact">
                    <%=Total.AddressWorkday%>
                </span>
            </td>
        </tr>
        <tr> 
        <td></td>
            <td  colspan="2" >
                <span class="indexContact">
                    <%=UtilHtml.BuildHref(Total.AspxUrlIntro + "?" + Total.QueryStringIntroId + "=" + contactIdWorkday, UtilHtml.GetFullImageUrl("images/showmap.gif", "�鿴��ϸ��ͼ·��", "70", "26"), "�鿴��ϸ��ͼ·��", true)%>
                </span>
            </td>
        </tr>
    </tbody>
</table>
