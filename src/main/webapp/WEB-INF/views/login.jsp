<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<title>User Sign In</title>
<link href="/oj/static/css/style.css" rel="stylesheet" type="text/css">
<link href="/oj/static/css/bootstrap.css" rel="stylesheet">
<link href="/oj/static/material/css/material.css" rel="stylesheet">



<script src="/oj/static/js/jquery.min.js" type="text/javascript"></script>
<script src="/oj/static/js/action.js" type="text/javascript"></script>
<script type="text/x-mathjax-config">MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}});</script>

<script src="/oj/static/js/md5-min.js"></script>
<script>
	function jsMd5() {
		if ($("input[name=password]").val() != "")
			$("input[name=password]").val(
					hex_md5($("input[name=password]").val()));
	}
</script>

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

				<div class="flash alert alert-warning" id="signin_failed"
					style="display:none;">Incorrect Handle or Password.</div>
				<div class="row">
					<div class="col-lg-6">

						<form accept-charset="UTF-8" class="new_user form-horizontal"
							id="new_user">
							<legend>Sign In</legend>
							<div style="margin:0;padding:0;display:inline">
								<input name="utf8" type="hidden" value="✓">
							</div>

							<div class="form-group">
								<label for="user_handle" class="col-lg-2 control-label">Handle</label>
								<div class="col-lg-10">
									<div class="form-control-wrapper">
										<input type="text" class="form-control empty" id="user_handle"
											name="userId" placeholder="Handle" autofocus=""><span
											class="material-input"></span>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="user_password" class="col-lg-2 control-label">Password</label>
								<div class="col-lg-10">
									<div class="form-control-wrapper">
										<input type="password" class="form-control empty"
											id="user_password" name="password" placeholder="Password"><span
											class="material-input"></span>
									</div>
								</div>
							</div>

							<div class="form-group">
								<div class="col-lg-10 col-lg-offset-5">
									<div class="actions">
										<input class="btn btn-info" name="user_signin" type="submit"
											value="Sign In">
									</div>
								</div>
							</div>
						</form>

					</div>
				</div>
				<script src="/oj/static/js/bootstrap.min.js"></script>
				<script src="/oj/static/material/js/material.min.js"></script>
				<a href="/oj/user/register">Register a new account.</a>

				<script type="text/javascript">
					$('#new_user')
							.submit(
									function(e) {
										jsMd5();
										e.preventDefault();
										$
												.ajax({
													type : 'POST',
													url : '/oj/user/log',
													data : $(this).serialize(),
													error : function() {
														$('#signin_failed')
																.css('display',
																		'block');
													},
													success : function(data) {

														console.log(data)
														if (data == "success") {
															$('#signin_failed')
																	.css(
																			'display',
																			'none');

															if (document.referrer != "") {
																window.location = document.referrer;
															} else {
																window.location = "/";
															}
														} else {
															$('#signin_failed')
																	.css(
																			'display',
																			'block');
														}
													}
												});
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