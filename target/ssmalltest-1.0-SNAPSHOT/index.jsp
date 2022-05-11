<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<html>
<head>
    <title>Title</title>
<%--    <script src="<%=request.getContextPath() %>/webjars/jquery/3.1.1/jquery.min.js"></script>--%>
    <base href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/"/>
<%--    <meta http-equiv="pragma" content="no-cache">--%>
<%--    <meta http-equiv="cache-control" content="no-cache">--%>
<%--    <meta http-equiv="expires" content="0">--%>
<%--    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">--%>
<%--    <meta http-equiv="description" content="This is my page">--%>
    <style type="text/css">
    p,input,label,select,button{
        font-size:20px;
    }
    html{
        width: 100%;
        height: 100%;
        overflow: hidden;
        font-style: oblique;
    }
    body{
        width: 100%;
        height: 100%;
        margin: 0;
        background:lightblue ;
    }
    #login {
        width:400px;
        margin:100px auto;
        /*	color:red;
             border:1px solid #F00; */
        background-color:#BBFFEE;
        padding:10px 0;
    }
    h1 {
        padding:20px 0px 0 0;
        text-align: center;
        color:darkseagreen;
    }
    label {
        color:dodgerblue;
    }
    .input {
        border:0px;
        width:100%;
        border-radius:3px;
        padding:5px;
    }
    button {
        width:100%;
        border:0;
        border-radius: 5px;
        padding: 5px;
    }
    p {
        padding: 0px 30px 5px 30px;
    }
</style>
</head>
<body>
<div id="login">
    <h1>欢迎登录</h1>
    <form action="servlet/LoginServlet/login" method="post">
        <!-- required表示该字段必填 -->
        <p><input class="input" type="text" placeholder="账号" required="required" name="number" value="" /></p>
        <p><input class="input" type="password" placeholder="密码" required="required" name="password" value=""/></p>
        <p><label>选择登录身份：</label>
            <select name="identity">
                <option value="student">学生</option>
                <option value="teacher">教师</option>
                <option value="admin">管理员</option>
            </select>
        </p>
        <p><input type="checkbox" name="isUseCookie" checked="checked" />记住密码(非本人电脑请勿勾选)</p>
        <p id="button"><button type="submit">登录</button></p>
    </form>
</div>
</body>
</html>
