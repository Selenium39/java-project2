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
#div1 {
	margin: 30px;
	border: solid 2px;
	background: pink;
}

#div2 {
	padding: 10px;
	font-size: 20px;
}

#caption1 {
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
		for (let i = 0; i < everyPageCount; i++) {//删除
			$("#btn" + voteIds[i] + "-delete").click(function() {
				$(location).attr("href","delete?currentPage="+currentPage+"&id="+voteIds[i]);
			});
		}
		for (let i = 0; i < everyPageCount; i++) {//修改
			$("#btn" + voteIds[i] + "-update").click(function() {
				$(location).attr("href","updateVote.jsp");
			});
		}
		$("#btn3").click(function() {//跳转首页
			$(location).attr("href", "editorVote?currentPage=1");
		});

		$("#btn4").click(
				function() {//跳转上一页
					if (hasPrePage) {
						$(location).attr("href",
								"editorVote?currentPage=" + (currentPage - 1));
					} else {
						alert("没有上一页!!!");
					}
				});

		$("#btn5").click(
				function() {//跳转下一页
					if (hasNextPage) {
						$(location).attr("href",
								"editorVote?currentPage=" + (currentPage + 1));
					} else {
						alert("没有下一页了!!!");
					}
				});

		$("#btn6").click(function() {//跳转尾页
			$(location).attr("href", "editorVote?currentPage=" + totalPage);
		});
	});
</script>

<title>EditorVote</title>
</head>
<body>
	<div id="div1">
		<table class="table">
			<caption id="caption1">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>投票管理
			</caption>
			<thead>
				<tr>
					<th>投票序号</th>
					<th>投票名</th>
					<th>选项一</th>
					<th>选项二</th>
					<th>选项三</th>
					<th>选项四</th>
					<th>选项五</th>
					<th>选项六</th>
					<th>删除</th>
					<th>修改</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${sessionScope.voteResults}" var="voteResult">
					<tr>
						<th scope="row">${voteResult.vote.voteId }</th>
						<td>${voteResult.vote.voteName }</td>
						<%
							int i = 0;
						%>
						<c:forEach items="${voteResult.voteOptions}" var="voteOption">
							<td>${voteOption.voteOptionName }</td>
							<%
								++i;
							%>
						</c:forEach>
						<c:forEach begin="<%=i%>" end="5">
							<td>无</td>
						</c:forEach>
						<td><button type="button" class="btn btn-danger"
								id="btn${voteResult.vote.voteId }-delete">删除</button></td>
						<td><button type="button" class="btn btn-primary"
								id="btn${voteResult.vote.voteId }-update">修改</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
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