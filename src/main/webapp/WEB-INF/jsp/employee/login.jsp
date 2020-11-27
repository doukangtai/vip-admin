<%--
  Created by IntelliJ IDEA.
  User: DKT
  Date: 2020/11/16
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>员工登录页</title>
    <link rel="icon" href="${pageContext.request.contextPath}/favicon.ico" type="image/ico">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.min.css" rel="stylesheet">
    <style>
        .lyear-wrapper {
            position: relative;
        }
        .lyear-login {
            display: flex !important;
            min-height: 100vh;
            align-items: center !important;
            justify-content: center !important;
        }
        .lyear-login:after{
            content: '';
            min-height: inherit;
            font-size: 0;
        }
        .login-center {
            background-color: rgba(255,255,255,.075);
            min-width: 29.25rem;
            padding: 2.14286em 3.57143em;
            border-radius: 3px;
            margin: 2.85714em;
        }
        .login-header {
            margin-bottom: 1.5rem !important;
        }
        .login-center .has-feedback.feedback-left .form-control {
            padding-left: 38px;
            padding-right: 12px;
            background-color: rgba(255,255,255,.075);
            border-color: rgba(255,255,255,.075)
        }
        .login-center .has-feedback.feedback-left .form-control-feedback {
            left: 0;
            right: auto;
            width: 38px;
            height: 38px;
            line-height: 38px;
            z-index: 4;
            color: #dcdcdc;
        }
        .login-center .has-feedback.feedback-left.row .form-control-feedback {
            left: 15px;
        }
        .login-center .form-control::-webkit-input-placeholder{
            color: rgba(255, 255, 255, .8);
        }
        .login-center .form-control:-moz-placeholder{
            color: rgba(255, 255, 255, .8);
        }
        .login-center .form-control::-moz-placeholder{
            color: rgba(255, 255, 255, .8);
        }
        .login-center .form-control:-ms-input-placeholder{
            color: rgba(255, 255, 255, .8);
        }
        .login-center .custom-control-label::before {
            background: rgba(0, 0, 0, 0.3);
            border-color: rgba(0, 0, 0, 0.1);
        }
        .login-center .lyear-checkbox span::before {
            border-color: rgba(255,255,255,.075)
        }
        .tit {
            font-size: 20px;
            color: #00f3ff;
        }
    </style>
</head>

<body>
<div class="row lyear-wrapper" style="background-image: url(${pageContext.request.contextPath}/images/login-bg-3.jpg); background-size: cover;">
    <div class="lyear-login">
        <div class="login-center">
            <div class="login-header text-center">
                <span class="tit">员工登录页</span>
            </div>
            <form action="#!" method="post">
                <div class="form-group has-feedback feedback-left">
                    <input value="15550310403" type="text" placeholder="请输入您的手机号" class="form-control" name="phone" id="phone" />
                    <span class="mdi mdi-account form-control-feedback" aria-hidden="true"></span>
                </div>
                <div class="form-group has-feedback feedback-left">
                    <input value="123456" type="password" placeholder="请输入密码" class="form-control" id="password" name="password" />
                    <span class="mdi mdi-lock form-control-feedback" aria-hidden="true"></span>
                </div>
                <div class="form-group">
                    <button class="btn btn-block btn-primary login-button" type="button">立即登录</button>
                </div>
            </form>
            <footer class="col-sm-12 text-center text-white">
                <p class="m-b-0">Copyright © 2020 DKT. All right reserved</p>
            </footer>
        </div>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(function(){
        $('.login-button').click(function () {
            let list = {};
            list.phone = $('#phone').val();
            list.password = $('#password').val();
            list.type = 0;
            $.ajax({
                type : "POST",
                contentType: "application/json;charset=UTF-8",
                url : "${pageContext.request.contextPath}/employee/login",
                data : JSON.stringify(list),
                success : function(result) {
                    console.log(result)
                    if (result.status === 'success') {
                        window.location.href = "${pageContext.request.contextPath}/employee/page/index";
                    }
                },
                error : function(e){
                    console.log(e.status);
                    console.log(e.responseText);
                }
            });
        })
    });
</script>
</body>
</html>
