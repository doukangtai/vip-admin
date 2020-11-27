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
                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="mdi mdi-sign-text"></i> 员工管理</a>
                            <ul class="nav nav-subnav">
                                <li> <a href="${pageContext.request.contextPath}/admin/page/employee/all">员工列表</a> </li>
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
                        <li class="nav-item nav-item-has-subnav active open">
                            <a href="javascript:void(0)"><i class="mdi mdi-arrange-send-to-back"></i>会员卡、服务项目管理</a>
                            <ul class="nav nav-subnav">
                                <li> <a href="${pageContext.request.contextPath}/admin/page/vip">会员卡管理</a> </li>
                                <li class="active"> <a href="${pageContext.request.contextPath}/admin/page/fee">服务项目管理</a> </li>
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
                            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="exampleModalLabel">修改服务项目</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form>
                                                <div class="form-group">
                                                    <label for="fid" class="control-label">编号</label>
                                                    <input disabled type="text" class="form-control" id="fid">
                                                </div>
                                                <div class="form-group">
                                                    <label for="name" class="control-label">名称</label>
                                                    <input class="form-control" id="name"/>
                                                </div>
                                                <div class="form-group">
                                                    <label for="price" class="control-label">单价</label>
                                                    <input class="form-control" id="price"/>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                            <button id="save-fee" type="button" class="btn btn-primary">保存</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="exampleModalLabel2">添加服务项目</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form>
                                                <div class="form-group">
                                                    <label for="name2" class="control-label">名称</label>
                                                    <input class="form-control" id="name2"/>
                                                </div>
                                                <div class="form-group">
                                                    <label for="price2" class="control-label">单价</label>
                                                    <input class="form-control" id="price2"/>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                            <button id="add-fee" type="button" class="btn btn-primary">添加</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <button data-toggle="modal" data-target="#exampleModal2" class="btn btn-success btn-default add-btn" style="margin-bottom: 10px">添加</button>

                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>编号</th>
                                            <th>名称</th>
                                            <th>单价</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${fees}" var="fee">
                                            <tr>
                                                <td>${fee.fid}</td>
                                                <td>${fee.name}</td>
                                                <td>${fee.price}</td>
                                                <td>
                                                    <div class="btn-group btn-group-xs">
                                                        <button fid="${fee.fid}" data-toggle="modal" data-target="#exampleModal" class="btn btn-purple btn-default edit-btn">编辑</button>
                                                        <button fid="${fee.fid}" class="btn btn-danger btn-default delete-btn">删除</button>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
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
    $(function () {
        $(".delete-btn").click(function () {
            let index = $(".delete-btn").index(this);
            let fid = $(".delete-btn").eq(index).attr("fid");
            $.ajax({
                type : "GET",
                url : "${pageContext.request.contextPath}/admin/fee/delete?fid=" + fid,
                success : function(result) {
                    alert(result.msg)
                    window.location.href = "${pageContext.request.contextPath}/admin/page/fee";
                },
                error : function(e){
                    console.log(e.status);
                    console.log(e.responseText);
                }
            });
        })
        $("#add-fee").click(function () {
            let list = {}
            list.name = $("#name2").val()
            list.price = $("#price2").val()
            $.ajax({
                type : "POST",
                contentType: "application/json;charset=UTF-8",
                url : "${pageContext.request.contextPath}/admin/fee/add",
                data : JSON.stringify(list),
                success : function(result) {
                    alert(result.msg)
                    window.location.href = "${pageContext.request.contextPath}/admin/page/fee";
                },
                error : function(e){
                    console.log(e.status);
                    console.log(e.responseText);
                }
            });
        })
        $(".edit-btn").click(function () {
            let index = $(".edit-btn").index(this);
            let fid = $(".edit-btn").eq(index).attr("fid");
            $.ajax({
                type : "GET",
                url : "${pageContext.request.contextPath}/admin/fee/select?fid=" + fid,
                success : function(result) {
                    $("#fid").val(result.fid)
                    $("#name").val(result.name)
                    $("#price").val(result.price)
                },
                error : function(e){
                    console.log(e.status);
                    console.log(e.responseText);
                }
            });
        })
        $("#save-fee").click(function () {
            let list = {};
            list.fid = $("#fid").val()
            list.name = $("#name").val()
            list.price = $("#price").val()
            $.ajax({
                type : "POST",
                contentType: "application/json;charset=UTF-8",
                url : "${pageContext.request.contextPath}/admin/fee/save",
                data : JSON.stringify(list),
                success : function(result) {
                    alert(result.msg)
                    window.location.href = "${pageContext.request.contextPath}/admin/page/fee";
                },
                error : function(e){
                    console.log(e.status);
                    console.log(e.responseText);
                }
            });
        })
    })
</script>
</body>
</html>
