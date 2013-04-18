<%@ Control Language="c#" Inherits="com.hujun64.header_frame" CodeFile="header_frame.ascx.cs" %>
<%@ OutputCache Duration="300" VaryByParam="none" Shared="True" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <link href="css/style.css" rel="stylesheet" rev="stylesheet" type="text/css" />
    <script type="text/javascript" language="JavaScript" src="js/common.js"></script>
</head>
<body>
    <div class="DivContainer">
        <div class="DivLeft">
            <div class="standPhotoTop">
                <img src="images/profile_stand_top.gif" alt="" class="imgStandTop" />
            </div>
            <div class="standPhotoBottom">
                <img src="images/profile_stand_bottom.gif" alt="" class="imgStandBottom" />
            </div>
        </div>
        <div class="DivContent">
            <div class="DivContent" style="height: 110px; margin-top: 20px;">
                <div class="DivLogo">
                    <img src="images/logo.jpg" alt="" width="90" height="80" border="0" />
                    <img src="<%=Total.Logo%>" alt="<%=Total.SiteName %>" width="260" height="80" border="0" />
                </div>
                <div class="DivLogoRight">
                    <div class="DivLogoRight">
                        <div align="right" class="DivFreeAsk">
                            电话咨询
                        </div>
                        <div align="right" class="DivTel">
                            <b>
                            <%=Total.Tel%> <br />
                                <%=Total.Mobile%>
                            </b>
                        </div>
                    </div>
                    <div class="DivLogoRight">
                        <div align="right" class="DivOffice">
                            办公地址<br />
                        </div>
                        <div align="right" class="DivAddress">
                            <%=Total.AddressWorkday %>
                            <%=UtilHtml.BuildHref(Total.AspxUrlIntro + "?" + Total.QueryStringIntroId + "=" + contactIdWorkday, UtilHtml.GetFullImageUrl("images/showmap.gif", "查看详细地图路线", "70", "26"), "查看详细地图路线", true)%>
                        </div>
                    </div>
                </div>
            </div>
            <div class="DivContent" style="height: 120px;">
                <div class="DivHeaderFlash">
                    <img src="images/top.gif" height="120px" width="450px" alt="" />
                </div>
                <div class="DivHeaderMenu">
                    <table class="headMenuTable">
                        <tbody>
                            <tr>
                                <asp:Repeater ID="navigateMenuDataList" runat="server">
                                    <ItemTemplate>
                                        <td style="padding-top: 6px;">
                                            <b>
                                                <img src="images/plus2.gif" alt="" width="7" height="7" />
                                                <a href="<%# Eval("template_url") %>" title="<%# Eval("mainClass.class_name") %>"
                                                    target='_top'><span class="navigateMenu">
                                                        <%# Eval("mainClass.class_name")%></span> </a></b>
                                        </td>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>