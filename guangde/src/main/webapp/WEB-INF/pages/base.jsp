<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<link rel="stylesheet" href="res/layui/css/layui.css">
<link rel="stylesheet" href="res/css/global.css">

<script src="res/layui/layui.js"></script>
