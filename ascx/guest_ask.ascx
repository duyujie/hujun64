<%@ Control Language="c#" Inherits="com.hujun64.guest_ask" CodeFile="guest_ask.ascx.cs" %>
<div class="DivMyLocation" align="left">
    您的位置：
    <%=myLocation%>
</div>
<div align="left" style="margin-top: 7px;">
    &nbsp;&nbsp;&nbsp;&nbsp;
    <img src="images/blue_plus.gif" style="border-style: none; vertical-align: middle;"
        alt="查看已有咨询列表" />
    <a href="<%= Total.AspxUrlGuestbook %>" target="_blank" class="nowidthModule" title="查看已有咨询列表">
        咨询列表</a>
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
                    签写新留言：
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td colspan="2" align="left">
                    <font color="#cc3300">
                        <ul>
                            <li>姓名和联系方式本站都会进行严格保密，不会透露给任何第三方，请如实填写</li>
                            <li>本网站面向公众，请勿在留言内容中透露个人隐私及身份信息</li>
                        </ul>
                    </font>
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td width="120px" align="right">
                    姓名(必填)：
                </td>
                <td width="320px">
                    <asp:TextBox ID="author" runat="server" Width="192px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="valid1" runat="server" ControlToValidate="author"
                        Display="dynamic" SetFocusOnError="true">姓名不能为空</asp:RequiredFieldValidator>
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td width="120px" align="right">
                    性别：
                </td>
                <td>
                    <input type="radio" id="sex" name="sex" value="男" />男
                    <input type="radio" id="sex" name="sex" value="女" />女
                    <input type="radio" id="sex" name="sex" value="保密" checked="checked" />保密
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td width="120px" align="right">
                    联系电话(选填)：
                </td>
                <td width="320px">
                    <asp:TextBox ID="contact" runat="server" Width="192px"></asp:TextBox>
                    <br />
                    <asp:RegularExpressionValidator ID="contactValidator" runat="server" ControlToValidate="contact"
                        ValidationExpression="((^1[0-9]{10}$)|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)"
                        Display="dynamic" SetFocusOnError="true">电话号码格式不正确</asp:RegularExpressionValidator>
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td width="120px" align="right">
                    邮件地址(选填)：
                </td>
                <td width="500px">
                    <asp:TextBox ID="email" runat="server" Width="192px" MaxLength="30"></asp:TextBox>
                    <span style="color: #cc3300">回复将会自动通知到您的邮箱</span>
                    <br />
                    <asp:RegularExpressionValidator ID="EmailValidator" runat="server" ControlToValidate="email"
                        ValidationExpression="(^[a-zA-Z]|^[a-zA-Z][\w-_\.]*[a-zA-Z0-9])@(\w+\.)+\w+$"
                        Display="dynamic" SetFocusOnError="true">邮件地址格式不正确</asp:RegularExpressionValidator>
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td width="120px" align="right">
                    咨询分类：
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
                    主题(必填)：
                </td>
                <td width="500px">
                    <asp:TextBox ID="guesttitle" runat="server" Width="500px" MaxLength="100"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="guesttitle"
                        Display="dynamic" SetFocusOnError="true">主题不能为空</asp:RequiredFieldValidator>
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr valign="top">
                <td width="120px" align="right">
                    内容(必填)：
                </td>
                <td style="width: 500px; word-break: break-all">
                    <asp:TextBox ID="content" runat="server" Width="500px" TextMode="MultiLine" Height="180px"
                        MaxLength="2000"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="content"
                        Display="dynamic" SetFocusOnError="true">内容不能为空</asp:RequiredFieldValidator>
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td width="18%" height="25" align="right">
                    验证码<font color="red">*</font>
                </td>
                <td>
                   
                    <asp:TextBox ID="txtValidateCode" runat="server" Width="40px" MaxLength="4" ToolTip="请填写右侧四位一组的验证码！"
                        onkeyup="value=value.replace(/[^0-9_]/ig, '')" />
                         <img alt="" src="admin/ValidateCode.aspx"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtValidateCode"
                        Display="dynamic" SetFocusOnError="true">验证码不能为空</asp:RequiredFieldValidator>
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr height="30px">
                <td width="120px">
                </td>
                <td>
                    <asp:Button ID="addbtn" runat="server" Text="提交" Font-Size="13px" Height="20px" Width="50px"
                        ToolTip="提交咨询留言" OnClick="addbtn_Click"></asp:Button>
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
                        <li>尊重网上道德，遵守中华人民共和国的各项有关法律法规 </li>
                        <li>承担一切因您的行为而直接或间接导致的民事或刑事法律责任 </li>
                        <li>本站管理人员有权保留或删除其管辖留言中的任意内容 </li>
                        <li>本站有权在网站内转载或引用您的留言 </li>
                        <li>参与本留言即表明您已经阅读并接受上述条款 </li>
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
