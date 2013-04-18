<%@ Control Language="c#" Inherits="com.hujun64.ip_search" CodeFile="ip_search.ascx.cs" %>
 
<%@ Register TagPrefix="uc1" TagName="guest_ask_top" Src="guest_ask_top.ascx" %>
<div class="DivMyLocation" align="left">
    您的位置：
    <%=myLocation%>
</div>
<div class="DivGuestaskTop" align="left">
    <uc1:guest_ask_top ID="guest_ask_top1" runat="server"></uc1:guest_ask_top>
</div>
<table width="90%" align="center">
    <tbody>
        <tr>
            <td style="line-height: 150%">
                您的IP：<%=Request.UserHostAddress+" "+InternetWebService.GetCountryCityByIp(Request.UserHostAddress) %>
                <br />
            </td>
        </tr>
    </tbody>
</table>
<table width="90%">
    <tbody>
        <tr>
            <td style="line-height: 180%" width="100%" height="25" colspan="2">
                <table border="0" width="98%" cellspacing="0" cellpadding="0" id="table7" align="center">
                    <tr>
                        <td bgcolor="#D0E1DE" height="1">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </tbody>
    <tbody>
        <tr>
            <td style="line-height: 180%" colspan="2">
                <table width="96%" align="center">
                    <tbody>
                        <tr>
                            <td style="line-height: 150%" height="60">
                                <b>IP查询</b><br />
                            </td>
                        </tr>
                    </tbody>
                    <tbody>
                        <tr>
                            <td width="344" style="width: 344px">
                                <asp:TextBox ID="ip" runat="server" Width="100px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="valid1" runat="server" ControlToValidate="ip" Display="dynamic"
                                    SetFocusOnError="true">IP不能为空</asp:RequiredFieldValidator>
                                <br />
                                <asp:Button ID="search_submit" runat="server" Text="开始查询" OnClick="submit_Click"
                                    OnClientClick="this.disabled=true;this.form.submit();" UseSubmitBehavior="False">
                                </asp:Button>
                                <br />
                            </td>
                        </tr>
                    </tbody>
                    <tbody>
                        <tr>
                            <td>
                                <asp:Label ID="ipProvinceLable" runat="server" Width="100px"></asp:Label>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </tbody>
</table>
