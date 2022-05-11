
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<html>
<head>
    <base href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/"/>

    <title>Title</title>
    <script type="text/javascript">
        function courseDelete(sid,cid) {
            if(confirm("您确定要退课吗？")) {
                window.location="servlet/LoginServlet/look?type=tuike&sid=" +sid+"&cid="+cid;

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
<%--
SELECT b.sid,b.sname,c.cid,c.cname,c.credit,a.score--%>
<%--                from optcou a--%>
<%--                join student b on a.sid=b.sid--%>
<%--                join course c on c.cid=a.cid--%>
<%--                where a.sid=#{sid}--%>
                <td>${stat.index+1}</td>
                <td>${o.sid}</td>
                <td>${o.student.sname}</td>
                <td>${o.cid}</td>
                <td>${o.course.cname}</td>
                <td>${o.course.credit}</td>
                <td>${o.score}</td>
                <td><button onclick="courseDelete(${o.sid},${o.cid}) ">退课</button></td>
            </tr>
        </c:forEach>

</tbody>
</table>
</div>
</body>
</html>
