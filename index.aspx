<%@ Page Language="c#" Inherits="com.hujun64.index" CodeFile="index.aspx.cs" CodeFileBaseClass="com.hujun64.PageBase"
    EnableViewState="false" %>

<%@ Register TagPrefix="uc1" TagName="header" Src="ascx/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="topmenu" Src="ascx/dropdown_menu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="search" Src="ascx/search.ascx" %>
<%@ Register TagPrefix="uc1" TagName="index_flzx" Src="ascx/index_flzx.ascx" %>
<%@ Register TagPrefix="uc1" TagName="index_fee" Src="ascx/index_fee.ascx" %>
<%@ Register TagPrefix="uc1" TagName="index_sszz" Src="ascx/index_sszz.ascx" %>
<%@ Register TagPrefix="uc1" TagName="index_pfcs" Src="ascx/index_pfcs.ascx" %>
<%@ Register TagPrefix="uc1" TagName="index_contact" Src="ascx/index_contact.ascx" %>
<%@ Register TagPrefix="uc1" TagName="fzb" Src="ascx/fzb.ascx" %>
<%@ Register TagPrefix="uc1" TagName="link" Src="ascx/link.ascx" %>
<%@ Register TagPrefix="uc1" TagName="track" Src="ascx/track.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<!--head����ʼλ��-->
<head runat="server">
    <uc1:header ID="header" runat="server"></uc1:header>
    <meta name="Keywords" content="<%=Total.Keywords+" "%>" />
    <meta name="Description" content="<%=Total.Description+" "%>" />
    <title>
        <%=  Total.Title +" "%>
    </title>
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="js/jScroll/jquery.jScroll.js"></script>
    <link href="js/jScroll/css.css" rel="stylesheet" type="text/css" media="screen" />
   
</head>
<!--head������--λ��-->
<body>
    <div class="DivContainer">
        <iframe name="frame_header" class="frameHeader" marginwidth="0" marginheight="0"
            src="frame_header.aspx" frameborder="0" scrolling="no"></iframe>
    </div>
    <form id="bodyForm" runat="server">
    <div id="DivContainer" align="center" class="DivContainer">
        <div class="DivLeft">
            <!--��߿�ʼλ��-->
            <div class="DivLeftMenu">
                <iframe name="frame_flzx" marginwidth="0" marginheight="0" width="100%" height="250px"
                    src="frame_flzx.aspx" frameborder="0"></iframe>
            </div>
            <div class="DivLeftMenu">
                <uc1:index_sszz ID="index_sszz" runat="server"></uc1:index_sszz>
            </div>
            <div class="DivLeftMenu">
                <uc1:index_pfcs ID="index_pfcs" runat="server"></uc1:index_pfcs>
            </div>
            <div class="DivLeftMenu">
                <uc1:index_fee ID="index_fee" runat="server"></uc1:index_fee>
            </div>
            <div class="DivLeftMenu">
                <uc1:index_contact ID="index_contact" runat="server"></uc1:index_contact>
            </div>
            <!--���--λ��-->
        </div>
        <div id="DivContent" align="left" class="DivContent">
            <!--��Ҫ���ֿ�ʼλ��-->
            <div class="DivContent" style="margin-bottom: 6px;">
                <!--���������·����ȵ��б� -->
                <div class="DivHalfContent">
                    <div class="nowidthModuleName">
                        <div class="moduleName_Left">
                            <%=Total.ImgModuleTitleUrl%>
                            <a href="listitem.aspx?module_id=<%=hotClassId %>" target="_blank" class="module">
                                <%=hotClassName %></a>
                        </div>
                        <div class="moduleName_Right">
                            <a href="listitem.aspx?module_id=<%=hotClassId %>" target="_blank" class="more">����&gt;&gt;</a>
                        </div>
                    </div>
                    <table cellspacing="0" border="0" class="noframeHotTable">
                        <asp:Repeater ID="hotRepeater" runat="server">
                            <ItemTemplate>
                                <tbody>
                                    <tr>
                                        <td>
                                            <img src="images/bullet.gif" alt="" class="imgNoborder" />
                                        </td>
                                        <td width="230px">
                                            <a href="<%# Total.AspxUrlShowdetail %>?<%# Total.QueryStringArticleId %>=<%# Eval("id") %>"
                                                title="<%#UtilHtml.RemoveHtmlTag(Eval("title").ToString(),true)%>" target="_blank">
                                                <%#UtilHtml.NoImgTitleSubstring(Eval("id").ToString(), Eval("title").ToString(), (DateTime)Eval("addtime"))%>
                                            </a>
                                        </td>
                                        <td>
                                            <div class="articleDate">
                                                [<%# String.Format("{0:MM}/{1:dd}", Eval("addtime"), Eval("addtime"))%>]
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </ItemTemplate>
                        </asp:Repeater>
                        <!-- �����б����-->
                    </table>
                </div>
                <div class="DivHalfContent" id="divLawyerInfo">
                    <div align="center">
                        <img src="<%=Total.ImgWriteGuestbookUrl%>" height="18px" alt="�����ʦ����������ѯ" />
                        <a href="<%= Total.AspxUrlGuestAsk %>" target="_blank" class="nowidthModule" title="�����ʦ����������ѯ">
                            <font color="blue">������ѯ</font> </a>
                    </div>
                    <ul>
                        <li>
                            <table cellpadding="2" cellspacing="2" class="noframeHotTable">
                                <tr>
                                    <td align="center" colspan="2">
                                        <div class="DivCertificate" style="margin-left: 20px">
                                            ��ʦִҵ֤��&nbsp;&nbsp;<%=Total.Sn%>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100px">
                                        <a href="<%=Total.AspxUrlIntro %>" target="_blank">
                                            <img border="0" src="<%=Total.ImgProfileUrl %>" alt="<%=Total.Title %>" /></a>
                                    </td>
                                    <td width="190px" style="line-height: 178%" align="left">
                                        <div class="DivIndexIntro" align="left">
                                            <%=Total.Profile%>
                                            &nbsp;&nbsp; <a href="<%=Total.AspxUrlIntro %>" target="_blank" class="more" title="���B��ʦ��ϸ����">
                                                ��ϸ&gt;&gt</a>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </li>
                        <li>
                            <table cellpadding="2" cellspacing="2" class="noframeHotTable">
                                <tr>
                                    <td align="center" colspan="2">
                                        <div class="DivCertificate" style="margin-left: 20px">
                                            ��ʦִҵ֤��&nbsp;&nbsp;13101200810636819
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100px">
                                        <a href="http://www.360counsel.com" target="_blank">
                                            <img border="0" src="images/gk.png" alt="������ʦ" width="100" height="140" /></a>
                                    </td>
                                    <td width="190px" style="line-height: 178%" align="left">
                                        <div class="DivIndexIntro" align="left">
                                            &nbsp;&nbsp;������ʦ���Ϻ��ˣ���ҵ�ڻ���������ѧ����ѧѧʿ�����̷�˶ʿ��<font color="blue">ӯ�ƣ��Ϻ�����ʦ�������ϻ�����ʦ�����Ϻ���������ʦ����Ŀ�α���������ˡ��α���ʦ���Ϻ����Ӵ�ѧ��Ƹ��ʦ</font>���Ϻ���ʦЭ���Ա�����С����ҹ���˾������Ч�ƶȵ���״�����顷����������̽���������۱��������������������ϳ��򡷵ȶ�ƪѧ�����ġ�
                                            &nbsp;&nbsp;<a href="http://www.360counsel.com" target="_blank" class="more" title="������ʦ��ϸ����">
                                                ��ϸ&gt;&gt</a>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </li>
                    </ul>
                </div>
            </div>
            <script language="javascript" type="text/javascript">
                $("#divLawyerInfo").jScroll({ speed: 2000, scroll: 1 });
            </script>
            <div class="DivModuleContainer" align="center">
                <!--�����ѭ����ʼ-->
                <asp:Repeater runat="server" ID="dlCategories">
                    <ItemTemplate>
                        <div class="DivIndexModuleClass">
                            <table>
                                <tbody>
                                    <tr>
                                        <td colspan="4">
                                            <div class="nowidthModuleName">
                                                <div class="moduleName_Left">
                                                    <a href="<%# Eval("template_url") %>" target="_blank" class="module">
                                                        <%#Total.ImgModuleTitleUrl%>
                                                        <%# Eval("mainClass.class_name")%></a>
                                                </div>
                                                <div class="moduleName_Right">
                                                    <a href="<%# Eval("template_url") %>" target="_blank" class="more">����&gt;&gt;</a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr valign="top">
                                        <td colspan="4" height="80px" style="line-height: 150%">
                                            <div class="imgClassModule">
                                                <img src="<%# Eval("img_url") %>" alt="" width="100px" height="80px" class="imgNoborader" />
                                            </div>
                                            <asp:Repeater runat="server" ID="RepeaterImgNews">
                                                <ItemTemplate>
                                                    <div class="imgArticleTitle">
                                                        <img src="images/bullet.gif" alt="" class="imgNoborder" />
                                                        <a href="<%# Total.AspxUrlShowdetail %>?<%# Total.QueryStringArticleId %>=<%# Eval("id") %>"
                                                            title="<%#UtilHtml.RemoveHtmlTag(Eval("title").ToString(),true)%>" target="_blank">
                                                            <%#UtilHtml.ImgTitleSubstring(Eval("id").ToString(), Eval("title").ToString(), (DateTime)Eval("addtime"))%>
                                                        </a>
                                                    </div>
                                                    <div class="articleDate">
                                                        <span class="mframe-m-date">[<%# String.Format("{0:MM}/{1:dd}", Eval( "addtime"), Eval( "addtime"))%>]
                                                        </span>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </td>
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr valign="top">
                                        <td colspan="4" style="line-height: 150%">
                                            <asp:Repeater runat="server" ID="RepeaterNoImgNews">
                                                <ItemTemplate>
                                                    <div class="noimgArticleTitle">
                                                        <img src="images/bullet.gif" alt="" class="imgNoborder" />
                                                        <a href="<%# Total.AspxUrlShowdetail %>?<%# Total.QueryStringArticleId %>=<%# Eval("id") %>"
                                                            title="<%#Eval("title")%>" target="_blank">
                                                            <%#UtilHtml.NoImgTitleSubstring(Eval("id").ToString(), Eval("title").ToString(), (DateTime)Eval("addtime"))%>
                                                        </a>
                                                    </div>
                                                    <div class="articleDate">
                                                        [<%# String.Format("{0:MM}/{1:dd}", Eval( "addtime"), Eval( "addtime"))%>]
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </td>
                                    </tr>
                                </tbody>
                                <!-- Ƕ��datalist����-->
                            </table>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <!--��������-->
            </div>
        </div>
        <!--��Ҫ���ֽ���λ��-->
    </div>
     </form>
    <div align="center" class="DivFooter">
        <uc1:fzb ID="fzb" runat="server"></uc1:fzb>
    </div>
   
    <div align="center" class="DivFooter">
        <uc1:link ID="link" runat="server"></uc1:link>
    </div>
    <div align="center" class="DivFooter">
        <iframe name="frame_footer" marginwidth="0" marginheight="0" class="frameFooter"
            src="frame_footer.aspx" frameborder="0"></iframe>
    </div>
    <uc1:track ID="track" runat="server"></uc1:track>
</body>
</html>
