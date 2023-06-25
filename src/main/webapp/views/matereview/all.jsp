<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script>
    function deleteSelectedReview() {
        var checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
        var couponIds = Array.from(checkboxes).map(function(checkbox) {
            return parseInt(checkbox.value);
        });

        if (couponIds.length > 0) {
            var confirmation = confirm("선택한 쿠폰을 삭제하시겠습니까?");
            if (confirmation) {
                var url = "/matereview/deleteimpl?";
                couponIds.forEach(function(id, index) {
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
<div id="page-wrapper">
    <div class="header">
        <h1 class="page-header">
            후기 관리
        </h1>
        <ol class="breadcrumb">
            <li><a href="/matereview/all">간병인 후기</a></li>
<%--            <li><a href="/itemreview/all">상품 후기</a></li>--%>
        </ol>
    </div>

    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <!-- Advanced Tables -->
                <div class="card">
                    <div class="card-action">
                        간병인 후기 리스트
                    </div>
                    <div class="card-content">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                <tr>
                                    <th class="center">후기 번호</th>
                                    <th class="center">간병인 명</th>
                                    <th class="center">회원 명</th>
                                    <th class="center">회원 후기</th>
                                    <th class="center">평점</th>
                                    <th class="center">등록일시</th>
                                    <th class="center">Check</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="obj" items="${rlist}" varStatus="status">
                                    <tr>
                                        <td>${obj.id}</td>
                                        <td><a href="/mate/findimpl?keyword1=name&keyword2=license&keyword3=area&keyword4=startPeriod&keyword5=endPeriod&search1=${obj.mateName}&search2=&search3=&startPeriod=&endPeriod=">${obj.mateName}</a></td>
                                        <td><a href="/member/findimpl?keyword1=email&keyword2=name&keyword3=birth&keyword4=birth&search1=&search2=${obj.memberName}&startDate=&endDate=">${obj.memberName}</a></td>
                                        <td><a href="/matereview/detail?id=${obj.id}">${obj.content}</a></td>
                                        <td>${obj.rate}</td>
                                        <td><fmt:formatDate value="${obj.rdate}" pattern="yyyy-MM-dd 00:00:00"/></td>
                                        <td>
                                            <p>
                                                <input type="checkbox" id="indeterminate-checkbox-${obj.id}" value="${obj.id}" />
                                                <label for="indeterminate-checkbox-${obj.id}"></label>
                                            </p>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!--End Advanced Tables -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" onclick="deleteSelectedReview()">Delete</button>
            </div>
        </div>
    </div>
    <!-- /. PAGE INNER  -->
</div>
<!-- /. PAGE WRAPPER -->
<!-- /. WRAPPER -->
<!-- JS Scripts-->


<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
</script>
<style>
    .small_img {
        max-width: 50px;
        max-height: 50px;
    }

    td {
        text-align: center;
    }
</style>
