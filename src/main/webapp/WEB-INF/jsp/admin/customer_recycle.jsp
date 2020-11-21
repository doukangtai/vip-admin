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
                                <li> <a href="${pageContext.request.contextPath}/admin/page/customer/charge">顾客结账、充值</a> </li>
                                <li> <a href="${pageContext.request.contextPath}/admin/page/customer/update">修改顾客信息</a> </li>
                                <li class="active"> <a href="${pageContext.request.contextPath}/admin/page/customer/recycle">回收站</a> </li>
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

                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>编号</th>
                                            <th>姓名</th>
                                            <th>手机号</th>
                                            <th>密码</th>
                                            <th>余额</th>
                                            <th>会员名称</th>
                                            <th>会员折扣</th>
                                            <th>VIP是否有效</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                            <ul id="xjzPagination" class="pagination"></ul>
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
        $(document).ready(function(){
            $.ajax({
                type : "GET",
                url : "${pageContext.request.contextPath}/admin/customer/count/delete",
                success : function(result) {
                    let remainder = result % 5
                    let pageSize = Math.floor(result / 5)
                    if (remainder != 0) {
                        pageSize += 1
                    }
                    $("#xjzPagination").xjzPagination({
                        totalPages: pageSize,
                        onPageClick: function (currentPage) {
                            $("table tbody").html('')
                            $.ajax({
                                type : "GET",
                                url : "${pageContext.request.contextPath}/admin/customer/page/delete?startIndex=" + (currentPage - 1) * 5 + "&len=" + 5,
                                success : function(result) {
                                    for (let i in result) {
                                        let temp = ''
                                        if (result[i].isLogoutVip == 0) {
                                            temp = "VIP有效";
                                        } else {
                                            temp = "VIP无效"
                                        }
                                        let str = "<tr>\n"+
                                            "<td>"+result[i].cid+"</td>\n"+
                                            "<td>"+result[i].name+"</td>\n"+
                                            "<td>"+result[i].phone+"</td>\n"+
                                            "<td>"+result[i].password+"</td>\n"+
                                            "<td>"+result[i].money+"</td>\n"+
                                            "<td>"+result[i].vip.name+"</td>\n"+
                                            "<td>"+result[i].vip.discount+"</td>\n"+
                                            "<td><font class=\"text-success\">"+temp+"</font></td>\n" +
                                            "<td>\n" +
                                            "<button cid=\""+result[i].cid+"\" class=\"recycle-btn btn btn-success btn-xs btn-primary\">还原</button>\n" +
                                            "</td>\n"+
                                            "</tr>";
                                        $("tbody").append(str)
                                    }
                                },
                                error : function(e){
                                    console.log(e.status);
                                    console.log(e.responseText);
                                }
                            });
                        }
                    });
                },
                error : function(e){
                    console.log(e.status);
                    console.log(e.responseText);
                }
            });
        });
        $("tbody").on("click", ".recycle-btn", function () {
            let index = $(".recycle-btn").index(this)
            let cid = $(".recycle-btn").eq(index).attr("cid");
            $.ajax({
                type : "GET",
                url : "${pageContext.request.contextPath}/admin/customer/recycle?cid=" + cid,
                success : function(result) {
                    if (result.status == "success") {
                        alert(result.msg)
                        window.location.href = "${pageContext.request.contextPath}/admin/page/customer/recycle";
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
