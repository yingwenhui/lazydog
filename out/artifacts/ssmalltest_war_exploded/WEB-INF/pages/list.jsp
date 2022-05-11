<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/4/16
  Time: 14:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach items="${accountList}" var="a">
    <tr>
        <td>${a.id}</td>
        <td>${a.name}</td>
        <td>${a.money}</td>
    </tr>
</c:forEach>
</body>
</html>
