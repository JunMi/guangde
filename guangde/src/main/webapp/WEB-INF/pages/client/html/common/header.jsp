<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<div class="fly-header layui-bg-black">
	<div class="layui-container">
		<a class="fly-logo" href="index"> 
			<!--<img src="res/images/logo_g.png" alt="layui" style="width: 107px;height: 52px;margin-top: -6px;">-->
			<img src="res/images/logo.png" alt="layui">
		</a>
		<!-- <ul class="layui-nav fly-nav layui-hide-xs">
			<li class="layui-nav-item layui-this"><a
				href="javascript:void(0)"><i class="iconfont icon-jiaoliu"></i>交流</a></li>
			<li class="layui-nav-item"><a href="javascript:void(0)"><i
					class="iconfont icon-iconmingxinganli"></i>案例</a></li>
			<li class="layui-nav-item"><a href="javascript:void(0)"
				target="_blank"><i class="iconfont icon-ui"></i>框架</a></li>
		</ul> -->
		
		<ul class="layui-nav fly-nav-user">
			<c:choose >
				<c:when test="${sessionScope.user==null}">
					<!-- 未登入的状态 -->
					<li class="layui-nav-item">
						<a class="iconfont icon-touxiang layui-hide-xs" href="../user/login.html"></a></li>
					<li class="layui-nav-item"><a href="user/login?param=login">登入</a></li>
					<li class="layui-nav-item"><a href="user/login?param=reg">注册</a></li>
					<li class="layui-nav-item layui-hide-xs">
						<a href="" onclick="layer.msg('正在通过QQ登入', {icon:16, shade: 0.1, time:0})"
						title="QQ登入" class="iconfont icon-qq"></a></li>
					<li class="layui-nav-item layui-hide-xs">
						<a href="" onclick="layer.msg('正在通过微博登入', {icon:16, shade: 0.1, time:0})"
						title="微博登入" class="iconfont icon-weibo"></a></li> 
				</c:when>
				<c:otherwise>
					 <!-- 登入后的状态 -->
					 <li class="layui-nav-item">
				        <a class="fly-nav-avatar" href="javascript:;">
				          <cite class="layui-hide-xs">${sessionScope.user.nickName}</cite>
				          <i class="iconfont icon-renzheng layui-hide-xs" title="认证信息：layui 作者"></i>
				          <i class="layui-badge fly-badge-vip layui-hide-xs">VIP3</i>
				          <img src="${sessionScope.userPhoto }">
				        </a>
				        <dl class="layui-nav-child">
				          <dd><a href="user/set"><i class="layui-icon">&#xe620;</i>基本设置</a></dd>
				          <dd><a href="user/message"><i class="iconfont icon-tongzhi" style="top: 4px;"></i>我的消息</a></dd>
				          <dd><a href="user/home?userId=${sessionScope.user.userId}"><i class="layui-icon" style="margin-left: 2px; font-size: 22px;">&#xe68e;</i>我的主页</a></dd>
				          <hr style="margin: 5px 0;">
				          <dd><a href="user/logout" style="text-align: center;">退出</a></dd>
				        </dl>
				      </li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</div>