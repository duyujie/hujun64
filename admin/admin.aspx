<%@ Page Language="c#" Inherits="com.hujun64.admin.admin" CodeFile="admin.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD html 4.0 Transitional//EN" >
<html>
<head>
    <title>后台管理登陆</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR" />
    <meta content="C#" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
    <meta name="robots" content="noindex,follow" />
</head>
<body>
    <form id="Form1" method="post" runat="server">
    <table id="Table1" style="z-index: 103; left: 232px; width: 408px; position: absolute;
        top: 128px; height: 126px" cellspacing="0" cellpadding="0" width="408" border="1">
        <tr>
            <td colspan="3">
                后台管理登陆
            </td>
        </tr>
        <tr>
            <td colspan="3">
            </td>
        </tr>
        <tr>
            <td>
                用户名：
            </td>
            <td>
                <input name="username" type="text" value="admin" id="username" />
            </td>
        </tr>
        <tr>
            <td>
                密码：
            </td>
            <td>
                <input name="pass" type="password" id="pass" />
            </td>
            
        </tr>
        <tr>
            <td>
                验证码：
            </td>
            <td>
                <input name="txtValidateCode" type="text" id="txtValidateCode" />
            </td>
            <td>
                <img alt="" src="ValidateCode.aspx"/>&nbsp;
            </td>
        </tr>
        <tr><td><input name="chkSaveLogin" type="checkbox" id="chkSaveLogin" />记住登录</td></tr>
        <tr>
            <td align="center" colspan="3">
                <input type="submit" id="enter" name="enter" value="确认" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="labelMsg" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
