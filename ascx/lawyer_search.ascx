<%@ Control Language="c#" Inherits="com.hujun64.lawyer_search" CodeFile="lawyer_search.ascx.cs" %>
 
<%@ Register TagPrefix="uc1" TagName="guest_ask_top" Src="guest_ask_top.ascx" %>
<div class="DivMyLocation" align="left">
    您的位置：
    <%=myLocation%>
</div>
<div class="DivGuestaskTop" align="left">
    <uc1:guest_ask_top ID="guest_ask_top1" runat="server"></uc1:guest_ask_top>
</div>
<table border="0" width="96%" id="table6" align="right">
    <tbody>
        <tr>
            <td height="18">
            </td>
        </tr>
    </tbody>
    <tbody>
        <tr>
            <td style="line-height: 180%" height="30">
                <p>
                    <li>律师及律所信息查询由上海律师管理平台提供。</li>
                    <li>数据查询的格式如下图所示，本站只提供相关链接，点击进入查询界面。</li>
                    <li>本律师不对数据的完整性及可靠性负责，有问题请直接访问<a href="http://shlg.lawyer.org.cn" title="上海律师管理平台网站"
                        style="color: Blue">上海律师管理平台网站</a>进行查询。 </li>
                </p>
            </td>
        </tr>
    </tbody>
    <tbody>
        <tr>
            <td height="18">
            </td>
        </tr>
    </tbody>
    <tbody>
        <tr>
            <td>
                <iframe name="lawyerSearch_frame" marginwidth="0" marginheight="0" width="100%" height="600"
                    src="<%=Total.AspxUrlOriginalLawyerSearch %>" frameborder="0"></iframe>
            </td>
        </tr>
    </tbody>
</table>
