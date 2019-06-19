<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

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

