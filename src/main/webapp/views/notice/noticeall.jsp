<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="page-wrapper">
    <div class="header">
        <div class="row align-items-center">
            <div class="col-lg-3 d-flex align-items-center">
                <h1 class="page-header" style="display: inline-block; vertical-align: middle;">공지 관리</h1>
                <a href="/notice/register" class="btn-floating btn-small" style="margin-top: 20px;"><i class="material-icons">add</i></a>
            </div>
        </div>
    </div>
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <!-- Advanced Tables -->
                <div class="card">
                    <div class="card-action">
                        공지사항 목록
                    </div>
                    <div class="card-content">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                <tr>
                                    <th>공지사항 번호</th>
                                    <th>관리자 번호</th>
                                    <th>제목</th>
                                    <th>내용</th>
                                    <th class="center">대표 이미지</th>
                                    <th>조회수</th>
                                    <th>등록일자</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="obj" items="${notices}">
                                        <tr class="odd gradeX">
                                            <td><a href="/notice/${obj.id}">${obj.id}</a></td>
                                            <td>${obj.admId}</td>
                                            <td>${obj.title}</td>
                                            <td>${obj.content}</td>
                                            <td class="center"><img src="/uimg/${obj.img}" alt="Notice Image"></td>
                                            <td>${obj.hit}</td>
                                            <td><fmt:formatDate value="${obj.rdate}" pattern="yyyy-MM-dd"/></td>
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