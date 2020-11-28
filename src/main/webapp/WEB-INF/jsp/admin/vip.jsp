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
                                <li class="active"> <a href="${pageContext.request.contextPath}/admin/page/vip">会员卡管理</a> </li>
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
                            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="exampleModalLabel">修改会员卡</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form>
                                                <div class="form-group">
                                                    <label for="vid" class="control-label">编号</label>
                                                    <input disabled type="text" class="form-control" id="vid">
                                                </div>
                                                <div class="form-group">
                                                    <label for="name" class="control-label">名称</label>
                                                    <input class="form-control" id="name"/>
                                                </div>
                                                <div class="form-group">
                                                    <label for="discount" class="control-label">折扣</label>
                                                    <input class="form-control" id="discount"/>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                            <button id="save-vip" type="button" class="btn btn-primary">保存</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">

                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>编号</th>
                                            <th>名称</th>
                                            <th>折扣</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${vips}" var="vip">
                                            <tr>
                                                <td>${vip.vid}</td>
                                                <td>${vip.name}</td>
                                                <td>${vip.discount}</td>
                                                <td>
                                                    <div class="btn-group btn-group-xs">
                                                        <button vid="${vip.vid}" data-toggle="modal" data-target="#exampleModal" class="btn btn-purple btn-default edit-btn">编辑</button>
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
        $(".edit-btn").click(function () {
            let index = $(".edit-btn").index(this);
            let vid = $(".edit-btn").eq(index).attr("vid");
            $.ajax({
                type : "GET",
                url : "${pageContext.request.contextPath}/admin/vip/select?vid=" + vid,
                success : function(result) {
                    $("#vid").val(result.vid)
                    $("#name").val(result.name)
                    $("#discount").val(result.discount)
                },
                error : function(e){
                    console.log(e.status);
                    console.log(e.responseText);
                }
            });
        })
        $("#save-vip").click(function () {
            let list = {};
            list.vid = $("#vid").val()
            list.name = $("#name").val()
            list.discount = $("#discount").val()
            $.ajax({
                type : "POST",
                contentType: "application/json;charset=UTF-8",
                url : "${pageContext.request.contextPath}/admin/vip/save",
                data : JSON.stringify(list),
                success : function(result) {
                    alert(result.msg)
                    window.location.href = "${pageContext.request.contextPath}/admin/page/vip";
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
