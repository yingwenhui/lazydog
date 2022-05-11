<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/5/9
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<html lang="en">
<head>
    <base href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/"/>

    <title>老师登录页面</title>
<style>
    #openadd{
        /*display: none;*/
        position: absolute
    }

    th,td{
        width: 80px;
        text-align: center;
    }
    button{
        width: 80px;
        background-color: cadetblue;
    }
</style>
    <script type="text/javascript">


        function TeachercourseDelete(cid) {

            if(confirm("您确定要删除该课程吗？")) {
                window.location="servlet/TeacherServlet/lookallcourse?type3=delete&cid="+cid;
            }

        }


    </script>
</head>
<body>
<div style="height:100%;width:80%;float:left;">


    <table class="" style="border:solid cadetblue ;width: 100%;" >
    <thead>
    <tr>
        <th>序号</th>
        <th>课号</th>
        <th>课名</th>
        <th >学分</th>
        <th >操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach   var="o" items="${courseList}" varStatus="stat">
        <tr>
            <td>${stat.index+1}</td>
            <td>${o.cid}</td>
            <td>${o.cname}</td>
            <td>${o.credit}</td>
            <td ><button  onclick="TeachercourseDelete(${o.cid})">删除课程</button></td>

        </tr>
    </c:forEach>

    </tbody>
</table>
</div>
</body>
</html>


