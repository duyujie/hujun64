<%@ Control Language="C#" AutoEventWireup="true" Inherits="com.hujun64.guest_ask_top"    CodeFile="guest_ask_top.ascx.cs" %>
<%@ OutputCache Duration="300" VaryByParam="none" Shared="True" %>

<table border="0">
    <tbody>
        <tr>
            <td width="60px" align="right" >
                <img src="<%=Total.ImgWriteGuestbookUrl%>" height="22px"  alt="�����ʦ����������ѯ">
            </td>
            <td valign="bottom">
                <a href="<%= Total.AspxUrlGuestAsk %>" target = "_blank" class="nowidthModule" title="�����ʦ����������ѯ">
                    ������ѯ</a>
            </td>
        </tr>
    </tbody>
</table>
