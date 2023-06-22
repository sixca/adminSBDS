<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    //입력값 초기화 :: Reset 버튼
    $(document).ready(function() {
        $("#reset").click(function() {
            $("#name").val("");
            $("#license").val("");
            $("#area").val("");
            $("#startPeriod").val("");
            $("#endPeriod").val("");
        });
    });

    //평점 백그라운드 색상 조건부 설정
    document.addEventListener("DOMContentLoaded", function () {
        var avgRateElements = document.querySelectorAll('#avgRate');

        avgRateElements.forEach(function (avgRateElement) {
            var avgRate = parseFloat(avgRateElement.innerText);

            if (avgRate == 5) {
                avgRateElement.classList.add('bg-danger');
            } else if (avgRate >= 4 && avgRate < 5) {
                avgRateElement.classList.add('bg-warning');
            } else if (avgRate >= 3 && avgRate < 4) {
                avgRateElement.classList.add('bg-info');
            } else if (avgRate >= 2 && avgRate < 3) {
                avgRateElement.classList.add('bg-success');
            } else if (avgRate >= 1 && avgRate < 2) {
                avgRateElement.classList.add('bg-primary');
            } else if (avgRate >= 0 && avgRate < 1) {
                avgRateElement.classList.add('bg-secondary');
            }
        });
    });
</script>


<div class="content-wrapper">
    <!-- Content -->

    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">간병인 관리 /</span> Mate Management</h4>

        <!-- Basic Bootstrap Table -->
        <div class="card">
            <h5 class="card-header">간병인 현황</h5>
            <div class="card-body">
                <form action="/mate/findimpl" method="get">
                    <div class="row gx-3 gy-2 align-items-center justify-content-center">
                        <input type="hidden" name="keyword1" value="name">
                        <input type="hidden" name="keyword2" value="license">
                        <input type="hidden" name="keyword3" value="area">
                        <input type="hidden" name="keyword4" value="startPeriod">
                        <input type="hidden" name="keyword5" value="endPeriod">

                        <div class="col-md-2">
                            <label class="form-label" for="name">간병인명</label>
                            <input id="name" class="form-control me-2" type="text" name="search1"
                                   <c:if test="${value1 != ''}">value="${value1}"</c:if>>
                        </div>
                        <div class="col-md-2">
                            <label class="form-label" for="license">자격명</label>
                            <input id="license" class="form-control me-2" type="text" name="search2"
                                   <c:if test="${value2 != ''}">value="${value2}"</c:if>>
                        </div>
                        <div class="col-md-2">
                            <label class="form-label" for="area">지역명</label>
                            <input id="area" class="form-control me-2" type="text" name="search3"
                                   <c:if test="${value3 != ''}">value="${value3}"</c:if>>
                        </div>
                        <div class="col-md-1">
                            <label class="form-label" for="startPeriod">경력 검색</label>
                            <select id="startPeriod" class="form-select color-dropdown" type="number"
                                    name="startPeriod">
                                <option value="" selected>~부터</option> <!-- 공백을 선택할 수 있는 옵션 -->
                                <c:forEach var="option" begin="1" end="10">
                                    <option value="${option}"
                                            <c:if test="${option == value4}">selected</c:if>>${option}년차</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-1">
                            <label class="form-label" for="endPeriod">(년차)</label>
                            <select id="endPeriod" class="form-select color-dropdown" type="number" name="endPeriod">
                                <option value="" selected>~까지</option> <!-- 공백을 선택할 수 있는 옵션 -->
                                <c:forEach var="option" begin="1" end="10">
                                    <option value="${option}"
                                            <c:if test="${option == value5}">selected</c:if>>${option}년차</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-1">
                            <label class="form-label" for="showToastPlacement">&nbsp;</label>
                            <button id="showToastPlacement" class="btn btn-primary d-block mb-4">Show!</button>
                        </div>
                        <div class="col-md-1">
                            <label class="form-label" for="reset">&nbsp;</label>
                            <button type="button" id="reset" class="btn btn-outline-secondary account-image-reset mb-4">
                            <i class="bx bx-reset d-block d-sm-none"></i>
                            <span class="d-none d-sm-block">Reset</span>
                        </button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="table-responsive text-nowrap">
                <table class="table">
                    <thead>
                    <tr>
                        <th>프로필 사진</th>
                        <th>간병인번호</th>
                        <th>e-mail</th>
                        <th>이름</th>
                        <th>경력(년)</th>
                        <th>자격</th>
                        <th>지역</th>
                        <th>평점</th>
                        <th>활동여부</th>
                    </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                    <c:forEach var="obj" items="${cpage.getList()}" varStatus="status">
                        <input type="hidden" name="id" value="${obj.id}">
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
                            <td style="text-align: center">${obj.jobPeriod}</td>
                            <td>${obj.license}</td>
                            <td>${obj.area}</td>
                            <td><span id="avgRate" class="badge badge-center">${rlist[status.index].rate}</span></td>
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
                                        <a class="dropdown-item" href="/mate/detail?id=${obj.id}"
                                        ><i class="bx bx-edit-alt me-1"></i> Edit</a
                                        >
                                        <a class="dropdown-item" href="/mate/deleteimpl?id=${obj.id}"
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
                    <h4 class="fw-bold py-3 mb-4 text-center"><span
                            class="text-muted fw-light">조건을 입력하여 간병인 LIST를 출력하세요</span></h4>
                </c:if>
                <jsp:include page="../findpagemate.jsp"/>
            </div>
        </div>
    </div>
</div>
<!--/ Basic Bootstrap Table -->


<div class="buy-now">
    <a
            href="/mate/add"
            target="_blank"
            class="btn btn-danger btn-buy-now"
    >간병인 신규 등록</a
    >
</div>
