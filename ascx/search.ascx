<%@ Control Language="c#" Inherits="com.hujun64.search" CodeFile="search.ascx.cs" %>

<div>
            <img src="images/search_add1.gif"  />�ؼ��֣�
            <input type="text" id="txtwords" maxlength="30" style="width: 200px; height: 20px"
                onkeydown="TabSearch();" />
           
            <input id="btnSearch" type="button" onclick='go("<%=appPath %>");' value="վ������ " style="border-style: outset;
                height: 20px;width:80px" />
</div>
