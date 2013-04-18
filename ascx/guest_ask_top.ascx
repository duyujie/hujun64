<%@ Control Language="C#" AutoEventWireup="true" Inherits="com.hujun64.guest_ask_top"    CodeFile="guest_ask_top.ascx.cs" %>
<%@ OutputCache Duration="300" VaryByParam="none" Shared="True" %>

<table border="0">
    <tbody>
        <tr>
            <td width="60px" align="right" >
                <img src="<%=Total.ImgWriteGuestbookUrl%>" height="22px"  alt="向胡律师进行留言咨询">
            </td>
            <td valign="bottom">
                <a href="<%= Total.AspxUrlGuestAsk %>" target = "_blank" class="nowidthModule" title="向胡律师进行留言咨询">
                    留言咨询</a>
            </td>
        </tr>
    </tbody>
</table>
