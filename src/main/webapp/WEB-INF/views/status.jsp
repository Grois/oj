<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.gechao.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="ico" href="/oj/static/favicon.ico"
	mce_href="/oj/static/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="/oj/static/favicon.ico"
	mce_href="/oj/static/favicon.ico" type="image/x-icon">
<title>Status List</title>
<link href="/oj/static/css/style.css" rel="stylesheet" type="text/css">
<link href="/oj/static/css/bootstrap.css" rel="stylesheet">
<link href="/oj/static/material/css/material.css" rel="stylesheet">



<script src="/oj/static/js/jquery.min.js" type="text/javascript"></script>
<script src="/oj/static/js/action.js" type="text/javascript"></script>
<script type="text/x-mathjax-config">MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}});</script>



</head>

<body style="">
	<div class="container">

		<div id="logo" class="lfloat">
			<a href="/"><img alt="Logo" src="/oj/static/img/logo.png"></a>
		</div>
		<hr>
		<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">

			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="/oj">Home</a></li>
					<li><a href="/oj/problems">Problems</a></li>
					<li class="active"><a href="/oj/status">Status</a></li>
					<li><a href="/oj/rank">Ranklist</a></li>
					<li><a href="/oj/faq">FAQ</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">

					<%
						if (session.getAttribute("userId") != null) {
					%>
					<li><a href="/oj/user/settings"
						class="icon icon-material-settings">[<%=session.getAttribute("userId")%>]
					</a></li>
					<li><a class="user_signout icon icon-material-chevron-right"
						href="#"><span id="signout">[Sign Out]</span></a></li>
					<%
						} else {
					%>

					<li><a class="icon icon-material-account-circle"
						href="/oj/user/login">[Sign In]</a></li>
					<li><a class="icon icon-material-person-add"
						href="/oj/user/register">[Sign Up]</a></li>
					<%
						}
					%>

				</ul>
			</div>
		</div>
		</nav>

		<center>
			<marquee style="width:60%;height:30px" scrollamount="2"
				direction="left" scrolldelay="30" onmouseover="this.stop()"
				onmouseout="this.start()">新生赛题解已经更新，同时为大家开设了新生赛的补题。</marquee>
		</center>

		<div id="body">


			<script src="/oj/static/js/jquery.pin.js" type="text/javascript"></script>
			<script type="text/javascript">
				$(".pinned").pin();
			</script>

			<div class="jumbotron">

				<meta http-equiv="refresh" content="30">

				<form accept-charset="UTF-8" id="search_form" class="form-inline">
					<span> User: </span><input id="search_uid" name="search_uid"
						size="20" type="text" value=""> <span
						style="margin-left:10px">Problem: </span><input id="search_pid"
						name="search_pid" size="10" type="text" value=""> <span
						style="margin-left:10px">Result: </span> <select id="search_judge"
						name="search_judge">
						<option value="0">All</option>
						<option value="1">Pending</option>
						<option value="2">Running &amp;Judging</option>
						<option value="3">Compile Error</option>
						<option value="4">Accepted</option>
						<option value="5">Runtime Error</option>
						<option value="6">Wrong Answer</option>
						<option value="7">Time Limit Exceeded</option>
						<option value="8">Memory Limit Exceeded</option>
						<option value="9">Output Limit Exceeded</option>
						<option value="10">Presentation Error</option>
						<option value="11">System Error</option>
					</select> <span style="margin-left:10px">Language: </span> <select
						id="search_language" name="search_language">
						<option value="0">All</option>
						<option value="1">C</option>
						<option value="2">C++</option>
						<option value="3">Java</option>
						<option value="3">Python</option>
						<option value="3">C#</option>
						<option value="3">Bash</option>
						<option value="3">Pascal</option>
					</select> <input name="commit" type="submit" value="Go"
						style="margin-left:10px">
				</form>

				<!-- 分页条 -->
				<div class="pagination" style="align:center">
					<c:if test="${solutionList.hasPreviousPage }">
						<a href="/oj/status?pn=${solutionList.pageNum-1 }"
							class="icon icon-material-arrow-back"></a>
					</c:if>
					&nbsp; <a href="/oj/status?pn=1">0</a>

					<c:forEach items="${solutionList.navigatepageNums }" var="pageNum">
						<c:if test="${pageNum==solutionList.pageNum }">
							<span>${pageNum}</span>
						</c:if>
						<c:if test="${pageNum!=solutionList.pageNum }">
							<a href="/oj/status?pn=${pageNum}">${pageNum}</a>
						</c:if>
					</c:forEach>

					<a href="/oj/status?pn=${solutionList.pages }">N</a> &nbsp;

					<c:if test="${solutionList.hasNextPage }">
						<a href="/oj/status?pn=${solutionList.pageNum+1 }"
							class="icon icon-material-arrow-forward"></a>
					</c:if>

				</div>



				<div class="table-responsive">
					<table id="contest_list" class="table table-striped table-hover">
						<thead>
							<tr>
								<th class="header">Run ID</th>
								<th class="header">User</th>
								<th class="header">Problem</th>
								<th class="header">Result</th>
								<th class="header">Time</th>
								<th class="header">Memory</th>
								<th class="header">Language</th>
								<th class="header">Code Length</th>
								<th class="header">Submit Time</th>
							</tr>
						</thead>
						<tbody>


							<c:forEach items="${solutionList.list }" var="item">
								<tr>
									<td>${item.solutionId }</td>
									<td><a href="/users/1612180330">${item.userId }</a></td>
									<td><a href="/oj/problem/31">${item.problemId }</a></td>
									<td><span class="submitRes-3" disabled="disabled">Accepted</span></td>
									<td>${item.time }MS</td>
									<td>${item.memory }KB</td>
									<td>${item.language }<a href="/status/code?sid=22042">[view]</a></td>
									<td>${item.codeLength }B</td>
									<td><fmt:formatDate value="${item.judgetime }"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
				<script type="text/javascript">
					$('#search_form').submit(function(e) {
						e.preventDefault();
						var uid = $('#search_uid').val();
						var pid = $('#search_pid').val();
						var judge = $('#search_judge').val();
						var language = $('#search_language').val();
						var url = '/status?';
						if (uid != '')
							url += 'uid=' + uid + "&";
						if (pid != '')
							url += 'pid=' + pid + "&";
						if (judge > 0) {
							judge = judge - 1;
							url += 'judge=' + judge + "&";
						}
						if (language > 0)
							url += 'language=' + language + "&";
						window.location.href = url;
					});
				</script>

			</div>
			<div id="pageFooter" class="center">
				<hr class="nomarginbottom">
				<div id="footerContainer">
					<center>
						<div class="center">
							ZJGSU Online Judge Version 15.09.24 @ <a
								href="https://github.com/ZJGSU-Open-Source/GoOnlineJudge"
								target="_blank">Github</a>
						</div>
					</center>
					<center>
						<div class="center">Copyright © 2013-2015 ZJGSU ACM Club</div>
					</center>
					<center>
						<div class="center">
							Developer: <a href="https://github.com/memelee" target="_blank">@memelee</a>
							<a href="https://github.com/sakeven" target="_blank">@sakeven</a>
							<a href="https://github.com/JinweiClarkChao" target="_blank">@JinweiClarkChao</a>
							<a href="https://github.com/rex-zsd" target="_blank">@rex-zsd</a>
						</div>
					</center>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$('.user_signout').on('click', function(e) {
				e.preventDefault();
				$.ajax({
					type : 'DELETE',
					url : '/oj/user/signout',
					data : $(this).serialize(),
					error : function() {
						alert('Sign Out Failed.');
					},
					success : function() {
						window.location.href = '/oj/user/login';
					}
				});
			});
		</script>

		<script src="/oj/static/js/jquery.min.js"></script>

		<script src="/oj/static/js/bootstrap.min.js"></script>



	</div>
</body>
</html>
