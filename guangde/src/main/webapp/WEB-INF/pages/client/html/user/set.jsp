<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>帐号设置</title>
<jsp:include page="../../../base.jsp"></jsp:include>
</head>
<body>
	<!-- header -->
	<jsp:include page="../common/header.jsp"></jsp:include>

	<div class="layui-container fly-marginTop fly-user-main">

		<jsp:include page="../common/user-nav.jsp"></jsp:include>

		<div class="fly-panel fly-panel-user" pad20>
			<div class="layui-tab layui-tab-brief" lay-filter="user">
				<ul class="layui-tab-title" id="LAY_mine">
					<li class="layui-this" lay-id="info">我的资料</li>
					<li lay-id="avatar">头像</li>
					<li lay-id="pass">密码</li>
					<li lay-id="bind">帐号绑定</li>
				</ul>
				<div class="layui-tab-content" style="padding: 20px 0;">
					<!-- 我的资料 -->
					<div class="layui-form layui-form-pane layui-tab-item layui-show">
						<form method="post">
							<div class="layui-form-item">
								<label for="L_set_email" class="layui-form-label">邮箱</label>
								<div class="layui-input-inline">
									<input type="text" id="L_set_email" name="email" required
										lay-verify="email" autocomplete="off"
										email="${sessionScope.user.email }"
										value="${sessionScope.user.email }" class="layui-input">
								</div>
								<div id="V_email"
									style="color:red !important;display: none;"
									class="layui-form-mid layui-word-aux">
									<i class="layui-icon">&#xe69c;</i> 邮箱已经存在
								</div>
								<div class="layui-form-mid layui-word-aux">
									如果您在邮箱已激活的情况下，变更了邮箱，需<a href="user/activate"
										style="font-size: 12px; color: #4f99cf;">重新验证邮箱</a>。
								</div>
							</div>
							<div class="layui-form-item">
								<label for="L_set_nickName" class="layui-form-label">昵称</label>
								<div class="layui-input-inline">
									<input type="text" id="L_set_nickName" name="nickName" required
										lay-verify="nickName" autocomplete="off"
										nickName="${sessionScope.user.nickName }"
										value="${sessionScope.user.nickName }" class="layui-input">
								</div>
								<div id="V_nickName"
									style="color:red !important;display: none;"
									class="layui-form-mid layui-word-aux">
									<i class="layui-icon">&#xe69c;</i>昵称已经存在
								</div>
								<div class="layui-inline">
									<div class="layui-input-inline">
										<input type="radio" name="gender" value="0"
											<c:if test="${sessionScope.user.gender==0 }">checked</c:if>
											title="男"> <input type="radio" name="gender"
											value="1"
											<c:if test="${sessionScope.user.gender==1 }">checked</c:if>
											title="女">
									</div>
								</div>
							</div>
							<div class="layui-form-item">
								<label for="L_fromCity" class="layui-form-label">城市</label>
								<div class="layui-input-inline">
									<input type="text" id="L_fromCity" name="fromCity"
										autocomplete="off" value="${sessionScope.user.fromCity }"
										class="layui-input">
								</div>
							</div>
							<div class="layui-form-item layui-form-text">
								<label for="L_sign" class="layui-form-label">签名</label>
								<div class="layui-input-block">
									<textarea placeholder="随便写些什么刷下存在感" id="L_sign" name="sign"
										autocomplete="off" class="layui-textarea"
										style="height: 80px;">${sessionScope.user.sign }</textarea>
								</div>
							</div>
							<div class="layui-form-item">
								<button class="layui-btn" key="set-mine"
									lay-filter="updateUserInfo" lay-submit>确认修改</button>
							</div>
						</form>
					</div>
					<!-- 头像 -->
					<div class="layui-form layui-form-pane layui-tab-item">
						<div class="layui-form-item">
							<div class="avatar-add">
								<p>建议尺寸168*168，支持jpg、png、gif，最大不能超过50KB</p>
								<button type="button" class="layui-btn upload-img">
									<i class="layui-icon">&#xe67c;</i>上传头像
								</button>
								<img src="${userPhoto}"> <span class="loading"></span>
							</div>
						</div>
					</div>
					<!-- 密码 -->
					<div class="layui-form layui-form-pane layui-tab-item">
						<form method="post">
							<div class="layui-form-item">
								<label for="L_nowpass" class="layui-form-label">当前密码</label>
								<div class="layui-input-inline">
									<input type="password" id="L_nowpass" name="nowpass" required
										lay-verify="required" autocomplete="off" class="layui-input">
								</div>
								<div id="V_nowpass" style="color:red !important;display: none;"
									class="layui-form-mid layui-word-aux">
									<i class="layui-icon">&#xe69c;</i> 密码不正确
								</div>
							</div>
							<div class="layui-form-item">
								<label for="L_newpass" class="layui-form-label">新密码</label>
								<div class="layui-input-inline">
									<input type="password" id="L_password" name="password" required
										lay-verify="password" autocomplete="off" class="layui-input">
								</div>
								<div class="layui-form-mid layui-word-aux">6到16个字符</div>
							</div>
							<div class="layui-form-item">
								<label for="L_repass" class="layui-form-label">确认密码</label>
								<div class="layui-input-inline">
									<input type="password" id="L_repassword" name="repass" required
										lay-verify="required" autocomplete="off" class="layui-input">
								</div>
								<div id="V_repassword"
									style="color:red !important;display: none;"
									class="layui-form-mid layui-word-aux">
									<i class="layui-icon">&#xe69c;</i> 密码不一致
								</div>
							</div>
							<div class="layui-form-item">
								<button class="layui-btn" key="set-mine"
									lay-filter="updatePassword" lay-submit>确认修改</button>
							</div>
						</form>
					</div>
					<!-- 帐号绑定 -->
					<div class="layui-form layui-form-pane layui-tab-item">
						<ul class="app-bind">
							<li class="fly-msg app-havebind"><i class="iconfont icon-qq"></i>
								<span>已成功绑定，您可以使用QQ帐号直接登录Fly社区，当然，您也可以</span> <a
								href="javascript:;" class="acc-unbind" type="qq_id">解除绑定</a> <!-- <a href="" onclick="layer.msg('正在绑定微博QQ', {icon:16, shade: 0.1, time:0})" class="acc-bind" type="qq_id">立即绑定</a>
                <span>，即可使用QQ帐号登录Fly社区</span> --></li>
							<li class="fly-msg"><i class="iconfont icon-weibo"></i> <!-- <span>已成功绑定，您可以使用微博直接登录Fly社区，当然，您也可以</span>
                <a href="javascript:;" class="acc-unbind" type="weibo_id">解除绑定</a> -->

								<a href="" class="acc-weibo" type="weibo_id"
								onclick="layer.msg('正在绑定微博', {icon:16, shade: 0.1, time:0})">立即绑定</a>
								<span>，即可使用微博帐号登录Fly社区</span></li>
						</ul>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>

	<script type="text/javascript">
		layui.use([ 'user' ], function() {
			var user = layui.user;
		});
	</script>
</body>
</html>
