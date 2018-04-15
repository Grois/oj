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
<meta name="description" content="">
<meta name="author" content="">

<title>后台管理</title>

<link href="/oj/static/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="/oj/static/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<link href="/oj/static/dist/css/sb-admin-2.css" rel="stylesheet">

<link href="/oj/static/vendor/morrisjs/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/oj/static/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.html">OJ 后台</a>
		</div>
		<!-- /.navbar-header -->

		<ul class="nav navbar-top-links navbar-right">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-user">
					<li><a href="#"><i class="fa fa-user fa-fw"></i> User
							Profile</a></li>
					<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
					</li>
					<li class="divider"></li>
					<li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i>
							Logout</a></li>
				</ul></li>
		</ul>

		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
					<li><a href="/oj"> <i class="fa fa-dashboard fa-fw"></i>
							查看前台
					</a></li>
					<li><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>
							新闻管理<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="/oj/admin/news_manage">管理</a></li>
							<li><a href="/oj/admin/news_add">新增</a></li>
						</ul> <!-- /.nav-second-level --></li>
					<li><a href="/oj/admin/tzgg"><i class="fa fa-edit fa-fw"></i>
							公告设置</a></li>
					<li><a href="forms.html"><i class="fa fa-edit fa-fw"></i>
							用户管理</a></li>

					<li><a href="#"><i class="fa fa-wrench fa-fw"></i> 问题管理<span
							class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="panels-wells.html">管理</a></li>
							<li><a href="buttons.html">新增</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		</nav>

		<div id="page-wrapper"></div>




		<!-- jQuery -->
		<script src="/oj/static/vendor/jquery/jquery.min.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="/oj/static/vendor/bootstrap/js/bootstrap.min.js"></script>

		<!-- Metis Menu Plugin JavaScript -->
		<script src="/oj/static/vendor/metisMenu/metisMenu.min.js"></script>

		<!-- DataTables JavaScript -->
		<script src="/oj/static/vendor/datatables/js/jquery.dataTables.min.js"></script>
		<script
			src="/oj/static/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
		<script
			src="/oj/static/vendor/datatables-responsive/dataTables.responsive.js"></script>

		<!-- Custom Theme JavaScript -->
		<script src="/oj/static/dist/js/sb-admin-2.js"></script>

		<!-- Page-Level Demo Scripts - Tables - Use for reference -->
		<script>
			$(document).ready(function() {
				$('#dataTables-example').DataTable({
					responsive : true
				});
			});
		</script>
</body>

</html>
