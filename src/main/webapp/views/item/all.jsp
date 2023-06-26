<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="content-wrapper">
    <!-- Content -->

    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">상품 관리 /</span> Item Management</h4>

        <!-- Basic Bootstrap Table -->
        <div class="card">
            <h5 class="card-header">상품 현황</h5>
            <div class="card-body">

                    <div class="row gx-3 gy-2 align-items-center justify-content-center">

                        <div class="col-md-2">
                            <label class="form-label" for="name">제품명</label>
                            <input id="name" class="form-control me-2" type="text" name="search1">
                        </div>
                        <div class="col-md-2">
                            <label class="form-label" for="license">가격</label>
                            <input id="license" class="form-control me-2" type="text" name="search2">
                        </div>
                        <div class="col-md-2">
                            <label class="form-label" for="area">사이즈</label>
                            <input id="area" class="form-control me-2" type="text" name="search3">
                        </div>
                        <div class="col-md-2">
                            <label class="form-label" for="color">색상</label>
                            <input id="color" class="form-control me-2" type="text" name="search3">
                        </div>
                        <div class="col-md-1">
                            <label class="form-label" for="showToastPlacement">&nbsp;</label>
                            <button id="showToastPlacement" class="btn btn-primary d-block mb-4">Search!</button>
                        </div>
                        </div>
                    </div>
            </div>
            <div class="table-responsive text-nowrap">
                <table class="table">
                    <thead>
                    <tr>
                        <th>제품사진</th>
                        <th>제품번호</th>
                        <th>제품명</th>
                        <th>가격</th>
                        <th>사이즈</th>
                        <th>색상</th>
                        <th>등록일시</th>
                        <th>수정 및 삭제</th>
                    </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                    <c:forEach var="obj" items="${items}" varStatus="status">
                        <input type="hidden" name="id" value="${obj.id}">
                        <tr>
                            <td>
                                <ul class="list-unstyled users-list m-0 avatar-group d-flex">
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
                            <td>${obj.name}</td>
                            <td><fmt:formatNumber type="number" pattern="###,###원" value="${obj.price}"/></td>
                            <td style="text-align: center">${obj.itemSize}</td>
                            <td>${obj.color}</td>
                            <td><fmt:formatDate value="${obj.rdate}" pattern="yyyy-MM-dd" /></td>
                            <td>
                                <div class="dropdown">
                                    <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                            data-bs-toggle="dropdown">
                                        <i class="bx bx-dots-vertical-rounded"></i>
                                    </button>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="/mate/detail?id=${obj.id}"
                                        ><i class="bx bx-edit-alt me-1"></i> Edit</a
                                        >
                                        <a class="dropdown-item" href="#" onclick="confirmDelete(${obj.id})">
                                            <i class="bx bx-trash me-1"></i> Delete
                                        </a>
                                    </div>
                                </div>
                            </td>

                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <c:if test="${cpage.getList() == null}">
                    <h4 class="fw-bold py-3 mb-4 text-center"><span
                            class="text-muted fw-light">조건을 입력하여 상품 리스트를 출력하세</span></h4>
                </c:if>
                <jsp:include page="../findpagemate.jsp"/>
            </div>
        </div>
</div>

<!--/ Basic Bootstrap Table -->

