<%@ Control Language="c#" Inherits="com.hujun64.lawyer_search" CodeFile="lawyer_search.ascx.cs" %>
 
<%@ Register TagPrefix="uc1" TagName="guest_ask_top" Src="guest_ask_top.ascx" %>
<div class="DivMyLocation" align="left">
    ����λ�ã�
    <%=myLocation%>
</div>
<div class="DivGuestaskTop" align="left">
    <uc1:guest_ask_top ID="guest_ask_top1" runat="server"></uc1:guest_ask_top>
</div>
<table border="0" width="96%" id="table6" align="right">
    <tbody>
        <tr>
            <td height="18">
            </td>
        </tr>
    </tbody>
    <tbody>
        <tr>
            <td style="line-height: 180%" height="30">
                <p>
                    <li>��ʦ��������Ϣ��ѯ���Ϻ���ʦ����ƽ̨�ṩ��</li>
                    <li>���ݲ�ѯ�ĸ�ʽ����ͼ��ʾ����վֻ�ṩ������ӣ���������ѯ���档</li>
                    <li>����ʦ�������ݵ������Լ��ɿ��Ը�����������ֱ�ӷ���<a href="http://shlg.lawyer.org.cn" title="�Ϻ���ʦ����ƽ̨��վ"
                        style="color: Blue">�Ϻ���ʦ����ƽ̨��վ</a>���в�ѯ�� </li>
                </p>
            </td>
        </tr>
    </tbody>
    <tbody>
        <tr>
            <td height="18">
            </td>
        </tr>
    </tbody>
    <tbody>
        <tr>
            <td>
                <iframe name="lawyerSearch_frame" marginwidth="0" marginheight="0" width="100%" height="600"
                    src="<%=Total.AspxUrlOriginalLawyerSearch %>" frameborder="0"></iframe>
            </td>
        </tr>
    </tbody>
</table>
