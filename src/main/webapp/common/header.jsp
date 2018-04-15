<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<div class="sea-header hidden-xs">
		<div class="container">
			<div class="row">
				<div class="col-xs-3">
					<a href="http://localhost/dy" class="sea-logo"></a>
				</div>
				<div class="col-xs-7">
					<form class="form-horizontal sea-search" id="sea-search"
						role="search" action="" method="post">
						<div class="form-group">
							<div class="col-sm-9">
								<input type="text" class="form-control" id="searchword"
									name="searchword" placeholder="Search" autocomplete="off">
							</div>
							<div class="col-sm-3 sea-col-0">
								<button type="submit" class="btn btn-default" data-module="vod"
									data-action="/dy/static/search.php">搜视频</button>
								<button type="submit" class="btn btn-default btn-success"
									data-module="news" data-action="/dy/static/so.php">搜资讯</button>

							</div>
						</div>
					</form>
				</div>
				<!-- /.col-xs-5 -->
			</div>
			<!-- /.row -->
		</div>
	</div>
	<nav class="navbar navbar-inverse visible-lg visible-md"
		role="navigation">
		<div class="container">
			<ul class="nav navbar-nav navbar-left">
				<li class=""><a href="/dy"
					class="dropdown-toggle" data-toggle="">首页</a></li>

				<li class=""><a href="/dy/mov"
					class="dropdown-toggle" data-toggle="">电影</a></li>
					
				<li class=""><a href="/dy/tv"
					class="dropdown-toggle" data-toggle="">电视剧</a></li>

				<li class=""><a href="/dy/variety"
					class="dropdown-toggle" data-toggle="">综艺</a></li>

				<li class=""><a href="/dy/cartoon"
					class="dropdown-toggle" data-toggle="">动漫</a></li>
				<li class=""><a href="/dy/fuli"
					class="dropdown-toggle" data-toggle="">福利</a></li>
				<li class=""><a href="http://www.57tao.cc" target="_blank"
					class="dropdown-toggle" data-toggle="">福利购</a></li>
					<li class=""><a href="/dy/qiupian"
					class="dropdown-toggle" data-toggle="">求片留言</a></li>
					
					
			</ul>
		</div>
	</nav>
	<div class="container sea-nav visible-xs visible-sm">
		<div class="row">
			<ul class="list-inline">
				<li class="col-xs-3 text-left">
					<h4>
						<a href="javascript:;" id="sea-goback"><span
							class="glyphicon glyphicon-chevron-left"></span></a>
					</h4>
				</li>
				<li class="col-xs-6 text-center">
					<h4>电影网站</h4>
				</li>
				<li class="col-xs-3 text-right"><h4>
						<a href="http://localhost/dy"><span
							class="glyphicon glyphicon-home"></span></a> <a
							href="/search.php?searchword=请输入关键词"><span
							class="glyphicon glyphicon-search"></span></a>
					</h4></li>
			</ul>
		</div>
	</div>
