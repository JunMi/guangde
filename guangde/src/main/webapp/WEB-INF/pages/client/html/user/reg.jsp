<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>注册</title>
<jsp:include page="../../../base.jsp"></jsp:include>
</head>
<body>

	<!-- header -->
	<jsp:include page="../common/header.jsp"></jsp:include>

	<div class="layui-container fly-marginTop">
		<div class="fly-panel fly-panel-user" pad20>
			<div class="layui-tab layui-tab-brief" lay-filter="user">
				<ul class="layui-tab-title">
					<li><a href="user/login?param=login">登入</a></li>
					<li class="layui-this">注册</li>
				</ul>
				<div class="layui-form layui-tab-content" id="LAY_ucm"
					style="padding: 20px 0;">
					<div class="layui-tab-item layui-show">
						<div class="layui-form layui-form-pane">
							<form method="post">
								<div class="layui-form-item">
									<label for="L_email" class="layui-form-label">邮箱</label>
									<div class="layui-input-inline">
										<input type="text" id="L_email" name="email" required
											lay-verify="email" autocomplete="off" class="layui-input">
									</div>
									<div class="layui-form-mid layui-word-aux">将会成为您唯一的登入名</div>
								</div>
								<div class="layui-form-item">
									<label for="L_nickName" class="layui-form-label">昵称</label>
									<div class="layui-input-inline">
										<input type="text" id="L_nickName" name="nickName" required
											lay-verify="nickName" autocomplete="off" class="layui-input">
									</div>
									<div id="V_nickName"
										style="color:red !important;display: none;"
										class="layui-form-mid layui-word-aux">
										<i class="layui-icon">&#xe69c;</i> 昵称已经存在
									</div>
								</div>
								<div class="layui-form-item">
									<label for="L_pass" class="layui-form-label">密码</label>
									<div class="layui-input-inline">
										<input type="password" id="L_password" name="password"
											required lay-verify="repassword" autocomplete="off"
											class="layui-input">
									</div>
									<div class="layui-form-mid layui-word-aux">6到16个字符</div>
								</div>
								<div class="layui-form-item">
									<label for="L_repass" class="layui-form-label">确认密码</label>
									<div class="layui-input-inline">
										<input type="password" id="L_repassword" name="repassword"
											required lay-verify="repassword" autocomplete="off"
											class="layui-input">
									</div>
									<div id="V_repassword"
										style="color:red !important;display: none;"
										class="layui-form-mid layui-word-aux">
										<i class="layui-icon">&#xe69c;</i> 密码不一致
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
									<button class="layui-btn" lay-filter="userReg" lay-submit>立即注册</button>
								</div>
								<div class="layui-form-item fly-form-app">
									<span>或者直接使用社交账号快捷注册</span> <a href=""
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
	<jsp:include page="../common/footer.jsp"></jsp:include>

	<script type="text/javascript">
		layui.use([ 'layer', 'form', 'jquery' ], function() {
			var layer = layui.layer;
			var form = layui.form;
			var $ = layui.jquery;
			//layer.msg('Hello!!');
			//自定义验证规则
			form.verify({
				nickName : function(value) {
					if (value.length < 2) {
						return '昵称至少得2个字符啊';
					}
				},
				repassword : [
					/^[\S]{6,12}$/, '密码必须6到16位，且不能出现空格'
				],
				content : function(value) {
					layedit.sync(editIndex);
				}
			});
	
			var valideNickName = false;
			var validePass = false;
			$("#L_nickName").on('blur', function(e) {
				$.post('user/queryUser',
					{
						nickName : this.value
					}, function(res) {
						if (res.flag && res.data) {
							document.getElementById('V_nickName').style.display = 'none';
							valideNickName = true;
						} else {
							layer.msg('昵称已经存在!!');
							document.getElementById('V_nickName').style.display = 'table';
							valideNickName = false;
						}
					});
			});
	
			$("#L_repassword").on('blur', function(e) {
				var password = $('#L_password').val();
				if (this.value != password) {
					document.getElementById('V_repassword').style.display = 'table';
					validePass = false;
				} else {
					document.getElementById('V_repassword').style.display = 'none';
					validePass = true;
				}
			});
	
			form.on('submit(userReg)', function(data) {
				if (valideNickName && validePass) {
					  $.post('user/doReg', data.field, function(result) {
						if (result.flag) {
							layer.msg('注册成功，即将跳转登录页面...', {
								icon : 1,
								time : 3000 //3秒关闭（如果不配置，默认是3秒）
							},function(){
								window.location.href='user/login';
							});
						} else {
							alert('error');
						}
					});  
				} 
				//阻止form提交表单
				return false;
			});
		});
	</script>
</body>
</html>
