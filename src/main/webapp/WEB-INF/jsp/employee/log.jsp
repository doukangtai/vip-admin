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
                        <li class="nav-item active"> <a class="home" href="${pageContext.request.contextPath}/employee/page/index"><i class="mdi mdi-home"></i> 后台首页</a> </li>
                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="mdi mdi-file-outline"></i> 顾客管理</a>
                            <ul class="nav nav-subnav">
                                <li> <a href="${pageContext.request.contextPath}/employee/page/customer">顾客列表</a> </li>
                                <li> <a href="${pageContext.request.contextPath}/employee/page/customer/add">添加顾客</a> </li>
                                <li> <a href="${pageContext.request.contextPath}/employee/page/customer/charge">顾客结账、充值</a> </li>
                                <li> <a href="${pageContext.request.contextPath}/employee/page/customer/update">修改顾客信息</a> </li>
                                <li> <a href="${pageContext.request.contextPath}/employee/page/customer/recycle">回收站</a> </li>
                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav active open">
                            <a href="javascript:void(0)"><i class="mdi mdi-altimeter"></i>订单管理</a>
                            <ul class="nav nav-subnav">
                                <li class="active"> <a href="${pageContext.request.contextPath}/employee/page/log">管理订单</a> </li>
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
                                <div class="row" style="margin-bottom: 10px">
                                    <div class="form-controls col-xs-3">
                                        <input id="cphone" class="form-control" type="text" placeholder="请输入顾客手机号">
                                    </div>
                                    <div class="col-xs-3">
                                        <input id="ephone" class="form-control" type="text" placeholder="请输入员工手机号">
                                    </div>
                                    <div class="col-xs-3">
                                        <button id="select-btn" type="button" class="btn btn-success btn-primary">查 询</button>
                                    </div>
                                </div>

                                <div id="page-out-div" class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>编号</th>
                                            <th>顾客姓名</th>
                                            <th>顾客手机号</th>
                                            <th>员工姓名</th>
                                            <th>员工手机号</th>
                                            <th>消费项目名</th>
                                            <th>单价</th>
                                            <th>会员名</th>
                                            <th>折扣</th>
                                            <th>消费金额</th>
                                            <th>消费日期</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
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
        $(document).ready(function(){
            $("#page-out-div").append("<ul id=\"xjzPagination\" class=\"pagination\"></ul>")
            $.ajax({
                type : "GET",
                url : "${pageContext.request.contextPath}/employee/log/count/total",
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
                                url : "${pageContext.request.contextPath}/employee/log/page?startIndex=" + (currentPage - 1) * 5 + "&len=" + 5,
                                success : function(result) {
                                    for (let i in result) {
                                        let str = "<tr>\n"+
                                            "<td>"+result[i].lid+"</td>\n"+
                                            "<td>"+result[i].cname+"</td>\n"+
                                            "<td>"+result[i].cphone+"</td>\n"+
                                            "<td>"+result[i].ename+"</td>\n"+
                                            "<td>"+result[i].ephone+"</td>\n"+
                                            "<td>"+result[i].fname+"</td>\n"+
                                            "<td>"+result[i].fprice+"</td>\n"+
                                            "<td>"+result[i].vname+"</td>\n"+
                                            "<td>"+result[i].vdiscount+"</td>\n"+
                                            "<td>"+result[i].money+"</td>\n"+
                                            "<td>"+result[i].time+"</td>\n"+
                                            "<td>\n" +
                                            "<button lid=\""+result[i].lid+"\" class=\"revoke-btn btn btn-yellow btn-xs btn-primary\">撤销</button>\n" +
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
        $("#select-btn").click(function () {
            let urlPage = ''
            let urlData = ''
            if ($("#cphone").val() == '' && $("#ephone").val() == '') {
                urlPage = "${pageContext.request.contextPath}/employee/log/count/total";
                urlData = "${pageContext.request.contextPath}/employee/log/page?"
            } else if ($("#ephone").val() == '') {
                urlPage = "${pageContext.request.contextPath}/employee/log/count/customer?phone=" + $("#cphone").val()
                urlData = "${pageContext.request.contextPath}/employee/log/page/customer?phone=" + $("#cphone").val()
            } else if ($("#cphone").val() == '') {
                urlPage = "${pageContext.request.contextPath}/employee/log/count/employee?phone=" + $("#ephone").val()
                urlData = "${pageContext.request.contextPath}/employee/log/page/employee?phone=" + $("#ephone").val()
            } else {
                urlPage = "${pageContext.request.contextPath}/employee/log/count/ce?cphone=" + $("#cphone").val() + "&ephone=" + $("#ephone").val()
                urlData = "${pageContext.request.contextPath}/employee/log/page/ce?cphone=" + $("#cphone").val() + "&ephone=" + $("#ephone").val()
            }

            $("#xjzPagination").remove();
            $("#page-out-div").append("<ul id=\"xjzPagination\" class=\"pagination\"></ul>")

            $.ajax({
                type : "GET",
                url : urlPage,
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
                                url : urlData + "&startIndex=" + (currentPage - 1) * 5 + "&len=" + 5,
                                success : function(result) {
                                    for (let i in result) {
                                        let str = "<tr>\n"+
                                            "<td>"+result[i].lid+"</td>\n"+
                                            "<td>"+result[i].cname+"</td>\n"+
                                            "<td>"+result[i].cphone+"</td>\n"+
                                            "<td>"+result[i].ename+"</td>\n"+
                                            "<td>"+result[i].ephone+"</td>\n"+
                                            "<td>"+result[i].fname+"</td>\n"+
                                            "<td>"+result[i].fprice+"</td>\n"+
                                            "<td>"+result[i].vname+"</td>\n"+
                                            "<td>"+result[i].vdiscount+"</td>\n"+
                                            "<td>"+result[i].money+"</td>\n"+
                                            "<td>"+result[i].time+"</td>\n"+
                                            "<td>\n" +
                                            "<button lid=\""+result[i].lid+"\" class=\"revoke-btn btn btn-yellow btn-xs btn-primary\">撤销</button>\n" +
                                            "<button lid=\""+result[i].lid+"\" class=\"delete-btn btn btn-danger btn-xs btn-primary\">删除</button>\n" +
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
        })
        $("tbody").on("click", ".revoke-btn", function () {
            let lid = $(this).attr("lid")
            $.ajax({
                type : "GET",
                url : "${pageContext.request.contextPath}/employee/log/revoke?lid=" + lid,
                success : function(result) {
                    alert(result.msg)
                    window.location.href = "${pageContext.request.contextPath}/employee/page/log";
                },
                error : function(e){
                    console.log(e.status);
                    console.log(e.responseText);
                }
            });
        })
        $("tbody").on("click", ".delete-btn", function () {
            let lid = $(this).attr("lid")
            $.ajax({
                type : "GET",
                url : "${pageContext.request.contextPath}/employee/log/delete?lid=" + lid,
                success : function(result) {
                    alert(result.msg)
                    window.location.href = "${pageContext.request.contextPath}/employee/page/log";
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
