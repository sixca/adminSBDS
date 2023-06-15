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
                                <label class="col-sm-2 col-form-label" for="basic-default-name">회원번호</label>
                                <div class="col-sm-10">
                                    <input name="memberId" type="number" class="form-control"
                                           id="basic-default-name"/>
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


<%--<div id="page-wrapper">--%>
<%--    <div class="header">--%>
<%--        <h1 class="page-header">--%>
<%--            쿠폰 관리--%>
<%--        </h1>--%>
<%--    </div>--%>
<%--    <div id="page-inner">--%>
<%--        <div class="row">--%>
<%--            <div class="col-lg-6">--%>
<%--                <div class="card">--%>
<%--                    <div class="card-action">--%>
<%--                        쿠폰 발행--%>
<%--                    </div>--%>
<%--                    <div class="card-content">--%>
<%--                        <form id="register_form" enctype="multipart/form-data" method="post" action="/coupon/registerImpl">--%>
<%--                                <div class="row">--%>
<%--                                    <div class="input-field col s8">--%>
<%--                                        <input id="icon_prefix" name="memberId" type="number" class="validate">--%>
<%--                                        <label for="icon_prefix">회원 번호</label>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="row">--%>
<%--                                    <div class="input-field col s12">--%>
<%--                                        <input id="num" name="num" type="number" class="validate">--%>
<%--                                        <label for="num" data-error="wrong" data-success="right">쿠폰 코드번호</label>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="row">--%>
<%--                                    <div class="input-field col s6">--%>
<%--                                        <input id="amount" name="amount" type="number" class="validate">--%>
<%--                                        <label for="amount" data-error="wrong" data-success="right">할인금액</label>--%>
<%--                                    </div>--%>
<%--                                    <div class="input-field col s3"><span style="font-size: 6px; color: #00897b;">시작월</span>--%>
<%--                                        <input id="monthStart" type="month" class="validate">--%>
<%--                                        <label for="monthStart" data-error="wrong" data-success="right"></label>--%>
<%--                                    </div>--%>
<%--                                    <div class="input-field col s3"><span style="font-size: 6px; color: #00897b;">만료월</span>--%>
<%--                                        <input id="monthEnd" type="month" class="validate">--%>
<%--                                        <label for="monthEnd" data-error="wrong" data-success="right"></label>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="row">--%>
<%--                                    <div class="input-field col s12">--%>
<%--                                        <textarea id="textarea" class="materialize-textarea"></textarea>--%>
<%--                                        <label for="textarea">제공 사유</label>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            <div class="clearBoth"></div>--%>
<%--                            <div class="modal-footer">--%>
<%--                                <input type="submit" class="btn btn-default" value="Register"></input>--%>
<%--                            </div>--%>
<%--                        </form>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-md-6">--%>
<%--                <!--   Basic Table  -->--%>
<%--                <div class="card">--%>
<%--                    <div class="card-action">--%>
<%--                        쿠폰 제공 현황 / 삭제--%>
<%--                    </div>--%>
<%--                    <div class="card-content">--%>
<%--                        <div class="table-responsive">--%>
<%--                            <form class="col s12" action="/coupon/findimpl" method="get">--%>
<%--                                <div class="row">--%>
<%--                                    <input type="hidden" name="keyword1" value="id">--%>
<%--                                    <input type="hidden" name="keyword2" value="num">--%>
<%--                                    <input type="hidden" name="keyword3" value="amount">--%>
<%--                                    <div class="input-field col s3">--%>
<%--                                        <span style="color: #00897b;">회원번호</span>--%>
<%--                                        <input type="number"  name="search1" <c:if test="${value1 != ''}">value="${value1}"</c:if>>--%>
<%--                                    </div>--%>
<%--                                    <div class="input-field col s3">--%>
<%--                                        <span style="color: #00897b;">쿠폰코드</span>--%>
<%--                                        <input type="number"  name="search2" <c:if test="${value2 != ''}">value="${value2}"</c:if>>--%>
<%--                                    </div>--%>
<%--                                    <div class="input-field col s6">--%>
<%--                                        <span style="color: #00897b;">할인금액(Max)</span>--%>
<%--                                        <input type="number"  name="search3" <c:if test="${value3 != ''}">value="${value3}"</c:if>>--%>
<%--                                    </div>--%>
<%--                                    <div class="modal-footer">--%>
<%--                                        <input type="submit" class="btn btn-default" value="Search"></input>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </form>--%>
<%--                            <table class="table">--%>
<%--                                <thead>--%>
<%--                                <tr>--%>
<%--                                    <th>#</th>--%>
<%--                                    <th>회원 번호</th>--%>
<%--                                    <th>쿠폰 코드</th>--%>
<%--                                    <th>할인 금액</th>--%>
<%--                                    <th>Check</th>--%>
<%--                                </tr>--%>
<%--                                </thead>--%>
<%--                                <tbody>--%>
<%--                                <c:forEach var="obj" items="${cpage.getList()}">--%>
<%--                                    <tr>--%>
<%--                                        <td>${obj.id}</td>--%>
<%--                                        <td><a href="/member/detail?id=${obj.memberId}">${obj.memberId}</td>--%>
<%--                                        <td>${obj.num}</td>--%>
<%--                                        <td>${obj.amount}</td>--%>
<%--                                        <td>--%>
<%--                                            <p>--%>
<%--                                                <input type="checkbox" id="indeterminate-checkbox-${obj.id}" value="${obj.id}" />--%>
<%--                                                <label for="indeterminate-checkbox-${obj.id}"></label>--%>
<%--                                            </p>--%>
<%--                                        </td>--%>
<%--                                    </tr>--%>
<%--                                </c:forEach>--%>

<%--&lt;%&ndash;                                <c:forEach var="obj" items="${coupons}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <td>${obj.id}</td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <td>${obj.memberId}</td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <td>${obj.num}</td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <td>${obj.amount}</td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <input type="checkbox" id="indeterminate-checkbox-${obj.id}" value="${obj.id}" />&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <label for="indeterminate-checkbox-${obj.id}"></label>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </c:forEach>&ndash;%&gt;--%>
<%--                                </tbody>--%>
<%--                            </table>--%>
<%--                            <c:if test="${cpage.getList() == null}">--%>
<%--                                <h4 style="color: red; font-size: 15px; text-align: center;">검색 조건을 입력하세요</h4>--%>
<%--                            </c:if>--%>
<%--                            <div class="pagingbar">--%>
<%--                                <jsp:include page="../findpage.jsp"/>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="modal-footer">--%>
<%--                            <button class="waves-effect waves-light btn" type="button" class="btn btn-default" onclick="deleteSelectedCoupon()">Delete</button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <!-- End  Basic Table  -->--%>
<%--        </div>--%>
<%--        <!-- /. ROW  -->--%>
<%--    </div>--%>
<%--    <!-- /. PAGE INNER  -->--%>
<%--</div>--%>
<%--<!-- /. PAGE WRAPPER -->--%>
<%--<!-- /. WRAPPER -->--%>
<%--<!-- JS Scripts-->--%>
<%--</div>--%>


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

</script>

