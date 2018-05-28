<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Vote</title>

<!--bootstrap  -->
<link href="static/bootstrap.min.css" rel="stylesheet">

<!--自定义css  -->
<style type="text/css">
#div1 {
	width: 1000px;
	height: 500px;
	margin: 100px auto;
	border: 2px solid;
}

#span1 {
	color: red;
	font-size: 20px;
}

.divs {
	width: 500px;
	height: 20px;
	margin: 30px auto;
}
</style>

<!--自定义jquery-->
<script type="text/javascript" src="static/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
    var i=1;
    $(function(){
    	$("#btn1").click(function(){
    		++i;
    		if(i>6){
    			alert("最多为6个选项");
    			return 0;
    		}
    		var newDiv=$("<div></div>");//创建div
    		$(newDiv).attr("class","divs");
    		$(newDiv).attr("id","option"+i);
    	    var newLabel=$("<label></label>");//创建label
    	    $(newLabel).text("请输入选项"+i+"名称:");
    	    var newInput=$("<input></input>");//创建input
    	    $(newInput).attr("type","text");
    	    $(newInput).attr("name","voteOptions");
    		$("#option"+(i-1)).after(newDiv);
    		$("#option"+i).append(newLabel);
    		$("#option"+i).append(newInput);	
    	});
       $("#btn3").click(function(){
    	   window.location.reload();
       });
    });
</script>
</head>
<body>
	<form action="addVote" method="post">
		<div id="div1">
			<div id="div2">
				<span class="glyphicon glyphicon-pencil"></span> <span id="span1">新增投票</span>
			</div>
			<div class="divs">
				<label>请输入投票频道:</label> <select name="channel">
					<option value="1">NBA</option>
					<option value="2">CBA</option>
				</select>
			</div>
			<div class="divs">
				<label>请输入投票名称:</label> <input type="text" name="voteName" />
			</div>
			<div class="divs" id="option1">
				<label>请输入选项1名称:</label> <input type="text" name="voteOptions"/>
			</div>
			<div class="divs">
				<button id="btn1" type="button" class="btn btn-success">新增投票选项</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="btn2" type="submit" class="btn btn-warining" type="submit">发布</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="btn3" type="button" class="btn btn-danger">重置</button>
				</div>
		</div>
	</form>
</body>
</html>