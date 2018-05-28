<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Vote</title>
<!--bootstrap  -->
<link href="static/bootstrap.min.css" rel="stylesheet">
<!--鲨鱼游动css  -->
<style>
	body{
		background-color: lightblue;
		overflow:hidden;
	}
	.fishbox{
		width: 200px;
		height: 200px;
		/*background-color: rgba(0,0,0,0.4);*/
		position: absolute;
		left:0;
		top:0;
		animation: run 20s linear infinite;
		animation-direction: normal;
	}
	.fish{
		width: 174px;
		height: 126px;
		position: absolute;
		left:35%;
		top:0;
		background:url(images/fish8.png) no-repeat left top;
		/*transition:all 0.8s steps(8) ;*/
		animation:active1 0.8s steps(8) infinite;

	}
	
	.sharkbox{
		  width: 509px;
		  height: 270px;
		  animation: run2 20s linear infinite;
	}
	.shark{
		width: 509px;
		height: 270px;
		background:url(images/shark1.png) no-repeat;
		animation: active2 1s steps(8) infinite;
	}




	@keyframes active1 {
		0%{

		}
		100%{
			background-position: left -1008px;
		}
	}

	@keyframes active2 {
		0%{

		}
		100%{
			background-position: left -2160px;
		}
	}

	@keyframes run {
		0%{

		}

		15%{
			transform:translate(600px,0px) rotate(45deg) ;
		}

		50%{
			transform:translate(600px,350px) rotate(135deg) ;
		}

		75%{
			transform:translate(50px,300px) rotate(235deg);
		}


		100%{
			transform:translate(0px,0px) rotate(360deg) ;
		}
	}

   @keyframes run2{
		0%{
			transform:translateX(-600px);
		}

		100%{
			transform:translateX(2000px);
		}
   }
</style>

<!-- 自定义css -->
<style type="text/css">
#div1{
   width:500px;
   height:500px;
   margin:auto;
   margin-top:-200px;
   background-color:pink;
}
h2{
  padding-top:20px;
  padding-left:90px;
}
#div2{
  padding-left:110px;
  font-size:20px;
 }
#btn1{
   margin-left:90px;
 }
</style>
<!-- 自定义jquery -->
<script type="text/javascript" src="static/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#btn1").click(function(){
	if($("input[name='voted']:checked").val()==null){
	   alert("未选中任何选项");
	   window.location.reload();
	}else{
		$("form").submit();
	}
	});
	$("#btn2").click(function(){
		window.location.reload();
	});
});
</script>
</head>
<body>
<div class="fishbox">
	<div class="fish"></div>
</div>
<div class="sharkbox">
	 <div class="shark"></div>
</div>
<div id="div1">
<form method="post" action="addTicket?id=${sessionScope.vote.voteId }">
<h2>${sessionScope.vote.voteName}</h2>
<c:forEach items="${sessionScope.voteOptions}" var="voteOption">
  <div class="radio" id="div2">
  <label>
    <input type="radio" name="voted" value="${voteOption.voteOptionId}">
    ${voteOption.voteOptionName}<br/><br/>
  </label>
</div>
</c:forEach>
<button id="btn1" type="button" class="btn btn-success">提交</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<button id="btn2" type="button" class="btn btn-warning">重置</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</form>
</div>
</body>
</html>