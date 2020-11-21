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
                        <li class="nav-item active"> <a class="home" href="${pageContext.request.contextPath}/admin/page/index"><i class="mdi mdi-home"></i> 后台首页</a> </li>
                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="mdi mdi-home"></i> 员工管理</a>
                            <ul class="nav nav-subnav">
                                <li> <a href="${pageContext.request.contextPath}/admin/page/employee/all">员工列表</a> </li>
                                <li> <a href="${pageContext.request.contextPath}/admin/page/employee/add">添加员工</a> </li>
                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav active open">
                            <a href="javascript:void(0)"><i class="mdi mdi-file-outline"></i> 顾客管理</a>
                            <ul class="nav nav-subnav">
                                <li> <a href="${pageContext.request.contextPath}/admin/page/customer">顾客列表</a> </li>
                                <li> <a href="${pageContext.request.contextPath}/admin/page/customer/add">添加顾客</a> </li>
                                <li class="active"> <a href="${pageContext.request.contextPath}/admin/page/customer/charge">顾客收费、充值</a> </li>
                                <li> <a href="${pageContext.request.contextPath}/admin/page/customer/update">修改顾客信息</a> </li>
                                <li> <a href="${pageContext.request.contextPath}/admin/page/customer/recycle">回收站</a> </li>
                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="mdi mdi-language-javascript"></i> JS 插件</a>
                            <ul class="nav nav-subnav">
                                <li> <a href="javascript:void(0)">表格</a> </li>
                                <li> <a href="javascript:void(0)">模态框</a> </li>
                                <li> <a href="javascript:void(0)">警告框</a> </li>
                            </ul>
                        </li>
                    </ul>
                </nav>

                <div class="sidebar-footer">
                    <p class="copyright">Copyright &copy; 2019. <a target="_blank" href="${pageContext.request.contextPath}/http://lyear.itshubao.com">IT书包</a> All rights reserved.</p>
                </div>
            </div>

        </aside>
        <!--End 左侧导航-->

        <!--头部信息-->
        <%@ include file="../common/admin/top.jsp" %>
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
                                        <label for="charge">收费、充值金额</label>
                                        <input type="text" class="form-control" id="charge" name="charge" value="" placeholder="请输入收费或充值金额" />
                                    </div>
                                    <div class="form-group col-md-12">
                                        <button id="customer-cost" type="button" class="btn btn-yellow btn-primary">收 费</button>
                                        <button id="customer-charge" type="button" class="btn btn-info btn-primary">充 值</button>
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
        $('#select-customer').click(function () {
            $.ajax({
                type : "GET",
                url : "${pageContext.request.contextPath}/admin/customer/" + $("#phone").val(),
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
                url : "${pageContext.request.contextPath}/admin/customer/" + $("#phone").val() + "/" + $("#charge").val(),
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
                url : "${pageContext.request.contextPath}/admin/customer/cost/" + $("#phone").val() + "/" + $("#charge").val(),
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
