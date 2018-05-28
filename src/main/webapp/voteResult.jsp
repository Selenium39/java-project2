<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<%@ page import="org.jfree.chart.servlet.ServletUtilities,   
                            com.wantao.util.ChartUtil,
                            com.wantao.bean.Vote" %>  
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>  
    <base href="<%=basePath%>">  
      
    <title>Java 图书销量统计</title>  
    <meta http-equiv="pragma" content="no-cache">  
    <meta http-equiv="cache-control" content="no-cache">  
    <meta http-equiv="expires" content="0">      
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">  
    <meta http-equiv="description" content="This is my page">  
    <!--  
    <link rel="stylesheet" type="text/css" href="styles.css">  
    --> 
    <!--bootstrap  -->
<link href="static/bootstrap.min.css" rel="stylesheet"> 
<!--自定义jquery-->
<script type="text/javascript" src="static/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#btn1").click(function(){
		$(location).attr("href","index.jsp");
	});
});
</script>
<style type="text/css">
#div1{
margin-left:450px;
margin-top:100px;
}
#btn1{
 margin-left:160px;
}
</style>
  </head>  
    
  <body>  
  <div id="div1">
    <%  
        Vote vote=(Vote)session.getAttribute("vote");
        String fileName = ServletUtilities.saveChartAsJPEG(ChartUtil.createChart(vote.getVoteId()), 450, 300, session);  
        String graphURL = request.getContextPath() + "/servlet/DisplayChart?filename=" + fileName;  
    %>  
    <img src="<%=graphURL %>" border="1"/> <br/><br/><br/>
    <button type="button" id="btn1" class="btn btn-info">点击我返回首页</button>
    </div> 
  </body>  
</html>  