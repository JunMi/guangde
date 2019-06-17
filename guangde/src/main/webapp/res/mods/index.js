/**

 @Name: Fly社区主入口
1:首頁置顶列表
 */


layui.define([ 'layer', 'laytpl', 'form', 'element', 'upload', 'util' ], function(exports) {

	var $ = layui.jquery,
		layer = layui.layer,
		laytpl = layui.laytpl,
		form = layui.form,
		element = layui.element,
		upload = layui.upload,
		util = layui.util,
		device = layui.device();

		//DISABLED = 'layui-btn-disabled';

    layer.msg('加载index页面成功!');

    //渲染top模版
    $.post('article/getArticleList',
    	{},function(res){
    		//debugger
    		//console.log(res);
    		if(res.flag){
    			var data =res.data;
    			var getTpl = listtmpl.innerHTML;
				var view = document.getElementById('list-top');
				laytpl(getTpl).render(res, function(html){
				  view.innerHTML = html;
				});
    		}    		
    	});
    

	


	exports('index',null);

});