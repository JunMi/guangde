

layui.define([ 'layer', 'form','upload' ], function(exports) {
	var $ = layui.jquery;
	var layer = layui.layer;
	var form = layui.form;
	var upload = layui.upload;

	layer.msg('Hello~~~!');

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

	//验证新密码（注册和修改密码通用）
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
	form.on('submit(updateUserInfo)', function(data) {
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
		//阻止form提交表单
		return false;
	});

	//重置密码
	var validePass = false;
	var rePass = false;
	//验证当前密码是否正确
	$("#L_nowpass").on('blur', function(e) {
		if (this.value) {
			$.post('user/validPass', {
				repass : this.value
			}, function(result) {
				if (result.flag) {
					document.getElementById('V_nowpass').style.display = 'none';
					rePass = true;
				} else {
					document.getElementById('V_nowpass').style.display = 'table';
					rePass = false;
				}
			});
		}
	});

	//确认修改
	form.on('submit(updatePassword)', function(data) {
		if (validePass && rePass) {
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
						layer.msg('修改失败，稍后重试', {icon: 2}); 
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




	exports('user', function() {
		alert('Hello World!');
	});

});