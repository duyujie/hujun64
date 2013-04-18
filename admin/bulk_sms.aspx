<%@ Page Language="c#" AutoEventWireup="true" Inherits="com.hujun64.admin.bulk_sms"
    CodeFile="bulk_sms.aspx.cs" ValidateRequest="false" %>

<%@ Register TagPrefix="FCKeditorV2" Namespace="FredCK.FCKeditorV2" Assembly="FredCK.FCKeditorV2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>群发邮件</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <meta name="robots" content="noindex,follow" />
</head>
<body>
    <form id="FormBulkEMail" method="post" runat="server">
    <p>
        <br />
    </p>
    <table border="1" align="center" width="100%" cellpadding="0" cellspacing="0" id="TableBulkSms">
        <tbody>
            <tr>
                <td width="15%" align="right">
                    <br />
                    内容：
                </td>
                <td>
                    <FCKeditorV2:FCKeditor ID="ContentEditor" runat="server" Width="90%" Height="200px">
                    </FCKeditorV2:FCKeditor>
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td width="15%" align="right">
                    <asp:Button ID="button_submit_shanghai" runat="server" Text="发送上海客户"  ForeColor="Blue" Width="120px" Height="30px" Font-Bold="true"
                        Font-Size="14px" OnClick="submit_shanghai" />
                </td>
                <td>
                    <asp:Button ID="button_submit_all" runat="server" Text="发送所有客户"  ForeColor="Blue" Width="120px" Height="30px" Font-Bold="true"
                        Font-Size="14px" OnClick="submit_all" />
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td width="15%" align="right">
                    <asp:Button ID="button_submit_spec" runat="server" Text="发送指定客户" ForeColor="Blue" Width="120px" Height="30px" Font-Bold="true"
                        Font-Size="14px" OnClick="submit_spec" />
                </td>
                <td>
                    <asp:TextBox ID="SpecMobileSend" runat="server" Width="100%"></asp:TextBox>
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td width="15%" align="right">
                    <asp:Button ID="button_query" runat="server" Text="查询余额" ForeColor="Blue" Width="120px" Height="30px" Font-Bold="true"
                        Font-Size="14px" OnClick="submit_query" />
                </td>
                <td>
                    <asp:Label ID="MSG" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </tbody>
    </table>
    <p>
    </p>
    <table border="1" align="left" width="50%" cellpadding="0" cellspacing="0" id="TableChangeSmsPwd">
        <tr>
            <td align="right">
                新密码：
           
                <asp:TextBox TextMode="Password" ID="PasswordNew" runat="server"></asp:TextBox>
            </td>
            <td align="right">
                重复：
            
                <asp:TextBox TextMode="Password" ID="PasswordNewRepeat" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="button_changepw" runat="server" Text="更改短信密码"  ForeColor="Blue" Width="120px" Height="30px" Font-Bold="true"
                    Font-Size="14px" OnClick="submit_changepw" />
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="2次输入不一致！"
                    ControlToValidate="PasswordNewRepeat" ControlToCompare="PasswordNew"></asp:CompareValidator>
            </td>
        </tr>
        <tbody>
            <tr>
                <td colspan="2">
                    <asp:Label ID="MSG_Password" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </tbody>
    </table>
    </form>
</body>
</html>
