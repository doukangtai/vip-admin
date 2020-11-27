<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DKT
  Date: 2020/11/19
  Time: 19:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <%@ include file="../common/head.jsp" %>
</head>

<body>
<div class="lyear-layout-web">
    <div class="lyear-layout-container">
        <!--左侧导航-->
        <aside class="lyear-layout-sidebar">

            <!-- logo -->
            <div id="logo" class="sidebar-header">
                <a href="${pageContext.request.contextPath}/index.html"><img src="${pageContext.request.contextPath}/images/logo-sidebar.png" title="LightYear" alt="LightYear" /></a>
            </div>
            <div class="lyear-layout-sidebar-scroll">

                <nav class="sidebar-main">
                    <ul class="nav nav-drawer">
                        <li class="nav-item active"> <a class="home" href="${pageContext.request.contextPath}/employee/page/index"><i class="mdi mdi-home"></i> 后台首页</a> </li>
                        <li class="nav-item nav-item-has-subnav active open">
                            <a href="javascript:void(0)"><i class="mdi mdi-file-outline"></i> 顾客管理</a>
                            <ul class="nav nav-subnav">
                                <li> <a href="${pageContext.request.contextPath}/employee/page/customer">顾客列表</a> </li>
                                <li> <a href="${pageContext.request.contextPath}/employee/page/customer/add">添加顾客</a> </li>
                                <li class="active"> <a href="${pageContext.request.contextPath}/employee/page/customer/charge">顾客结账、充值</a> </li>
                                <li> <a href="${pageContext.request.contextPath}/employee/page/customer/update">修改顾客信息</a> </li>
                                <li> <a href="${pageContext.request.contextPath}/employee/page/customer/recycle">回收站</a> </li>
                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="mdi mdi-altimeter"></i>订单管理</a>
                            <ul class="nav nav-subnav">
                                <li> <a href="${pageContext.request.contextPath}/employee/page/log">管理订单</a> </li>
                            </ul>
                        </li>
                    </ul>
                </nav>

                <div class="sidebar-footer">
                    <p class="copyright">Copyright &copy; 2020. DKT All rights reserved.</p>
                </div>
            </div>

        </aside>
        <!--End 左侧导航-->

        <!--头部信息-->
        <%@ include file="../common/employee/top.jsp" %>
        <!--End 头部信息-->

        <!--页面主要内容-->
        <main class="lyear-layout-content">

            <div class="container-fluid">

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">

                                <form action="#!" method="post" class="row">
                                    <div class="form-group col-md-12">
                                        <label for="phone">手机号</label>
                                        <input type="text" class="form-control" id="phone" name="phone" value="" placeholder="请输入顾客手机号" />
                                    </div>
                                    <div class="form-group col-md-12">
                                        <button id="select-customer" type="button" class="btn btn-primary">查 询</button>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label for="name">姓名</label>
                                        <input disabled type="text" class="form-control" id="name" name="name" value="" placeholder="顾客姓名" />
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label for="money">余额</label>
                                        <input disabled type="text" class="form-control" id="money" name="money" value="" placeholder="顾客余额" />
                                    </div>
                                    <div class="form-group col-md-12">
                                        <div class="row">
                                            <label class="col-xs-6" for="cost">结账</label>
                                            <label class="col-xs-6" for="charge">充值</label>
                                        </div>
                                        <div class="row">
                                            <div class="form-controls col-xs-6">
                                                <select name="cost" class="form-control" id="cost">
                                                </select>
                                            </div>
                                            <div class="col-xs-6">
                                                <input id="charge" class="form-control" type="text" placeholder="请输入充值金额">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-6" style="margin-top: 10px">
                                                <button id="customer-cost" type="button" class="btn btn-yellow btn-primary">结 账</button>
                                            </div>
                                            <div class="col-xs-6" style="margin-top: 10px">
                                                <button id="customer-charge" type="button" class="btn btn-info btn-primary">充 值</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </main>
        <!--End 页面主要内容-->
    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/perfect-scrollbar.min.js"></script>
<!--标签插件-->
<script src="${pageContext.request.contextPath}/js/jquery-tags-input/jquery.tagsinput.min.js"></script>
<!--对话框-->
<script src="${pageContext.request.contextPath}/js/jconfirm/jquery-confirm.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/main.min.js"></script>
<script type="text/javascript">
    $(function(){
        $(document).ready(function(){
            $.ajax({
                type : "GET",
                url : "${pageContext.request.contextPath}/employee/allFee",
                success : function(result) {
                    $("#cost option").remove()
                    for (let i in result) {
                        $("#cost").append("<option value=\""+result[i].fid+"\">"+result[i].name+"---"+result[i].price+"元"+"</option>")
                    }
                },
                error : function(e){
                    console.log(e.status);
                    console.log(e.responseText);
                }
            });
        });
        $('#select-customer').click(function () {
            $.ajax({
                type : "GET",
                url : "${pageContext.request.contextPath}/employee/customer/" + $("#phone").val(),
                success : function(result) {
                    $('#name').val(result.name);
                    $('#money').val(result.money);
                },
                error : function(e){
                    console.log(e.status);
                    console.log(e.responseText);
                }
            });
        })
        $('#customer-charge').click(function () {
            $.ajax({
                type : "GET",
                url : "${pageContext.request.contextPath}/employee/customer/" + $("#phone").val() + "/" + $("#charge").val(),
                success : function(result) {
                    $('#name').val('');
                    $('#money').val('');
                    $('#phone').val('');
                    $('#charge').val('');
                    alert(result.msg)
                },
                error : function(e){
                    console.log(e.status);
                    console.log(e.responseText);
                }
            });
        })
        $('#customer-cost').click(function () {
            $.ajax({
                type : "GET",
                url : "${pageContext.request.contextPath}/employee/customer/cost/" + $("#phone").val() + "/" + $("#cost option:selected").val(),
                success : function(result) {
                    $('#name').val('');
                    $('#money').val('');
                    $('#phone').val('');
                    $('#charge').val('');
                    alert(result.msg)
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
