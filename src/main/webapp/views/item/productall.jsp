<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="page-wrapper">
    <div class="header">
        <div class="row align-items-center">
            <div class="col-lg-3 d-flex align-items-center">
                <h1 class="page-header" style="display: inline-block; vertical-align: middle;">상품 관리</h1>
                <a href="/item/register" class="btn-floating btn-small" style="margin-top: 20px;"><i class="material-icons">add</i></a>
            </div>
        </div>
    </div>
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <!-- Advanced Tables -->
                <div class="card">
                    <div class="card-action">
                        상품목록
                    </div>
                    <div class="card-content">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                <tr>
                                    <th>상품 번호</th>
                                    <th>등록ID</th>
                                    <th>제품명</th>
                                    <th>제품사진</th>
                                    <th>가격</th>
                                    <th>사이즈</th>
                                    <th>색상</th>
                                    <th>등록일자</th>
                                    <th>수정일자</th>
                                    <th>유효상품 여부</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="obj" items="${items}">
                                <tr class="odd gradeX">
                                    <td><a href="/item/${obj.id}">${obj.id}</a></td>
                                    <td>${obj.registerId}</td>
                                    <td>${obj.name}</td>
                                    <td><img src="/uimg/${obj.img}" alt="Item Image"></td>
                                    <td><fmt:formatNumber type="number" pattern="###,###원" value="${obj.price}"/></td>
                                    <td>${obj.itemSize}</td>
                                    <td>${obj.color}</td>
                                    <td><fmt:formatDate value="${obj.rdate}" pattern="yyyy-MM-dd"/></td>
                                    <td><fmt:formatDate value="${obj.udate}" pattern="yyyy-MM-dd"/></td>
                                    <td>${obj.isValid}</td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
                <!--End Advanced Tables -->
            </div>
        </div>
    </div>
    <!-- /. PAGE INNER  -->
</div>
<!-- /. PAGE WRAPPER -->
<!-- /. WRAPPER -->
<!-- JS Scripts-->

<style>
    img {
        width: 50px;
        height: 50px;
        border-radius: 50%;
    }
</style>

<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable({
            "order": [[0, "desc"]]  // 첫 번째 열(id)을 내림차순으로 정렬:: xml에서 order by desc가 안 먹혀서 dataTalbes 라이브러리를 활용.
        });
    });
</script>