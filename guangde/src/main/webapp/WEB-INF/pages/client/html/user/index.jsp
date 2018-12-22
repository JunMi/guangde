<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:include page="../../../base.jsp"></jsp:include>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>用户中心</title>
</head>
<body>

	<!-- header -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<div class="layui-container fly-marginTop fly-user-main">
		<ul class="layui-nav layui-nav-tree layui-inline" lay-filter="user">
			<li class="layui-nav-item"><a href="user/home.do"> <i
					class="layui-icon">&#xe609;</i> 我的主页
			</a></li>
			<li class="layui-nav-item layui-this"><a href="user/index.do">
					<i class="layui-icon">&#xe612;</i> 用户中心
			</a></li>
			<li class="layui-nav-item"><a href="user/set.do"> <i
					class="layui-icon">&#xe620;</i> 基本设置
			</a></li>
			<li class="layui-nav-item"><a href="user/message.do"> <i
					class="layui-icon">&#xe611;</i> 我的消息
			</a></li>
		</ul>

		<div class="site-tree-mobile layui-hide">
			<i class="layui-icon">&#xe602;</i>
		</div>
		<div class="site-mobile-shade"></div>

		<div class="site-tree-mobile layui-hide">
			<i class="layui-icon">&#xe602;</i>
		</div>
		<div class="site-mobile-shade"></div>

		<div class="fly-panel fly-panel-user" pad20>

			<!-- <div class="fly-msg" style="margin-top: 15px;">
				您的邮箱尚未验证，这比较影响您的帐号安全，<a href="user/activate.do">立即去激活？</a>
			</div> -->

			<div class="layui-tab layui-tab-brief" lay-filter="user">
				<ul class="layui-tab-title" id="LAY_mine">
					<li data-type="mine-jie" lay-id="index" class="layui-this">我发的帖（<span>89</span>）
					</li>
					<li data-type="collection" data-url="/collection/find/"
						lay-id="collection">我收藏的帖（<span>16</span>）
					</li>
				</ul>
				
				<div class="layui-tab-content" style="padding: 20px 0;">
					<div class="layui-tab-item layui-show">
						<ul class="mine-view jie-row">
							<li><a class="jie-title" href="../jie/detail.html"
								target="_blank">基于 layui 的极简社区页面模版</a> <i>2017/3/14
									上午8:30:00</i> <a class="mine-edit" href="/jie/edit/8116">编辑</a> <em>661阅/10答</em>
							</li>
							<li><a class="jie-title" href="../jie/detail.html"
								target="_blank">基于 layui 的极简社区页面模版</a> <i>2017/3/14
									上午8:30:00</i> <a class="mine-edit" href="/jie/edit/8116">编辑</a> <em>661阅/10答</em>
							</li>
						</ul>
						<div id="LAY_page"></div>
					</div>
					<div class="layui-tab-item">
						<ul class="mine-view jie-row">
							<li><a class="jie-title" href="../jie/detail.html"
								target="_blank">基于 layui 的极简社区页面模版</a> <i>收藏于23小时前</i></li>
						</ul>
						<div id="LAY_page1"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>	
	
</body>
</html>
