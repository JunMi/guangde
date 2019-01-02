

layui.define([ 'layer', 'form' ], function(exports) {

	var $ = layui.jquery;
	var layer = layui.layer;
	var form = layui.form;
	

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
		newpass : [
			/^[\S]{6,12}$/, '密码必须6到16位，且不能出现空格'
		]
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
	$("#L_repass").on('blur', function(e) {
		var newpass = $('#L_newpass').val();
		if (this.value != newpass) {
			document.getElementById('V_repassword').style.display = 'table';
			validePass = false;
		} else {
			document.getElementById('V_repassword').style.display = 'none';
			validePass = true;
		}
	});

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

	form.on('submit(updatePassword)', function(data) {
		if (validePass && rePass) {
			$.post('user/updatePassword', data.field, function(result) {
				if (result.flag) {
					layer.msg('修改成功', {
						icon : 1,
						time : 3000 //3秒关闭（如果不配置，默认是3秒）
					});
				} else {
					alert('error');
				}
			});
		}
		//阻止form提交表单
		return false;
	});

	//上传头像
	if ($('.upload-img')[0]) {
		layui.use('upload', function(upload) {
			var avatarAdd = $('.avatar-add');

			upload.render({
				elem : '.upload-img',
				url : '/user/upload/',
				size : 50,
				before : function() {
					avatarAdd.find('.loading').show();
				},
				done : function(res) {
					if (res.status == 0) {
						$.post('/user/set/', {
							avatar : res.url
						}, function(res) {
							location.reload();
						});
					} else {
						layer.msg(res.msg, {
							icon : 5
						});
					}
					avatarAdd.find('.loading').hide();
				},
				error : function() {
					avatarAdd.find('.loading').hide();
				}
			});
		});
	}




	exports('user_mod', function() {
		alert('Hello World!');
	});

});