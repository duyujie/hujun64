<%@ Control Language="c#" Inherits="com.hujun64.index_flzx" CodeFile="index_flzx.ascx.cs" %>
  <%@ Register TagPrefix="uc1" TagName="guest_ask_top" Src="guest_ask_top.ascx" %>
<table align="left" cellpadding="0" cellspacing="0" class="frameIndexFlzxTable">
    <tbody>
        <tr >
            <td class="moduleName" colspan="2">
                <%=Total.ImgModuleTitleUrl%>
                <a href="<%=moreUrl %>" target = "_blank" class="module">
                    <%=moduleName%></a>                
            </td>
             
        </tr>
    </tbody>
    <asp:Repeater ID="RepeaterIndexFlzx" runat="server" >
        <ItemTemplate>
            <tbody>
                <tr >
                    <td width="5%">
                        <img src="images/bullet.gif" alt="" class="imgNoborder" />
                    </td>
                    <td width="95%">
                        <a href="<%# Total.AspxUrlGuestbook %>?<%# Total.QueryStringGuestbookId %>=<%#Eval( "id")%>" title="<%#UtilHtml.RemoveHtmlTag(Eval("title").ToString(),false)+"\n"+UtilHtml.RemoveHtmlTag(Eval("content").ToString(),true)%>"
                            target = "_blank" class="navlink">
                            <%# UtilHtml.LeftTitleSubstring(Eval("id").ToString(),Eval( "title").ToString()+" - "+Eval("content").ToString(), (DateTime)Eval("addtime"))%></a>
                    </td>
                </tr>
            </tbody>
        </ItemTemplate>
    </asp:Repeater>
    <tbody>
        <tr>        
            <td width="100%" align="right" colspan="2">
            <img src="<%=Total.ImgWriteGuestbookUrl%>" height="18px"  alt="向胡律师进行留言咨询"/>
                <a href="<%= Total.AspxUrlGuestAsk %>" target = "_blank" class="nowidthModule" title="向胡律师进行留言咨询">
                 <font color="blue">留言咨询</font>  </a>
                    <a href="<%=moreUrl %>"  title="<%="更多"+moduleName %>" target = "_blank" class="more">更多&gt;&gt;</a>
            </td>
        </tr>
    </tbody>
</table>
