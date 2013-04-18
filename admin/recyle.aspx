<%@ Page Language="c#" Inherits="com.hujun64.admin.recyle" CodeFile="recyle.aspx.cs" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head>
    <title>文章列表</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <meta name="robots" content="noindex,follow"/>
</head>
<body>
    <form id="ArtListForm" method="post" runat="server">
    
 <%--<uc1:search ID="SearchTop" runat="server"></uc1:search>--%>

    <table id="Table1" cellspacing="0" cellpadding="0" width="100%" align="center" border="1">
        
        <tbody>
            <tr>
                <td colspan="3">
                    <asp:DataGrid ID="newlistDGD" runat="server" Width="100%" AutoGenerateColumns="False"
                        DataKeyField="id" HeaderStyle-Font-Bold="true" OnItemCommand="newlistDGD_Command">
                        <Columns>
                            <asp:HyperLinkColumn DataNavigateUrlField="id" DataNavigateUrlFormatString="add_art.aspx?dnid={0}"
                                DataTextField="title" HeaderText="标题" ItemStyle-Width="400px"></asp:HyperLinkColumn>
                            <asp:BoundColumn DataField="id" HeaderText="ID" ItemStyle-ForeColor="Red">
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="addtime" HeaderText="添加时间" DataFormatString="{0:yyyy-MM-dd HH:mm}">
                            </asp:BoundColumn>                           
                            <asp:BoundColumn DataField="news_from" HeaderText="来源"></asp:BoundColumn>
                            <asp:BoundColumn DataField="author" HeaderText="作者"></asp:BoundColumn>                                                       
                            <%--<asp:BoundColumn DataField="site_name" HeaderText="所属站点"></asp:BoundColumn>--%>
                            <asp:ButtonColumn Text="浏览" HeaderText="浏览" CommandName="Open"></asp:ButtonColumn>
                            <asp:ButtonColumn Text="彻底删除" HeaderText="彻底删除" CommandName="Delete"></asp:ButtonColumn>
                        </Columns>
                    </asp:DataGrid>
                </td>
            </tr>
        </tbody>
    </table>
    
    <table cellspacing="0" cellpadding="0" width="60%" border="1">
        <tbody>
            <tr>
                <td colspan="3">
                    <asp:Label ID="MSG" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </tbody>
        
    </table>
    </form>
</body>
</html>
