<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    // delete 버튼 확인창
    function confirmDelete(id) {
        if (confirm("삭제 시, 절대 복구할 수 없습니다. 그래도 진행하시겠습니까?")) {
            window.location.href = "/member/deleteimpl?id=" + id;
        }
    }

    // 활동 or 정지 클릭 변환 :: 클릭 이벤트 핸들러 함수 toggleStatus
    function toggleStatus(element) {
        var id = element.getAttribute("data-id");
        var value = element.getAttribute("data-value");
        var newValue = value === "1" ? "0" : "1";
        element.setAttribute("data-value", newValue);

        // 변경된 값을 기준으로 CSS 클래스 및 텍스트 업데이트
        element.classList.toggle("bg-label-primary", newValue === "1");
        element.classList.toggle("bg-label-danger", newValue === "0");
        element.textContent = newValue === "1" ? "정상" : "정지";

        // confirm 창을 통해 사용자의 확인을 받음
        var confirmed = confirm("활동상태가 변경됩니다. 계속 하시겠습니까?");
        if (!confirmed) {
            // 변경이 취소된 경우 원래 값으로 되돌리기
            newValue = value;
            element.setAttribute("data-value", newValue);
            element.classList.toggle("bg-label-primary", newValue === "1");
            element.classList.toggle("bg-label-danger", newValue === "0");
            element.textContent = newValue === "1" ? "정상" : "정지";
            return;
        }

        // 서버에 데이터 업데이트를 요청하는 Ajax 호출
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/member/updateStatus/" + id, true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // 서버 응답 처리
                var response = xhr.responseText;
                console.log("업데이트 결과: " + response);
            }
        };

        // 수정된 부분: 요청 데이터를 쿼리 문자열로 전송
        xhr.send("id=" + id + "&valid=" + newValue);
    }



</script>

<div class="content-wrapper">
    <!-- Content -->
    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Member Management /</span> 시니어 회원 관리</h4>
        <!-- Basic Bootstrap Table -->
        <div class="card">
            <h5 class="card-header">시니어 회원 현황</h5>
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
                        <th style="width: 50px;">주소</th>
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
                                <span class="badge ${obj.valid eq 1 ? 'bg-label-primary' : 'bg-label-danger'} me-1" style="cursor: pointer;" onclick="toggleStatus(this)" data-id="${obj.id}" data-value="${obj.valid}">
                                    <c:choose>
                                        <c:when test="${obj.valid eq 1}">
                                            정상
                                        </c:when>
                                        <c:when test="${obj.valid eq 0}">
                                            정지
                                        </c:when>
                                    </c:choose>
                                </span>
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
                    <h4 style="color: hotpink; margin-top: 15px; font-size: 15px; text-align: center;">검색 조건을 입력하세요</h4>
                </c:if>
                <jsp:include page="../findpagemember.jsp"/>
            </div>
        </div>
    </div>
</div>
<!--/ Basic Bootstrap Table -->