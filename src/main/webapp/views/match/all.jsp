<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script>

    //form 리셋버튼
    function resetForm() {
        document.getElementById("objectgender").value = "";
        document.getElementById("status").value = "";
        document.getElementById("startDateTo").value = "";
        document.getElementById("startDateFrom").value = "";
    }

    function toggleStatus(element) {
        var id = element.getAttribute("data-id");
        var value = element.getAttribute("data-value");
        var newValue;

        if (value === "매칭완료") {
            if (confirm("매칭을 취소하시겠습니까?")) {
                newValue = "매칭취소";
            } else {
                return; // 매칭 취소를 취소한 경우 아무 작업도 수행하지 않음
            }
        } else if (value === "결제완료") {
            if (confirm("정산을 완료하시겠습니까?")) {
                newValue = "정산완료";
            } else {
                return; // 정산 완료를 취소한 경우 아무 작업도 수행하지 않음
            }
        } else {
            return; // 매칭완료 또는 결제완료가 아닌 경우 아무 작업도 수행하지 않음
        }

        element.setAttribute("data-value", newValue);

        // 변경된 값을 기준으로 텍스트 업데이트
        element.textContent = newValue;

        // CSS 클래스 업데이트
        element.classList.remove("bg-label-primary");
        element.classList.remove("bg-label-danger");
        element.classList.remove("bg-label-dark");
        element.classList.remove("bg-label-warning");
        element.classList.remove("bg-label-info");
        element.classList.remove("bg-label-success");
        element.classList.remove("bg-label-secondary");

        if (newValue === "매칭대기") {
            element.classList.add("bg-label-primary");
        } else if (newValue === "매칭완료") {
            element.classList.add("bg-label-danger");
        } else if (newValue === "매칭취소") {
            element.classList.add("bg-label-dark");
        } else if (newValue === "결제대기") {
            element.classList.add("bg-label-warning");
        } else if (newValue === "결제완료") {
            element.classList.add("bg-label-info");
        } else if (newValue === "정산완료") {
            element.classList.add("bg-label-success");
        } else if (newValue === "환불완료") {
            element.classList.add("bg-label-secondary");
        }

        document.addEventListener("DOMContentLoaded", function() {
            var badgeElements = document.getElementsByClassName("badge");

            for (var i = 0; i < badgeElements.length; i++) {
                var badge = badgeElements[i];

                badge.addEventListener("mouseover", function() {
                    this.style.cursor = "pointer";
                });

                badge.addEventListener("mouseout", function() {
                    this.style.cursor = "default";
                });
            }
        });

        // 서버에 데이터 업데이트를 요청하는 Ajax 호출
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/match/updateStatus/" + id, true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // 서버 응답 처리
                var response = xhr.responseText;
                console.log("업데이트 결과: " + response);
            }
        };

        // 수정된 부분: 요청 데이터를 쿼리 문자열로 전송
        xhr.send("id=" + encodeURIComponent(id) + "&status=" + encodeURIComponent(newValue));
    }


</script>
<!-- Content wrapper -->
<div class="content-wrapper">
    <!-- Content -->

    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Match List /</span> 매칭 현황 관리</h4>

        <!-- Basic Bootstrap Table -->

        <!-- Hoverable Table rows -->
        <div class="card">
            <div class="card-header d-flex align-items-center justify-content-between">
                <h5 class="card-header">매칭 리스트</h5>
                <div class="d-flex">
                    <form action="/match/findimpl" method="get" class="form-inline well">
                        <input type="hidden" name="keyword1" value="objectGender">
                        <input type="hidden" name="keyword2" value="status">
                        <input type="hidden" name="keyword3" value="startDate">
                        <input type="hidden" name="keyword4" value="startDate">
                        <div class="form-group">
                            <div class="input-group input-group-sm">
                                <label class="form-label" for="objectgender">성별별</label>&nbsp;&nbsp;&nbsp;
                                <select id="objectgender" class="form-control" name="search1" style="width: 100px;">
                                    <option value="">전체</option>
                                    <option value="F" <c:if test="${value1 == 'F'}">selected</c:if>>여성</option>
                                    <option value="M" <c:if test="${value1 == 'M'}">selected</c:if>>남성</option>
                                </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="form-label" for="status">과정별</label>&nbsp;&nbsp;&nbsp;
                                <select id="status" class="form-control" name="search2" style="width: 100px;">
                                    <option value="">전체</option>
                                    <option value="매칭대기" <c:if test="${value2 == '매칭대기'}">selected</c:if>>매칭대기</option>
                                    <option value="매칭완료" <c:if test="${value2 == '매칭완료'}">selected</c:if>>매칭완료</option>
                                    <option value="매칭취소" <c:if test="${value2 == '매칭취소'}">selected</c:if>>매칭취소</option>
                                    <option value="결제대기" <c:if test="${value2 == '결제대기'}">selected</c:if>>결제대기</option>
                                    <option value="결제완료" <c:if test="${value2 == '결제완료'}">selected</c:if>>결제완료</option>
                                    <option value="정산완료" <c:if test="${value2 == '정산완료'}">selected</c:if>>정산완료</option>
                                    <option value="환불완료" <c:if test="${value2 == '환불완료'}">selected</c:if>>환불완료</option>
                                </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="form-label" for="startDateTo">개시기간 To</label>&nbsp;&nbsp;&nbsp;
                                <input id="startDateTo" class="form-control" type="date" name="startDateTo"
                                       style="width: 100px;"
                                       <c:if test="${value3 != ''}">value="${value3}"</c:if>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="form-label" for="startDateFrom">개시기간 From</label>&nbsp;&nbsp;&nbsp;
                                <input id="startDateFrom" class="form-control" type="date" name="startDateFrom"
                                       style="width: 100px;"
                                       <c:if test="${value4 != ''}">value="${value4}"</c:if>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <button class="btn btn-outline-primary" id="search_btn" type="submit">Search</button>
                                <button class="btn btn-outline-secondary account-image-reset" id="reset_btn"
                                        type="button" onclick="resetForm()">
                                    <i class="bx bx-reset d-block d-sm-none"></i>
                                    <span class="d-none d-sm-block">Reset</span>
                                </button>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
            <div class="table-responsive text-nowrap">
                <table class="table table-hover text-center align-middle">
                    <thead>
                    <tr>
                        <th class="center">#</th>
                        <th class="center">메이트 명</th>
                        <th class="center">시니어 명</th>
                        <th class="center">개시일자</th>
                        <th class="center">종료일자</th>
                        <th class="center">종류</th>
                        <th class="center">지역</th>
                        <th class="center">대상 성별</th>
                        <th class="center">대상 생년월일</th>
                        <th class="center">상태</th>
                        <th class="center">금액</th>
                        <th class="center">결제수단</th>
                        <th class="center">결제일자</th>
                    </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                    <c:forEach var="obj" items="${cpage.getList()}">
                        <tr>
                            <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>${obj.id}</strong></td>
                            <td>
                                <a href="/mate/findimpl?keyword1=name&keyword2=license&keyword3=area&keyword4=startPeriod&keyword5=endPeriod&search1=${obj.mateName}&search2=&search3=&startPeriod=&endPeriod=">${obj.mateName}</a>
                            </td>
                            <td>
                                <a href="/member/findimpl?keyword1=email&keyword2=name&keyword3=birth&keyword4=birth&search1=&search2=${obj.memberName}&startDate=&endDate=">${obj.memberName}</a>
                            </td>
                            <td>${obj.startDate}</td>
                            <td>${obj.endDate}</td>
                            <td>${obj.service}</td>
                            <td>${obj.area}</td>
                            <td>${obj.objectGender}</td>
                            <td>${obj.objectBirth}</td>
                            <td>
                                <span class="badge ${obj.status eq '매칭대기' ? 'bg-label-primary' : (obj.status eq '매칭완료' ? 'bg-label-danger' : (obj.status eq '매칭취소' ? 'bg-label-dark' : (obj.status eq '결제대기' ? 'bg-label-warning' : (obj.status eq '결제완료' ? 'bg-label-info' : (obj.status eq '정산완료' ? 'bg-label-success' : 'bg-label-secondary')))))} me-1" onclick="toggleStatus(this)" data-id="${obj.id}" data-value="${obj.status}">
                                    <c:choose>
                                        <c:when test="${obj.status eq '매칭대기'}">
                                            매칭대기
                                        </c:when>
                                        <c:when test="${obj.status eq '매칭완료'}">
                                            매칭완료
                                        </c:when>
                                        <c:when test="${obj.status eq '매칭취소'}">
                                            매칭취소
                                        </c:when>
                                        <c:when test="${obj.status eq '결제대기'}">
                                            결제대기
                                        </c:when>
                                        <c:when test="${obj.status eq '결제완료'}">
                                            결제완료
                                        </c:when>
                                        <c:when test="${obj.status eq '정산완료'}">
                                            정산완료
                                        </c:when>
                                        <c:when test="${obj.status eq '환불완료'}">
                                            환불완료
                                        </c:when>
                                    </c:choose>
                                </span>
                            </td>
                            <td>${obj.price}</td>
                            <td>${obj.payment}</td>
                            <td><fmt:formatDate value="${obj.payDate}" pattern="yyyy-MM-dd 00:00:00"/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <c:if test="${cpage.getList() == null}">
                    <h4 style="text-align: center ">데이터가 없습니다.</h4>
                </c:if>
            </div>
            <jsp:include page="../findpagematch.jsp"/>
        </div>
        <!--/ Hoverable Table rows -->
    </div>
</div>

