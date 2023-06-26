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
                var url = "/matereview/deleteimpl?";
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

<!-- Content wrapper -->
<div class="content-wrapper">
    <!-- Content -->

    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Mate Reviews /</span> 간병인 후기 관리</h4>

        <!-- Basic Bootstrap Table -->

        <!-- Hoverable Table rows -->
        <div class="card">
            <h5 class="card-header">간병인 후기 리스트</h5>
            <div class="table-responsive text-nowrap">
                <table class="table table-hover text-center align-middle">
                    <thead>
                    <tr class="text-center">
                        <th>#</th>
                        <th>간병인명</th>
                        <th>회원명</th>
                        <th>회원 후기</th>
                        <th>평점</th>
                        <th>등록일시</th>
                        <th>Check</th>
                    </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                    <c:forEach var="obj" items="${cpage.getList()}" varStatus="status">
                        <tr>
                            <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>${obj.id}</strong></td>
                            <td><a href="/mate/findimpl?keyword1=name&keyword2=license&keyword3=area&keyword4=startPeriod&keyword5=endPeriod&search1=${obj.mateName}&search2=&search3=&startPeriod=&endPeriod=">${obj.mateName}</a></td>
                            <td><a href="/member/findimpl?keyword1=email&keyword2=name&keyword3=birth&keyword4=birth&search1=&search2=${obj.memberName}&startDate=&endDate=">${obj.memberName}</a></td>
                            <td><a href="/matereview/detail?id=${obj.id}">${obj.content}</a></td>
                            <td>${obj.rate}</td>
                            <td><fmt:formatDate value="${obj.rdate}" pattern="yyyy-MM-dd 00:00:00"/></td>
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