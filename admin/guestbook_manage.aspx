<%@ Page Language="c#" Inherits="com.hujun64.admin.guestbook_manage" CodeFile="guestbook_manage.aspx.cs"
    ValidateRequest="false" %>
<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD html 4.0 Transitional//EN" >
<link href="../css/style.css" rel="stylesheet" rev="stylesheet" type="text/css" />
<html>
<head>
    <title>留言管理</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <meta name="robots" content="noindex,follow"/>
</head>
<body>
    <form id="FormAsk" method="post" runat="server">
    
        <table id="Table1" cellspacing="0" cellpadding="0" width="1100" align="center" border="1">
            
            <tbody>
                <tr>
                    <td colspan="3">
                        <h2>
                            留言管理</h2>
                    </td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td colspan="3">
                        <asp:DataGrid ID="DataGridTitle" runat="server" Width="100%" AutoGenerateColumns="False"
                            DataKeyField="id" OnSelectedIndexChanged="DataGrid1_SelectedIndexChanged" HeaderStyle-Font-Bold="true">
                            <Columns>
                                <asp:BoundColumn  DataField="id" HeaderText="ID" ItemStyle-ForeColor="Blue"></asp:BoundColumn>
                                <asp:BoundColumn DataField="title" HeaderText="标题"></asp:BoundColumn>
                                <asp:BoundColumn DataField="big_class" HeaderText="分类" ItemStyle-Width="80px"></asp:BoundColumn>
                                <asp:BoundColumn DataField="author" HeaderText="咨询者" ItemStyle-Width="100px"></asp:BoundColumn>
                                <asp:BoundColumn DataField="province_from" HeaderText="地域" ItemStyle-Width="150px">
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="sex" HeaderText="性别" ItemStyle-Width="30px"></asp:BoundColumn>
                                <asp:BoundColumn DataField="addtime" HeaderText="咨询时间" DataFormatString="{0:yyyy-MM-dd HH:mm}"
                                    ItemStyle-Width="100px" ItemStyle-Wrap="false"></asp:BoundColumn>
                                <asp:BoundColumn DataField="is_replied" HeaderText="回复" ItemStyle-Width="30px"></asp:BoundColumn>
                                <asp:ButtonColumn Text="选择" HeaderText="查看" CommandName="Select" ItemStyle-Width="30px">
                                </asp:ButtonColumn>
                                <asp:ButtonColumn Text="删除" CommandName="Delete" ItemStyle-Width="30px"></asp:ButtonColumn>
                            </Columns>
                        </asp:DataGrid>
                    </td>
                </tr>
            </tbody>
        </table>
        <br />
        <table align="center" >
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
        <table id="Table2" cellspacing="0" cellpadding="0" width="800" align="left" border="1">
            <tbody>
                <tr>
                    <td colspan="3" style="color: #CC3300; font-weight: bold;">
                        <h2>
                            留言内容</h2>
                    </td>
                </tr>
            </tbody>
             <tbody>
                <tr>
                    <td align="right"  class="guestreply">
                        ID
                    </td>
                    <td>
                        <asp:Label ID="LaebelSelectedId" runat="server" Width="50px" ForeColor="Blue"></asp:Label>
                    </td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td align="right"  class="guestreply">
                        法律业务分类
                    </td>
                    <td>
                        <asp:RadioButtonList ID="bigClassRadioList" DataTextField="class_name" DataValueField="id"  runat="server" AutoPostBack="true" RepeatDirection="Horizontal" />
                    </td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td align="right" class="guestreply">
                        标题
                    </td>
                    <td>
                        <asp:HiddenField ID="guestId" runat="server" />
                        <asp:TextBox ID="guesttitle" runat="server" Width="100%"></asp:TextBox>
                    </td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td align="right"  class="guestreply">
                        <span class="guestreply">咨询者</span>
                    </td>
                    <td>
                        <asp:Label ID="author" runat="server"></asp:Label>
                    </td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td align="right" class="guestreply">
                        <span class="guestreply">性别</span>
                    </td>
                    <td>
                        <asp:Label ID="sex" runat="server"></asp:Label>
                    </td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td align="right"  class="guestreply">
                        联系方式
                    </td>
                    <td>
                        <asp:Label ID="contact" runat="server"></asp:Label>
                    </td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td align="right"  class="guestreply">
                        邮件地址
                    </td>
                    <td>
                        <asp:Label ID="email" runat="server"></asp:Label>
                    </td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td align="right"  class="guestreply">
                        留言时间
                    </td>
                    <td>
                        <asp:Label ID="addtime" runat="server"></asp:Label>
                    </td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td align="right"  class="guestreply">
                        咨询者地域
                    </td>
                    <td>
                        <asp:Label ID="ipProvince" runat="server"></asp:Label>
                    </td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td align="right" height="120"  class="guestreply">
                        内容
                    </td>
                    <td height="120">
                        <asp:TextBox ID="content" runat="server" Width="100%" Height="120" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td align="right"  class="guestreply">
                        <span class="guestreply">关键词汇</span>
                    </td>
                    <td>
                        <asp:TextBox ID="keywords" runat="server" Width="100%" MaxLength="100"></asp:TextBox>
                    </td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td align="right" height="150" class="guestreply">
                        回复
                    </td>
                    <td height="150">
                        <asp:TextBox ID="reply" runat="server" TextMode="MultiLine" Width="100%" Height="150" />
                    </td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td align="right" class="guestreply">
                        回复时间
                    </td>
                    <td>
                        <asp:Label ID="replytime" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td align="right">
                        <asp:Button ID="reply_button" runat="server" Text="提交回复"  ForeColor="Blue"  Font-Bold="true"
                            Font-Size="Medium" OnClick="reply_Click"></asp:Button>
                    </td>
                    <td>
                        <asp:CheckBox ID="email_guest_check" Checked="true" runat="server" />自动邮件通知咨询者
                    </td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                <td align="right" class="guestreply">
                        信息
                    </td>
                    <td >                    
                        <asp:Label ID="MSG" runat="server" ForeColor="Red" Font-Size="Small"></asp:Label>
                    </td>
                </tr>
            </tbody>
        </table>
    
    </form>
</body>


</html>
