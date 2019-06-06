
/**
 * 用户模块
 * 1、注册，登陆，
 * 2、修改个人资料，头像，更新密码
 * 3、找回密码
 */
layui.define([ 'layer', 'form', 'upload' ], function(exports) {
	var $ = layui.jquery;
	var layer = layui.layer;
	var form = layui.form;
	var upload = layui.upload;

	layer.msg('加载页面成功!');

	//自定义验证规则
	form.verify({
		nickName : function(value) {
			if (value.length < 2) {
				return '昵称至少得2个字符啊';
			}
		},
		sign : function(value) {
			if (value.length < 5) {
				return '签名至多得225个字符';
			}
		},
		password : [
			/^[\S]{6,12}$/, '密码必须6到16位，且不能出现空格'
		]
	});

	/**
	 * 注册
	 */
	var userValid = {
		email : true,
		nickName : true,
		password : true,
		rePass : true, //重置密码
		regStatus : function() {
			//返回注册验证状态
			return this.email && this.nickName && this.password;
		},
		rePass : function() {
			//返回更新验证状态
			return this.password && this.rePass;
		},
		updateInfo : function() {
			//返回验证用户信息状态
			return this.email && this.nickName;
		}
	}
	$('#L_email').on('blur', function(e) {
		if (this.value) {
			$.post('user/validEmail', {
				email : this.value
			}, function(res) {
				if (res.flag && res.data) {
					document.getElementById('V_email').style.display = 'none';
					userValid.email = true;
				} else {
					layer.msg('邮箱已经注册，请直接登陆!!');
					document.getElementById('V_email').style.display = 'table';
					userValid.email = false;
				}
			});
		}
	});

	$("#L_nickName").on('blur', function(e) {
		if (this.value) {
			$.post('user/validNickName',
				{
					nickName : this.value
				}, function(res) {
					if (res.flag && res.data) {
						document.getElementById('V_nickName').style.display = 'none';
						userValid.nickName = true;
					} else {
						layer.msg('昵称已经存在!!');
						document.getElementById('V_nickName').style.display = 'table';
						userValid.nickName = false;
					}
				});
		}
	});

	//验证新密码（注册和修改密码通用）
	$("#L_repassword").on('blur', function(e) {
		var password = $('#L_password').val();
		if (this.value != password) {
			document.getElementById('V_repassword').style.display = 'table';
			userValid.password = false;
			layer.msg('密码不一致!!');
		} else {
			document.getElementById('V_repassword').style.display = 'none';
			userValid.password = true;
		}
	});

	form.on('submit(userReg)', function(data) {
		if (userValid.regStatus()) {
			$.post('user/doReg', data.field, function(result) {
				if (result.flag) {
					layer.msg('注册成功，即将跳转登录页面...', {
						icon : 1,
						time : 3000 //3秒关闭（如果不配置，默认是3秒）
					}, function() {
						window.location.href = 'user/login';
					});
				} else {
					alert('error');
				}
			});
		}
		//阻止form提交表单
		return false;
	});


	//我的资料
	//验证邮箱
	$('#L_set_email').on('blur', function(e) {
		var self = $(this).attr('email');
		if (self != this.value) {
			$.post('user/validEmail', {
				email : this.value
			}, function(res) {
				if (res.flag && res.data) {
					document.getElementById('V_email').style.display = 'none';
					userValid.email = true;
				} else {
					layer.msg('邮箱已经存在!!');
					document.getElementById('V_email').style.display = 'table';
					userValid.email = false;
				}
			});
		}
	});
	//验证昵称
	$('#L_set_nickName').on('blur', function(e) {
		var self = $(this).attr('nickName');
		if (self != this.value) {
			$.post('user/validNickName', {
				nickName : this.value
			}, function(res) {
				if (res.flag && res.data) {
					document.getElementById('V_nickName').style.display = 'none';
					userValid.nickName = true;
				} else {
					layer.msg('昵称已经存在!!');
					document.getElementById('V_nickName').style.display = 'table';
					userValid.nickName = false;
				}
			});
		}
	});
	form.on('submit(updateUserInfo)', function(data) {
		if (userValid.updateInfo()) {
			$.post('user/updateUserInfo', data.field,
				function(result) {
					if (result.flag) {
						layer.msg('修改成功', {
							icon : 6,
							time : 3000 //3秒关闭（如果不配置，默认是3秒）
						});
					} else {
						layer.msg('修改失败，请稍后再试', {
							icon : 5,
							time : 3000 //3秒关闭（如果不配置，默认是3秒）
						});
					}
				});
		}
		//阻止form提交表单
		return false;
	});

	//重置密码
	//验证当前密码是否正确
	$("#L_nowpass").on('blur', function(e) {
		if (this.value) {
			$.post('user/validPass', {
				repass : this.value
			}, function(result) {
				if (result.flag) {
					document.getElementById('V_nowpass').style.display = 'none';
					userValid.rePass = true;
				} else {
					document.getElementById('V_nowpass').style.display = 'table';
					userValid.rePass = false;
				}
			});
		}
	});
	//确认修改密码
	form.on('submit(updatePassword)', function(data) {
		if (userValid.rePass()) {
			layer.confirm('确认修改密码？', {
				btn : [ '确认', '取消' ]
			}, function(index, layero) {
				var tips = layer.load(2);
				$.post('user/updatePassword', data.field, function(result) {
					if (result.flag) {
						layer.msg('修改成功', {
							icon : 1,
							time : 3000 //3秒关闭（如果不配置，默认是3秒）
						});
					} else {
						layer.msg('修改失败，稍后重试', {
							icon : 2
						});
					}
					layer.close(tips);
				});
			});
		}
		//阻止form提交表单
		return false;
	});

	//上传头像
	if ($('.upload-img')[0]) {
		var avatarAdd = $('.avatar-add');
		upload.render({
			elem : '.upload-img',
			url : 'user/uploadPhoto',
			size : 50,
			before : function() {
				avatarAdd.find('.loading').show();
			},
			done : function(res) {
				if (res.flag) {
					$.post('user/set', {
						//avatar : res.url
					}, function(res) {
						location.reload();
					});
				} else {
					layer.msg(res.data, {
						icon : 5
					});
				}
				avatarAdd.find('.loading').hide();
			},
			error : function() {
				avatarAdd.find('.loading').hide();
			}
		});
	}

	/**
	 * 找回密码
	 */
	form.on('submit(forgetPass)', function(data) {
		var index = layer.load(1);
		$.post('user/forgetPassword', data.field, function(res) {
			if (res.flag) {
				layer.alert('已成功将相关信息发送到了您的邮箱，接受可能会稍有延迟，请注意查收。', {
					icon : 1
				});
			} else {
				layer.alert(res.data, {
					icon : 5
				});
			}
			layer.close(index);
		});
		return false;
	});


	/**
	 * 发表帖子
	 */
	var article = {};
	form.on('submit(publicArticle)', function(data) {
		var index = layer.load(1);
		$.post('article/updateArticle',data.field,function(res){
			if (res.flag) {
				layer.msg(res.data, {
					icon : 1,
					time : 3000 //（如果不配置，默认是3秒）
				}, function() {
					layer.close(index);
					window.location.href = '/guangde';
				});
			} else {
				layer.alert(res.data, {
					icon : 5
				});
				layer.close(index);
			}
		});
		return false;
	});
	

	exports('user', function() {
		alert('Hello World!');
	});

});