<%@ Page Language="c#" Inherits="com.hujun64.admin.art_search" CodeFile="art_search.aspx.cs" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>文章搜索</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <meta name="robots" content="noindex,follow" />
</head>
<body>
    <form id="ArtListForm" method="post" runat="server">
    <%--<uc1:search ID="SearchTop" runat="server"></uc1:search>--%>
    <table id="Table1" cellspacing="0" cellpadding="0" width="100%" align="center" border="1">
        <tbody>
            <tr>
                <td>
                    文章ID
                </td>
                <td>
                    <asp:TextBox ID="TextBoxSearchAticleId" runat="server" Width="100" MaxLength="10"></asp:TextBox>
                    <asp:Button ID="ButtonArticleQueryById" runat="server" Text="查询" ForeColor="Blue" Width="60px"
                        Height="30px" Font-Bold="true" Font-Size="14px" OnClick="click_ArticleQueryById" />
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td>
                    文章标题
                </td>
                <td>
                    <asp:TextBox ID="TextBoxSearchTitle" runat="server" Width="100" MaxLength="100"></asp:TextBox>
                    <asp:Button ID="ButtonSearchTitle" runat="server" Text="查询" ForeColor="Blue" Width="60px"
                        Height="30px" Font-Bold="true" Font-Size="14px" OnClick="click_ArticleQueryByTitle" />
                </td>
            </tr>
        </tbody>
         <tbody>
            <tr>
                <td colspan="2">
                    满足条件记录数：
                    <asp:Label ID="LabelCount" runat="server" Width="20" ></asp:Label>             
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td colspan="3">
                    <asp:DataGrid ID="newlistDGD" runat="server" Width="100%" AutoGenerateColumns="False"
                        DataKeyField="id" HeaderStyle-Font-Bold="true" OnItemCommand="newlistDGD_Command">
                        <Columns>
                            <asp:HyperLinkColumn DataNavigateUrlField="id" DataNavigateUrlFormatString="add_art.aspx?nid={0}"
                                DataTextField="title" HeaderText="标题"></asp:HyperLinkColumn>
                            <asp:BoundColumn DataField="id" HeaderText="ID" ItemStyle-ForeColor="Red"></asp:BoundColumn>
                            <asp:BoundColumn DataField="addtime" HeaderText="添加时间" DataFormatString="{0:yyyy-MM-dd}">
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="ref_id" HeaderText="引用自" ItemStyle-ForeColor="Blue">
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="ref_by_list" HeaderText="被引用" ItemStyle-ForeColor="Blue">
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="news_from" HeaderText="来源"></asp:BoundColumn>
                            <asp:ButtonColumn Text="删除" HeaderText="删除" CommandName="Delete"></asp:ButtonColumn>
                            <asp:ButtonColumn Text="升序" HeaderText="升序" CommandName="SortUp"></asp:ButtonColumn>
                            <asp:ButtonColumn Text="降序" HeaderText="降序" CommandName="SortDown"></asp:ButtonColumn>
                            <asp:ButtonColumn Text="浏览" HeaderText="浏览" CommandName="Open"></asp:ButtonColumn>
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
