<%--
  Created by IntelliJ IDEA.
  User: DKT
  Date: 2020/11/28
  Time: 21:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <%@ include file="WEB-INF/jsp/common/head.jsp" %>
    <style>
        body{
            background-color: #fff;
        }
        .error-page {
            height: 100%;
            position: fixed;
            width: 100%;
        }
        .error-body {
            padding-top: 5%;
        }
        .error-body h1 {
            font-size: 210px;
            font-weight: 700;
            text-shadow: 4px 4px 0 #f5f6fa, 6px 6px 0 #33cabb;
            line-height: 210px;
            color: #33cabb;
        }
        .error-body h4 {
            margin: 30px 0px;
        }
    </style>
</head>

<body>
<section class="error-page">
    <div class="error-box">
        <div class="error-body text-center">
            <h1>404</h1>
            <h4>很抱歉，但是那个页面看起来已经不存在了。</h4>
        </div>
    </div>
</section>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript">;</script>
</body>
</html>
