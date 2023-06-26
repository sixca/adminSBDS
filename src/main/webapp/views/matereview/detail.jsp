<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    function deleteReview() {
        if (confirm("해당 리뷰를 삭제하시겠습니까?")) {
            location.href = "/matereview/deleteimpl?id=" + ${mreviewinfo.id};
        }
    }

    function deleteComment(commentId) {
        if (confirm("해당 댓글을 삭제하시겠습니까?")) {
            location.href = "/matereview/deletecommentimpl?id=" + commentId;
        }
    }

</script>

<!-- Content wrapper -->
<div class="content-wrapper">
    <!-- Content -->

    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Mate Reviews Detail /</span> 간병인 후기 상세</h4>

        <div class="card">
            <h5 class="card-header">간병인 후기 상세</h5>
            <div class="table-responsive text-nowrap">


                <div class="col-md-12">
                    <div class="card">
                        <div class="card-content">
                            <table class="table table-condensed">
                                <tbody>
                                <tr>
                                    <td class="col-sm-2">작성 회원 명
                                    </td>
                                    <td class="col-sm-10">
                                        ${mreviewinfo.mateName}
                                    </td>
                                </tr>
                                <tr>
                                    <td>대상 간병인 명
                                    </td>
                                    <td>
                                        ${mreviewinfo.memberName} <span
                                            style="float: right; font-weight: bold; color: blue;">평점 : ${mreviewinfo.rate}점</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>등록일시
                                    </td>
                                    <td>
                                        <fmt:formatDate value="${mreviewinfo.rdate}" pattern="yyyy-MM-dd 00:00:00"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div class="col-md-6 col-xl-12">
                                            <div class="card shadow-none bg-transparent border border-primary mb-3">
                                                <div class="card-body">
                                                    <h6 class="card-title">작성 내용</h6>
                                                    <p class="card-text">${mreviewinfo.content}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <table class="table table-condensed">
                                <thead>
                                <tr>
                                    <td>
                                        <span style='float:right'>
                                            <input type="button" class="btn btn-primary px-4" value="후기 삭제"
                                                   onclick="deleteReview()">
                                            <a href="/matereview/all" class="btn btn-secondary px-4">Back</a>
                                        </span>
                                    </td>
                                </tr>
                                </thead>
                            </table>
                            <div class="clearBoth"><br/></div>
                            <table class="table table-borderless">
                                <thead>
                                <tr>
                                    <th>댓글 작성자 / 등록일</th>
                                    <th>댓글 내용</th>
                                    <th>삭제</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%-- DB에서 불러온 댓글 리스트를 순회하며 출력 --%>
                                <c:forEach var="c" items="${comment}">
                                    <c:if test="${c.reviewId eq mreviewinfo.id}">
                                        <tr>
                                            <td class="col-3"><i class="fab fa-angular fa-lg text-danger me-3"></i>
                                                <strong>${c.adminId}</strong> <span
                                                        style="font-size: 8px"><fmt:formatDate
                                                        value="${c.rdate}" pattern="yyyy-MM-dd"/></span></td>
                                            <td class="col-7">${c.mateComment}</td>
                                            <td class="col-2">
                                                <button class="badge bg-label-danger me-1" style="border-color: transparent;"
                                                        onclick="deleteComment(${c.id})">X
                                                </button>
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                                </tbody>
                            </table>
                            <table class="table table-borderless">
                                <thead>
                                <tr>
                                    <th>
                                        <form method="post" action="/matereview/matereviewcommentregister">
                                            <div class="form-group">
                                                <label for="comment">댓글 입력</label>
                                                <textarea id="comment" name="comment" class="form-control"
                                                          rows="3"></textarea>
                                            </div>
                                            <input name="adminId" type="hidden" value="${loginadm.getAdminId()}">
                                            <input type="hidden" name="reviewId" value="${reviewId}">
                                            <button type="submit" class="btn btn-primary px-4"
                                                    style="float:right; margin-top: 20px;">댓글 등록
                                            </button>
                                        </form>
                                    </th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
</div>
