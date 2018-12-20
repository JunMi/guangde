<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:include page="../../base.jsp"></jsp:include>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>我的社区</title>
</head>
<body>
	
	<!-- header -->
	<jsp:include page="menu/header.jsp"></jsp:include>
	
	<div class="fly-panel fly-column">
		<div class="layui-container">
		
			<!-- nav导航栏 start -->
			<ul class="layui-clear">
				<li class="layui-hide-xs layui-this"><a href="/">首页</a></li>
				<li><a href="jie/index.html">提问</a></li>
				<li><a href="jie/index.html">分享<span class="layui-badge-dot"></span></a></li>
				<li><a href="jie/index.html">讨论</a></li>
				<li><a href="jie/index.html">建议</a></li>
				<li><a href="jie/index.html">公告</a></li>
				<li><a href="jie/index.html">动态</a></li>
				<li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block">
					<span class="fly-mid"></span></li>
				
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
		      <span class="fly-search"><i class="layui-icon"></i></span> 
		      <a href="jie/add.html" class="layui-btn">发表新帖</a> 
		    </div> 
		    <div class="layui-hide-sm layui-show-xs-block" style="margin-top: -10px; padding-bottom: 10px; text-align: center;"> 
		      	<a href="jie/add.html" class="layui-btn">发表新帖</a> 
		    </div> 
		</div>
	</div>

	<div class="layui-container">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-md8">
				
				<!-- 置顶 start -->
				<div class="fly-panel">
					<div class="fly-panel-title fly-filter">
						<a>置顶</a> <a href="#signin"
							class="layui-hide-sm layui-show-xs-block fly-right"
							id="LAY_goSignin" style="color: #FF5722;">去签到</a>
					</div>
					<ul class="fly-list">
						<li>
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
						</li>
					</ul>
				</div>
				<!-- 置顶 end -->
				
				<!-- 综合 start -->
				<div class="fly-panel" style="margin-bottom: 0;">

					<div class="fly-panel-title fly-filter">
						<a href="javascript:void(0)" class="layui-this">综合</a><span class="fly-mid"></span>
						<a href="javascript:void(0)">未结</a><span class="fly-mid"></span>
						<a href="javascript:void(0)">已结</a><span class="fly-mid"></span> 
						<a href="javascript:void(0)">精华</a><span class="fly-filter-right layui-hide-xs"> 
						<a href="javascript:void(0)" class="layui-this">按最新</a><span class="fly-mid"></span>
						<a href="javascript:void(0)">按热议</a>
						</span>
					</div>

					<ul class="fly-list">
						<li>
							<a href="user/home.html" class="fly-avatar"> 
								<img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"
								alt="贤心"></a>
							<h2>
								<a class="layui-badge">分享</a> <a href="jie/detail.html">基于layui 的极简社区页面模版</a>
							</h2>
							<div class="fly-list-info">
								<a href="user/home.html" link><cite>贤心</cite> 
				                	<i class="iconfont icon-renzheng" title="认证信息：XXX"></i>
				                	<i class="layui-badge fly-badge-vip">VIP3</i>
								</a> 
								<span>刚刚</span> 
								<span class="fly-list-kiss layui-hide-xs" title="悬赏飞吻">
									<i class="iconfont icon-kiss"></i> 60</span>
								<span class="layui-badge fly-badge-accept layui-hide-xs">已结</span>
								<span class="fly-list-nums"> <i
									class="iconfont icon-pinglun1" title="回答"></i> 21
								</span>
							</div>
							<div class="fly-list-badge">
								<span class="layui-badge layui-bg-red">精帖</span>
							</div>
						</li>
						<li>
							<a href="user/home.html" class="fly-avatar">
								<img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"
									alt="贤心"></a>
							<h2>
								<a class="layui-badge">动态</a> <a href="jie/detail.html">基于layui 的极简社区页面模版</a>
							</h2>
							<div class="fly-list-info">
								<a href="user/home.html" link> <cite>贤心</cite> 
								<!--<i class="iconfont icon-renzheng" title="认证信息：XXX"></i>
									<i class="layui-badge fly-badge-vip">VIP3</i>-->
								</a>
								<span>刚刚</span> 
								<span class="fly-list-kiss layui-hide-xs" title="悬赏飞吻">
								<i class="iconfont icon-kiss"></i> 60</span> 
								<span class="layui-badge fly-badge-accept layui-hide-xs">已结</span> 
								<span class="fly-list-nums"> 
									<i class="iconfont icon-pinglun1" title="回答"></i>66</span>
							</div>
							<div class="fly-list-badge">
								<span class="layui-badge layui-bg-red">精帖</span>
							</div>
						</li>
					</ul>
					
					<div style="text-align: center">
						<div class="laypage-main">
							<a href="jie/index.html" class="laypage-next">更多求解</a>
						</div>
					</div>
					
				</div>
				<!-- 综合 end -->
			</div>
			
			
			<div class="layui-col-md4">
				
				<!-- 温馨通道 -->
				<div class="fly-panel">
					<h3 class="fly-panel-title">温馨通道</h3>
					<ul class="fly-panel-main fly-list-static">
						<li><a href="javascript:void(0)" target="_blank">
							layui的 GitHub 及 Gitee (码云) 仓库，欢迎Star</a></li>
						<li><a href="javascript:void(0)" target="_blank">
								layui 常见问题的处理和实用干货集锦 </a></li>
						<li><a href="javascript:void(0)" target="_blank">
							layui的 GitHub 及 Gitee (码云) 仓库，欢迎Star</a></li>
						<li><a href="javascript:void(0)" target="_blank">
								layui 常见问题的处理和实用干货集锦 </a></li>
						<li><a href="javascript:void(0)" target="_blank">
							layui的 GitHub 及 Gitee (码云) 仓库，欢迎Star</a></li>
					</ul>
				</div>
				
				<!-- 签到 -->
				<div class="fly-panel fly-signin">
					<div class="fly-panel-title">
						签到 <i class="fly-mid"></i> 
						   <a href="javascript:;" class="fly-link" id="LAY_signinHelp">说明</a><i class="fly-mid"></i> 
						   <a href="javascript:;" class="fly-link" id="LAY_signinTop">活跃榜<span class="layui-badge-dot"></span></a> 
						   <span class="fly-signin-days">已连续签到<cite>16</cite>天
						</span>
					</div>
					<div class="fly-panel-main fly-signin-main">
						<button class="layui-btn layui-btn-danger" id="LAY_signin">今日签到</button>
						<span>可获得<cite>5</cite>飞吻</span>
						<!-- 已签到状态 -->
						<!-- <button class="layui-btn layui-btn-disabled">今日已签到</button>
				          <span>获得了<cite>20</cite>飞吻</span>
				          -->
					</div>
				</div>

				<!-- 回贴周榜 -->
				<div class="fly-panel fly-rank fly-rank-reply" id="LAY_replyRank">
					<h3 class="fly-panel-title">回贴周榜</h3>
					<dl>
						<!--<i class="layui-icon fly-loading">&#xe63d;</i>-->
						<dd>
							<a href="user/home.do"> 
								<img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg">
								<cite>贤心</cite><i>106次回答</i>
							</a>
						</dd>
						<dd>
							<a href="user/home.do">
								<img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg">
								<cite>贤心</cite><i>10次回答</i>
							</a>
						</dd>
						
					</dl>
				</div>

				<!-- 本周热议 -->
				<dl class="fly-panel fly-list-one">
					<dt class="fly-panel-title">本周热议</dt>
					
					<dd>
						<a href="jie/detail.html">基于 layui 的极简社区页面模版</a> 
						<span><i class="iconfont icon-pinglun1"></i> 216</span>
					</dd>
					<dd>
						<a href="jie/detail.html">基于 layui 的极简社区页面模版</a> 
						<span><i class="iconfont icon-pinglun1"></i> 16</span>
					</dd>

					<!-- 无数据时 -->
					<!-- <div class="fly-none">没有相关数据</div> -->
				</dl>

				<!-- 广告 -->
				<div class="fly-panel">
					<div class="fly-panel-title">广告</div>
					<div class="fly-panel-main">
						<a href="javascript:void(0)" target="_blank"
							class="fly-zanzhu" time-limit="2017.09.25-2099.01.01"
							style="background-color: #5FB878;">LayIM 3.0 - layui 旗舰之作</a>
					</div>
				</div>
				
				<!-- 友情链接 -->
				<div class="fly-panel fly-link">
					<h3 class="fly-panel-title">友情链接</h3>
					<dl class="fly-panel-main">
						<dd>
							<a href="javascript:void(0)" target="_blank">layui</a>
						<dd>
						<dd>
							<a href="javascript:void(0)" target="_blank">WebIM</a>
						<dd>
						<dd>
							<a href="javascript:void(0)" target="_blank">layer</a>
						<dd>
						<dd>
							<a href="javascript:void(0)" target="_blank">layDate</a>
						<dd>
						<dd>
							<a href="javascript:void(0)" class="fly-link">申请友链</a>
						<dd>
					</dl>
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="menu/footer.jsp"></jsp:include>	
	
	<script src="res/layui/layui.js"></script>
	<script>
		layui.cache.page = '';
		layui.cache.user = {
			username : '游客',
			uid : -1,
			avatar : 'res/images/avatar/00.jpg',
			experience : 83,
			sex : '男'
		};
		layui.config({
			version : "3.0.0",
			base : 'res/mods/' //这里实际使用时，建议改成绝对路径
		}).extend({
			fly : 'index'
		}).use('fly');
	</script>

	<script type="text/javascript">
		var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
		document.write(unescape("%3Cspan id='cnzz_stat_icon_30088308'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "w.cnzz.com/c.php%3Fid%3D30088308' type='text/javascript'%3E%3C/script%3E"));
	</script>

</body>
</html>
