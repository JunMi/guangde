<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>我的社区</title>
<jsp:include page="../../base.jsp"></jsp:include>
</head>
<body>
	
	<!-- header -->
	<jsp:include page="common/header.jsp"></jsp:include>
	<!-- column -->
	<jsp:include page="common/column.jsp"></jsp:include>
	
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
					${date }
					<ul id="list-top" class="fly-list">
						<!-- 包含置顶的list -->
					</ul>
				</div>
				<!-- 置顶 end -->
				
				<!-- 综合 start -->
				<div class="fly-panel" style="margin-bottom: 0;">
					<jsp:include page="common/filter.jsp"></jsp:include>
					<ul id="list-show" class="fly-list">
						<!-- 包含综合的list -->
					</ul>
					<div style="text-align: center">
						<div class="laypage-main">
							<a href="article/index" class="laypage-next">更多求解</a>
						</div>
					</div>
				</div>
				<!-- 综合 end -->
			</div>
			
			
			<div class="layui-col-md4">
				
				<!-- 温馨通道 -->
				<jsp:include page="common/list-static.jsp"></jsp:include>
				
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
							<a href="user/home"> 
								<img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg">
								<cite>贤心</cite><i>106次回答</i>
							</a>
						</dd>
						<dd>
							<a href="user/home">
								<img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg">
								<cite>贤心</cite><i>10次回答</i>
							</a>
						</dd>
						
					</dl>
				</div>

				<!-- 本周热议 -->
				<jsp:include page="common/list-hot.jsp"></jsp:include>

				<!-- 广告 -->
				<jsp:include page="ad/ad.jsp"></jsp:include>
				
				<!-- 友情链接 -->
				<jsp:include page="ad/link.jsp"></jsp:include>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="common/footer.jsp"></jsp:include>	
	
	<!-- list模板 -->
	<jsp:include page="common/list.jsp"></jsp:include>
	

	<script type="text/javascript">
		layui.use([ 'index' ], function() {
			var index = layui.index;
			//var layer = layui.layer;
			//layer.msg('Hello1!!');
		});
	</script>
</body>

</html>
