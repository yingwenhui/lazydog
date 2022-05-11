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
    <script>
        function coursescore(sid,cid) {
            var name = prompt("请给该课程打分：", "分数");
            if(name==""||name==null||name=="null"){
                alert("请输入正确的分数");
            }else{
                name=parseInt(name);
                if(name>=0 && name<=100)
                {
                    window.location="servlet/TeacherServlet/teacherdafen?type5=dafen&score="+name+"&sid=" +sid+"&cid="+cid;
                } else{
                    alert("请输入正确的分数");
                }
            }
        }
    </script>
</head>
<body>
<div style="height:100%;width:80%;float:left;">
<div style="width: 100%; background-color: lightcyan;">
<table class="" style="border:solid cadetblue ;width: 100%;" >
    <thead>
    <tr>
        <th>序号</th>
        <th>学号</th>
        <th >名字</th>
        <th>课号</th>
        <th>课名</th>
        <th >学分</th>
        <th>成绩</th>

        <th >操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach   var="o" items="${optcous}" varStatus="stat">
        <tr>

            <td>${stat.index+1}</td>
            <td>${o.sid}</td>
            <td>${o.student.sname}</td>
            <td>${o.cid}</td>
            <td>${o.course.cname}</td>
            <td>${o.course.credit}</td>
            <td>${o.score}</td>
            <td ><button  onclick="coursescore(${o.sid},${o.cid})">打分</button></td>

        </tr>
    </c:forEach>

    </tbody>
</table>
</div>
</div>
</body>
</html>
