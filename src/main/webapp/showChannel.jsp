<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Show channel</title>

<!--bootstrap  -->
<link href="static/bootstrap.min.css" rel="stylesheet">

<!-- 自定义jquery -->
<script type="text/javascript" src="static/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#a1").click(function() {
			$(location).attr("href", "showVote?channelId=1&currentPage=1");
		});

		$("#a2").click(function() {
			$(location).attr("href", "showVote?channelId=2&currentPage=1");
		});

	});
</script>

<!-- 自定义css -->
<style type="text/css">
body {
	background-color: pink;
}

#div1 {
	border: solid 2px;
	border-color: red;
	margin: auto;
	margin-top: 50px;
	width: 500px;
	height: 500px;
	background-image: url("./images/004.jpg");
	width: 500px;
	margin: auto;
}

#div2 {
	margin: auto;
	width: 400px;
	height: 150px;
	background-image: url("./images/12.jpg");
	width: 400px;
}

#div3 {
	margin: auto;
	width: 400px;
	height: 150px;
	background-image: url("./images/13.jpg");
}

h2 {
	padding: 50px;
}

a {
	margin-left: 130px;
	font-size: 50px;
	color: red;
}
</style>
</head>
<body>
	<div id="div1">
		<h2>请选择你要参与投票的频道:</h2>
		<div id="div2">
			<a id="a1">NBA</a>
		</div>
		<div id="div3">
			<a id="a2">CBA</a>
		</div>
	</div>
</body>
</html>