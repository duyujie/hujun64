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
                                            搜索 "<font color= "red"><strong><%=keywords %></strong></font>"，共有 <font color= "red"><strong><%=resultCount%> </strong></font>条结果
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
                                            日期：
                                                <%# ((DateTime)Eval("addtime")).ToString("yyyy-MM-dd")%>
                                        </td>
                                        <td align="left" width="200">
                                            &nbsp; 来源：<%# Eval( "news_from")%>
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
                        CurrentPageButtonPosition="Center" CustomInfoHTML="第%CurrentPageIndex%页，共%PageCount%页，每页%PageSize%条"
                        FirstPageText="首页" LastPageText="尾页" LayoutType="Table" NextPageText="下一页" PageIndexBoxType="DropDownList"
                        PagingButtonLayoutType="Span" PrevPageText="上一页" ShowCustomInfoSection="Left"
                        SubmitButtonText="Go" TextAfterPageIndexBox="页" TextBeforePageIndexBox="转到" UrlPaging="true">
                    </webdiyer:AspNetPager>
                </td>
            </tr>
        </tbody>
    </table>