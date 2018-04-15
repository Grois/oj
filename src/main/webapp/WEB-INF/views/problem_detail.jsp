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
<title>Problem — 1</title>
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




				<h1 style="text-align: center" class="page-header">${problem.title}</h1>
				<div id="problemInfo" class="rfloat" title="Problem Information">
					<div class="limit">
						<div class="key">Time Limit</div>
						<div class="value">
							${problem.timeLimit}s<br>
						</div>
					</div>
					<div class="limit">
						<div class="key">Memory Limit</div>
						<div class="value">
							${problem.memoryLimit}MB<br>
						</div>
					</div>
					<div class="checker">
						<div class="key">Judge Program</div>
						<div class="value">
							<span>Standard</span>
						</div>
					</div>
					<div class="checker">
						<div class="key">Ratio(Solve/Submit)</div>
						<div class="value">
							<span>${problem.solved/problem.submit }%(<a
								href="/status?pid=1&amp;judge=3">${problem.solved}</a>/<a
								href="/status?pid=1">${problem.submit }</a>)
							</span>
						</div>
					</div>
				</div>
				<div id="problemContent">
					<div class="problemIteam">Description:</div>
					${problem.description }
					<div class="problemIteam">Input:</div>
					${problem.input }
					<div class="problemIteam">Output:</div>
					${problem.output }
					<div class="problemIteam">Sample Input:</div>
					<pre class="sample">${problem.sampleInput }</pre>
					<div class="problemIteam">Sample Output:</div>
					<pre class="sample">${problem.sampleOutput }</pre>


				</div>
				<hr>

				<a href="#" id="submission_link"
					onclick="show_submission(); return false;">Submit</a>
				<script src="/oj/static/js/codemirror.js" type="text/javascript"></script>
				<div id="submission" style="display: none;">
					<form accept-charset="UTF-8" id="problem_submit">
						<div style="margin:0;padding:0;display:inline">
							<input name="utf8" type="hidden" value="✓">
						</div>

						<div style="margin:0;padding:0;display:inline">
							<input name="pid" type="hidden" value="${problem.problemId}">
						</div>
						<div class="field">
							<label for="compiler_id">Compiler</label> <select
								id="compiler_id" name="compiler_id">
								<option value="1">C</option>
								<option value="2">C++</option>
								<option value="3">Java</option>
								<option value="3">Python</option>
								<option value="3">C#</option>
								<option value="3">Bash</option>
								<option value="3">Pascal</option>

							</select> <font id="warning" color="red"></font>
						</div>
						<div class="field">
							<div class="rfloat">
								<input checked="checked" id="advanced_editor"
									name="advanced_editor" onchange="toggle_editor()"
									onclick="toggle_editor()" type="checkbox" value="1">
								Use advanced editor
							</div>
							<label for="code">Code</label>
							<textarea id="code" name="code" autofocus=""></textarea>
						</div>
						<div class="actions">
							<input name="submit" type="submit" value="Submit">
						</div>
					</form>
				</div>

				<script type="text/javascript">
					var editor;
					function show_submission() {
						$('#submission').show();
						$('#submission_link').hide();
						editor = CodeMirror.fromTextArea(document
								.getElementById("code"), {
							lineNumbers : true,
						});
						$('#code').blur(function() {
							editor.setValue($('#code').val());
						});
						$('#compiler_id').change(set_mode);
						set_mode();
						toggle_editor();
					};
					$('#problem_submit')
							.submit(
									function(e) {
										$('#code').val(editor.getValue());
										e.preventDefault();
										$
												.ajax({
													type : 'POST',
													url : '/oj/problem/submit',
													data : $(this).serialize(),
													error : function(
															XMLHttpRequest) {
														if (XMLHttpRequest.status == 401) {
															alert('Please Sign In.');
															window.location.href = '/sess';
														} else {
															var json = eval('('
																	+ XMLHttpRequest.responseText
																	+ ')');
															if (json.info != null) {
																$('#warning')
																		.text(
																				json.info);
															} else {
																$('#warning')
																		.text(
																				'');
															}
														}
													},
													success : function(result) {
														$('textarea').val('')
														window.location.href = '/status';
													}
												});
									});
					function toggle_editor() {
						var cm = $('.CodeMirror'), c = $('#code');
						if ($('#advanced_editor').prop('checked')) {
							cm.show();
							editor.setValue(c.val());
							c.hide();
						} else {
							c.val(editor.getValue()).show();
							cm.hide();
						}
						;
						return true;
					}
					function set_mode() {
						var compiler = $('#compiler_id option:selected').text();
						var modes = [ 'Javascript', 'Haskell', 'Lua', 'Pascal',
								'Python', 'Ruby', 'Scheme', 'Smalltalk',
								'Clojure', [ 'PHP', 'text/x-php' ],
								[ 'C', 'text/x-csrc' ],
								[ 'C++', 'text/x-c++src' ],
								[ 'Java', 'text/x-java' ], [ '', 'text/plain' ] ];
						for (var i = 0; i != modes.length; ++i) {
							var n = modes[i], m = modes[i];
							if ($.isArray(n)) {
								m = n[1];
								n = n[0];
							}
							if (compiler.indexOf(n) >= 0) {
								editor.setOption('mode', m.toLowerCase());
								break;
							}
						}
					};
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