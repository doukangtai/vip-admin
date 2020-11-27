<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DKT
  Date: 2020/11/16
  Time: 21:18
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
                        <li class="nav-item nav-item-has-subnav active open">
                            <a href="javascript:void(0)"><i class="mdi mdi-sign-text"></i> 员工管理</a>
                            <ul class="nav nav-subnav">
                                <li class="active"> <a href="${pageContext.request.contextPath}/admin/page/employee/all">员工列表</a> </li>
                                <li> <a href="${pageContext.request.contextPath}/admin/page/employee/add">添加员工</a> </li>
                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="mdi mdi-file-outline"></i> 顾客管理</a>
                            <ul class="nav nav-subnav">
                                <li> <a href="${pageContext.request.contextPath}/admin/page/customer">顾客列表</a> </li>
                                <li> <a href="${pageContext.request.contextPath}/admin/page/customer/add">添加顾客</a> </li>
                                <li> <a href="${pageContext.request.contextPath}/admin/page/customer/charge">顾客结账、充值</a> </li>
                                <li> <a href="${pageContext.request.contextPath}/admin/page/customer/update">修改顾客信息</a> </li>
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
                            <div class="card-toolbar clearfix">
                                <div class="toolbar-btn-action">
                                    <div class="modal fade" id="updateEmployee" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                    <h4 class="modal-title" id="exampleModalLabel">修改员工信息</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <form>
                                                        <div class="form-group">
                                                            <label for="eid" class="control-label">编号：</label>
                                                            <input type="text" class="form-control" id="eid" disabled>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="name" class="control-label">姓名：</label>
                                                            <input type="text" class="form-control" id="name">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="phone" class="control-label">手机号：</label>
                                                            <input type="text" class="form-control" id="phone">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="password" class="control-label">密码：</label>
                                                            <input type="text" class="form-control" id="password">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="address" class="control-label">住址：</label>
                                                            <input type="text" class="form-control" id="address">
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="lyear-switch switch-success">是否任职：
                                                                <input id="isFire" type="checkbox" checked="">
                                                                <span></span>
                                                            </label>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                    <button type="button" class="btn btn-primary" id="save-employee">保存修改</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div style="padding-left: 30px">
                                <button id="isNotFire-btn" class="btn btn-round btn-primary btn-success">任职中</button>
                                <button id="isFire-btn" class="btn btn-round btn-primary btn-secondary">被解雇</button>
                                    <div style="display: inline-block; margin-left: 30px">
                                        <input id="select-phone" class="form-control" type="text" placeholder="请输入手机号">
                                    </div>
                                <button id="select-btn" style="margin-left: 10px" class="btn btn-round btn-primary btn-info">查 询</button>
                            </div>
                            <div class="card-body">

                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>编号</th>
                                            <th>姓名</th>
                                            <th>手机号</th>
                                            <th>密码</th>
                                            <th>住址</th>
                                            <th>是否任职</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>${employee.eid}</td>
                                            <td>${employee.name}</td>
                                            <td>${employee.phone}</td>
                                            <td>${employee.password}</td>
                                            <td>${employee.address}</td>
                                            <c:if test="${employee.isFire == 0}">
                                                <td><font class="text-success">任职中</font></td>
                                            </c:if>
                                            <c:if test="${employee.isFire == 1}">
                                                <td><font class="text-success">被解雇</font></td>
                                            </c:if>
                                            <td>
                                                <div class="btn-group">
                                                    <a class="btn btn-xs btn-default edit" eid="${employee.eid}" href="javascript:void(0)" title="编辑" data-toggle="modal" data-target="#updateEmployee"><i class="mdi mdi-pencil"></i></a>
                                                </div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>

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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/main.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/page/jquery.xjzPagination.min.js"></script>
<script type="text/javascript">
    $(function(){
        $('.search-bar .dropdown-menu a').click(function() {
            var field = $(this).data('field') || '';
            $('#search-field').val(field);
            $('#search-btn').html($(this).text() + ' <span class="caret"></span>');
        });
        $('#updateEmployee').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget)
            var recipient = button.data('whatever')
            var modal = $(this)
            // modal.find('.modal-title').text('发送新消息给 ' + recipient)
            modal.find('.modal-body input').val(recipient)
        });
        $("tbody").on("click", ".edit", function () {
            let index = $(".edit").index(this)
            let eid = $(".edit").eq(index).attr("eid")
            $.ajax({
                type : "GET",
                url : "${pageContext.request.contextPath}/admin/employee/selectByPrimaryKey?eid=" + eid,
                success : function(result) {
                    $("#eid").val(result.eid)
                    $("#name").val(result.name)
                    $("#phone").val(result.phone)
                    $("#password").val(result.password)
                    $("#address").val(result.address)
                    if (result.isFire == 1) {
                        $("#isFire").attr("checked", false);
                    } else if (result.isFire == 0) {
                        $("#isFire").prop("checked","checked");
                    }
                },
                error : function(e){
                    console.log(e.status);
                    console.log(e.responseText);
                }
            });
        });
        $("#save-employee").click(function () {
            let eid = $("#eid").val()
            let name = $("#name").val()
            let phone = $("#phone").val()
            let password = $("#password").val()
            let address = $("#address").val()
            let list = {};
            list.eid = eid
            list.name = name
            list.phone = phone
            list.password = password
            list.address = address
            list.isFire = $("#isFire").prop("checked") == true ? 0 : 1
            $.ajax({
                type : "POST",
                contentType: "application/json;charset=UTF-8",
                url : "${pageContext.request.contextPath}/admin/employee/updateByPrimaryKey",
                data : JSON.stringify(list),
                success : function(result) {
                    alert(result.msg)
                    if (result.status == 'success') {
                        window.location.href = "${pageContext.request.contextPath}/admin/page/employee/all";
                    }
                },
                error : function(e){
                    console.log(e.status);
                    console.log(e.responseText);
                }
            });
        });
        $("#isFire-btn").click(function () {
            window.location.href = "${pageContext.request.contextPath}/admin/page/employee/fire";
        })
        $("#isNotFire-btn").click(function () {
            window.location.href = "${pageContext.request.contextPath}/admin/page/employee/notFire";
        })
        $("#select-btn").click(function () {
            let phoneNum = $("#select-phone").val()
            console.log(phoneNum)
            if (phoneNum == '') {
                alert("请输入手机号再进行查询");
            } else {
                window.location.href = "${pageContext.request.contextPath}/admin/page/employee/" + phoneNum;
            }
        })
    });
</script>
</body>
</html>
