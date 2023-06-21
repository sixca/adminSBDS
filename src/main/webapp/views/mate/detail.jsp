<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let mate_detail={
        init: function (){
            $('#update_btn').click(function(){
                mate_detail.send();
            });
            $('#delete_btn').click(function(){
                var c = confirm("삭제 하시겠습니까?");
                if(c == true){
                    location.href="/mate/deleteimpl?id=${mateinfo.id}";
                }
            });
        },
        send: function(){
            $('#detail_form').attr({
                method:'post',
                action:'/mate/updateimpl',
                enctype: 'multipart/form-data'   // imgname <-> img파일
            });
            $('#detail_form').submit();
        }
    };
    $(function(){
        mate_detail.init();
    });
</script>

<div id="page-wrapper">
    <div class="header">
        <h1 class="page-header">
            간병인 상세
        </h1>
    </div>
    <div class="main-body">
        <div class="row">
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex flex-column align-items-center text-center">
                            <img src="/uimg/${mateinfo.img}" alt="Admin" class="rounded-circle p-1 bg-primary" width="110" style="border-radius: 50%;">
                            <div class="mt-3">
                                <h4>${mateinfo.name}</h4>
                                <p class="text-secondary mb-1">${mateinfo.email}</p>
                                <p class="text-muted font-size-sm">${mateinfo.area}</p>
                                <button class="btn btn-outline-primary">Message</button>
                            </div>
                        </div>
                        <hr class="my-4">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <h4 class="d-flex align-items-center mb-3">
                                    <span class="text-primary font-weight-bold">고객 후기</span>
                                </h4>
                            </li>
                            <c:forEach var="obj" items="${rlist}" varStatus="status">
                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <span class="text-secondary">"${rlist[status.index].content}"</span>
                            </li>
                            </c:forEach>
                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-twitter me-2 icon-inline text-info"><path d="M23 3a10.9 10.9 0 0 1-3.14 1.53 4.48 4.48 0 0 0-7.86 3v1A10.66 10.66 0 0 1 3 4s-4 9 5 13a11.64 11.64 0 0 1-7 2c9 5 20 0 20-11.5a4.5 4.5 0 0 0-.08-.83A7.72 7.72 0 0 0 23 3z"></path></svg>Twitter</h6>
                                <span class="text-secondary">@Your_Mate</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-body">
                        <form id="detail_form">
                            <input type="hidden" name="id" value="${mateinfo.id}">
                            <input type="hidden" name="img" value="${mateinfo.img}">
                            <input type="hidden" name="password" value="${mateinfo.password}">

                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Full Name</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="text" name="name" class="form-control" value="${mateinfo.name}">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Email</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="text" name="email" class="form-control" value="${mateinfo.email}">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">지역</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="text" name="area" class="form-control" value="${mateinfo.area}">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">경력(년차)</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="text" name="jobPeriod" class="form-control" value="${mateinfo.jobPeriod}">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">자격</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="text" name="license" class="form-control" value="${mateinfo.license}">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">탈퇴여부</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <select name="valid" class="form-control">
                                        <option value="1" ${mateinfo.valid == '1' ? 'selected' : ''}>Y</option>
                                        <option value="0" ${mateinfo.valid == '0' ? 'selected' : ''}>N</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">프로필 이미지 변경</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="file" name="imgMate" class="form-control" placeholder="Input img">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3"></div>
                                <div class="col-sm-9 text-secondary">
                                    <input id="update_btn" type="button" class="btn btn-primary px-4" value="Save Changes">
                                    <input id="delete_btn" type="button" class="btn btn-primary px-4" value="Delete This Profile">
                                    <a href="javascript:history.back()" class="btn btn-secondary px-4">Back</a>

                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="d-flex align-items-center mb-3">
                                    <span class="text-primary font-weight-bold">간병인 활동 마일리지</span>
                                </h5>
                                <p>간병 매칭 마일리지</p>
                                <div class="progress mb-3" style="height: 5px">
                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <p>간병 완료 마일리지</p>
                                <div class="progress mb-3" style="height: 5px">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 72%" aria-valuenow="72" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <p>간병인 후기 마일리지</p>
                                <div class="progress mb-3" style="height: 5px">
                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 55%" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    body{
    margin-top:0px;
    color: #1a202c;
    text-align: left;
    background-color: #e2e8f0;
    }
    .main-body {
    padding: 0px;
    }
    .card {
    box-shadow: 0 1px 3px 0 rgba(0,0,0,.1), 0 1px 2px 0 rgba(0,0,0,.06);
    }

    .card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 0 solid rgba(0,0,0,.125);
    border-radius: .25rem;
    }

    .card-body {
    flex: 1 1 auto;
    min-height: 1px;
    padding: 1rem;
    }

    .gutters-sm {
    margin-right: -8px;
    margin-left: -8px;
    }

    .gutters-sm>.col, .gutters-sm>[class*=col-] {
    padding-right: 8px;
    padding-left: 8px;
    }
    .mb-3, .my-3 {
    margin-bottom: 1rem!important;
    }

    .bg-gray-300 {
    background-color: #e2e8f0;
    }
    .h-100 {
    height: 100%!important;
    }
    .shadow-none {
    box-shadow: none!important;
    }
</style>