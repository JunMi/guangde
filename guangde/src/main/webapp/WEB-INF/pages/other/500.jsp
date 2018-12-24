<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>500</title>
<jsp:include page="../base.jsp"></jsp:include>
</head>
<body>

	<!-- header -->
	<jsp:include page="../client/html/common/header.jsp"></jsp:include>
	<!-- column -->
	<jsp:include page="../client/html/common/column.jsp"></jsp:include>

	<div class="layui-container fly-marginTop">
		<div class="fly-panel">
		  <div class="fly-none">
		    <h2><i class="iconfont icon-tishilian"></i></h2>
	      <p>非常抱歉，系统发生错误，稍后恢复。。。<br>或请联系管理员。。。</p>
		  </div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../client/html/common/footer.jsp"></jsp:include>

</body>
</html>
