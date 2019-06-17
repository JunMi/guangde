<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <c:forEach items="${articleList }" var="list">
		<li>
			<a href="user/home?userId=${list.userId}" class="fly-avatar"> 
				<img src="${list.photoPath }"
				alt="${list.nickName }"></a>
			<h2>
				<a class="layui-badge">${list.module }</a>
				<a href="jie/detail.html">${list.title }</a>
			</h2>
			<div class="fly-list-info">
				<a href="user/home.html?userId=${list.userId}" link> 
					<cite>${list.nickName }</cite> 
					<c:if test="${not empty list.validateInfo}">
						<i class="iconfont icon-renzheng" title="认证信息：VIP"></i> 
						<i class="layui-badge fly-badge-vip">${list.validateInfo }</i>
					</c:if>
				</a>
				<span>${list.createDate }</span> 
				<span class="fly-list-kiss layui-hide-xs" title="悬赏积分">
					<i class="iconfont icon-kiss"></i>${list.integral }</span>
				<span class="layui-badge fly-badge-accept layui-hide-xs">${list.status }</span> 
				<span class="fly-list-nums">
					<i class="iconfont icon-pinglun1"title="回答"></i>${list.reply }</span>
			</div>
			<div class="fly-list-badge">
		          <c:if test="${list.top==1 }">
		          	<span class="layui-badge layui-bg-black">置顶</span>
		          </c:if>
		          <c:if test="${list.fine==1 }">
		            <span class="layui-badge layui-bg-red">精帖</span> 
		          </c:if>
			</div>
		</li>
</c:forEach> -->


<script id="listtmpl" type="text/html">
	    {{#  layui.each(d.data, function(index, item){ }}
		<li>
			<a href="user/home?userId={{item.userId}}" class="fly-avatar"> 
				<img src="{{item.photoPath }}"
				alt="{{item.nickName }"></a>
			<h2>
				<a class="layui-badge">{{item.module }}</a>
				<a href="jie/detail.html">{{item.title }}</a>
			</h2>
			<div class="fly-list-info">
				<a href="user/home.html?userId={{item.userId}}" link> 
					<cite>{{item.nickName }}</cite> 
					{{# if(item.validateInfo==null){ }}
						<i class="iconfont icon-renzheng" title="认证信息：VIP"></i> 
						<i class="layui-badge fly-badge-vip">{{item.validateInfo }}</i>
					{{#  } }} 
				</a>
				<span>{{item.createDate }}</span> 
				<span class="fly-list-kiss layui-hide-xs" title="悬赏积分">
					<i class="iconfont icon-kiss"></i>{{item.integral }}</span>
				<span class="layui-badge fly-badge-accept layui-hide-xs">{{item.status }}</span> 
				<span class="fly-list-nums">
					<i class="iconfont icon-pinglun1"title="回答"></i>{{item.reply }}</span>
			</div>
			<div class="fly-list-badge">
		        {{# if(item.top==1){ }}
					<span class="layui-badge layui-bg-black">置顶</span>
				{{#  } }}
				{{# if(item.fine==1){ }}
					<span class="layui-badge layui-bg-red">精帖</span> 
				{{#  } }} 
			</div>
		</li>
		  {{#  }); }}
		  {{#  if(d.data.length === 0){ }}
		    无数据
		  {{#  } }} 
	</script>




	<%-- <li>
		<a href="user/home.html" class="fly-avatar"> 
			<img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"
			alt="贤心"></a> 
		<h2>
			<a class="layui-badge">动态</a>
			<a href="jie/detail.html">基于layui 的极简社区页面模版</a>
		</h2>
		<div class="fly-list-info">
			<a href="user/home.html" link> 
				<cite>贤心</cite> 
				<i class="iconfont icon-renzheng" title="认证信息：XXX"></i> 
				<i class="layui-badge fly-badge-vip">VIP3</i>
			</a>
			<span>刚刚</span> 
			<span class="fly-list-kiss layui-hide-xs" title="悬赏飞吻">
				<i class="iconfont icon-kiss"></i>60</span>
			<span class="layui-badge fly-badge-accept layui-hide-xs">已结</span> 
			<span class="fly-list-nums">
				<i class="iconfont icon-pinglun1"title="回答"></i>66</span>
		</div>
		<div class="fly-list-badge">
			<!--
	          <span class="layui-badge layui-bg-black">置顶</span>
	          <span class="layui-badge layui-bg-red">精帖</span>
	          -->
		</div>
	</li>
	<li>
		<a href="user/home.html" class="fly-avatar"> 
			<img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"
			alt="贤心"></a>
		<h2>
			<a class="layui-badge">公告</a>
			<a href="jie/detail.html">基于layui 的极简社区页面模版</a>
		</h2>
		<div class="fly-list-info">
			<a href="user/home.html" link> <cite>贤心</cite> 
			<!--
	            <i class="iconfont icon-renzheng" title="认证信息：XXX"></i>
	            <i class="layui-badge fly-badge-vip">VIP3</i>
	            -->
			</a> 
			<span>2017-11-30</span> 
			<span class="fly-list-kiss layui-hide-xs" title="悬赏飞吻">
				<i class="iconfont icon-kiss"></i> 60</span>
			<!--<span class="layui-badge fly-badge-accept layui-hide-xs">已结</span>-->
			<span class="fly-list-nums"> 
				<i class="iconfont icon-pinglun1" title="回答"></i> 1</span>
		</div>
		<div class="fly-list-badge">
			<!--
	          <span class="layui-badge layui-bg-black">置顶</span>
	          <span class="layui-badge layui-bg-red">精帖</span>
	          -->
		</div>
	</li> --%>