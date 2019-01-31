<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<title>提问 --菜单</title>
<jsp:include page="../../../base.jsp"></jsp:include>
</head>

<body>
	<!-- header -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- column -->
	<jsp:include page="../common/column.jsp"></jsp:include>

	
	<div class="layui-container">
		 <div class="layui-row layui-col-space15">
		    <div class="layui-col-md8">
			     <div class="fly-panel" style="margin-bottom: 0;">
			        
			        <jsp:include page="../common/filter.jsp"></jsp:include>
					
			        <ul class="fly-list">          
			          
			          
			          <li>
			            <a href="user/home" class="fly-avatar">
			              <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg" alt="贤心">
			            </a>
			            <h2>
			              <a class="layui-badge">分享1</a>
			              <a href="article/detail">基11于 layui 的极简社区页面模版</a>
			            </h2>
			            <div class="fly-list-info">
			              <a href="user/home" link>
			                <cite>贤心</cite>
			                <!--
			                <i class="iconfont icon-renzheng" title="认证信息：XXX"></i>
			                <i class="layui-badge fly-badge-vip">VIP3</i>
			                -->
			              </a>
			              <span>刚刚</span>
			              
			              <span class="fly-list-kiss layui-hide-xs" title="悬赏飞吻"><i class="iconfont icon-kiss"></i> 60</span>
			              <span class="layui-badge fly-badge-accept layui-hide-xs">已结</span>
			              <span class="fly-list-nums"> 
			                <i class="iconfont icon-pinglun1" title="回答"></i> 66
			              </span>
			            </div>
			            <div class="fly-list-badge">
			              <span class="layui-badge layui-bg-black">置顶</span>
			              <span class="layui-badge layui-bg-red">精帖</span>
			            </div>
			          </li>
			          
			          <li>
			            <a href="user/home" class="fly-avatar">
			              <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg" alt="贤心">
			            </a>
			            <h2>
			              <a class="layui-badge">动态</a>
			              <a href="article/detail">基于 layui 的极简社区页面模版</a>
			            </h2>
			            <div class="fly-list-info">
			              <a href="user/home" link>
			                <cite>贤心</cite>
			                <!--<i class="iconfont icon-renzheng" title="认证信息：XXX"></i>-->
			                <i class="layui-badge fly-badge-vip">VIP3</i>
			              </a>
			              <span>刚刚</span>
			              <span class="fly-list-kiss layui-hide-xs" title="悬赏飞吻"><i class="iconfont icon-kiss"></i> 60</span>
			              <span class="layui-badge fly-badge-accept layui-hide-xs">已结</span>
			              <span class="fly-list-nums"> 
			                <i class="iconfont icon-pinglun1" title="回答"></i> 66
			              </span>
			            </div>
			            <div class="fly-list-badge">
			              <span class="layui-badge layui-bg-red">精帖</span>
			            </div>
			          </li>
			          
			        </ul>
			        
			        <!-- <div class="fly-none">没有相关数据</div> -->
			    
			        <div style="text-align: center">
			          <div class="laypage-main">
			          	<span class="laypage-curr">1</span>
			          	<a href="/jie/page/2/">2</a>
			          	<a href="/jie/page/3/">3</a>
			          	<a href="/jie/page/4/">4</a>
			          	<a href="/jie/page/5/">5</a>
			          	<span>…</span>
			          	<a href="/jie/page/148/" class="laypage-last" title="尾页">尾页</a>
			          	<a href="/jie/page/2/" class="laypage-next">下一页</a>
			          </div>
			        </div>
			
			     </div>
		    </div>
		    
		    <div class="layui-col-md4">
		      <!-- 本周热议 -->
		      <jsp:include page="../common/list-hot.jsp"></jsp:include>
		
		      <!-- 广告 -->
			  <jsp:include page="../ad/ad.jsp"></jsp:include>
		      
		      <!-- 友情链接 -->
			  <jsp:include page="../ad/link.jsp"></jsp:include>
		    </div>
		    
		  </div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	<script type="text/javascript">
	layui.use([ 'jie' ], function() {
			//var user = layui.user;
			
			
	});
</script>
</body>
</html>
