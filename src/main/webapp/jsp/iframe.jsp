<%@ page import="static com.jykj.util.Constants.USER_SESSION" %><%--
  Created by IntelliJ IDEA.
  User: yt
  Date: 2022-02-10
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<nav class="navbar navbar-default top-navbar" role="navigation">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle waves-effect waves-dark" data-toggle="collapse"
                data-target=".sidebar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand waves-effect waves-dark" href="index.jsp"><i class="large material-icons">track_changes</i>
            <strong>管理系统</strong></a>

        <div id="sideNav" href=""><i class="material-icons dp48">toc</i></div>
    </div>

    <ul class="nav navbar-top-links navbar-right">
        <li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown1"><i
                class="fa fa-user fa-fw"></i> <b><%=request.getSession().getAttribute(USER_SESSION)%></b> <i
                class="material-icons right">arrow_drop_down</i></a></li>
    </ul>
</nav>
<!-- Dropdown Structure -->
<!--/. NAV TOP  -->
<nav class="navbar-default navbar-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav" id="main-menu">
            <li>
                <a href="${pageContext.request.contextPath}/jsp/index.jsp" class="active-menu waves-effect waves-dark"><i class="fa fa-dashboard"></i> 统计管理</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/jsp/employ.jsp" class="waves-effect waves-dark"><i class="fa fa-desktop"></i> 员工管理</a>
            </li>
            <li>
                <a href="chart.jsp" class="waves-effect waves-dark"><i class="fa fa-bar-chart-o"></i> 配置管理</a>
            </li>
            <li>
                <a href="tab-panel.html" class="waves-effect waves-dark"><i class="fa fa-qrcode"></i> 个人中心</a>
            </li>

            <li>
                <a href="table.html" class="waves-effect waves-dark"><i class="fa fa-table"></i> 权限管理</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/jsp/logout.do" class="waves-effect waves-dark"><i
                        class="fa fa-edit"></i> 退出系统 </a>
            </li>
        </ul>
    </div>
</nav>
<script src="../assets/js/jquery-1.10.2.js"></script>
<script>
    $(function () {
        $("#main-menu li a").each(function () {
            $this = $(this);
            if ($this[0].href == String(window.location)) {
                $this.addClass("active-menu");
                $this.parent().siblings().children().removeClass("active-menu")
            }
        })

    })

</script>
</body>
</html>
