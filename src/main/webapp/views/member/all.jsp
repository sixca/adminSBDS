<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="content-wrapper">
    <!-- Content -->

    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">회원 관리 /</span> Member Management</h4>

        <!-- Basic Bootstrap Table -->
        <div class="card">
            <h5 class="card-header">회원 현황</h5>
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
                    <c:forEach var="obj" items="${mlist}">
                        <tr>
                            <td>
                                <ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center justify-content-center">
                                    <li
                                            data-bs-toggle="tooltip"
                                            data-popup="tooltip-custom"
                                            data-bs-placement="top"
                                            class="avatar avatar-xs pull-up"
                                            title="Lilian Fuller"
                                    >
                                        <img src="/uimg/${obj.img}" alt="${obj.img}" class="rounded-circle" />
                                    </li>
                                </ul>
                            </td>
                            <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>${obj.id}</strong></td>
                            <td>${obj.email}</td>
                            <td>${obj.name}</td>
                            <td>${obj.birth}</td>
                            <td>${obj.tel}</td>
                            <td>${obj.addr}</td>
                            <td class="d-flex align-items-center justify-content-center">
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
                                    <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
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
            </div>
        </div>
    </div>
</div>
        <!--/ Basic Bootstrap Table -->
