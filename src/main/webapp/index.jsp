<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script src="static/jquery-3.2.1.min.js"
	type="text/javascript"></script>
<title>Index</title>
<!--自定义的jquery-->
<script type="text/javascript">
	$(document).ready(function() {
		$("#btn1").click(function() {//页面跳转
			$(location).attr('href', 'addVote.jsp');
		});
		$("#btn2").click(function() {
			$(location).attr('href', 'editorVote?currentPage=1');
		});
		$("#btn3").click(function() {
			$(location).attr('href', 'showChannel.jsp');
		});
		$("#btn4").click(function() {
			$(location).attr('href', 'seeVote?currentPage=1');
		});
	});
</script>
<!-- Bootstrap -->
<link href="./index/bootstrap.css" rel="stylesheet">
<link href="./index/font-awesome.css" rel="stylesheet">
<link href="./index/bootstrap-theme.css" rel="stylesheet">
<link rel="stylesheet" href="./index/animations.css">

<!-- siimple style -->
<link href="./index/style.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
</head>

<body>

	<div class="cloud floating">
		<img src="./index/cloud.png" alt="Scoop Themes">
	</div>

	<div class="cloud pos1 fliped floating">
		<img src="./index/cloud.png" alt="Scoop Themes">
	</div>

	<div class="cloud pos2 floating">
		<img src="./index/cloud.png" alt="Scoop Themes">
	</div>

	<div class="cloud pos3 fliped floating">
		<img src="./index/cloud.png" alt="Scoop Themes">
	</div>


	<div id="wrapper" style="height: 686px;">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 col-md-12 col-lg-12">
					<img src="./index/logo.png" alt="等一等，马上加载出来" /> <br> <br>
					<button id="btn1" class="btn btn-success">发起投票</button>
					&nbsp;&nbsp;
					<button id="btn2" class="btn btn-warning">管理投票</button>
					&nbsp;&nbsp;
					<button id="btn3" class="btn btn-danger">参与投票</button>
					&nbsp;&nbsp;
					<button id="btn4" class="btn btn-info">查看投票</button>
					<br>
				</div>

				<div class="row">
					<div class="col-lg-6 col-lg-offset-3">
						<p class="copyright">Copyright © 2018 上海电机学院万涛</p>
					</div>
				</div>
			</div>
		</div>
</body>
</html>