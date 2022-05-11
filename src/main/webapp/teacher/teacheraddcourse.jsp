<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/5/10
  Time: 16:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<html>
<head>
    <base href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/"/>

    <title>老师登录页面</title>
    <script>
    </script>
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
</head>
<body>
<div style="height:100%;width:80%;float:left;">

        <div style="width: 100%; background-color: lightcyan;align-content: center;">


            <form action="servlet/TeacherServlet/teacheraddcourse" method="post"  >
                <h3>课号：</h3> <input type="text" name="cid"><br>
                <h3>课名：</h3> <input type="text" name="cname"><br>
                <h3>学分：</h3><input type="text" name="credit"><br>
                <button type="submit" style="margin-top: 10px">确定添加</button>

            </form>
        </div>
</div>
</body>
</html>
