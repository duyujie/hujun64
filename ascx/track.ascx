<%@ Control Language="C#" AutoEventWireup="true" Inherits="com.hujun64.track" CodeFile="track.ascx.cs" %>


                
<!--本站自定义的访客跟踪代码!-->

<script type="text/javascript" >
    document.write(unescape("%3Cscript src='<%=statUrl %>" + document.referrer
                     + "' type='text/javascript'%3E%3C/script%3E"));

</script>



<!--Google的跟踪代码!-->

<script type="text/javascript">
    var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
    document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>

<script type="text/javascript">
    try {
        var pageTracker = _gat._getTracker("UA-6896754-2");
        pageTracker._trackPageview();
    } catch (err) { }
</script>


<!--CNZZ的跟踪代码!-->
<div class="DivContainer">
   <script type="text/javascript" src="<%=Total.AspxUrlCnzzStat %>" language="JavaScript"
                charset="gb2312"></script>
</div>

