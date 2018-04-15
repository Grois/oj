<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.gechao.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="ico" href="/oj/static/favicon.ico"
	mce_href="/oj/static/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="/oj/static/favicon.ico"
	mce_href="/oj/static/favicon.ico" type="image/x-icon">
<title>Welcome to ZJGSU Online Judge</title>
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
						<li class="active"><a href="/oj">Home</a></li>
						<li><a href="/oj/problems">Problems</a></li>
						<li><a href="/oj/status">Status</a></li>
						<li><a href="/oj/rank">Ranklist</a></li>
						<li><a href="/oj/faq">FAQ</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
					
					<%
						if(session.getAttribute("userId")!=null){
						
					%>
 						<li><a href="/oj/user/settings" class="icon icon-material-settings">[<%=session.getAttribute("userId") %>]</a></li>
						<li><a class="user_signout icon icon-material-chevron-right" href="#"><span id="signout">[Sign Out]</span></a></li>
					<%
						}else{
					%>
					
						<li><a class="icon icon-material-account-circle" href="/oj/user/login">[Sign
								In]</a></li>
						<li><a class="icon icon-material-person-add" href="/oj/user/register">[Sign Up]</a></li>
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
				onmouseout="this.start()">这是轮播条。</marquee>
		</center>

		<div id="body">


			<script src="/oj/static/js/jquery.pin.js" type="text/javascript"></script>
			<script type="text/javascript">
				$(".pinned").pin();
			</script>



			<div class="jumbotron">

				<div class="row">

					<h2 class="page-header">News List</h2>


					<table class="table table-hover">
						<thead>
							<tr>
								<th style="align:center">title</th>
								<th style="align:center">time</th>
							</tr>
						</thead>

						<tbody>

							<c:forEach items="${newsList.list }" var="item">
								<tr>
									<td style="width: 80%;padding-left:20px"><a
										href="/oj/news/${item.newsId }">${item.title }</a></td>
									<td><fmt:formatDate value="${item.time }"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>

								</tr>

							</c:forEach>
						</tbody>

					</table>

					<div class="pagination" style="align:center">
						<c:if test="${newsList.hasPreviousPage }">
							<a href="/oj/?pn=${newsList.pageNum-1 }"
								class="icon icon-material-arrow-back"></a>
						</c:if>
						&nbsp; 
						<a href="/oj/?pn=1">0</a>

						<c:forEach items="${newsList.navigatepageNums }" var="pageNum">
							<c:if test="${pageNum==newsList.pageNum }">
								<span>${pageNum}</span>
							</c:if>
							<c:if test="${pageNum!=newsList.pageNum }">
								<a href="/oj/?pn=${pageNum}">${pageNum}</a>
							</c:if>
						</c:forEach>

						<a href="/oj/?pn=${newsList.pages }">N</a> &nbsp;

						<c:if test="${newsList.hasNextPage }">
							<a href="/oj/?pn=${newsList.pageNum+1 }"
								class="icon icon-material-arrow-forward"></a>
						</c:if>

					</div>

				</div>

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