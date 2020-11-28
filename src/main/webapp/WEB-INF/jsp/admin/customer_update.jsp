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
            <div style="height: 65px;width: 210px" id="logo" class="sidebar-header">
                <a href="${pageContext.request.contextPath}/admin/page/index" style="height: 65px;width: 210px;line-height: 65px;font-size: 25px">伍幺柒美发</a>
            </div>
            <div class="lyear-layout-sidebar-scroll">

                <nav class="sidebar-main">
                    <ul class="nav nav-drawer">
                        <li class="nav-item active"> <a class="home" href="${pageContext.request.contextPath}/admin/page/index"><i class="mdi mdi-home"></i> 后台首页</a> </li>
                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="mdi mdi-sign-text"></i> 员工管理</a>
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
                                <li> <a href="${pageContext.request.contextPath}/admin/page/customer/charge">顾客结账、充值</a> </li>
                                <li class="active"> <a href="${pageContext.request.contextPath}/admin/page/customer/update">修改顾客信息</a> </li>
                                <li> <a href="${pageContext.request.contextPath}/admin/page/customer/recycle">回收站</a> </li>
                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="mdi mdi-arrange-send-to-back"></i>会员卡、服务项目管理</a>
                            <ul class="nav nav-subnav">
                                <li> <a href="${pageContext.request.contextPath}/admin/page/vip">会员卡管理</a> </li>
                                <li> <a href="${pageContext.request.contextPath}/admin/page/fee">服务项目管理</a> </li>
                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="mdi mdi-altimeter"></i>订单管理</a>
                            <ul class="nav nav-subnav">
                                <li> <a href="${pageContext.request.contextPath}/admin/page/log">管理订单</a> </li>
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
                                    <input type="hidden" class="form-control" id="cid" />
                                    <div class="form-group col-md-12">
                                        <label for="phone">手机号</label>
                                        <input type="text" class="form-control" id="phone" name="phone" value="" placeholder="请输入顾客手机号" />
                                    </div>
                                    <div class="form-group col-md-12">
                                        <button id="select-customer" type="button" class="btn btn-primary">查 询</button>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label for="name">姓名</label>
                                        <input type="text" class="form-control" id="name" name="name" value="" placeholder="请输入顾客姓名" />
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label for="phone2">手机号</label>
                                        <input type="text" class="form-control" id="phone2" name="phone2" value="" placeholder="请输入顾客手机号" />
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label for="password">密码</label>
                                        <input type="text" class="form-control" id="password" name="password" value="" placeholder="请输入顾客登录密码" />
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label for="money">余额</label>
                                        <input type="text" class="form-control" id="money" name="money" value="" placeholder="请输入顾客充值的金额" />
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label for="vip">会员</label>
                                        <div class="form-controls">
                                            <select name="vip" class="form-control" id="vip">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label for="isLogoutVip">VIP是否有效</label>
                                        <div class="form-controls">
                                            <select name="isLogoutVip" class="form-control" id="isLogoutVip">
                                                <option value="0">VIP有效</option>
                                                <option value="1">VIP无效</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <button id="customer-charge" type="button" class="btn btn-primary">保 存</button>
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
                url : "${pageContext.request.contextPath}/admin/allVip",
                success : function(result) {
                    $("#vip").html('')
                    for (let i in result) {
                        $("#vip").append("<option value="+result[i].vid+">"+result[i].name+"</option>")
                    }

                },
                error : function(e){
                    console.log(e.status);
                    console.log(e.responseText);
                }
            });
            $.ajax({
                type : "GET",
                url : "${pageContext.request.contextPath}/admin/customerVip/" + $("#phone").val(),
                success : function(result) {
                    $("#cid").val(result.cid)
                    $('#name').val(result.name);
                    $('#phone2').val(result.phone);
                    $("#password").val(result.password)
                    $("#money").val(result.money)
                    $("#vip").val(result.vip.vid)
                    $("#isLogoutVip").val(result.isLogoutVip)
                },
                error : function(e){
                    console.log(e.status);
                    console.log(e.responseText);
                }
            });
        })
        $('#customer-charge').click(function () {
            let list = {};
            list.cid = $("#cid").val()
            list.name = $('#name').val();
            list.phone = $('#phone2').val();
            list.password = $('#password').val();
            list.money = $('#money').val();
            list.vid = $('#vip').val();
            list.isLogoutVip = $('#isLogoutVip').val();
            $.ajax({
                type : "POST",
                contentType: "application/json;charset=UTF-8",
                url : "${pageContext.request.contextPath}/admin/customer/update",
                data : JSON.stringify(list),
                success : function(result) {
                    alert(result.msg)
                    $("#cid").val('')
                    $('#phone').val('');
                    $('#name').val('');
                    $('#phone2').val('');
                    $("#password").val('')
                    $("#money").val('')
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
