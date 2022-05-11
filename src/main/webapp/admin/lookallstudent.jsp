<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/5/10
  Time: 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<html>
<head>
    <base href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/"/>

    <title>管理员登录页面</title>
<style>
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
function AdminstudentDelete(sid) {
    if(confirm("您确定要删除该学生吗？此操作将同时删除该学生的选课情况，请谨慎点击")) {
        window.location="servlet/AdminServlet/lookallstudent?type7=deletestudent&sid="+sid;
    }


}

    </script>
</head>
<body>
<div style="height:100%;width:80%;float:left;">
    <table class="" style="width: 100%; background-color: lightcyan;border:solid #00BBFF ">
        <thead>

        <tr>
            <th>序号</th>
            <th>学号</th>
            <th >名字</th>
            <th colspan="2">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach   var="s" items="${studentList}" varStatus="stat">
            <tr>

                <td>${stat.index+1}</td>
                <td>${s.sid}</td>
                <td>${s.sname}</td>
                <td ><button  onclick="AdminstudentDelete(${s.sid})">删除学生</button></td>

            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>
</body>
</html>
