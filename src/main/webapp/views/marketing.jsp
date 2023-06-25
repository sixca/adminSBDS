<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let send = {
        init: function () {
            $('#marketingBtn').click(function () {
                send.send();
            });
        },
        send: function () {
            $('#marketingForm').attr({
                'action': '/notification',
                'method': 'post'
            });
            $('#marketingForm').submit();
            alert("성공!");
        }
    }
    $(function () {
        send.init();
    })
</script>
<!------ Include the above in your HEAD tag ---------->

<div class="container-xxl flex-grow-1 container-p-y">
    <h4 class="fw-semibold py-3 mb-4"><span class="text-muted fw-light">상세 매칭 분석 /</span> Search detail</h4>
    <div class="card mb-4">
        <div class="card-body">
            <div class="container contact-form1" style="background-color: #202838">
                <form style="margin-top: 100px" id="marketingForm">
                    <h3 style="color:whitesmoke">공지 및 마케팅 PUSH</h3>
                    <div class="row">
                        <div class="col s12">
                            <div class="col-md-12">
                                <div class="form-group1">
                                    <label for="label-title" style="color:whitesmoke">제목 작성</label>
                                    <input type="text" name="title" id="label-title" class="form-control"
                                           placeholder="발송 제목" style="color:whitesmoke"/>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group1">
                                    <label for="label-message" style="color:whitesmoke">메시지 작성</label>
                                    <textarea name="body" id="label-message" class="form-control1"
                                              style="width: 100%; height: 150px;color:whitesmoke;"></textarea>
                                </div>
                                <button type="button" class="btnContactSubmit1 col-md-12"
                                        style="width: 100%; margin-top: 10px" id="marketingBtn">전송
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>