<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--bootstrap  -->
<link href="static/bootstrap.min.css" rel="stylesheet">
<!--自定义css  -->
<style type="text/css">
#div2 {
	padding: 10px;
	font-size: 20px;
}

caption {
	color: red;
	font-size: 30px;
}
</style>

<!-- 自定义jquery -->
<script type="text/javascript" src="static/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		var currentPage = ${sessionScope.page.currentPage}//当前页
		var hasNextPage = ${sessionScope.page.hasNextPage}//是否有下一页
		var hasPrePage = ${sessionScope.page.hasPrePage}//是否有上一页
		var totalPage = ${sessionScope.page.totalPage}//总页数
		var totalCount = ${sessionScope.page.totalCount}//总记录   
		var everyPageCount = ${sessionScope.page.everyPageCount}//每页记录数
		var voteIds = ${sessionScope.voteIds}//所有的投票id
		for(let i = 0; i < everyPageCount; i++) {//投票
			$("#btn" + voteIds[i]+"-vote").click(function() {
				$(location).attr("href","vote?id="+voteIds[i]);
			});
		}
		$("#btn3").click(function() {//跳转首页
			$(location).attr("href", "showVote?channelId=1&currentPage=1");
		});

		$("#btn4").click(
				function() {//跳转上一页
					if (hasPrePage) {
						$(location).attr("href",
								"showVote?channelId=1&currentPage=" + (currentPage - 1));
					} else {
						alert("没有上一页!!!");
					}
				});

		$("#btn5").click(
				function() {//跳转下一页
					if (hasNextPage) {
						$(location).attr("href",
								"showVote?channelId=1&currentPage=" + (currentPage + 1));
					} else {
						alert("没有下一页了!!!");
					}
				});

		$("#btn6").click(function() {//跳转尾页
			$(location).attr("href", "showVote?channelId=1&currentPage=" + totalPage);
		});
	});
</script>

<title>EditorVote</title>
</head>
<body>
        <div>
        <table class="table">
     <caption> <span class="glyphicon glyphicon-user" aria-hidden="true"></span>投票</caption>
      <thead>
        <tr>
          <th>投票序号</th>
          <th>投票名</th>
          <th>投票</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${sessionScope.votes}" var="vote">
        <tr>
          <th scope="row">${vote.voteId}</th>
          <td>${vote.voteName}</td>
          <td><button class="btn btn-danger" id="btn${vote.voteId}-vote">投票</button></td>
        </tr>
        </c:forEach>
      </tbody>
    </table>
        </div>
		<div id="div2">
			共有${sessionScope.page.totalCount}条记录,当前第${sessionScope.page.currentPage}/${sessionScope.page.totalPage}页,每页${sessionScope.page.everyPageCount}条记录
			<c:forEach begin="0" end="50">
			&nbsp;
			</c:forEach>
			<button class="btn btn-success" id="btn3">首页</button>
			&nbsp;&nbsp;&nbsp;
			<button class="btn btn-info" id="btn4">上一页</button>
			&nbsp;&nbsp; &nbsp;
			<button class="btn btn-warning" id="btn5">下一页</button>
			&nbsp;&nbsp;&nbsp;
			<button class="btn btn-default" id="btn6">尾页</button>
		</div>
	</div>
</body>
</html>