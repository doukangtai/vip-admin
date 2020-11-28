<%--
  Created by IntelliJ IDEA.
  User: DKT
  Date: 2020/11/17
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>伍幺柒美发店会员管理系统</title>
    <style>
        body {
            background: url("${pageContext.request.contextPath}/images/bg1.jpg") no-repeat center -100px;
            background-size: cover;
        }
        .title1, .title2 {
            font-size: 60px;
            color: #9dcaff;
            font-style: italic;
            text-shadow: 3px 3px 5px #83ACDB;
        }
        .box {
            text-align: center;
            margin-top: 100px;
        }
        .box a {
            font-size: 30px;
            color: #75b3c2;
            text-decoration: none;
            margin-top: 100px;
            display: inline-block;
            margin-right: 20px;
            margin-left: 20px;
        }
        .box a:hover {
            color: #ffffff;
        }
    </style>
</head>
<body>
<div class="box">
    <span class="title1">欢迎使用</span><br/>
    <span class="title2">伍幺柒美发店会员管理系统</span><br/>
    <span><a href="${pageContext.request.contextPath}/customer/loginPage">我是顾客</a> <a href="${pageContext.request.contextPath}/employee/loginPage">我是员工</a> <a href="${pageContext.request.contextPath}/admin/loginPage">我是管理员</a> </span><br/>
</div>
</body>
</html>
