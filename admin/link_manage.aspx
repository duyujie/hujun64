<%@ Page Language="c#" Inherits="com.hujun64.admin.link_manage" CodeFile="link_manage.aspx.cs"
    ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD html 4.0 Transitional//EN" >
<link href="../css/style.css" rel="stylesheet" rev="stylesheet" type="text/css" />
<html>
<head>
    <title>¡Ù—‘π‹¿Ì</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <meta name="robots" content="noindex,follow"/>
</head>
<body>
    <form id="FormAsk" method="post" runat="server">
    <font face="ÀŒÃÂ">
        <table id="Table1" cellspacing="0" cellpadding="0" width="800" align="center" border="1">
            
            <tr>
                <td colspan="3">
                    <h2>
                        ”—«È¡¥Ω”π‹¿Ì</h2>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:DataGrid ID="DataGridTitle" runat="server" Width="752px" AutoGenerateColumns="False"
                        DataKeyField="id" OnSelectedIndexChanged="DataGrid1_SelectedIndexChanged" OnItemCommand="DataGrid1_SortCommand" HeaderStyle-Font-Bold="true">
                        <Columns>
                            <asp:BoundColumn Visible="False" DataField="id"></asp:BoundColumn>
                            <asp:BoundColumn DataField="site_name" HeaderText="Õ¯’æ√˚≥∆"></asp:BoundColumn>                                           
                            <asp:BoundColumn DataField="addtime" HeaderText="…Í«Î ±º‰"></asp:BoundColumn>
                            <asp:BoundColumn DataField="status" HeaderText="…Û∫À◊¥Ã¨"></asp:BoundColumn>
                            <asp:BoundColumn DataField="approve_time" HeaderText="…Û∫À ±º‰"></asp:BoundColumn>
                            <asp:ButtonColumn Text="—°‘Ò" HeaderText="≤Èø¥" CommandName="Select"></asp:ButtonColumn>
                            <asp:ButtonColumn Text="…æ≥˝" HeaderText="…æ≥˝" CommandName="Delete"></asp:ButtonColumn>
                            <asp:ButtonColumn Text="…˝–Ú" HeaderText="…˝–Ú" CommandName="SortUp"></asp:ButtonColumn>
                            <asp:ButtonColumn Text="Ωµ–Ú" HeaderText="Ωµ–Ú" CommandName="SortDown"></asp:ButtonColumn>
                        </Columns>
                    </asp:DataGrid>
                </td>
            </tr>
        </table>
        <p>
        </p>
        <p>
        </p>
        <table id="Table2" cellspacing="0" cellpadding="0" width="800" align="center" border="1">
            <tr>
                <td colspan="3" style="color: #CC3300; font-weight: bold;">
                    <h2>
                        ”—∫√¡¥Ω”ƒ⁄»›</h2>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="linkApprove">
                    ±æ’æ‘⁄∏√’æµÿ÷∑
                </td>
                <td>
                    <asp:HiddenField ID="linkId" runat="server" />
                    <asp:Label ID="my_url" runat="server"></asp:Label>
                    &nbsp; -><asp:TextBox ID="my_url_edit" runat="server" Width="500px"> </asp:TextBox>
                </td>
            </tr>
            <tr>
            <td colspan="2" class="linkApprove">
                Õ¯’æ√˚≥∆
            </td>
            <td>
                <asp:Label ID="site_name" runat="server"></asp:Label>
                &nbsp; -><asp:TextBox ID="site_name_edit" runat="server" Width="500px"> </asp:TextBox>
            </td>
            </tr>
            <tr>
                <td colspan="2" class="linkApprove">
                    <span class="linkApprove">Õ¯’æµÿ÷∑</span>
                </td>
                <td>
                    <asp:TextBox ID="site_url_edit" runat="server" Width="500px"></asp:TextBox>                    
                </td>
            </tr>
            <tr>
                <td colspan="2" class="linkApprove">
                    <span class="linkApprove">Õ¯’ælogo</span>
                </td>
                <td>
                    <asp:Label ID="site_logo" runat="server"></asp:Label>
                    &nbsp; -><asp:TextBox ID="site_logo_edit" runat="server" Width="500px"> </asp:TextBox>
                </td>
            </tr>
            <tr>
                <td height="80px" colspan="2" class="linkApprove">
                    Õ¯’æ√Ë ˆ
                </td>
                <td height="80px">
                    <asp:TextBox ID="site_desc" runat="server" Width="500px" Height="80px"  TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td  colspan="2" class="linkApprove">
                    …Í«Î ±º‰
                </td>
                <td>
                    <asp:Label ID="addtime" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td  colspan="2" class="linkApprove">
                    …Û∫À◊¥Ã¨
                </td>
                <td>
                    <asp:Label ID="status" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td  colspan="2" class="linkApprove">
                    …Û∫À ±º‰
                </td>
                <td>
                    <asp:Label ID="approve_time" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="approve_button" runat="server" Text="…Û∫ÀÕ®π˝" ForeColor="Green" Width="100px"
                        Height="30px" Font-Bold="true" Font-Size="14px" OnClick="approve_Click"  ></asp:Button>
                </td>
                <td colspan="2">
                    <asp:Button ID="reject_button" runat="server" Text="…Û∫Àæ‹æ¯" ForeColor="Red" Width="100px"
                        Height="30px" Font-Bold="true" Font-Size="14px" OnClick="reject_Click"  ></asp:Button>
                </td>
                </tr>
                <tr>
                <td colspan="2">
                    <asp:Button ID="update_button" runat="server" Text="∏¸–¬¡¥Ω”" ForeColor="Blue" Width="100px"
                        Height="30px" Font-Bold="true" Font-Size="14px" OnClick="update_Click" ></asp:Button>
                </td>
            </tr>
            <tr>
                <td class="linkApprove" colspan="2">
                </td>
                <td>
                    <asp:Label ID="MSG" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </font>
    </form>
</body>
</html>
