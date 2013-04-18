<%@ Page Language="c#" Inherits="com.hujun64.admin.class_eidt" CodeFile="class_edit.aspx.cs" %>

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
    <form id="SiteClassListForm" method="post" runat="server">
    <table id="TableClass" cellspacing="0" cellpadding="0" width="600px" align="left" border="1">
        <tr>
            <th>
                网站
            </th>
            <th>
                法律业务大类
            </th>
            <th>
                法律业务小类
            </th>
            <th>
                版块分类
            </th>
        </tr>
        
        <tr>
            <td>
               <asp:Label ID="LabelEditi" Text="所有分类" runat="server"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownListBigClass" runat="Server" AutoPostBack="True" 
                    DataTextField="class_name" DataValueField="id" OnSelectedIndexChanged="DropDownListBigClass_SelectedIndexChanged">
                </asp:DropDownList>
                <br /> <asp:Button ID="ButtonAddBigClass" runat="server" OnClick="ButtonAddBigClass_Click" Text="增加" />
            </td>
            <td>
                <asp:ListBox ID="ListBoxSmallClass" runat="Server" AutoPostBack="True"
                    DataTextField="class_name" DataValueField="id" SelectionMode="Multiple" >
                </asp:ListBox>
                <br /><asp:Button ID="ButtonAddSmallClass" runat="server" OnClick="ButtonAddSmallClass_Click" Text="增加" />
            </td>
            <td >
                <asp:ListBox ID="ListBoxModuleClass" runat="server" AutoPostBack="True" Height="200px"
                    SelectionMode="Multiple" DataTextField="class_name" DataValueField="id">
                </asp:ListBox>
                <br /> <asp:Button ID="ButtonAddModuleClass" runat="server" OnClick="ButtonAddModuleClass_Click" Text="增加" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList ID="DropDownListSite" runat="server" AutoPostBack="True" DataTextField="site_name"
                    DataValueField="site_id" OnSelectedIndexChanged="DropDownListSite_SelectedIndexChanged" />
            </td>
            <td>
                <asp:DropDownList ID="DropDownListBigClassSelected" runat="server" AutoPostBack="True" DataTextField="class_name" DataValueField="id"  OnSelectedIndexChanged="DropDownListBigClassSelected_SelectedIndexChanged" />
                <br />
                <asp:Button ID="ButtonRemoveBigClass" runat="server" OnClick="ButtonRemoveBigClass_Click" Text="删除" />
            </td>
            <td>
            
                <asp:ListBox ID="ListBoxSmallClassSelected" runat="Server" AutoPostBack="false" SelectionMode="Multiple"
                     DataTextField="class_name" DataValueField="id"></asp:ListBox>
                    <br /> <asp:Button ID="ButtonRemoveSmallClass" runat="server" OnClick="ButtonRemoveSmallClass_Click" Text="删除" />
            </td>
            <td>
                <asp:ListBox ID="ListBoxModuleClassSelected" runat="server" AutoPostBack="false" SelectionMode="Multiple"  Height="200px" 
                    DataTextField="class_name" DataValueField="id"></asp:ListBox>
                  <br />  <asp:Button ID="ButtonRemoveModuleClass" runat="server" OnClick="ButtonRemoveModuleClass_Click" Text="删除" />
            </td>
        </tr>
    </table>
    <table cellspacing="0" cellpadding="0" border="1">
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
