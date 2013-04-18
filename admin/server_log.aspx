<%@ Page Language="c#" Inherits="com.hujun64.admin.server_log" CodeFile="server_log.aspx.cs" %>

<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>服务器后台日志</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <meta name="robots" content="noindex,follow" />
</head>
<body>
    <form id="logForm" runat="server">
    <table id="Table1" cellspacing="0" cellpadding="0" width="100%" align="center" border="1">
        <tbody>
            <tr>
                <td>
                   Date: <asp:TextBox ID="logDateQuery" runat="server" AutoPostBack="True" OnTextChanged="queryDate_Changed" MaxLength="10" Width="100px" />
                   Level: <asp:DropDownList ID="levelList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="levelList_SelectedIndexChanged" />
                
                   Logger: <asp:DropDownList ID="loggerList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="loggerList_SelectedIndexChanged" />
                   <br />
                </td>
                
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td>
                    <asp:DataGrid ID="loglistDGD" runat="server" Width="100%" AutoGenerateColumns="False"
                        DataKeyField="Id" HeaderStyle-Font-Bold="true" HeaderStyle-HorizontalAlign="Center">
                        <Columns>
                            <asp:BoundColumn DataField="Id" HeaderText="Id" ItemStyle-ForeColor="Blue" ItemStyle-Width="30px">
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="Date" HeaderText="Date" DataFormatString="{0:MM-dd HH:mm:ss}"
                                ItemStyle-Width="120px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center">
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="Thread" HeaderText="Thread" ItemStyle-Width="30px" HeaderStyle-Width="30px">
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="Level" HeaderText="Level" ItemStyle-Width="50px"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Logger" HeaderText="Logger" ItemStyle-Width="50px"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Message" HeaderText="Message" ItemStyle-Width="200px"
                                ItemStyle-Wrap="false"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Exception" HeaderText="Exception" ItemStyle-ForeColor="Red"
                                ItemStyle-Wrap="true"></asp:BoundColumn>
                        </Columns>
                    </asp:DataGrid>
                </td>
            </tr>
        </tbody>
    </table>
    <table align="center">
        <tbody>
            <tr valign="top">
                <td>
                    <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                        CurrentPageButtonPosition="Center" CustomInfoHTML="第%CurrentPageIndex%页，共%PageCount%页，每页%PageSize%条"
                        FirstPageText="首页" LastPageText="尾页" LayoutType="Table" NextPageText="下一页" PageIndexBoxType="DropDownList"
                        PagingButtonLayoutType="Span" PrevPageText="上一页" ShowCustomInfoSection="Left"
                        SubmitButtonText="Go" TextAfterPageIndexBox="页" TextBeforePageIndexBox="转到" UrlPaging="true">
                    </webdiyer:AspNetPager>
                </td>
            </tr>
        </tbody>
    </table>
    </form>
</body>
</html>
