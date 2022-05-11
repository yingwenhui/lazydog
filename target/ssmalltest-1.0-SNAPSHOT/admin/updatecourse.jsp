<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/5/11
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<html>
<head>
    <base href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/"/>

    <title>管理员登录页面</title>
    <script>
        function check() {
            var flag=false;
           var cname= document.getElementById("cname").value;
            var credit= document.getElementById("credit").value;
            if(cname==""||cname==null){
                flag=false;
                alert("课名不能为空");
                return flag;
            }
            if(credit>=10||credit<=0){
                flag=false;
                alert("学分范围应该在1-10之间，请正确输入");
                return flag;
            }

        }
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


        <form action="servlet/AdminServlet/lookallcourse?type6=updateend" method="post" onsubmit="return check()" >
            <h3>课号：</h3> <input id="cid" type="text" name="cid" value="${course.cid}" readonly><br>
            <h3>课名：</h3> <input id="cname" type="text" name="cname" value="${course.cname}"><br>
            <h3>学分：</h3><input id="credit" type="text" name="credit" value="${course.credit}"><br>
            <button type="submit" style="margin-top: 10px" >确定修改</button>

        </form>
    </div>
</div>
</body>
</html>
