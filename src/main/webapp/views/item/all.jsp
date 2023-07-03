<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
    // delete 버튼 확인창
    function confirmDelete(id) {
        if (confirm("삭제 시, 절대 복구할 수 없습니다. 그래도 진행하시겠습니까?")) {
            window.location.href = "/item/deleteimpl?id=" + id;
        }
    }
</script>


<div class="content-wrapper">
    <!-- Content -->

    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">제품 관리 /</span> Item Management</h4>

        <!-- Basic Bootstrap Table -->
        <div class="card">
            <div class="card-header d-flex align-items-center justify-content-between">
                <h5 class="card-header">제품 현황</h5>
                <div class="d-flex">
                    <div class="input-group input-group-sm">
                        <input type="text" class="form-control" id="search-input1" placeholder="제품명">
                        <input type="text" class="form-control" id="search-input2" placeholder="최대 금액">
                        <button class="btn btn-outline-primary" type="button" onclick="window.location.href='/matereview/allpage'">Search</button>
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
                        <th>등록일시</th>
                        <th class="text-center">수정 및 삭제</th>
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
                            <td><a href="#">${obj.name}</a></td>
                            <td><fmt:formatNumber type="number" pattern="###,###원" value="${obj.price}"/></td>
                            <td><fmt:formatDate value="${obj.rdate}" pattern="yyyy-MM-dd"/></td>
                            <td class="text-center">
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
            </div>
        </div>
    </div>
</div>

<div class="buy-now">
    <a
            href="/item/register"
            target="_blank"
            class="btn btn-outline-danger btn-buy-now"
    >제품 신규 등록</a
    >
</div>
