<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!-- Content wrapper -->
<div class="content-wrapper">
    <!-- Content -->

    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Coupons/</span> 쿠폰 발행, 검색, 삭제</h4>

        <!-- Basic Layout & Basic with Icons -->
        <div class="row">
            <!-- Basic Layout -->
            <div class="col-xxl-5">
                <div class="card mb-4">
                    <div class="card-header d-flex align-items-center justify-content-between">
                        <h5 class="mb-0">쿠폰 발행</h5>
                        <small class="text-muted float-end">Register Coupons</small>
                    </div>
                    <form id="register_form" enctype="multipart/form-data" method="post" action="/coupon/registerImpl">
                        <div class="card-body">
                                <div class="row mb-3">
                                    <label class="col-sm-2 col-form-label" for="memberId">회원번호</label>
                                    <div class="col-sm-10">
                                        <input name="memberId" type="number" class="form-control" id="memberId" value="${param.id}" />
                                    </div>
                                </div>
                                <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="basic-default-company">쿠폰번호</label>
                                <div class="col-sm-10">
                                    <input
                                            type="number"
                                            name="num"
                                            class="form-control"
                                            id="basic-default-company"
                                    />
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="basic-default-email">할인금액</label>
                                <div class="col-sm-10">
                                    <div class="input-group input-group-merge">
                                        <input
                                                type="number"
                                                name="amount"
                                                id="basic-default-email"
                                                class="form-control"
                                        />
                                        <span class="input-group-text" id="basic-default-email2">원</span>
                                    </div>
                                    <div class="form-text">100,000원 초과 할인금액은 결재권자 승인 필수</div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="exdate">유효기간</label>
                                <div class="col-sm-4"><span style="font-size: 6px; color: hotpink;">시작월</span>
                                    <input
                                            id="exdate"
                                            type="month"
                                            class="form-control phone-mask"
                                    />
                                </div>
                                <div class="col-sm-4"><span style="font-size: 6px; color: hotpink;">만료월</span>
                                    <input
                                            type="month"
                                            class="form-control phone-mask"
                                    />
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="basic-default-message">메세지</label>
                                <div class="col-sm-10">
                            <textarea name="admComment"
                                      id="basic-default-message"
                                      class="form-control"
                                      placeholder="회원님께 전달될 메세지를 입력하세요"
                                      aria-label="회원님께 전달될 메세지를 입력하세요"
                                      aria-describedby="basic-icon-default-message2"
                            ></textarea>
                                </div>
                            </div>
                            <div class="row justify-content-end">
                                <div class="col-sm-10">
                                    <button type="submit" class="btn btn-primary">Register</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Basic with Icons -->
            <div class="col-xxl-7">
                <div class="card mb-4">
                    <div class="card-header d-flex align-items-center justify-content-between">
                        <h5 class="mb-0">쿠폰 제공 현황</h5>
                        <small class="text-muted float-end">Search & Delete</small>
                    </div>
                    <div class="card-body">
                        <form class="col s12" action="/coupon/findimpl" method="get">
                            <div class="row">
                                <input type="hidden" name="keyword1" value="id">
                                <input type="hidden" name="keyword2" value="num">
                                <input type="hidden" name="keyword3" value="amount">


                                <div class="card-body">

                                    <div class="row gx-3 gy-2 align-items-center">
                                        <div class="col-md-3">
                                            <input type="number" name="search1" class="form-control me-2"
                                                   placeholder="회원번호" aria-label="Search"
                                                   <c:if test="${value1 != ''}">value="${value1}"</c:if>>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="number" name="search2" class="form-control me-2"
                                                   placeholder="쿠폰코드" aria-label="Search"
                                                   <c:if test="${value2 != ''}">value="${value2}"</c:if>>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="number" name="search3" class="form-control me-2"
                                                   placeholder="할인금액(최대값)" aria-label="Search"
                                                   <c:if test="${value3 != ''}">value="${value3}"</c:if>>
                                        </div>

                                        <div class="col-md-3 text-end">
                                            <button class="btn btn-outline-primary">Search
                                            </button>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </form>
                    </div>
                    <div class="card-body">
                        <div class="card">
                            <div class="table-responsive text-nowrap">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>회원번호</th>
                                        <th>쿠폰코드</th>
                                        <th>할인금액</th>
                                        <th>메세지</th>
                                        <th style="text-align: center;">Check</th>
                                    </tr>
                                    </thead>
                                    <tbody class="table-border-bottom-0">
                                    <c:forEach var="obj" items="${cpage.getList()}">
                                        <tr>
                                            <td>${obj.id}</td>
                                            <td><a href="/member/detail?id=${obj.memberId}">${obj.memberId}</td>
                                            <td>${obj.num}</td>
                                            <td>${obj.amount}</td>
                                            <td>${obj.admComment}</td>
                                            <td>
                                                <p style="text-align: center;">
                                                    <input class="form-check-input" type="checkbox"
                                                           id="indeterminate-checkbox-${obj.id}"
                                                           value="${obj.id}"/>
                                                    <label for="indeterminate-checkbox-${obj.id}"></label>
                                                </p>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <c:if test="${cpage.getList() == null}">
                                    <br/>
                                    <h4 style="color: hotpink; font-size: 15px; text-align: center;">검색 조건을 입력하세요</h4>
                                    <br/>
                                    <br/>
                                </c:if>
                                <div class="pagingbar">
                                    <jsp:include page="../findpage.jsp"/>
                                </div>
                            </div>
                        </div>
                        <!--/ Basic Bootstrap Table -->
                        <div class="row justify-content-end">
                            <div class="col-sm-12">
                                <br/>
                                <button type="button" class="btn btn-primary" onclick="deleteSelectedCoupon()">Delete
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- / Content -->

<script>
    function deleteSelectedCoupon() {
        var checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
        var couponIds = Array.from(checkboxes).map(function (checkbox) {
            return parseInt(checkbox.value);
        });

        if (couponIds.length > 0) {
            var confirmation = confirm("선택한 쿠폰을 삭제하시겠습니까?");
            if (confirmation) {
                var url = "/coupon/deleteimpl?";
                couponIds.forEach(function (id, index) {
                    if (index > 0) {
                        url += "&";
                    }
                    url += "id=" + encodeURIComponent(id);
                });
                location.href = url;
            }
        } else {
            alert("삭제할 쿠폰을 선택해주세요");
        }
    }

    // URL에서 id 파라미터 값을 가져옴 :: mate/detail 화면에서 들어온 경우 회원번호에 id 값이 떠있도록 구현
    document.addEventListener('DOMContentLoaded', function() {
        // URL에서 id 파라미터 값을 가져옴
        const urlParams = new URLSearchParams(window.location.search);
        const detailId = urlParams.get('id');

        // detailId 값을 활용하여 원하는 작업 수행
        console.log(detailId); // 콘솔에 detailId 값 출력 확인

        // detailId 값을 회원번호 input 요소에 설정
        var memberIdInput = document.querySelector('#memberId');
        memberIdInput.value = detailId;
    });



</script>

