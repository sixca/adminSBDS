<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script>
    function deleteSelectedReview() {
        var checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
        var reviewIds = Array.from(checkboxes).map(function(checkbox) {
            return parseInt(checkbox.value);
        });

        if (reviewIds.length > 0) {
            var confirmation = confirm("선택한 후기를 삭제하시겠습니까?");
            if (confirmation) {
                var url = "/itemreview/deleteimpl?";
                reviewIds.forEach(function(id, index) {
                    if (index > 0) {
                        url += "&";
                    }
                    url += "id=" + encodeURIComponent(id);
                });
                location.href = url;
            }
        } else {
            alert("삭제할 후기를 선택해주세요");
        }
    }
</script>

<div class="content-wrapper">
    <!-- Content -->

    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Item Reviews /</span> 제품 후기 관리</h4>

        <!-- Basic Bootstrap Table -->

        <!-- Hoverable Table rows -->
        <div class="card">
            <div class="card-header d-flex align-items-center justify-content-between">
                <h5 class="card-header">제품 후기 리스트</h5>
                <div class="d-flex">
                    <div class="input-group input-group-sm">
                        <input type="text" class="form-control" id="search-input" placeholder="검색어 입력">
                        <button class="btn btn-outline-primary" type="button" onclick="window.location.href='/itemreview/all'">Search</button>
                    </div>
                </div>
            </div>
            <div class="table-responsive text-nowrap">
                <table class="table table-hover text-center align-middle">
                    <thead>
                        <tr class="text-center">
                            <th>#</th>
                            <th>제품명</th>
                            <th>작성회원명</th>
                            <th>후기 제목</th>
                            <th>내용</th>
                            <th>평점</th>
                            <th>Check</th>
                        </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                    <c:forEach var="obj" items="${ilist}">
                        <tr>
                            <td>${obj.id}</td>
                            <td><a href="#">${obj.itemName}</a></td>
                            <td><a href="#">${obj.reviewName}</a></td>
                            <td>${obj.title}</td>
                            <td>${obj.review}</td>
                            <td>${obj.rate}</td>
                            <td class="d-flex align-items-center">
                                <div class="mx-auto">
                                    <input class="form-check-input mt-0" type="checkbox" id="indeterminate-checkbox-${obj.id}" value="${obj.id}"/>
                                    <label for="indeterminate-checkbox-${obj.id}"></label>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="row justify-content-end">
                <div class="col-sm-1" style="margin-right: 30px; margin-bottom: 20px;">
                    <br/>
                    <button type="button" class="btn btn-primary" onclick="deleteSelectedReview()">Delete
                    </button>
                </div>
            </div>
            <jsp:include page="../page.jsp"/>
        </div>
        <!--/ Hoverable Table rows -->
    </div>
</div>



