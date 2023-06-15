<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Target Material Design Bootstrap Admin Template</title>
    <link href="/css/form.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="/materialize/css/materialize.min.css" media="screen,projection"/>
    <!-- Bootstrap Styles-->
    <link href="/css/bootstrap.css" rel="stylesheet"/>
    <%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <!-- FontAwesome Styles-->
    <link href="/css/font-awesome.css" rel="stylesheet"/>
    <!-- Morris Chart Styles-->
    <link href="/js/morris/morris-0.4.3.min.css" rel="stylesheet"/>
    <!-- Custom Styles-->
    <link href="/css/custom-styles.css" rel="stylesheet"/>
    <!-- Google Fonts-->

    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" href="/js/Lightweight-Chart/cssCharts.css">

    <%--간병인 all--%>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />


</head>

<body>
<div id="wrapper">
    <nav class="navbar navbar-default top-navbar" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle waves-effect waves-dark" data-toggle="collapse"
                    data-target=".sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand waves-effect waves-dark" href="/"><i class="large material-icons">track_changes</i>
                <strong>SBDS Center</strong></a>
            <div id="sideNav" href=""><i class="material-icons dp48">toc</i></div>
        </div>

        <ul class="nav navbar-top-links navbar-right">
            <li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown4"><i
                    class="fa fa-envelope fa-fw"></i> <i class="material-icons right">arrow_drop_down</i></a></li>
            <li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown3"><i
                    class="fa fa-tasks fa-fw"></i> <i class="material-icons right">arrow_drop_down</i></a></li>
            <li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown2"><i
                    class="fa fa-bell fa-fw"></i> <i class="material-icons right">arrow_drop_down</i></a></li>
            <c:choose>
                <c:when test="${loginadm == null}">
                    <li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown1"><i
                            class=""></i> <b>로그인하세요</b> <i
                            class="material-icons right">arrow_drop_down</i></a></li>
                </c:when>
                <c:otherwise>
                    <li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown1"><i
                            class="fa fa-user fa-fw"></i> <b>${loginadm.adminId}</b> <i
                            class="material-icons right">arrow_drop_down</i></a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </nav>
    <!-- Dropdown Structure -->
    <c:choose>
        <c:when test="${loginadm == null}">
            <ul id="dropdown1" class="dropdown-content">
                <li><a href="/register"><i class="fa fa-user fa-fw"></i> Register</a>
                </li>
                <li><a href="/login"><i class="fa fa-sign-out fa-fw"></i> Log In</a>
                </li>
                <li><a href="#"><i class="fa fa-gear fa-fw"></i> Setting</a>
                </li>
            </ul>
        </c:when>
        <c:otherwise>
            <ul id="dropdown1" class="dropdown-content">
                <li><a href="#"><i class="fa fa-user fa-fw"></i> Adm Profile</a>
                </li>
                <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                </li>
                <li><a href="/logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                </li>
            </ul>
        </c:otherwise>
    </c:choose>
    <ul id="dropdown2" class="dropdown-content w250">
        <li>
            <div>
                <i class="fa fa-comment fa-fw"></i> New Comment
                <span class="pull-right text-muted small">4 min</span>
            </div>
            </a>
        </li>
        <li class="divider"></li>
        <li>
            <div>
                <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                <span class="pull-right text-muted small">12 min</span>
            </div>
            </a>
        </li>
        <li class="divider"></li>
        <li>
            <div>
                <i class="fa fa-envelope fa-fw"></i> Message Sent
                <span class="pull-right text-muted small">4 min</span>
            </div>
            </a>
        </li>
        <li class="divider"></li>
        <li>
            <div>
                <i class="fa fa-tasks fa-fw"></i> New Task
                <span class="pull-right text-muted small">4 min</span>
            </div>
            </a>
        </li>
        <li class="divider"></li>
        <li>
            <div>
                <i class="fa fa-upload fa-fw"></i> Server Rebooted
                <span class="pull-right text-muted small">4 min</span>
            </div>
            </a>
        </li>
        <li class="divider"></li>
        <li>
            <a class="text-center" href="#">
                <strong>See All Alerts</strong>
                <i class="fa fa-angle-right"></i>
            </a>
        </li>
    </ul>
    <ul id="dropdown3" class="dropdown-content dropdown-tasks w250">
        <li>
            <a href="#">
                <div>
                    <p>
                        <strong>Task 1</strong>
                        <span class="pull-right text-muted">60% Complete</span>
                    </p>
                    <div class="progress progress-striped active">
                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60"
                             aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                            <span class="sr-only">60% Complete (success)</span>
                        </div>
                    </div>
                </div>
            </a>
        </li>
        <li class="divider"></li>
        <li>
            <a href="#">
                <div>
                    <p>
                        <strong>Task 2</strong>
                        <span class="pull-right text-muted">28% Complete</span>
                    </p>
                    <div class="progress progress-striped active">
                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="28"
                             aria-valuemin="0" aria-valuemax="100" style="width: 28%">
                            <span class="sr-only">28% Complete</span>
                        </div>
                    </div>
                </div>
            </a>
        </li>
        <li class="divider"></li>
        <li>
            <a href="#">
                <div>
                    <p>
                        <strong>Task 3</strong>
                        <span class="pull-right text-muted">60% Complete</span>
                    </p>
                    <div class="progress progress-striped active">
                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60"
                             aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                            <span class="sr-only">60% Complete (warning)</span>
                        </div>
                    </div>
                </div>
            </a>
        </li>
        <li class="divider"></li>
        <li>
            <a href="#">
                <div>
                    <p>
                        <strong>Task 4</strong>
                        <span class="pull-right text-muted">85% Complete</span>
                    </p>
                    <div class="progress progress-striped active">
                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="85"
                             aria-valuemin="0" aria-valuemax="100" style="width: 85%">
                            <span class="sr-only">85% Complete (danger)</span>
                        </div>
                    </div>
                </div>
            </a>
        </li>
        <li class="divider"></li>
        <li>
    </ul>
    <ul id="dropdown4" class="dropdown-content dropdown-tasks w250 taskList">
        <li>
            <div>
                <strong>John Doe</strong>
                <span class="pull-right text-muted">
                                        <em>Today</em>
                                    </span>
            </div>
            <p>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s...</p>
            </a>
        </li>
        <li class="divider"></li>
        <li>
            <div>
                <strong>John Smith</strong>
                <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
            </div>
            <p>Lorem Ipsum has been the industry's standard dummy text ever since an kwilnw...</p>
            </a>
        </li>
        <li class="divider"></li>
        <li>
            <a href="#">
                <div>
                    <strong>John Smith</strong>
                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                </div>
                <p>Lorem Ipsum has been the industry's standard dummy text ever since the...</p>
            </a>
        </li>
        <li class="divider"></li>
        <li>
            <a class="text-center" href="#">
                <strong>Read All Messages</strong>
                <i class="fa fa-angle-right"></i>
            </a>
        </li>
    </ul>
    <!--/. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li>
                    <a class="active-menu waves-effect waves-dark" href="/"><i class="fa fa-dashboard"></i>
                        Dashboard</a>
                </li>
                <li>
                    <a href="#" class="waves-effect waves-dark"><i class="fa fa-bar-chart-o"></i> 데이터 통계<span
                            class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="#"> Match (실시간)</a>
                        </li>
                        <li>
                            <a href="#"> Mall (실시간)</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="waves-effect waves-dark"><i class="fa fa-desktop"></i> 상세 분석<span
                            class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="#"> Mall & Item 분석</a>
                        </li>
                        <li>
                            <a href="#"> Matching 분석</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="/member/all" class="waves-effect waves-dark"><i class="fa fa-fw fa-file"></i> 고객 관리</a>
                </li>
                <li>
                    <a href="/mate/all" class="waves-effect waves-dark"><i class="fa fa-fw fa-file"></i> 간병인 관리</a>
                </li>
                <li>
                    <a href="#" class="waves-effect waves-dark"><i class="fa fa-sitemap"></i> 상품 관리<span
                            class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="/item/productall"> 상품 관리</a>
                        </li>
                        <li>
                            <a href="#"> 쿠폰 관리</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="waves-effect waves-dark"><i class="fa fa-table"></i> 주문 & 매칭 관리<span
                            class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="#"> 상품 주문 관리</a>
                        </li>
                        <li>
                            <a href="#"> 간병인 매칭 관리<span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li>
                                    <a href="#"> 매칭 리스트</a>
                                </li>
                                <li>
                                    <a href="#"> 수수료 관리</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="waves-effect waves-dark"><i class="fa fa-edit"></i> 게시물 관리<span
                            class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="/notice/noticeall"> 공시사항 관리</a>
                        </li>
                        <li>
                            <a href="/matereview/all"> 후기 관리</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="/marketing" class="waves-effect waves-dark"><i class="fa fa-desktop"></i> 공지 및 마케팅 발송</a>
                </li>
                <li>
                    <a href="/chart" class="waves-effect waves-dark"><i class="fa fa-bar-chart-o"></i> Charts</a>
                </li>
                <li>
                    <a href="/tab-panel" class="waves-effect waves-dark"><i class="fa fa-qrcode"></i> Tabs &
                        Panels</a>
                </li>
                <li>
                    <a href="table" class="waves-effect waves-dark"><i class="fa fa-table"></i> Responsive
                        Tables</a>
                </li>
                <li>
                    <a href="/forms" class="waves-effect waves-dark"><i class="fa fa-edit"></i> Forms </a>
                </li>
                <li>
                    <a href="#" class="waves-effect waves-dark"><i class="fa fa-sitemap"></i> Multi-Level Dropdown<span
                            class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="#">Second Level Link</a>
                        </li>
                        <li>
                            <a href="#">Second Level Link</a>
                        </li>
                        <li>
                            <a href="#">Second Level Link<span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li>
                                    <a href="#">Third Level Link</a>
                                </li>
                                <li>
                                    <a href="#">Third Level Link</a>
                                </li>
                                <li>
                                    <a href="#">Third Level Link</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="/empty" class="waves-effect waves-dark"><i class="fa fa-fw fa-file"></i> Empty Page</a>
                </li>
            </ul>

        </div>

    </nav>
    <!-- /. NAV SIDE  -->

	<!-- center.jsp -->
	<c:choose>
		<c:when test="${center == null}">
			<jsp:include page="center.jsp"/>
		</c:when>
		<c:otherwise>
			<jsp:include page="${center}.jsp"/>
		</c:otherwise>
	</c:choose>
	<!-- /center.jsp -->

	<!-- /. ROW  -->
	<div class="fixed-action-btn horizontal click-to-toggle">
		<a class="btn-floating btn-large red">
			<i class="material-icons">menu</i>
		</a>
		<ul>
			<li><a class="btn-floating red"><i class="material-icons">track_changes</i></a></li>
			<li><a class="btn-floating yellow darken-1"><i class="material-icons">format_quote</i></a></li>
			<li><a class="btn-floating green"><i class="material-icons">publish</i></a></li>
			<li><a class="btn-floating blue"><i class="material-icons">attach_file</i></a></li>
		</ul>
	</div>
</div>

<%--Modal--%>

<%--<div class="container">--%>
<%--   <div class="modal fade" id="myModal" role="dialog">--%>
<%--        <div class="modal-dialog modal-sm">--%>
<%--            <!-- Modal content-->--%>
<%--            <jsp:include page="login2.jsp"/>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<div class="container">--%>
<%--    <div class="modal fade" id="myModal2" role="dialog">--%>
<%--        <div class="modal-dialog">--%>
<%--            <!-- Modal content-->--%>
<%--            <jsp:include page="register2.jsp"/>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

</body>
</html>



<!-- /. WRAPPER  -->
<!-- JS Scripts-->
<!-- jQuery Js -->
<script src="/js/jquery-1.10.2.js"></script>

<!-- Bootstrap Js -->
<script src="/js/bootstrap.min.js"></script>

<script src="/materialize/js/materialize.min.js"></script>

<!-- Metis Menu Js -->
<script src="/js/jquery.metisMenu.js"></script>
<!-- Morris Chart Js -->
<script src="/js/morris/raphael-2.1.0.min.js"></script>
<script src="/js/morris/morris.js"></script>


<script src="/js/easypiechart.js"></script>
<script src="/js/easypiechart-data.js"></script>

<script src="/js/Lightweight-Chart/jquery.chart.js"></script>

<!-- Custom Js -->
<script src="/js/custom-scripts.js"></script>

<!-- DATA TABLE SCRIPTS -->
<script src="/js/dataTables/jquery.dataTables.js"></script>
<script src="/js/dataTables/dataTables.bootstrap.js"></script>


</body>

</html>