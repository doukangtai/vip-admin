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
                <a href="${pageContext.request.contextPath}/customer/page/index" style="height: 65px;width: 210px;line-height: 65px;font-size: 25px">伍幺柒美发</a>
            </div>
            <div class="lyear-layout-sidebar-scroll">

                <nav class="sidebar-main">
                    <ul class="nav nav-drawer">
                        <li class="nav-item active"> <a class="home" href="${pageContext.request.contextPath}/customer/page/index"><i class="mdi mdi-home"></i> 首页</a> </li>
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/customer/page/vip"><i class="mdi mdi-arrange-send-to-back"></i>会员卡</a></li>
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/customer/page/fee"><i class="mdi mdi-content-paste"></i>服务项目</a></li>
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/customer/page/log"><i class="mdi mdi-altimeter"></i>消费记录</a></li>
                    </ul>
                </nav>

                <div class="sidebar-footer">
                    <p class="copyright">Copyright &copy; 2020. DKT All rights reserved.</p>
                </div>
            </div>

        </aside>
        <!--End 左侧导航-->

        <!--头部信息-->
        <%@ include file="../common/customer/top.jsp" %>
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
                                            <th>名称</th>
                                            <th>单价</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${fees}" var="fee">
                                            <tr>
                                                <td>${fee.fid}</td>
                                                <td>${fee.name}</td>
                                                <td>${fee.price}</td>
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
</script>
</body>
</html>
