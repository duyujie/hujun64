<%@ Page Language="c#" AutoEventWireup="true" Inherits="com.hujun64.admin.add_art"
    CodeFile="add_art.aspx.cs" ValidateRequest="false" %>

<%--<%@ Register TagPrefix="FCKeditorV2" Namespace="FredCK.FCKeditorV2" Assembly="FredCK.FCKeditorV2" %>--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>添加/更新文章</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
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
    <table border="1" align="center" width="100%" cellpadding="0" cellspacing="0" id="Table1">
        <tbody>
            <tr>
                <td width="15%" align="right">
                    选择法律业务分类：
                </td>
                <td>
                    <asp:HiddenField ID="newsId" runat="server"></asp:HiddenField>
                    <asp:DropDownList ID="bigClassList" runat="server" AutoPostBack="True" DataTextField="class_name"
                        DataValueField="id" OnSelectedIndexChanged="bigClassList_SelectedIndexChanged" />
                    <asp:Label ID="ignoreBigClassLabel" runat="server" AutoPostBack="True" Text="忽略" />
                    <asp:CheckBox ID="ignoreBigClass" runat="server" AutoPostBack="True" OnCheckedChanged="ignoreBigClass_SelectedIndexChanged" />
                    &nbsp &nbsp
                    <asp:DropDownList ID="smallClassList" runat="server" DataTextField="class_name" DataValueField="id" />
                    <asp:Label ID="ignoreSmallClassLabel" runat="server" AutoPostBack="True" Text="忽略" />
                    <asp:CheckBox ID="ignoreSmallClass" runat="server" AutoPostBack="True" OnCheckedChanged="ignoreSmallClass_SelectedIndexChanged" />
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td width="15%" align="right">
                    版块分类：
                </td>
                <td>
                    <asp:DropDownList ID="moduleClassList" runat="server" AutoPostBack="True" DataTextField="class_name"
                        DataValueField="id" OnSelectedIndexChanged="moduleClassList_SelectedIndexChanged" />
                    <asp:Label ID="ignoreModuleLabel" runat="server" AutoPostBack="True" Text="忽略" />
                    <asp:CheckBox ID="ignoreModuleClass" runat="server" AutoPostBack="True" OnCheckedChanged="ignoreModule_SelectedIndexChanged" />
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td width="15%" align="right">
                    当前文章ID：
                </td>
                <td>
                    <asp:TextBox ID="TextBoxAticleId" runat="server" Width="100" MaxLength="10" Enabled="false"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="15%" align="right">
                    已有文章ID：
                </td>
                <td>
                    <asp:TextBox ID="RefArticleId" runat="server" Width="100" MaxLength="10" OnTextChanged="RefId_Changed"></asp:TextBox>
                    引用<asp:CheckBox ID="RefCheckBox" runat="server" AutoPostBack="True" OnCheckedChanged="RefCheckBox_Selected" />
                </td>
            </tr>
        </tbody>
     
        <tbody>
            <tr>
                <td width="15%" align="right">
                    标题：
                </td>
                <td>
                    <asp:TextBox ID="arttitle" runat="server" Width="90%" MaxLength="100"></asp:TextBox>
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td width="15%" align="right">
                    作者：
                </td>
                <td>
                    <asp:TextBox ID="author" runat="server" Width="200" MaxLength="100"></asp:TextBox>
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td width="15%" align="right">
                    文章来源：
                </td>
                <td>
                    <asp:TextBox ID="artFrom" runat="server" Width="200" MaxLength="100">本站原创</asp:TextBox>
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td width="15%" align="right">
                    关键词汇：
                </td>
                <td>
                    <asp:TextBox ID="keywords" runat="server" Width="90%" MaxLength="100"></asp:TextBox>
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                 <td width="15%" align="right">
                    上传文件：
                </td>
                <td>
                    <asp:FileUpload ID="imgFile" runat="server" name="imgFile" size="80"/>
                    <asp:Button value="上 传" onclick="UploadFile" runat="server" id="uploadButton" Text="上传"
                        name="uploadButton" />
                    <br />
                    <asp:Label runat="server" id="refImgUrl" name="refImgUrl" size="80" onchange="ReferenceFile" />
                </td>
            </tr>
            <%if (!string.IsNullOrEmpty(uploadImgUrl))
              {%>
            <tr>
                <td width="15%" align="right">
                    图片预览：
                </td>
                <td>
                    <img src="<%=uploadImgUrl%>" alt="" />
                </td>
            </tr>
            <% }%>
            <tr>
                <td width="15%" align="right">
                    内容：
                </td>
                <td>
                 <asp:TextBox ID="ContentEditor" TextMode="MultiLine" runat="server" Rows="30" Columns="100" />
                   <%-- <FCKeditorV2:FCKeditor ID="ContentEditor" runat="server" Width="90%" Height="600px">
                    </FCKeditorV2:FCKeditor>--%>
                </td>
            </tr>
            <tr>
                <td width="15%" align="right">
                    <asp:Button ID="submit_button" runat="server" Text="标准格式发表" ForeColor="Blue" Width="120px"
                        Height="30px" Font-Bold="true" Font-Size="14px" OnClick="submit_Click" />
                </td>
                <td>
                    <asp:Button ID="definedSubmit_button" runat="server" Text="自定义格式发表" ForeColor="Blue"
                        Width="120px" Height="30px" Font-Bold="true" Font-Size="14px" OnClick="definedSubmit_Click" />
                </td>
            </tr>
        </tbody>
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
