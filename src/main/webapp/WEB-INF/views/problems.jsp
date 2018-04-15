<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.gechao.*"%>
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
<title>Problem List</title>
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
					<li class="active"><a href="/oj/problems">Problems</a></li>
					<li><a href="/oj/status">Status</a></li>
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



				<form accept-charset="UTF-8" id="search_form" class="form-inline">
					<span> Search: </span><input id="search" name="search" size="30"
						type="text" value=""> <select id="option" name="option"
						style="margin-left:10px">
						<option value="title">Title</option>
						<option value="pid">ID</option>
						<option value="source">Source</option>
					</select> <input name="commit" type="submit" value="Go"
						style="margin-left:10px">
				</form>

				<table id="problem_list"
					class="table table-bordered table-striped table-hover">
					<thead>
						<tr>
							<th class="header">Flag</th>
							<th class="header">ID</th>
							<th class="header">Title</th>
							<th class="header">Ratio(Solve/Submit)</th>
							<th class="header">OJ</th>
							<th class="header">VPID</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${problemList.list }" var="item">
							<tr>
								<td></td>
								<td>${item.problemId }</td>
								<td><a href="/oj/problem/${item.problemId }">${item.title }</a></td>
								<td>${item.solved/item.submit }%(<a
									href="/status?pid=1&amp;judge=3">${item.solved }</a>/<a
									href="/status?pid=1">${item.submit }</a>)
								</td>
								<td>${item.source }</td>
								<td>1</td>
							</tr>
						</c:forEach>
						<div class="pagination">
							<c:if test="${problemList.hasPreviousPage }">
								<a href="/oj/problems?pn=${problemList.pageNum-1 }"
									class="icon icon-material-arrow-back"></a>
							</c:if>
							&nbsp;

							<c:if test="${pageNum!=1 }">
								<a href="/oj/problems?pn=1">0</a>
							</c:if>

							<c:forEach items="${problemList.navigatepageNums }" var="pageNum">
								<c:if test="${pageNum==problemList.pageNum }">
									<span>${pageNum}</span>
								</c:if>
								<c:if test="${pageNum!=problemList.pageNum }">
									<a href="/oj/problems?pn=${pageNum}">${pageNum}</a>
								</c:if>
							</c:forEach>

							<c:if test="${pageNum!=problemList.pages }">
								<a href="/oj/problems?pn=${problemList.pages }">N</a> &nbsp;
							</c:if>
							<c:if test="${problemList.hasNextPage }">
								<a href="/oj/problems?pn=${problemList.pageNum+1 }"
									class="icon icon-material-arrow-forward"></a>
							</c:if>

						</div>
					</tbody>

				</table>

				<script type="text/javascript">
					$('#search_form').submit(
							function(e) {
								e.preventDefault();
								var value = $('#search').val();
								var key = $('#option').val();
								value = encodeURIComponent(value);
								window.location.href = '/oj/problem?' + key
										+ '=' + value;
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
