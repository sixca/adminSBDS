<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    function deleteSelectedNotice() {
        var checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
        var noticeIds = Array.from(checkboxes).map(function(checkbox) {
            return parseInt(checkbox.value);
        });

        if (noticeIds.length > 0) {
            var confirmation = confirm("선택한 Notice를 삭제하시겠습니까?");
            if (confirmation) {
                var url = "/notice/deleteimpl?";
                noticeIds.forEach(function(id, index) {
                    if (index > 0) {
                        url += "&";
                    }
                    url += "id=" + encodeURIComponent(id);
                });
                location.href = url;
            }
        } else {
            alert("삭제할 Notice를 선택해주세요");
        }
    }

    $(document).ready(function() {
        // 발행&미발행 스팬 태그 클릭 이벤트 처리  :: 데이터 변경없이 CSS만 변동
        $(".notice-status").click(function() {
            var noticeId = $(this).data("notice-id");
            var status = $(this).data("status");

            // 발행 여부에 따라 클래스 변경 및 텍스트 변경
            if (status === "published") {
                $(this).removeClass("bg-label-primary").addClass("bg-label-danger");
                $(this).text("미발행");
                $(this).data("status", "unpublished");
            } else {
                $(this).removeClass("bg-label-danger").addClass("bg-label-primary");
                $(this).text("발행");
                $(this).data("status", "published");
            }
        });
    });

    // 이미지 클릭 시, 모달창 띄우기
    let imgModal = {
        init: function() {
            var noticeModal = document.getElementById('noticeModal');
            noticeModal.addEventListener('show.bs.modal', function(event) {
                var image = event.relatedTarget.getAttribute('data-theImage');
                var modalImage = document.getElementById('modalImage');
                modalImage.setAttribute('src', image);
            });
        }
    };

    $(function() {
        imgModal.init();
    });


</script>

<div class="content-wrapper">
    <!-- Content -->
    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Notice Management /</span> 공지 & 이벤트 관리</h4>

        <!-- Basic Bootstrap Table -->

        <!-- Hoverable Table rows -->
        <div class="card">
            <div class="card-header d-flex align-items-center justify-content-between">
                <h5 class="m-0">Notice List</h5>
                <form action="/notice/search" method="get" id="search_form" class="form-inline well">
                    <div class="d-flex">
                        <select class="form-select form-select-sm me-2" id="notice-type-select" name="title">
                            <option value="">전체</option>
                            <option value="공지" ${ns.title == '공지' ? 'selected' : ''}>[공지]</option>
                            <option value="이벤트" ${ns.title == '이벤트' ? 'selected' : ''}>[이벤트]</option>
                        </select>
                        <div class="input-group input-group-sm">
<%--                            <input type="text" class="form-control" id="search-input" name="keyword" value="${title}" placeholder="검색어 입력">--%>
                            <button class="btn btn-outline-primary" type="submit">Search</button>
                        </div>
                    </div>
                </form>


            </div>
            <div class="table-responsive text-nowrap">
                <table class="table table-hover text-center align-middle">
                    <thead>
                    <tr class="text-center">
                        <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#</th>
                        <th>관리자번호</th>
                        <th>제목</th>
                        <th>대표이미지</th>
                        <th>조회수</th>
                        <th>등록일자</th>
                        <th>발행여부</th>
                        <th>Check</th>
                    </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                    <c:forEach var="obj" items="${cpage.getList()}" varStatus="status">
                        <tr>
                            <td><i class="fab fa-angular fa-lg text-danger me-3"></i><strong>${obj.id}</strong></td>
                            <td>${obj.admId}</td>
                            <td><a href="/notice/${obj.id}">${obj.title}</a></td>
                            <td class="center">
                                <div class="mt-3">
                                    <img
                                            src="/uimg/${obj.img}"
                                            alt="Notice Image"
                                            type="button"
                                            data-bs-toggle="modal"
                                            data-bs-target="#noticeModal"
                                            data-theImage="/uimg/${obj.img}"
                                    />
                                    <!-- Modal -->
                                    <div class="modal fade" id="noticeModal" tabindex="-1" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered modal-m" role="document">
                                            <div class="modal-content">
                                                <img id="modalImage" alt="Modal Image" style="width: 100%; height: auto;" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td>${obj.hit}</td>
                            <td><fmt:formatDate value="${obj.rdate}" pattern="yyyy-MM-dd"/></td>
                            <td>
                                <span class="badge bg-label-primary me-1 notice-status" data-notice-id="${obj.id}" data-status="published">발행</span>
                            </td>
                            <td class="d-flex justify-content-center">
                                <br/><br/><br/>
                                <div class="mx-auto mt-4">
                                    <input class="form-check-input" type="checkbox" id="indeterminate-checkbox-${obj.id}" value="${obj.id}"/>
                                    <label for="indeterminate-checkbox-${obj.id}"></label>
                                </div>
                                <br/><br/>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:forEach var="obj" items="${searchlist}" varStatus="status">
                        <tr>
                            <td><i class="fab fa-angular fa-lg text-danger me-3"></i><strong>${obj.id}</strong></td>
                            <td>${obj.admId}</td>
                            <td><a href="/notice/${obj.id}">${obj.title}</a></td>
                            <td class="center">
                                <div class="mt-3">
                                    <img
                                            src="/uimg/${obj.img}"
                                            alt="Notice Image"
                                            type="button"
                                            data-bs-toggle="modal"
                                            data-bs-target="#noticeModal"
                                            data-theImage="/uimg/${obj.img}"
                                    />
                                    <!-- Modal -->
                                    <div class="modal fade" id="noticeModal" tabindex="-1" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered modal-m" role="document">
                                            <div class="modal-content">
                                                <img id="modalImage" alt="Modal Image" style="width: 100%; height: auto;" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td>${obj.hit}</td>
                            <td><fmt:formatDate value="${obj.rdate}" pattern="yyyy-MM-dd"/></td>
                            <td>
                                <span class="badge bg-label-primary me-1 notice-status" data-notice-id="${obj.id}" data-status="published">발행</span>
                            </td>
                            <td class="d-flex justify-content-center">
                                <br/><br/><br/>
                                <div class="mx-auto mt-4">
                                    <input class="form-check-input" type="checkbox" id="indeterminate-checkbox-${obj.id}" value="${obj.id}"/>
                                    <label for="indeterminate-checkbox-${obj.id}"></label>
                                </div>
                                <br/><br/>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="row justify-content-between">
                <div class="col-sm-1" style="margin-left: 30px; margin-bottom: 20px;">
                    <a href="/notice/register" class="btn btn-warning">Register</a>
                </div>
                <div class="col-sm-1" style="margin-right: 30px; margin-bottom: 20px;">
                    <button type="button" class="btn btn-primary" onclick="deleteSelectedNotice()">Delete</button>
                </div>
            </div>
            <jsp:include page="../page.jsp"/>
        </div>
        <!--/ Hoverable Table rows -->
    </div>
</div>



<style>
    img {
        width: 50px;
        height: 50px;
        border-radius: 50%;
    }
</style>
