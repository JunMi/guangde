<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div class="fly-panel fly-column">
	<div class="layui-container">

		<!-- nav导航栏 start -->
		<ul class="layui-clear">
			<li class="layui-hide-xs layui-this"><a href="index">首页</a></li>
			<li><a href="article/index">提问</a></li>
			<li><a href="article/index">分享<span class="layui-badge-dot"></span></a></li>
			<li><a href="article/index">讨论</a></li>
			<li><a href="article/index">建议</a></li>
			<li><a href="article/index">公告</a></li>
			<li><a href="article/index">动态</a></li>
			<li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block">
				<span class="fly-mid"></span>
			</li>
			
			<!-- 用户登入后显示 -->
			<!-- <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><a
					href="user/index.html">我发表的贴</a>
				</li>
				<li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><a
					href="user/index.html#collection">我收藏的贴</a>
				</li> -->
		</ul>
		<!-- nav导航栏 end -->

		<div class="fly-column-right layui-hide-xs">
			<span class="fly-search"><i class="layui-icon"></i></span> <a
				href="article/add" class="layui-btn">发表新帖</a>
		</div>
		<div class="layui-hide-sm layui-show-xs-block"
			style="margin-top: -10px; padding-bottom: 10px; text-align: center;">
			<a href="article/add" class="layui-btn">发表新帖</a>
		</div>
	</div>
</div>