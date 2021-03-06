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
<title>FAQ</title>
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
					<li><a href="/oj/status">Status</a></li>
					<li><a href="/oj/rank">Ranklist</a></li>
					<li class="active"><a href="/faq">FAQ</a></li>
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


				<h2>评分</h2>
				<p>用户提交的程序经过Online Judge的即时评测，可能的反馈信息包括：</p>
				<table id="FAQ_list"
					class="table table-bordered table-striped table-hover">
					<thead>
						<tr>
							<th class="lheader">结果</th>
							<th class="lheader">说明</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><button type="button" class="btn btn-warning btn-xs"
									style="pointer-events:none">Pending</button></td>
							<td>系统还没有评测到这个提交，请稍候</td>
						</tr>
						<tr>
							<td><button type="button" class="btn btn-primary btn-xs"
									style="pointer-events:none">Running&amp;Judging</button></td>
							<td>评测系统正在评测，稍候会有结果</td>
						</tr>
						<tr>
							<td><button type="button" class="btn btn-ce btn-xs"
									style="pointer-events:none">Compile Error</button></td>
							<td>您提交的代码无法完成编译</td>
						</tr>
						<tr>
							<td><button type="button" class="btn btn-danger btn-xs"
									style="pointer-events:none">Accepted</button></td>
							<td>恭喜！您通过了这道题</td>
						</tr>
						<tr>
							<td><button type="button" class="btn btn-success btn-xs"
									style="pointer-events:none">Presentation Error</button></td>
							<td>您的程序输出的格式不符合要求（比如空格和换行与要求不一致）</td>
						</tr>
						<tr>
							<td><button type="button" class="btn btn-success btn-xs"
									style="pointer-events:none">Runtime Error</button></td>
							<td>您的程序发生运行错误，可能是数组越界，堆栈溢出（比如，递归调用层数太多）等情况引起</td>
						</tr>
						<tr>
							<td><button type="button" class="btn btn-success btn-xs"
									style="pointer-events:none">Wrong Answer</button></td>
							<td>您的程序未能对评测系统的数据返回正确的结果，即答案错误</td>
						</tr>
						<tr>
							<td><button type="button" class="btn btn-success btn-xs"
									style="pointer-events:none">Time Limit Exceeded</button></td>
							<td>您的程序未能在规定时间内运行结束</td>
						</tr>
						<tr>
							<td><button type="button" class="btn btn-success btn-xs"
									style="pointer-events:none">Memory Limit Exceeded</button></td>
							<td>您的程序使用了超过限制的内存</td>
						</tr>
						<tr>
							<td><button type="button" class="btn btn-success btn-xs"
									style="pointer-events:none">Output Limit Exceeded</button></td>
							<td>您的程序输出的内容超出限制，可能是输出部分陷入无限循环引起</td>
						</tr>
						<tr>
							<td><button type="button" class="btn btn-success btn-xs"
									style="pointer-events:none">System Error</button></td>
							<td>评测系统出现了错误，竞赛中系统将不会记录罚时</td>
						</tr>
					</tbody>
				</table>
				<style>
body li p.first {
	display: inline-block;
}

body ul,body ol {
	padding-left: 30px;
}

body ul.no-list,body ol.no-list {
	list-style-type: none;
	padding: 0;
}

body ul ul,body ul ol,body ol ol,body ol ul {
	margin-bottom: 0;
	margin-top: 0;
}

body code,body tt {
	background-color: #f8f8f8;
	border: 1px solid #ddd;
	border-radius: 3px;
	margin: 0 2px;
	padding: 0 5px;
}

body code {
	white-space: nowrap;
}

code,pre {
	font-family: Consolas, "Liberation Mono", Courier, monospace;
	font-size: 12px
}

body pre>code {
	background: transparent;
	border: none;
	margin: 0;
	padding: 0;
	white-space: pre;
}

body pre code,body pre tt {
	background-color: transparent;
	border: none;
	margin: 0;
	padding: 0;
}
</style>

				<h2>常见问题</h2>
				<p>
					<b>我应该从哪里读输入，另外应该输出到哪里？</b>
				</p>
				<p>如果没有特别说明，你的程序应该从标准输入（stdin，传统意义上的“键盘”）读入，并输出到标准输出（stdout，传统意义上的“屏幕”），不要使用文件做输入输出。由于系统是在你的程序运行结束后开始检查输出是否是正确的，对于有多组测试数据的输入，可以全部读入之后再输出，也可以处理一组测试数据就输出一组。</p>
				<br>
				<p>
					<b>为什么我的程序交在这里得到编译错误，而我在自己的机器上已经编译通过了？</b>
				</p>
				<p>本系统所使用的编译器和你在自己机器上使用的可能有区别，请留意几个常见的地方：</p>
				<p></p>
				<li>本系统运行在 32 位 Linux 系统上，使用的编译器版本和编译参数可以参见编译器帮助</li>
				<p></p>
				<p></p>
				<li>Windows平台专有的函数、数据类型、头文件不应使用。如scanf_s(), _tmain(), _TCHAR,
					Windows.h等。</li>
				<p></p>
				<p></p>
				<li>C 代码main函数必须采用int作为返回类型，且返回return 0;.</li>
				<p></p>
				<p></p>
				<li>C++ 下 64 位整数的类型是 long long，不要使用 __int64</li>
				<p></p>
				<p></p>
				<li>C/C++代码不应包含stdafx.h。</li>
				<p></p>
				<p></p>
				<li>Java 代码需使用 Main 作为主类名</li>
				<p></p>
				<p></p>
				<li>Visual C++ 6.0 和 Turbo C++ 3.0 （及它们的更低版本）有较多违背 C++ 标准（<a
					href="http://www.iso.org/iso/iso_catalogue/catalogue_ics/catalogue_detail_ics.htm?ics1=35&amp;ics2=60&amp;ics3=&amp;csnumber=50372"
					target="new">ISO/IEC 14882</a>）的地方，不要使用它们来判断 C++ 程序语法上是否有问题
				</li>
				<p></p>
				<br>
				<p>
					<b>程序的时间和内存占用是如何计算的？</b>
				</p>
				<p>程序的运行时间为程序在所有 CPU 核占用的时间之和，内存占用取程序运行开始到结束占用内存的最大值</p>
				<br>
				<p>
					<b>为什么同样的程序运行时间和所用内存会不同？</b>
				</p>
				<p>程序运行时间会受到许多因素的影响，尤其是在现代多任务操作系统以及在使用动态库的情况下，多次使用同一输入运行同一程序所需时间和内存有一些不同是正常现象。我们的题目给出的运行限制一般为标准程序的若干倍，也就是说，选用正确的算法和合适的语言，那么运行限制是富余的</p>
				<br>
				<p>
					<b>不同语言的时间限制和内存限制是相同的吗？</b>
				</p>
				<p>Java代码的时间和内存限制一般是其他编程语言的两倍</p>
				<br>
				<p>
					<b>我提交的代码可以做什么，有什么限制吗？</b>
				</p>
				<p>没有。这里没有系统调用白名单，也没有针对语言限制可使用的包或库。虽然我们比较宽容大度，但还是请不要做不符合道义的事情。如果你需要使用我们系统没有提供的某个语言的某个库，或者需要更改编译参数，可以联系我们</p>

				<h2>编译器列表</h2>
				<hr>
				<h4>gcc for C</h4>
				<li>版本</li>
				<pre>
					<code>gcc (Ubuntu 4.8.2-19ubuntu1) 4.8.2
Copyright (C) 2013 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
</code>
				</pre>
				<li>编译运行选项</li>
				<pre>
					<code>gcc Main.c -o Main -Wall -lm --static -std=c99 -DONLINE_JUDGE &amp;&amp; ./Main</code>
				</pre>
				<hr>

				<h4>g++ for C++</h4>
				<li>版本</li>
				<pre>
					<code>g++ (Ubuntu 4.8.2-19ubuntu1) 4.8.2
Copyright (C) 2013 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
</code>
				</pre>
				<li>编译运行选项</li>
				<pre>
					<code>g++ Main.cc -o Main -Wall -lm --static -std=c++0x -DONLINE_JUDGE &amp;&amp; ./Main</code>
				</pre>
				<hr>

				<h4>OpenJDK for Java</h4>
				<li>版本</li>
				<pre>
					<code>java version "1.7.0_55"
OpenJDK Runtime Environment (IcedTea 2.4.7) (7u55-2.4.7-1ubuntu1)
OpenJDK Client VM (build 24.51-b03, mixed mode, sharing)
</code>
				</pre>
				<li>编译运行选项</li>
				<pre>
					<code>javac -J-Xms32m -J-Xmx256m Main.java &amp;&amp;/usr/bin/java -Xms128M -Xms512M -DONLINE_JUDGE=true Main</code>
				</pre>

				<h2>其他</h2>
				<p>在考试或比赛中遇到其他问题请咨询现场工作人员</p>
				<br>
				<p>
					如果对于Online Judge有任何需求或者bug report，请在Github发起一个<a
						href="https://github.com/ZJGSU-Open-Source/GoOnlineJudge/issues/new"
						target="_blank">issue</a>
				</p>
				<br>

				<h2>维护人员</h2>
				<a href="https://github.com/sakeven" target="_blank">@sakeven</a> <a
					href="https://github.com/JinweiClarkChao" target="_blank">@JinweiClarkChao</a>
				<a href="https://github.com/rex-zsd" target="_blank">@rex-zsd</a>

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
