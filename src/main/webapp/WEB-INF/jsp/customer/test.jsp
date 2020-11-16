<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DKT
  Date: 2020/11/16
  Time: 22:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
Test
<c:if test="${attr!=null}">
    ${attr}
</c:if>
<c:if test="${attr==null}">
    attr为空
</c:if>
<c:if test="${mdv!=null}">
    ${mdv}
</c:if>
<c:if test="${mdv==null}">
    mdv为空
</c:if>

<input id="inputId"/>
<input type="button" id="subBtn" value="提交">

<script type="text/javascript" src="js/jquery-3.5.1.js"></script>
<script type="text/javascript">
    $("#subBtn").click(function () {
        console.log('aaa')
        $("#inputId").val("内容")
    })
</script>
</body>
</html>
