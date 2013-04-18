<%@ Page Language="c#" Inherits="com.hujun64.admin.site_update" CodeFile="site_update.aspx.cs"
    ValidateRequest="false" EnableViewStateMac="false" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>网站更新</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta name="robots" content="noindex,follow" />
</head>
<body>
    <form id="FormSiteUpdate" method="post" runat="server">
    <table border="1" align="center" width="600" cellpadding="0" cellspacing="0" id="TableSiteUpdate">
        <tr>
            <td colspan="2" align="center">
                <br />
                <h3>
                    网站内容更新
                </h3>
                <br />
            </td>
        </tr>
        <tr>
            <td align="left">
                <asp:DropDownList ID="DropDownlistUpdateSite" runat="server" />
                <asp:Button ID="ButtonRefreshSite" runat="server" Text="生成静态页面" ForeColor="Red" OnClick="refreshSite_Click">
                </asp:Button>
            </td>
        </tr>
        <tr>
            <td align="left">
                <asp:Button ID="ButtonRefreshCache" runat="server" Text="刷新网站缓存" ForeColor="Red"
                    OnClick="refreshCache_Click"></asp:Button>
            </td>
        </tr>
        <tr>
            <td align="left">
                <asp:Button ID="ButtonIndexUpdate" runat="server" Text="重建查询索引" ForeColor="Red" OnClick="updateIndex_Click">
                </asp:Button>
            </td>
        </tr>
        <tr>
            <td align="left">
                <asp:Button ID="ButtonSyncMirror" runat="server" Text="同步镜像网站" ForeColor="Red" OnClick="ButtonSyncMirror_Click">
                </asp:Button>
            </td>
        </tr>
        <tr>
            <td align="left">
                <asp:Button ID="ButtonTest" runat="server" Text="功能测试" ForeColor="Red" OnClick="ButtonTest_Click">
                </asp:Button>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="MSG" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <p>
                    说明：<br />
                    <font face="宋体">1. 本功能将会对后台新增或改动的文章内容进行即时更新；</font><br />
                    <font face="宋体">2. 如果涉及的文章较多，需要较长时间等待，请耐心等候；</font><br />
                    <font face="宋体" color="red">3. <b>重新发布网站</b> 会刷新整个网站的内容，需要较长时间等待，请耐心等候；</font>
                </p>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <br />
                <h3>
                    上传文件</h3>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:FileUpload ID="myFile" runat="server" name="myFile" size="80" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <font color="red">服务器目录</font>
                <input type="text" id="destFilepath" runat="server" name="destFilepath" size="75"
                    maxlength="200" value="~\uploads\" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="button" value="上 传" onserverclick="UploadFile" runat="server" id="uploadButton"
                    name="uploadButton" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="MSG_File" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table cellpadding="0" cellspacing="0" border="1">
                    <tr>
                        <td colspan="2">
                            <b>文件资料</b>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            文件名 :
                        </td>
                        <td>
                            <asp:Label ID="fname" Text="" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            文件类型 :
                        </td>
                        <td>
                            <asp:Label ID="fenc" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            文件大小 :(in bytes)
                        </td>
                        <td>
                            <asp:Label ID="fsize" runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <font color="red">客户信息文件路径</font>
                <input type="text" id="ClientFilePath" runat="server" name="ClientFilePath" size="75"
                    maxlength="200" value="~\uploads\client.csv" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button Text="导入客户信息" OnClick="ImportClientInfo" runat="server" ID="ImportClientInfoButton"
                    name="ImportClientInfoButton" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="LabelImport" runat="server"></asp:Label>
            </td>
        </tr>
        <%--<tr>
            <td colspan="2">
            <br />
                 <asp:Button text="生成旧ID的html" onclick="CreateOldHtml" runat="server" id="createOldHtmlButton"
                    name="createOldHtmlButton"  OnClientClick="this.disabled=true;this.form.submit();" UseSubmitBehavior="False"/>
            </td>
        </tr>--%>
    </table>
    </form>
</body>
</html>
