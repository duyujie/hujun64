<%@ Page Language="c#" Inherits="com.hujun64.admin.global_edit" CodeFile="global_edit.aspx.cs" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>全编辑局变量</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <meta name="robots" content="noindex,follow"/>
</head>
<body>
    <form id="Form1" method="post" runat="server">
    <font face="宋体">
        <table id="Table1" cellspacing="0" cellpadding="0" width="800" align="center" border="1">
            <tbody>
                <tr>
                    <td colspan="2">
                        全局变量设置：
                    </td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td>
                        站点名称:
                    </td>
                    <td>
                        <asp:TextBox ID="sitename" runat="server" Width="368px"></asp:TextBox>
                    </td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td>
                        站点地址:
                    </td>
                    <td>
                        <asp:TextBox ID="sitelink" runat="server" Width="368px"></asp:TextBox>
                    </td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td>
                        站点title:
                    </td>
                    <td>
                        <asp:TextBox ID="sitetitle" runat="server" Width="368px"></asp:TextBox>
                    </td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td>
                        网页title:
                    </td>
                    <td>
                        <asp:TextBox ID="pagetitle" runat="server" Width="368px"></asp:TextBox>
                    </td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td>
                        管理员名称：
                    </td>
                    <td>
                        <asp:TextBox ID="adminname" runat="server" Width="368px"></asp:TextBox>
                    </td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td>
                        管理员信箱：
                    </td>
                    <td>
                        <asp:TextBox ID="adminmail" runat="server" Width="368px"></asp:TextBox>
                    </td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td>
                        版权说明：
                    </td>
                    <td>
                        <asp:TextBox ID="theright" runat="server" Width="368px"></asp:TextBox>
                    </td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td>
                        关键字：
                    </td>
                    <td>
                        <asp:TextBox ID="keywords" runat="server" Width="368px"></asp:TextBox>
                    </td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="updatebtn" runat="server" Text="更新" OnClick="updatebtn_Click"></asp:Button>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Message" runat="server"></asp:Label>
                    </td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td align="center" colspan="2">
                    </td>
                </tr>
            </tbody>
        </table>
    </font>
    </form>
</body>
</html>
