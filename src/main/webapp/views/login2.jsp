<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    //login
    let login_form={
        init:function (){
            $('#login_btn').click(function(){
                login_form.send();
            });
        },
        send:function (){
            $('#login_form').attr({
                'action':'/loginimpl',
                'method':'post'
            });
            $('#login_form').submit();
        }
    };
    //화면 로딩
    $(function (){
        login_form.init();
    });
</script>


<div id="page-wrapper">
    <div class="header">
        <h1 class="page-header">
            Login Administer
        </h1>
    </div>
    <div id="page-inner">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-action">
                        관리자 로그인 양식
                    </div>
                    <div class="card-content">
                        <form id="login_form" class="col s12">
                            <input type="hidden" name="redirectURL" value="${redirectURL}">
                            <div class="row">
                                <div class="input-field col s12">
                                    <input name="adminId" id="adminId" type="text" class="validate">
                                    <label for="adminId">ID</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s12">
                                    <input name="pwd" id="pwd" type="password" class="validate">
                                    <label for="pwd">Password</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="modal-footer">
                                    <button id="login_btn" type="button" class="btn btn-default">Login</button>
                                    <a href="/" type="button" class="btn btn-default" data-dismiss="modal">back</a>
                                </div>
                            </div>
                        </form>
                        <div class="clearBoth"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /. PAGE INNER  -->
</div>
<!-- /. PAGE WRAPPER -->







<%--<div id="page-wrapper">--%>
<%--    <div class="col-sm-8">--%>
<%--        <div class="container">--%>
<%--            <div class="row content">--%>
<%--                <div class="col-sm-4 text-left">--%>
<%--                    <form id="login_form" class="form-horizontal well">--%>
<%--                        <input type="hidden" name="redirectURL" value="${redirectURL}">--%>
<%--                        <div class="form-group">--%>
<%--                            <label for="adminId">ID:</label>--%>
<%--                            <input type="text" class="form-control" name="adminId" id="adminId">--%>
<%--                        </div>--%>
<%--                        <div class="form-group">--%>
<%--                            <label for="pwd">Password:</label>--%>
<%--                            <input type="password" class="form-control" name="pwd" id="pwd">--%>
<%--                        </div>--%>
<%--                    </form>--%>
<%--                    <button id="login_btn" class="btn btn-success">Log In</button>--%>
<%--                    <a href="/" class="btn btn-success">Go out</a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
