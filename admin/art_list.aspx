<%@ Page Language="c#" Inherits="com.hujun64.admin.art_list" CodeFile="art_list.aspx.cs" %>

<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>文章列表</title>
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
                <td width="15%">
                    选择法律业务分类
                </td>
                <td width="85%" align="left">
                    <asp:DropDownList ID="bigClassList" runat="server" AutoPostBack="True" DataTextField="class_name"
                        DataValueField="id" OnSelectedIndexChanged="bigClassList_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:Label ID="ignoreBigClassLabel" runat="server" AutoPostBack="True" Text="忽略" />
                    <asp:CheckBox ID="ignoreBigClass" runat="server" AutoPostBack="True" OnCheckedChanged="ignoreBigClass_SelectedIndexChanged" />
                    &nbsp &nbsp<asp:DropDownList ID="smallClassList" runat="server" AutoPostBack="True"
                        DataTextField="class_name" DataValueField="id" OnSelectedIndexChanged="smallClassList_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:Label ID="ignoreSmallClassLabel" runat="server" AutoPostBack="True" Text="忽略" />
                    <asp:CheckBox ID="ignoreSmallClass" runat="server" AutoPostBack="True" OnCheckedChanged="ignoreSmallClass_SelectedIndexChanged" />
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td>
                    版块分类
                </td>
                <td>
                    <asp:DropDownList ID="moduleClassList" runat="server" AutoPostBack="True" DataTextField="class_name"
                        DataValueField="id" OnSelectedIndexChanged="moduleList_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:Label ID="ignoreModuleLabel" runat="server" AutoPostBack="True" Text="忽略" />
                    <asp:CheckBox ID="ignoreModuleClass" runat="server" AutoPostBack="True" />
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
    <table cellspacing="0" cellpadding="0" width="60%" border="1">
        <tbody>
            <tr>
                <td colspan="3">
                    <asp:Label ID="MSG" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td colspan="3">
                    <p>
                        <asp:Button ID="standardFormatButton" runat="server" Text="标准格式化" ForeColor="Blue"
                            Width="120px" Height="30px" Font-Bold="true" Font-Size="14px" OnClick="standardFormat_Click" />
                        &nbsp;&nbsp; 对列表中所有文章进行格式<font color="red">标准化</font>
                    </p>
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td colspan="3">
                    <p>
                        <asp:Button ID="definedFormatButton" runat="server" Text="自定义格式化" ForeColor="Blue"
                            Width="120px" Height="30px" Font-Bold="true" Font-Size="14px" OnClick="definedFormat_Click" />
                        &nbsp;&nbsp; 对列表中所有文章进行格式<font color="red">自定义化</font>
                    </p>
                </td>
            </tr>
        </tbody>
    </table>
    </form>
</body>
</html>
