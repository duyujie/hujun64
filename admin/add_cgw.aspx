<%@ Page Language="c#" AutoEventWireup="true" Inherits="com.hujun64.admin.add_cgw"
    CodeFile="add_cgw.aspx.cs" ValidateRequest="false" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>添加/更新文章</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <meta name="robots" content="noindex,follow" />
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>

    <script type="text/javascript" src="../xheditor/xheditor-zh-cn.min.js"></script>

    <script type="text/javascript">
        //        $(pageInit);
        function pageInit() {

        }

        $(document).ready(function () {
            var content = "#" + '<%=this.ContentEditor.ClientID %>';
            $(content).xheditor(true, { tools: 'full'
            });

        });

    </script>
</head>
<body>
    <form id="FormArt" method="post" runat="server">
    <table border="1" align="center" width="100%" cellpadding="0" cellspacing="0" id="TableCGW">
        <tr>
            <td width="15%" align="right">
                敏感词：
            </td>
            <td>
                <asp:TextBox ID="TextBoxOriginalWords" runat="server" Width="200px" MaxLength="100"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="15%" align="right">
                替代词：
            </td>
            <td>
                <asp:TextBox ID="TextBoxNewWords" runat="server" Width="200px" MaxLength="100"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="15%" align="right">
                <asp:Button ID="submit_button" runat="server" Text="提交" ForeColor="Blue" Width="60px"
                    Height="30px" Font-Bold="true" Font-Size="14px" OnClick="submit_Click" />
            </td>
        </tr>
        <tr>
            <td width="15%" align="right">
                敏感词列表：
            </td>
            <td>
                <asp:TextBox ID="ContentEditor" TextMode="MultiLine" runat="server" Rows="30" Columns="100" />
            </td>
        </tr>
        <tbody>
            <tr>
                <td colspan="2">
                    <asp:Label ID="MSG" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </tbody>
    </table>
    </form>
</body>
</html>
