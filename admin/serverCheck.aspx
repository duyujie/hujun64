<%@ Page Language="c#" Inherits="com.hujun64.admin.serverCheck" CodeFile="serverCheck.aspx.cs"
 ValidateRequest="false" EnableViewStateMac="false" %>


<html>
<head>
    <title>后台管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <meta name="robots" content="noindex,follow"/>
    <style type="text/css">
        </style>
</head>
<body topmargin="0">
    <div align="center">
        <form id="Form1" runat="server">
        <table width="760" border="0" cellpadding="1" cellspacing="1" style="border-color: Black;
            border-width: 1px; border-style: solid; font-family: Verdana; border-collapse: collapse;">
            <tbody>
                <tr>
                    <td width="40%" bgcolor="#699326">
                        <div align="center" class="jjy">
                            <font color="#FFFFFF">.NET 服务器相关信息</font></div>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td colspan="2">
                        <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000"
                            style="border-color: Black; border-width: 1px; border-style: solid; font-family: Verdana;
                            border-collapse: collapse;">
                            <tbody>
                                <tr>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">服务器名称：</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">
                                            <asp:Label ID="servername" runat="server" />
                                        </font>
                                    </td>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">服务器操作系统：</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">
                                            <asp:Label ID="serverms" runat="server" />
                                        </font>
                                    </td>
                                </tr>
                            </tbody>
                            <tbody>
                                <tr>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">服务器IP地址：</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">
                                            <asp:Label ID="serverip" runat="server" />
                                        </font>
                                    </td>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">服务器域名：</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">
                                            <asp:Label ID="server_name" runat="server" />
                                        </font>
                                    </td>
                                </tr>
                            </tbody>
                            <tbody>
                                <tr>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">服务器IIS版本：</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">
                                            <asp:Label ID="serversoft" runat="server" />
                                        </font>
                                    </td>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">.NET解释引擎版本：</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">
                                            <asp:Label ID="servernet" runat="server" />
                                        </font>
                                    </td>
                                </tr>
                            </tbody>
                            <tbody>
                                <tr>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">HTTPS：</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">
                                            <asp:Label ID="serverhttps" runat="server" />
                                        </font>
                                    </td>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">HTTP访问端口：</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">
                                            <asp:Label ID="serverport" runat="server" />
                                        </font>
                                    </td>
                                </tr>
                            </tbody>
                            <tbody>
                                <tr>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">服务端脚本执行超时：</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">
                                            <asp:Label ID="serverout" runat="server" />
                                            秒</font>
                                    </td>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">服务器现在时间：</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">
                                            <asp:Label ID="servertime" runat="server" />
                                        </font>
                                    </td>
                                </tr>
                            </tbody>
                            <tbody>
                                <tr>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">虚拟目录绝对路径：</font>
                                    </td>
                                    <td colspan="3">
                                        <font size="2">
                                            <asp:Label ID="serverppath" runat="server" />
                                        </font><font size="2">&nbsp; </font>
                                    </td>
                                </tr>
                            </tbody>
                            <tbody>
                                <tr>
                                    <td bgcolor="#e2f3c0">
                                        <font size="2">执行文件绝对路径：</font>
                                    </td>
                                    <td colspan="3">
                                        <font size="2">
                                            <asp:Label ID="servernpath" runat="server" />
                                        </font>
                                    </td>
                                </tr>
                            </tbody>
                            <tbody>
                                <tr>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">虚拟目录Session总数：</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">
                                            <asp:Label ID="servers" runat="server" />
                                        </font>
                                    </td>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">虚拟目录Application总数：</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">
                                            <asp:Label ID="servera" runat="server" />
                                        </font>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td width="260" bgcolor="#699326">
                        <div align="center" class="jjy">
                            <font color="#FFFFFF">常见组件支持情况</font></div>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td colspan="2">
                        <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000"
                            style="border-color: Black; border-width: 1px; border-style: solid; font-family: Verdana;
                            border-collapse: collapse;">
                            <tbody>
                                <tr>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">Access数据库：</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">
                                            <asp:Label ID="serveraccess" runat="server" />
                                        </font>
                                    </td>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">FSO：</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">
                                            <asp:Label ID="serverfso" runat="server" />
                                        </font>
                                    </td>
                                </tr>
                            </tbody>
                            <tbody>
                                <tr>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">CDONTS邮件发送：</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">
                                            <asp:Label ID="servercdonts" runat="server" />
                                        </font>
                                    </td>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">JMail邮件收发：</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">
                                            <asp:Label ID="jmail" runat="server"></asp:Label>
                                        </font>
                                    </td>
                                </tr>
                            </tbody>
                            <tbody>
                                <tr>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">ASPemail发信：</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">
                                            <asp:Label ID="aspemail" runat="server"></asp:Label>
                                        </font>
                                    </td>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">Geocel发信：</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">
                                            <asp:Label ID="geocel" runat="server"></asp:Label>
                                        </font>
                                    </td>
                                </tr>
                            </tbody>
                            <tbody>
                                <tr>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">SmtpMail发信：</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">
                                            <asp:Label ID="smtpmail" runat="server"></asp:Label>
                                        </font>
                                    </td>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">ASPUpload文件上传:</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">
                                            <asp:Label ID="aspup" runat="server"></asp:Label>
                                        </font>
                                    </td>
                                </tr>
                            </tbody>
                            <tbody>
                                <tr>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">ASPCN文件上传：</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">
                                            <asp:Label ID="aspcnup" runat="server"></asp:Label>
                                        </font>
                                    </td>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">刘云峰的文件上传组件:</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">
                                            <asp:Label ID="lyfup" runat="server"></asp:Label>
                                        </font>
                                    </td>
                                </tr>
                            </tbody>
                            <tbody>
                                <tr>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">SoftArtisans文件管理:</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">
                                            <asp:Label ID="soft" runat="server"></asp:Label>
                                        </font>
                                    </td>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">Dimac文件上传:</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">
                                            <asp:Label ID="dimac" runat="server"></asp:Label>
                                        </font>
                                    </td>
                                </tr>
                            </tbody>
                            <tbody>
                                <tr>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">Dimac的图像读写组件:</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">
                                            <asp:Label ID="dimacimage" runat="server"></asp:Label>
                                        </font>
                                    </td>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">自定义组件查询：</font>
                                    </td>
                                    <td width="30%">
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="72%">
                                                    <font size="2">
                                                        <asp:TextBox ID="zujian" Rows="1" runat="server" TextMode="SingleLine" Style="border-style: solid;
                                                            border-color: black; border-width: 1px" />
                                                    </font>
                                                </td>
                                                <td width="28%">
                                                    <font size="2">
                                                        <asp:Button ID="ckzu" runat="server" Text="检测" OnClick="chkzujian" Style="background-color: #75c1ff;
                                                            border-color: black; border-width: 1px" />
                                                    </font>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                            <tbody>
                                <tr>
                                    <td colspan="4">
                                        <font size="2">请正确输入你要检测的组件的ProgId或ClassId。<br />
                                            <font color="#FF0000">
                                                <asp:Label ID="l001" runat="server" />
                                            </font></font>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td width="260" bgcolor="#699326">
                        <div align="center" class="jjy">
                            <font color="#FFFFFF">浏览者相关信息</font></div>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td colspan="2">
                        <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000"
                            style="border-color: Black; border-width: 1px; border-style: solid; font-family: Verdana;
                            border-collapse: collapse;">
                            <tbody>
                                <tr>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">浏览者ip地址：</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">
                                            <asp:Label ID="cip" runat="server"></asp:Label>
                                        </font>
                                    </td>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">浏览者操作系统：</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">
                                            <asp:Label ID="ms" runat="server" /></font>
                                    </td>
                                </tr>
                            </tbody>
                            <tbody>
                                <tr>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">浏览器：</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">
                                            <asp:Label ID="ie" runat="server" /></font>
                                    </td>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">浏览器版本：</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">
                                            <asp:Label ID="vi" runat="server" /></font>
                                    </td>
                                </tr>
                            </tbody>
                            <tbody>
                                <tr>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">JavaScript:</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">
                                            <asp:Label ID="javas" runat="server" /></font>
                                    </td>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">VBScript:</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">
                                            <asp:Label ID="vbs" runat="server" /></font>
                                    </td>
                                </tr>
                            </tbody>
                            <tbody>
                                <tr>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">JavaApplets:</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">
                                            <asp:Label ID="javaa" runat="server" /></font>
                                    </td>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">Cookies:</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">
                                            <asp:Label ID="cookies" runat="server" /></font>
                                    </td>
                                </tr>
                            </tbody>
                            <tbody>
                                <tr>
                                    <td bgcolor="#e2f3c0">
                                        <font size="2">语言：</font>
                                    </td>
                                    <td>
                                        <font size="2">
                                            <asp:Label ID="cl" runat="server"></asp:Label>
                                        </font>
                                    </td>
                                    <td bgcolor="#e2f3c0">
                                        <font size="2">Frames（分栏）:</font>
                                    </td>
                                    <td>
                                        <font size="2">
                                            <asp:Label ID="frames" runat="server" /></font>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td width="260" bgcolor="#699326">
                        <div align="center" class="jjy">
                            <font color="#FFFFFF">执行效率相关情况</font></div>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td colspan="2">
                        <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="Black"
                            rules="all" class="ty" style="border-color: Black; border-width: 1px; border-style: solid;
                            font-family: Verdana; border-collapse: collapse;">
                            <tbody>
                                <tr>
                                    <td width="20%" bgcolor="#e2f3c0">
                                        <font size="2">本页执行时间：</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">
                                            <asp:Label ID="runtime" runat="server" />
                                            毫秒</font>
                                    </td>
                                    <td width="20%" height="21" bgcolor="#e2f3c0">
                                        <font size="2">1000万次加法循环测试：</font>
                                    </td>
                                    <td width="30%">
                                        <font size="2">&nbsp;<asp:Button ID="for1000" runat="server" OnClick="turn_chk" Text="测试"
                                            Style="background-color: #75c1ff; border-color: black; border-width: 1px" />
                                            <asp:Label ID="l1000" runat="server"></asp:Label>
                                        </font>
                                    </td>
                                </tr>
                            </tbody>
                           
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
        </form>
    </div>
</body>
</html>


