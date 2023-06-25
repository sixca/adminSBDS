<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script>
    function deleteReview() {
        location.href = "/matereview/deleteimpl?id=" + ${mreviewinfo.id};
    }

</script>

<div id="page-wrapper">
    <div class="header">
        <h1 class="page-header">
            간병인 후기 상세 <small>Mate Review Detail.</small>
        </h1>
    </div>
    <div id="page-inner">

        <div class="row">

            <div class="col-md-12">
                <div class="card">
                    <div class="card-action">
                        후기 내용
                    </div>
                    <div class="card-content">
                            <table class="table table-condensed">
<%--                                <thead>--%>
<%--                                <tr align="center">--%>
<%--                                    <th width="10%">제목</th>--%>
<%--                                    <th width="60%">${mreviewinfo.content}</th>--%>
<%--                                </tr>--%>
<%--                                </thead>--%>
                                <tbody>
                                <tr>
                                    <td>작성 회원 명
                                    </td>
                                    <td>
                                        ${mreviewinfo.mateName}
                                    </td>
                                </tr>
                                <tr>
                                    <td>대상 간병인 명
                                    </td>
                                    <td>
                                        ${mreviewinfo.memberName} <span style="float: right; font-weight: bold; color: blue;">평점 : ${mreviewinfo.rate}점</span>
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
                                        <p>${mreviewinfo.content}</p>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <table class="table table-condensed">
                                <thead>
                                <tr>
                                    <td>
                                        <span style='float:right'>
                                            <input type="button" class="btn btn-primary px-4" value="Delete" onclick="deleteReview()">
                                            <a href="javascript:history.back()" class="btn btn-secondary px-4">Back</a>
                                        </span>
                                    </td>
                                </tr>
                                </thead>
                            </table>
                        <div class="clearBoth"><br/></div>
                        <table id="commentTable" class="table table-condensed">
                            <thead id="replycomment">
                            <tr>
                                <th>작성자</th>
                                <th>등록일자</th>
                                <th>내용</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%-- DB에서 불러온 댓글 리스트를 순회하며 출력 --%>
                            <c:forEach var="c" items="${comment}">
                                <c:if test="${c.reviewId eq mreviewinfo.id}">
                                    <tr>
                                        <td>${c.adminId}</td>
                                        <td><fmt:formatDate value="${c.rdate}" pattern="yyyy-MM-dd"/></td>
                                        <td>${c.mateComment}</td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                            </tbody>
                        </table>
                        <table class="table table-condensed">
                            <thead>
                                <tr>
                                    <td>
                                        <form method="post" action="/matereview/matereviewcommentregister">
                                            <div class="form-group">
                                                <label for="comment">댓글 입력</label>
                                                <textarea id="comment" name="comment" class="form-control" rows="3"></textarea>
                                            </div>
                                            <input name="adminId" type="hidden" value="${loginadm.getAdminId()}">
                                            <input type="hidden" name="reviewId" value="${reviewId}">
                                            <button type="submit" class="btn btn-primary px-4" style="float:right">댓글 등록</button>
                                        </form>
                                    </td>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
            <!-- /. PAGE INNER  -->
        </div>
    </div>
</div>

<style>
    #replycomment {
        font-size: 9px;
        color: blue;
    }
</style>
