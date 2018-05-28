<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add ticket</title>
<!-- 自定义css -->
<style type="text/css">
body{
 background-color:pink;
}
#div1{
  margin:auto;
  border:solid 2px red;
  width:400px;
  height:400px;
  background-image: url("images/004.jpg");
}
#div2{
  margin-top:300px;
  margin-left:20px;
}

</style>
</head>
<body>
<div id="div1">
<h1 align="center">Success add the ticket!!!</h1>
<div id="div2">
<a id="a1" href="voteResult?id=${sessionScope.vote.voteId}">查看投票</a>
<c:forEach begin="0" end="20">
&nbsp;
</c:forEach>
<a id="a2" href="index.jsp">返回首页</a>
</div>
</div>
</body>
</html>