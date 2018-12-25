<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>登入</title>
<jsp:include page="../../../base.jsp"></jsp:include>
</head>
<body>

	<!-- header -->
	<jsp:include page="../common/header.jsp"></jsp:include>

	<div class="layui-container fly-marginTop">
		<div class="fly-panel fly-panel-user" pad20>
			<div class="layui-tab layui-tab-brief" lay-filter="user">
				<ul class="layui-tab-title">
					<li class="layui-this">登入</li>
					<li><a href="user/login.do?param=reg">注册</a></li>
				</ul>
				<div class="layui-form layui-tab-content" id="LAY_ucm"
					style="padding: 20px 0;">
					<div class="layui-tab-item layui-show">
						<div class="layui-form layui-form-pane">
							<form method="post" action="user/doLogin.do">
								<div class="layui-form-item">
									<label for="L_email" class="layui-form-label">邮箱</label>
									<div class="layui-input-inline">
										<input type="text" id="L_email" name="email" required
											lay-verify="required" autocomplete="off" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label for="L_pass" class="layui-form-label">密码</label>
									<div class="layui-input-inline">
										<input type="password" id="L_pass" name="pass" required
											lay-verify="required" autocomplete="off" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label for="L_vercode" class="layui-form-label">人类验证</label>
									<div class="layui-input-inline">
										<input type="text" id="L_vercode" name="vercode" required
											lay-verify="required" placeholder="请回答后面的问题"
											autocomplete="off" class="layui-input">
									</div>
									<div class="layui-form-mid">
										<span style="color: #c00;">{{d.vercode}}</span>
									</div>
								</div>
								<div class="layui-form-item">
									<button class="layui-btn" lay-filter="userLogin" lay-submit>立即登录</button>
									<span style="padding-left:20px;"> <a
										href="user/login.do?param=forget">忘记密码？</a>
									</span>
								</div>
								<div class="layui-form-item fly-form-app">
									<span>或者使用社交账号登入</span> <a href=""
										onclick="layer.msg('正在通过QQ登入', {icon:16, shade: 0.1, time:0})"
										class="iconfont icon-qq" title="QQ登入"></a> <a href=""
										onclick="layer.msg('正在通过微博登入', {icon:16, shade: 0.1, time:0})"
										class="iconfont icon-weibo" title="微博登入"></a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<%-- <jsp:include page="../common/footer.jsp"></jsp:include>	 --%>

	<script type="text/javascript">
		layui.use([ 'layer', 'form','user'], function() {
			var layer = layui.layer;
			var form = layui.form;
			var user = layui.user;
			
			layer.msg('Hello!!');
		});
		
	//	layui.cache.page = '';
		layui.cache.user = {
			username : '游客',
			uid : -1,
			avatar : 'res/images/avatar/00.jpg',
			experience : 83,
			sex : '男'
		};
		layui.config({
			version : "3.1.0",
			base : 'res/mods/' //这里实际使用时，建议改成绝对路径
		}).extend({
			fly : 'index'
		}).use('fly');
	</script>
</body>
</html>
