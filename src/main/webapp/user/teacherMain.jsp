<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>

<html>
  <head>
    <title>教师登录</title>

<%--	<meta http-equiv="pragma" content="no-cache">--%>
<%--	<meta http-equiv="cache-control" content="no-cache">--%>
<%--	<meta http-equiv="expires" content="0">    --%>
<%--	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">--%>
<%--	<meta http-equiv="description" content="This is my page">--%>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		* {
/* 			border:1px solid #F00; */
		}
		body {

			text-align:center;
			
		}
		#wel {
			margin: 100px 400px 0 400px;
			border:1px solid #000;
		}
		a {
			font-size:1.5em;
			background: #BBFFEE;
		}
		a:hover {background: #00BBFF;}
	</style>

  </head>
  
  <body>
  	
  	<div id="wel">
  		<h1>欢迎登录，${student.sname}教师</h1>
  		<p><a href="servlet/StudentServlet?action=lookup">选课</a></p>
  		<p><a href="studentSelected.jsp">查看已选课程</a></p>
  		<p><a href="servlet/LoginServlet?action=logout">退出登录</a></p>
  	</div>
  </body>
</html>
