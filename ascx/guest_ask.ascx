<%@ Control Language="c#" Inherits="com.hujun64.guest_ask" CodeFile="guest_ask.ascx.cs" %>
<div class="DivMyLocation" align="left">
    ����λ�ã�
    <%=myLocation%>
</div>
<div align="left" style="margin-top: 7px;">
    &nbsp;&nbsp;&nbsp;&nbsp;
    <img src="images/blue_plus.gif" style="border-style: none; vertical-align: middle;"
        alt="�鿴������ѯ�б�" />
    <a href="<%= Total.AspxUrlGuestbook %>" target="_blank" class="nowidthModule" title="�鿴������ѯ�б�">
        ��ѯ�б�</a>
</div>
<div class="DivContent" align="center">
    <%=Total.BannerObjectUrl%>
</div>
<div class="DivGuestask">
    <form id="FormGuestask" method="post" runat="server">
    <table class="frameGuestaskTable">
        <tbody>
            <tr>
                <td colspan="3">
                    ǩд�����ԣ�
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td colspan="2" align="left">
                    <font color="#cc3300">
                        <ul>
                            <li>��������ϵ��ʽ��վ��������ϸ��ܣ�����͸¶���κε�����������ʵ��д</li>
                            <li>����վ�����ڣ�����������������͸¶������˽�������Ϣ</li>
                        </ul>
                    </font>
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td width="120px" align="right">
                    ����(����)��
                </td>
                <td width="320px">
                    <asp:TextBox ID="author" runat="server" Width="192px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="valid1" runat="server" ControlToValidate="author"
                        Display="dynamic" SetFocusOnError="true">��������Ϊ��</asp:RequiredFieldValidator>
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td width="120px" align="right">
                    �Ա�
                </td>
                <td>
                    <input type="radio" id="sex" name="sex" value="��" />��
                    <input type="radio" id="sex" name="sex" value="Ů" />Ů
                    <input type="radio" id="sex" name="sex" value="����" checked="checked" />����
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td width="120px" align="right">
                    ��ϵ�绰(ѡ��)��
                </td>
                <td width="320px">
                    <asp:TextBox ID="contact" runat="server" Width="192px"></asp:TextBox>
                    <br />
                    <asp:RegularExpressionValidator ID="contactValidator" runat="server" ControlToValidate="contact"
                        ValidationExpression="((^1[0-9]{10}$)|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)"
                        Display="dynamic" SetFocusOnError="true">�绰�����ʽ����ȷ</asp:RegularExpressionValidator>
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td width="120px" align="right">
                    �ʼ���ַ(ѡ��)��
                </td>
                <td width="500px">
                    <asp:TextBox ID="email" runat="server" Width="192px" MaxLength="30"></asp:TextBox>
                    <span style="color: #cc3300">�ظ������Զ�֪ͨ����������</span>
                    <br />
                    <asp:RegularExpressionValidator ID="EmailValidator" runat="server" ControlToValidate="email"
                        ValidationExpression="(^[a-zA-Z]|^[a-zA-Z][\w-_\.]*[a-zA-Z0-9])@(\w+\.)+\w+$"
                        Display="dynamic" SetFocusOnError="true">�ʼ���ַ��ʽ����ȷ</asp:RegularExpressionValidator>
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td width="120px" align="right">
                    ��ѯ���ࣺ
                </td>
                <td>
                    <asp:Repeater ID="RepeaterBigClass" runat="server">
                        <ItemTemplate>
                            <input type="radio" id="bigClassRadioList" name="bigClassRadioList" value="<%# Eval("id")%>"
                                checked="<%# Eval("radio_checked")%>" /><%# Eval("class_name")%>
                        </ItemTemplate>
                    </asp:Repeater>
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td width="120px" align="right">
                    ����(����)��
                </td>
                <td width="500px">
                    <asp:TextBox ID="guesttitle" runat="server" Width="500px" MaxLength="100"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="guesttitle"
                        Display="dynamic" SetFocusOnError="true">���ⲻ��Ϊ��</asp:RequiredFieldValidator>
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr valign="top">
                <td width="120px" align="right">
                    ����(����)��
                </td>
                <td style="width: 500px; word-break: break-all">
                    <asp:TextBox ID="content" runat="server" Width="500px" TextMode="MultiLine" Height="180px"
                        MaxLength="2000"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="content"
                        Display="dynamic" SetFocusOnError="true">���ݲ���Ϊ��</asp:RequiredFieldValidator>
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td width="18%" height="25" align="right">
                    ��֤��<font color="red">*</font>
                </td>
                <td>
                   
                    <asp:TextBox ID="txtValidateCode" runat="server" Width="40px" MaxLength="4" ToolTip="����д�Ҳ���λһ�����֤�룡"
                        onkeyup="value=value.replace(/[^0-9_]/ig, '')" />
                         <img alt="" src="admin/ValidateCode.aspx"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtValidateCode"
                        Display="dynamic" SetFocusOnError="true">��֤�벻��Ϊ��</asp:RequiredFieldValidator>
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr height="30px">
                <td width="120px">
                </td>
                <td>
                    <asp:Button ID="addbtn" runat="server" Text="�ύ" Font-Size="13px" Height="20px" Width="50px"
                        ToolTip="�ύ��ѯ����" OnClick="addbtn_Click"></asp:Button>
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td style="width: 80px">
                </td>
                <td colspan="2">
                    <asp:Label ID="MSG" runat="server"></asp:Label>
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td width="500px" colspan="3">
                    <ul>
                        <li>�������ϵ��£������л����񹲺͹��ĸ����йط��ɷ��� </li>
                        <li>�е�һ����������Ϊ��ֱ�ӻ��ӵ��µ����»����·������� </li>
                        <li>��վ������Ա��Ȩ������ɾ�����Ͻ�����е��������� </li>
                        <li>��վ��Ȩ����վ��ת�ػ������������� </li>
                        <li>���뱾���Լ��������Ѿ��Ķ��������������� </li>
                    </ul>
                </td>
            </tr>
        </tbody>
    </table>
    </form>
</div>
<div class="DivContent" align="center">
    <%=Total.BannerHireUrl%>
</div>
