<%@ Page Language="c#" Inherits="com.hujun64.error" CodeFile="error.aspx.cs"  EnableViewState="false"%>
<%@ Register TagPrefix="uc1" TagName="topmenu" Src="ascx/dropdown_menu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="ascx/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="track" Src="ascx/track.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<!--head区开始位置-->
<head  runat="server">
<uc1:header ID="Head1" runat="server"></uc1:header>

<title>
   错误信息
</title>
</head>
<!--head区结束--位置-->

<body>
     <div class="DivContainer">
        <iframe name="frame_header" class="frameHeader" marginwidth="0" marginheight="0"
            src="frame_header.aspx"  frameborder="0" scrolling="no">
        </iframe>
    </div>
<form id="bodyForm" runat="server">
     
     <table cellpadding="0" cellspacing="0" class="twidth" align="center">
   <tr height="500px" valign="top"><td>
         
                     <font face="宋体" color="#cc3300"><asp:Label ID="Label1" Style="z-index: 101; "
                        runat="server"></asp:Label></font>
         
    <p/>
     </td>
        </tr>
    </table>
     </form>
       
    <div align="center" class="DivFooter">
         <iframe name="frame_footer" marginwidth="0" marginheight="0" class="frameFooter" src="frame_footer.aspx"
            frameborder="0"></iframe>
    </div>
    <uc1:track ID="track" runat="server"></uc1:track>
</body>
</html>
