<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page isELIgnored="false"%>
<html lang="">
<head>
    <base href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/"/>

    <title>Title</title>
    <script type="text/javascript">
        function courseAdd() {
            var flag=false;
            if(confirm("您确定要选择该课吗？")) {
            flag=true;
            }
            return flag;
        }


    </script>
</head>
<body>
<div style="height:100%;width:80%;float:left;">
    <div style="width: 100%; background-color: lightcyan;align-content: center">
        <form action="servlet/LoginServlet/select?type2=add" method="post">

        <h3 >请选择要添加的课程</h3>
        <select  style="width:200px;height: 30px;" name="cadd">
            <c:forEach   var="courselist" items="${courseList}" varStatus="stat">

                <option value="${courselist.cid}"> 课号：${courselist.cid}&nbsp;课名：${courselist.cname}</option>
            </c:forEach>
            <option value="0" selected="selected">课程</option>
        </select>
        <button type="submit" onclick="return courseAdd()">添加课程</button>
    </form>
    </div>
    <table class="" style="width: 100%; background-color: lightcyan;border:solid #00BBFF ">
        <thead>
        <tr>
            <th>序号</th>
            <th width="15%">课号</th>
            <th>课程名称</th>
            <th>学分</th>
            <th >状态</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach   var="c" items="${courseList}" varStatus="stat">
            <tr>
                <td>${stat.index+1}</td>
                <td>${c.cid}</td>
                <td>${c.cname}</td>
                <td>${c.credit}</td>
                <c:set var="status" value="未选"></c:set>
            <c:forEach   var="o" items="${optcouList}" varStatus="stat">

                <c:if test="${o.cid==c.cid}">
                    <c:set var="status" value="已选"></c:set>
                </c:if>

            </c:forEach>
                <td>${status}</td>


<%--                <td><button class="btn btn-mini btn-info" type="button" onclick="javascript:window.location='dormbuild?action=preupdate&dormbuildid=${dormBuild.id}'">修改</button>--%>
<%--                    <button class="btn btn-mini btn-danger" type="button" onclick="dormBuildDelete(${dormBuild.id})">删除</button>--%>
<%--                </td>--%>
                    <%--							>
                    <button class="btn btn-mini btn-info" type="button" onclick="javascript:window.location='dormbuild?action=manager&dormBuildId=${dormBuild.id}'">管理员</button>&nbsp;
                                    --%>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>
</body>
</html>
