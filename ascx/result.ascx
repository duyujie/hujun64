<%@ Control Language="c#" Inherits="com.hujun64.result" CodeFile="result.ascx.cs" %>
<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager" %>

<table  rules="all" cellpadding="0" cellspacing="0" border="1" width="100%"  style="border-collapse: collapse;">
    <tbody>
        <tr>
            <td valign="top">
               
                    <table rules="all" cellpadding="0" cellspacing="0" border="1" width="100%" style="border-collapse: collapse;">
                       
                         
                                <tbody>
                                    <tr>
                                        <td colspan="2">
                                            ���� "<font color= "red"><strong><%=keywords %></strong></font>"������ <font color= "red"><strong><%=resultCount%> </strong></font>�����
                                        </td>
                                    </tr>
                                    <tr><td><br /></td>
                                    </tr>
                                </tbody>
                    <asp:DataList ID="DataListResult" runat="server">
                            <ItemTemplate>
                                <tbody>
                                    <tr>
                                        <td>
                                            <img src="images/bullet.gif" alt="" class="imgNoborder" />
                                        </td>
                                        <td align="left" width="580">
                                            &nbsp; <a href="<%# UtilHtml.ConvertAspxWithHtml(UtilHtml.GetAspxUrl(Eval("id").ToString(),PageType.DYNAMIC_TYPE)) %>"
                                                target = "_blank" title="<%# Eval("title") %>">
                                                <%# Eval("title") %>
                                            </a>
                                        </td>
                                        <td align="right" width="120">
                                            ���ڣ�
                                                <%# ((DateTime)Eval("addtime")).ToString("yyyy-MM-dd")%>
                                        </td>
                                        <td align="left" width="200">
                                            &nbsp; ��Դ��<%# Eval( "news_from")%>
                                        </td>
                                        
                                        
                                    </tr>
                                </tbody>
                            </ItemTemplate>
                        </asp:DataList>
                    </table>
                
            </td>
        </tr>
    </tbody>
</table>
<table align="center" cellspacing="5px">
        <tbody>
            <tr>
                <td>
                    <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                        CurrentPageButtonPosition="Center" CustomInfoHTML="��%CurrentPageIndex%ҳ����%PageCount%ҳ��ÿҳ%PageSize%��"
                        FirstPageText="��ҳ" LastPageText="βҳ" LayoutType="Table" NextPageText="��һҳ" PageIndexBoxType="DropDownList"
                        PagingButtonLayoutType="Span" PrevPageText="��һҳ" ShowCustomInfoSection="Left"
                        SubmitButtonText="Go" TextAfterPageIndexBox="ҳ" TextBeforePageIndexBox="ת��" UrlPaging="true">
                    </webdiyer:AspNetPager>
                </td>
            </tr>
        </tbody>
    </table>