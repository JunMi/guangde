<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div class="fly-footer">
	<p>
		<a href="javascript:void(0)" target="_blank">Fly社区</a> 2017 &copy; <a
			href="javascript:void(0)" target="_blank">layui.com 出品</a>
	</p>
	<p>
		<a href="javascript:void(0)" target="_blank">付费计划</a> <a
			href="javascript:void(0)" target="_blank">获取Fly社区模版</a> <a
			href="javascript:void(0)" target="_blank">微信公众号</a>
	</p>
</div>

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
		version : "3.1.0",
		base : 'res/mods/' //这里实际使用时，建议改成绝对路径
	}).extend({
		fly : 'index'
	}).use('fly');
</script>

<!-- <script type="text/javascript">
	var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
	document.write(unescape("%3Cspan id='cnzz_stat_icon_30088308'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "w.cnzz.com/c.php%3Fid%3D30088308' type='text/javascript'%3E%3C/script%3E"));
</script> -->