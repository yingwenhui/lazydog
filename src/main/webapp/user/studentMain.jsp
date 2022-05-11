
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>

<html lang="en">
  <head>

	  <script src="http://code.jquery.com/jquery-latest.js"></script>
	  <script src="http://code.jquery.com/jquery-1.8.0.min.js"></script>
	  <base href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/"/>

	  <title>学生信息系统</title>

<%--	<meta http-equiv="pragma" content="no-cache">--%>
<%--	<meta http-equiv="cache-control" content="no-cache">--%>
<%--	<meta http-equiv="expires" content="0">    --%>
<%--	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">--%>
<%--	<meta http-equiv="description" content="This is my page">--%>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style>
	.f1{
		background-color: darkslategray;
	}
	a:hover{
		width: 100%;
		/*background-color: dodgerblue;*/
	}
	a{
		text-decoration-line: none;
		color:inherit;
		/*width:250px;*/
	}

	#allpage li{
		width: 100%;
		height: 40px;
		list-style-type:none;
		margin-top: 10px;
		/*background-color: darkcyan;*/
		font-size: 20px;
		text-align-all: center;
		font-style: oblique;
		color: cadetblue;
	}
	/*#allpage p a{*/
	/*	text-align: center;*/
	/*}*/

</style>

  </head>

  <body>


	  <div id="header" style="background-color:darkslategray;height:70px ">
		  <h2 style="margin-bottom:0;margin-left: 80%;color: lightcyan;font-size: 15px">用户名：${student.sname}</h2>
	  </div>

		<div  id="allpage" class="allpage" style="height:100%;width:20%;float:left;" >
			<ul >
				<c:if test="${identity=='student'}">
					<li class="f1"><a  href="servlet/LoginServlet/firstpage" id="de"> 首页</a></li>
					<li class="f2"><a  href="servlet/LoginServlet/select" id="select">选课</a></li>
					<li class="f3"><a href="servlet/LoginServlet/look" id="look">查看已选课程</a></li>
					<li class="f4"><a href="servlet/LoginServlet/un" id="unlogin">退出登录</a></li>
<%--					 --%>
				</c:if>
				<c:if test="${identity=='teacher'}">
					<li class="f1"><a  href="servlet/LoginServlet/firstpage" id=""> 首页</a></li>
					<li><a href="servlet/TeacherServlet/lookallcourse">查看所有课程</a></li>
					<li><a href="servlet/TeacherServlet/lookallstudent">查看所有学生</a></li>
					<li><a href="servlet/TeacherServlet/teacheraddcourse">添加课程</a></li>
					<li><a href="servlet/TeacherServlet/teacherdafen">课程打分</a></li>
					<li><a href="servlet/LoginServlet/un">退出登录</a></li>
				</c:if>
				<c:if test="${identity=='admin'}">
					<li class="f1"><a  href="servlet/LoginServlet/firstpage" > 首页</a></li>
					<li><a href="servlet/AdminServlet/lookallcourse">查看所有课程</a></li>
					<li><a href="servlet/AdminServlet/lookallstudent">查看所有学生</a></li>
					<li><a href="servlet/AdminServlet/adminaddstudent">添加学生</a></li>
					<li><a href="servlet/AdminServlet/adminaddcourse">添加课程</a></li>
					<li><a href="servlet/LoginServlet/un">退出登录</a></li>
				</c:if>
			</ul>
			

		</div>
		<div id="content" class="" style="height:100%;width:80%;float:left;">
			<jsp:include page="${mainPage==null?'/user/error.jsp':mainPage}"></jsp:include>
		</div>





	  <div id="footer" style="background-color:midnightblue;clear:both;text-align:center;">
		  版权 © runoob.com</div>



  </body>
  <script>
	  // $(function () {
		//   $(".allpage li").each(function () {
		// 	  // console.log(window.location);
		// 	  // console.log($($(this))[0].href);
		// 	  if ($(this).href == String(window.location)){
		//
		// 	  }
		// 		  $(this).addClass('f1');
		//   });
	  // });
	  $(document).ready(function() {
		  $('.allpage li a').each(function() {
			  if ($($(this))[0].href == String(window.location)) {
				  $('.allpage ul li').removeClass("f1");
				  $(this).parent().addClass('f1');
			  };
		  });
	  });
	  // $(".allpage li").click(function(){
		//   $("#allpage li").removeClass("f1");
		//   $(this).addClass("f1");
	  //
	  //
		//   // $(current).toggleClass('f1');
	  // });
	  // $('.titleCurrent>ul>li').click(function(){
		//   $('.titleCurrent>ul>li>a').removeClass("current");
		//   $(this).addClass("current");
	  // });
	  // $(document).ready(function(){
		//   $("#allpage li").each(function(){
		// 	  $this = $(this);
		// 	  if($this[0].href==String(window.location)){
		// 		  $("#allpage li").removeClass("f1");
		// 		  $this.parent().addClass("f1");  //current 表示选中激活
		// 	  }
		//   });
	  // });





  </script>
</html>
