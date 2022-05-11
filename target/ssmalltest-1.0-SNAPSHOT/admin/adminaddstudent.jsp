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

    <title>管理员登录页面</title>
    <script>
        function check() {
            var flag=false;
            var sid= document.getElementById("sid").value;
            var spwd= document.getElementById("spwd").value;
           var sname= document.getElementById("sname").value;
            if(sid==""||sid==null){
                flag=false;
                alert("学号不能为空");
                return flag;
            }
            if(spwd==""||spwd==null){
                flag=false;
                alert("密码不能为空");
                return flag;
            }
            if(sname==""||sname==null){
                flag=false;
                alert("姓名不能为空");
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

            <form action="servlet/AdminServlet/adminaddstudent?type8=updatestudentend" method="post" onsubmit="return check()" >
                <h3>学号：</h3> <input id="sid" type="text" name="sid"  ><br>
                <h3>密码：</h3> <input id="spwd" type="text" name="spwd"><br>
                <h3>姓名：</h3><input id="sname" type="text" name="sname"><br>
                <button type="submit" style="margin-top: 10px" >确定添加</button>

            </form>

        </div>
</div>
</body>
</html>
