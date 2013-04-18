<%@ Control Language="c#" Inherits="com.hujun64.list_class" CodeFile="list_class.ascx.cs" %>
<%@ Register TagPrefix="uc1" TagName="guest_ask_top" Src="guest_ask_top.ascx" %>
<div class="DivMyLocation" align="left">
    ����λ�ã�
    <%=myLocation%>
</div>
<script type="text/javascript" src="js/jScroll/jquery.jScroll.js"></script>
<link href="js/jScroll/css.css" rel="stylesheet" type="text/css" media="screen" />
<div class="DivGuestaskTop" align="left">
    <uc1:guest_ask_top ID="guest_ask_top1" runat="server"></uc1:guest_ask_top>
</div>
<div class="DivProfile" align="left" id="divLawyerInfo">
    <ul>
        <li>
            <div class="DivProfile" align="left">
                <div class="DivCertificate" style="margin-left: 50px">
                    ��ʦִҵ֤��&nbsp;&nbsp;<%=Total.Sn%>
                </div>
                <div class="DivProfileText" align="left">
                    <%=Total.Profile %>
                    <div align="right">
                        <a href="<%=Total.AspxUrlIntro %>" class="more" title="���B��ʦ��ϸ����">��ϸ&gt;&gt;</a>
                    </div>
                </div>
                <div class="DivProfileImg" align="center">
                    <a href="<%=Total.AspxUrlIntro %>" target="_blank">
                        <img border="0" src="<%=Total.ImgProfileUrl %>" alt="<%=Total.Title %>" /></a>
                </div>
            </div>
        </li>
        <li>
            <div class="DivProfile" align="left">
                <div class="DivCertificate" style="margin-left: 50px">
                    ��ʦִҵ֤��&nbsp;&nbsp;13101200810636819
                </div>
                <div class="DivProfileText" align="left">
                    &nbsp;&nbsp;������ʦ���Ϻ��ˣ���ҵ�ڻ���������ѧ����ѧѧʿ�����̷�˶ʿ��<font color="blue">ӯ�ƣ��Ϻ�����ʦ�������ϻ�����ʦ�����Ϻ���������ʦ����Ŀ�α���������ˡ��α���ʦ���Ϻ����Ӵ�ѧ��Ƹ��ʦ</font>���Ϻ���ʦЭ���Ա�����С����ҹ���˾������Ч�ƶȵ���״�����顷����������̽���������۱��������������������ϳ��򡷵ȶ�ƪѧ�����ġ�
                    &nbsp;&nbsp;<a href="http://www.360counsel.com" target="_blank" class="more" title="������ʦ��ϸ����">
                        ��ϸ&gt;&gt</a>
                </div>
                <div class="DivProfileImg" align="center">
                    <a href="http://www.360counsel.com" target="_blank">
                        <img border="0" src="images/gk.png" alt="������ʦ" width="100" height="140" /></a>
                </div>
            </div>
        </li>
    </ul>
</div>
<script language="javascript" type="text/javascript">
    $("#divLawyerInfo").jScroll({ speed: 2000, scroll: 1 });
</script>
<div class="DivModuleContainer" align="center">
    <!--�����ѭ����ʼ-->
    <asp:Repeater runat="server" ID="dlCategories">
        <HeaderTemplate>
        </HeaderTemplate>
        <ItemTemplate>
            <div class="DivModuleClass">
                <table class="frameModuleClassTable">
                    <tbody>
                        <tr>
                            <td colspan="4">
                                <div class="nowidthModuleName">
                                    <div class="classModuleName">
                                        <a href="<%# Eval("template_url") %><%#queryStringBigSmallClass %>" target="_blank"
                                            class="module">
                                            <%#Total.ImgModuleTitleUrl%>
                                            <%# Eval("mainClass.class_name") %></a>
                                    </div>
                                    <div style="float: left; margin-top: 6px">
                                        <a href="<%# Eval("template_url") %><%#queryStringBigSmallClass %>" target="_blank"
                                            class="more">����&gt;&gt;</a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                    <asp:Repeater runat="server" ID="RepeaterNoImgNews">
                        <ItemTemplate>
                            <tbody>
                                <tr valign="top">
                                    <td colspan="3">
                                        <div style="margin: 0px; float: left; width: 250px; vertical-align: middle;">
                                            <img src="images/bullet.gif" alt="" class="imgNoborder" />
                                            <a href="<%# Total.AspxUrlShowdetail %>?<%# Total.QueryStringArticleId %>=<%# Eval("id") %>"
                                                title="<%=pageMetaName %>��<%#UtilHtml.RemoveHtmlTag(Eval("title").ToString(),true)%>"
                                                target="_blank">
                                                <%#UtilHtml.NoImgTitleSubstring(Eval("id").ToString(), Eval("title").ToString(), (DateTime)Eval("addtime"))%>
                                            </a>
                                        </div>
                                        <div class="articleDate">
                                            [<%# String.Format("{0:MM}/{1:dd}", Eval( "addtime"), Eval( "addtime"))%>]
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </ItemTemplate>
                    </asp:Repeater>
                    <!-- Ƕ��datalist����-->
                </table>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <!--��������-->
</div>
