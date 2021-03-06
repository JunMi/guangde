<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../../base.jsp"></jsp:include>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>用户主页</title>
</head>
<body style="margin-top: 65px;">

	<!-- header -->
	<jsp:include page="../common/header.jsp"></jsp:include>

	<div class="fly-home fly-panel" style="background-image: url();">
		<img src="${user.photoPath }"> <i
			class="iconfont icon-renzheng" title="Fly社区认证"></i>
		<h1>
			${user.nickName}
			<c:if test="${user.gender==0}">
				<i class="iconfont icon-nan"></i>
			</c:if>
			<c:if test="${user.gender==1}">
				<i class="iconfont icon-nv"></i>
			</c:if>
			<i class="layui-badge fly-badge-vip">VIP3</i>
			<!-- <span style="color:#c00;">（管理员）</span> -->
			<!-- <span style="color:#5FB878;">（社区之光）</span> -->
			<c:if test="${user.isEffective==1}">
				<span>（该号已被封）</span>
			</c:if>
		</h1>
		
		
		

		<!-- <p style="padding: 10px 0; color: #5FB878;">认证信息：layui 作者</p> -->

		<p class="fly-home-info">
			<i class="iconfont icon-kiss" title="积分"></i><span
				style="color: #FF7200;">${user.starts} 积分</span> <i
				class="iconfont icon-shijian"></i><span>${user.createdate}加入</span>
			<i class="iconfont icon-chengshi"></i><span>来自${user.fromCity}</span>
		</p>

		<p class="fly-home-sign">（${user.sign}）</p>

		<div class="fly-sns" data-user="">
			<a href="javascript:;"
				class="layui-btn layui-btn-primary fly-imActive"
				data-type="addFriend">加为好友</a> <a href="javascript:;"
				class="layui-btn layui-btn-normal fly-imActive" data-type="chat">发起会话</a>
		</div>

	</div>

	<div class="layui-container">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-md6 fly-home-jie">
				<div class="fly-panel">
					<h3 class="fly-panel-title">贤心 最近的提问</h3>
					<ul class="jie-row">
						<li><span class="fly-jing">精</span> <a href=""
							class="jie-title"> 基于 layui 的极简社区页面模版</a> <i>刚刚</i> <em
							class="layui-hide-xs">1136阅/27答</em></li>
						<li><a href="" class="jie-title"> 基于 layui 的极简社区页面模版</a> <i>1天前</i>
							<em class="layui-hide-xs">1136阅/27答</em></li>
						<li><a href="" class="jie-title"> 基于 layui 的极简社区页面模版</a> <i>2017-10-30</i>
							<em class="layui-hide-xs">1136阅/27答</em></li>
						<li><a href="" class="jie-title"> 基于 layui 的极简社区页面模版</a> <i>1天前</i>
							<em class="layui-hide-xs">1136阅/27答</em></li>
						<li><a href="" class="jie-title"> 基于 layui 的极简社区页面模版</a> <i>1天前</i>
							<em class="layui-hide-xs">1136阅/27答</em></li>
						<li><a href="" class="jie-title"> 基于 layui 的极简社区页面模版</a> <i>1天前</i>
							<em class="layui-hide-xs">1136阅/27答</em></li>
						<li><a href="" class="jie-title"> 基于 layui 的极简社区页面模版</a> <i>1天前</i>
							<em class="layui-hide-xs">1136阅/27答</em></li>
						<!-- <div class="fly-none" style="min-height: 50px; padding:30px 0; height:auto;"><i style="font-size:14px;">没有发表任何求解</i></div> -->
					</ul>
				</div>
			</div>

			<div class="layui-col-md6 fly-home-da">
				<div class="fly-panel">
					<h3 class="fly-panel-title">贤心 最近的回答</h3>
					<ul class="home-jieda">
						<li>
							<p>
								<span>1分钟前</span> 在<a href="" target="_blank">tips能同时渲染多个吗?</a>中回答：
							</p>
							<div class="home-dacontent">
								尝试给layer.photos加上这个属性试试：
								<pre>
full: true         
</pre>
								文档没有提及
							</div>
						</li>
						<li>
							<p>
								<span>5分钟前</span> 在<a href="" target="_blank">在Fly社区用的是什么系统啊?</a>中回答：
							</p>
							<div class="home-dacontent">Fly社区采用的是NodeJS。分享出来的只是前端模版</div>
						</li>

						<!-- <div class="fly-none" style="min-height: 50px; padding:30px 0; height:auto;"><span>没有回答任何问题</span></div> -->
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>


</body>
</html>
