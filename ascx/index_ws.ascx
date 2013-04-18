<%@ Control Language="c#" Inherits="com.hujun64.index_ws" CodeFile="index_ws.ascx.cs" %>
 
<table align="left" cellpadding="0" cellspacing="0" width="100%">
    <tbody>
        <tr>
            <td class="moduleName" colspan="2">
                <%=Total.ImgModuleTitleUrl%>
                <a href="#" class="module">法律支持工具</a>
            </td>
        </tr>
    </tbody>
    <tbody>
        <tr>
            <td width="5%">
                <img src="images/bullet.gif" alt="" class="imgNoborder" />
            </td>
            <td width="95%">
                <a href="<%= Total.AspxUrlWebService %>?<%=Total.QueryStringAction %>=<%=WebServiceActionType.SEARCH_LAWYER.ToString() %>"
                    title="律师及律师事务所信息查询" target = "_blank" class="navlink">
                    <%=UtilHtml.LeftTitleSubstring("律师及律师事务所信息查询")%></a>
            </td>
        </tr>
    </tbody>
    <tbody>
        <tr>
            <td width="5%">
                <img src="images/bullet.gif" alt="" class="imgNoborder" />
            </td>
            <td width="95%">
                <a href="<%= Total.AspxUrlWebService %>?<%=Total.QueryStringAction %>=<%=WebServiceActionType.SEARCH_IP.ToString() %>"
                    title="IP地址地理位置查询" target = "_blank" class="navlink">
                    <%=UtilHtml.LeftTitleSubstring("地址地理位置查询")%></a>
            </td>
        </tr>
    </tbody>
</table>
