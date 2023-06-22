<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="content-wrapper">
    <!-- Content -->

    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">회원 관리 /</span> Member Management</h4>

        <!-- Basic Bootstrap Table -->
        <div class="card">
            <h5 class="card-header">회원 현황</h5>
            <div class="card-body">
                <form action="/member/findimpl" method="get">
                    <div class="row gx-3 gy-2 align-items-center justify-content-center">
                        <input type="hidden" name="keyword1" value="email">
                        <input type="hidden" name="keyword2" value="name">
                        <input type="hidden" name="keyword3" value="birth">
                        <input type="hidden" name="keyword4" value="birth">

                        <div class="col-md-2">
                            <label class="form-label" for="email">이메일</label>
                            <input id="email" class="form-control me-2" type="text" name="search1"
                                   <c:if test="${value1 != ''}">value="${value1}"</c:if>>
                        </div>
                        <div class="col-md-2">
                            <label class="form-label" for="name">회원명</label>
                            <input id="name" class="form-control me-2" type="text" name="search2"
                                   <c:if test="${value2 != ''}">value="${value2}"</c:if>>
                        </div>
                        <div class="col-md-2">
                            <label class="form-label" for="startDate">생년월일 Start</label>
                            <input id="startDate" class="form-control me-2" type="date" name="startDate"
                                   <c:if test="${value3 != ''}">value="${value3}"</c:if>>
                        </div>
                        <div class="col-md-2">
                            <label class="form-label" for="endDate">생년월일 End</label>
                            <input id="endDate" class="form-control me-2" type="date" name="endDate"
                                   <c:if test="${value4 != ''}">value="${value4}"</c:if>>
                        </div>
                        <div class="col-md-2">
                            <label class="form-label" for="showToastPlacement">&nbsp;</label>
                            <button id="showToastPlacement" class="btn btn-primary d-block">Search</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="table-responsive text-nowrap">
                <table class="table">
                    <thead>
                    <tr>
                        <th>프로필 사진</th>
                        <th>회원번호</th>
                        <th>e-mail</th>
                        <th>이름</th>
                        <th>생년월일</th>
                        <th>전화번호</th>
                        <th>주소</th>
                        <th>활동여부</th>
                    </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                    <c:forEach var="obj" items="${cpage.getList()}">

                        <%--    <c:forEach var="obj" items="${mlist}">--%>
                        <tr>
                            <td>
                                <ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center justify-content-center">
                                    <li
                                            data-bs-toggle="tooltip"
                                            data-popup="tooltip-custom"
                                            data-bs-placement="top"
                                            class="avatar avatar-sm pull-up"
                                            title="${obj.name}"
                                    >
                                        <img src="/uimg/${obj.img}" alt="${obj.img}" class="rounded-circle"/>
                                    </li>
                                </ul>
                            </td>
                            <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>${obj.id}</strong></td>
                            <td>${obj.email}</td>
                            <td>${obj.name}</td>
                            <td>${obj.birth}</td>
                            <td>${obj.tel}</td>
                            <td>${obj.addr}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${obj.valid eq 1}">
                                        <span class="badge bg-label-primary me-1">정상</span>
                                    </c:when>
                                    <c:when test="${obj.valid eq 0}">
                                        <span class="badge bg-label-danger me-1">정지</span>
                                    </c:when>
                                </c:choose>
                            </td>
                            <td>
                                <div class="dropdown">
                                    <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                            data-bs-toggle="dropdown">
                                        <i class="bx bx-dots-vertical-rounded"></i>
                                    </button>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="/member/detail?id=${obj.id}"
                                        ><i class="bx bx-edit-alt me-1"></i> Edit</a
                                        >
                                        <a class="dropdown-item" href="/member/deleteimpl?id=${obj.id}"
                                        ><i class="bx bx-trash me-1"></i> Delete</a
                                        >
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <c:if test="${cpage.getList() == null}">
                    <h4>데이터가 없습니다.</h4>
                </c:if>
                <jsp:include page="../findpagemember.jsp"/>
            </div>
        </div>
    </div>
</div>
<!--/ Basic Bootstrap Table -->