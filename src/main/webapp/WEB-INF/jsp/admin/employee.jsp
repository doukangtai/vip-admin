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
                        <li class="nav-item active"> <a class="home" href="${pageContext.request.contextPath}/admin/index"><i class="mdi mdi-home"></i> 后台首页</a> </li>
                        <li class="nav-item nav-item-has-subnav active open">
                            <a href="javascript:void(0)"><i class="mdi mdi-home"></i> 员工管理</a>
                            <ul class="nav nav-subnav">
                                <li class="active"> <a href="${pageContext.request.contextPath}/admin/employee">员工列表</a> </li>
                                <li> <a href="javascript:void(0)">卡片</a> </li>
                                <li> <a href="javascript:void(0)">格栅</a> </li>
                                <li> <a href="javascript:void(0)">图标</a> </li>
                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="mdi mdi-file-outline"></i> 示例页面</a>
                            <ul class="nav nav-subnav">
                                <li> <a href="javascript:void(0)">分页</a> </li>
                                <li class="active"> <a href="javascript:void(0)">进度条</a> </li>
                                <li> <a href="javascript:void(0)">标签页</a> </li>
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
                            <div class="card-toolbar clearfix">
                                <form class="pull-right search-bar" method="get" action="#!" role="form">
                                    <div class="input-group">
                                        <div class="input-group-btn">
                                            <input type="hidden" name="search_field" id="search-field" value="title">
                                            <button class="btn btn-default dropdown-toggle" id="search-btn" data-toggle="dropdown" type="button" aria-haspopup="true" aria-expanded="false">
                                                标题 <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu">
                                                <li> <a tabindex="-1" href="${pageContext.request.contextPath}/javascript:void(0)" data-field="title">标题</a> </li>
                                                <li> <a tabindex="-1" href="${pageContext.request.contextPath}/javascript:void(0)" data-field="cat_name">栏目</a> </li>
                                            </ul>
                                        </div>
                                        <input type="text" class="form-control" value="" name="keyword" placeholder="请输入名称">
                                    </div>
                                </form>
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
                                    <a class="btn btn-primary m-r-5" href="${pageContext.request.contextPath}/#!"><i class="mdi mdi-plus"></i> 新增</a>
                                    <a class="btn btn-success m-r-5" href="${pageContext.request.contextPath}/#!"><i class="mdi mdi-check"></i> 启用</a>
                                    <a class="btn btn-warning m-r-5" href="${pageContext.request.contextPath}/#!"><i class="mdi mdi-block-helper"></i> 禁用</a>
                                    <a class="btn btn-danger" href="${pageContext.request.contextPath}/#!"><i class="mdi mdi-window-close"></i> 删除</a>
                                </div>
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
                                        <c:forEach items="${employees}" var="employee">
                                            <tr>
                                                <td>${employee.eid}</td>
                                                <td>${employee.name}</td>
                                                <td>${employee.phone}</td>
                                                <td>${employee.password}</td>
                                                <td>${employee.address}</td>
                                                <c:if test="${employee.isFire == 0}">
                                                    <td><font class="text-success">已离职</font></td>
                                                </c:if>
                                                <c:if test="${employee.isFire == 1}">
                                                    <td><font class="text-success">任职中</font></td>
                                                </c:if>
                                                <td>
                                                    <div class="btn-group">
                                                        <a data-toggle="modal" data-target="#updateEmployee" data-whatever="${employee.isFire}" class="btn btn-xs btn-default edit" eid="${employee.eid}" href="javascript:void(0)" title="编辑" data-toggle="tooltip"><i class="mdi mdi-pencil"></i></a>
                                                        <a class="btn btn-xs btn-default" href="${pageContext.request.contextPath}/#!" title="查看" data-toggle="tooltip"><i class="mdi mdi-eye"></i></a>
                                                        <a class="btn btn-xs btn-default" href="${pageContext.request.contextPath}/#!" title="删除" data-toggle="tooltip"><i class="mdi mdi-window-close"></i></a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <ul class="pagination">
                                    <li class="disabled"><span>«</span></li>
                                    <li class="active"><span>1</span></li>
                                    <li><a href="${pageContext.request.contextPath}/#1">2</a></li>
                                    <li><a href="${pageContext.request.contextPath}/#1">3</a></li>
                                    <li><a href="${pageContext.request.contextPath}/#1">4</a></li>
                                    <li><a href="${pageContext.request.contextPath}/#1">5</a></li>
                                    <li><a href="${pageContext.request.contextPath}/#1">6</a></li>
                                    <li><a href="${pageContext.request.contextPath}/#1">7</a></li>
                                    <li><a href="${pageContext.request.contextPath}/#1">8</a></li>
                                    <li class="disabled"><span>...</span></li>
                                    <li><a href="${pageContext.request.contextPath}/#!">14452</a></li>
                                    <li><a href="${pageContext.request.contextPath}/#!">14453</a></li>
                                    <li><a href="${pageContext.request.contextPath}/#!">»</a></li>
                                </ul>

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
        $(".edit").click(function () {
            let index = $(".edit").index(this)
            let eid = $(".edit").eq(index).attr("eid")
            $.ajax({
                type : "GET",
                url : "${pageContext.request.contextPath}/admin/selectByPrimaryKey?eid=" + eid,
                success : function(result) {
                    $("#eid").val(result.eid)
                    $("#name").val(result.name)
                    $("#phone").val(result.phone)
                    $("#password").val(result.password)
                    $("#address").val(result.address)
                    if (result.isFire == 0) {
                        $("#isFire").attr("checked", false);
                    } else if (result.isFire == 1) {
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
            list.isFire = $("#isFire").prop("checked") == true ? 1 : 0
            $.ajax({
                type : "POST",
                contentType: "application/json;charset=UTF-8",
                url : "${pageContext.request.contextPath}/admin/updateByPrimaryKey",
                data : JSON.stringify(list),
                success : function(result) {
                    if (result.status == 'success') {
                        window.location.href = "${pageContext.request.contextPath}/admin/employee";
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
