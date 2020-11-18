<%--
  Created by IntelliJ IDEA.
  User: DKT
  Date: 2020/11/17
  Time: 20:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside class="lyear-layout-sidebar">

    <!-- logo -->
    <div id="logo" class="sidebar-header">
        <a href="${pageContext.request.contextPath}/index.html"><img src="${pageContext.request.contextPath}/images/logo-sidebar.png" title="LightYear" alt="LightYear" /></a>
    </div>
    <div class="lyear-layout-sidebar-scroll">

        <nav class="sidebar-main">
            <ul class="nav nav-drawer">
                <li class="nav-item active"> <a class="home" href="${pageContext.request.contextPath}/admin/index"><i class="mdi mdi-home"></i> 后台首页</a> </li>
                <li class="nav-item nav-item-has-subnav">
                    <a href="javascript:void(0)"><i class="mdi mdi-home"></i> 员工管理</a>
                    <ul class="nav nav-subnav">
                        <li> <a href="${pageContext.request.contextPath}/admin/employee">员工列表</a> </li>
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

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript">
    $(function(){
        $(".nav-subnav > li").click(function () {
            $(".nav-subnav > li").removeClass("active");
            let index = $(".nav-subnav > li").index(this);
            $(".nav-subnav > li").eq(index).addClass("active");
        });
        <%--$(".employeeList").click(function () {--%>
        <%--    $.ajax({--%>
        <%--        type : "GET",--%>
        <%--        url : "${pageContext.request.contextPath}/admin/employee",--%>
        <%--        success : function(result) {--%>
        <%--            let str="";--%>
        <%--            $.each(result, function(index, employee){--%>
        <%--                let isFireStr = ''--%>
        <%--                if (employee.isFire == 0) {--%>
        <%--                    isFireStr = "已离职";--%>
        <%--                } else {--%>
        <%--                    isFireStr = "任职中";--%>
        <%--                }--%>
        <%--                str += "<tr>\n" +--%>
        <%--                    "<td>" + employee.eid + "</td>\n" +--%>
        <%--                    "<td>" + employee.name + "</td>\n" +--%>
        <%--                    "<td>" + employee.phone + "</td>\n" +--%>
        <%--                    "<td>" + employee.password + "</td>\n" +--%>
        <%--                    "<td>" + employee.address + "</td>\n" +--%>
        <%--                    "    <td><font class=\"text-success\">" + isFireStr + "</font></td>\n" +--%>
        <%--                    "<td>\n" +--%>
        <%--                    "    <div class=\"btn-group\">\n" +--%>
        <%--                    "        <a class=\"btn btn-xs btn-default\" href=\"/#!\" title=\"编辑\" data-toggle=\"tooltip\"><i class=\"mdi mdi-pencil\"></i></a>\n" +--%>
        <%--                    "        <a class=\"btn btn-xs btn-default\" href=\"/#!\" title=\"查看\" data-toggle=\"tooltip\"><i class=\"mdi mdi-eye\"></i></a>\n" +--%>
        <%--                    "        <a class=\"btn btn-xs btn-default\" href=\"/#!\" title=\"删除\" data-toggle=\"tooltip\"><i class=\"mdi mdi-window-close\"></i></a>\n" +--%>
        <%--                    "    </div>\n" +--%>
        <%--                    "</td>\n" +--%>
        <%--                    "</tr>";--%>
        <%--                $(".employeeBody").append(str)--%>
        <%--            });--%>
        <%--            // $("div").append(str);--%>

        <%--            console.log(result)--%>
        <%--            &lt;%&ndash;if (result.status === 'success') {&ndash;%&gt;--%>
        <%--            &lt;%&ndash;    window.location.href = "${pageContext.request.contextPath}/admin/index";&ndash;%&gt;--%>
        <%--            &lt;%&ndash;}&ndash;%&gt;--%>
        <%--        },--%>
        <%--        error : function(e){--%>
        <%--            console.log(e.status);--%>
        <%--            console.log(e.responseText);--%>
        <%--        }--%>
        <%--    });--%>
        <%--})--%>
    });
</script>
