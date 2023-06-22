<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<script>
    //성별, 연령별 매치 갯수 차트
    let chart = {
        init: function () {
            Highcharts.chart('container', {
                data: {
                    table: 'datatable'
                },
                chart: {
                    type: 'column'
                },
                title: {
                    text: ''
                },
                subtitle: {
                    text: ''
                },
                xAxis: {
                    type: 'category'
                },
                yAxis: {
                    allowDecimals: false,
                    title: {
                        text: 'Count'
                    }
                }
            });
        }
    }

    let ajax = {
        init: function () {
            $.ajax({
                url: "/chart1",
                type: "GET",
                dataType: "json",
                success: function (data) {
                    // 데이터 채우기
                    for (var gender in data) {
                        var ageGroups = data[gender];
                        var table = $("#datatable");

                        for (var ageGroup in ageGroups) {
                            var row = table.find("tr:contains('" + ageGroup + "')");
                            var columnIndex = gender === "여성" ? 1 : 0;
                            row.find("td").eq(columnIndex).text(ageGroups[ageGroup]);
                        }
                    }

                    // 차트 초기화 및 그리기
                    chart.init();
                },
                error: function (xhr, status, error) {
                    console.log(error);
                }
            });
        }
    }

    let getcnttomatched = {
        init: function () {
            getcnttomatched.getcnt();
        },
        getcnt: function () {
            $.ajax({
                url: '/getcnttomatched',
                success: function (result) {
                    console.log(result);
                    $('#getcnt').text(result);
                }
            })
        },
    };

    let gettotalprice = {
        init: function () {
            gettotalprice.getTP();
        },
        getTP: function () {
            $.ajax({
                url: '/gettotalprice',
                success: function (result) {
                    console.log(result);
                    var formattedPrice = formatNumber(result);
                    $('#gettotalprice').text(formattedPrice);
                }
            })
        },
    };

    let getcancelledcnt = {
        init: function () {
            getcancelledcnt.getcnt();
        },
        getcnt: function () {
            $.ajax({
                url: '/getcancelledcnt',
                success: function (result) {
                    console.log(result);
                    $('#getcancelledcnt').text(result);
                }
            })
        },
    };

    let getconfirmpercent = {
        init: function () {
            getconfirmpercent.getcnt();
        },
        getcnt: function () {
            $.ajax({
                url: '/getconfirmpercent',
                success: function (result) {
                    console.log(result);
                    $('#getconfirmpercent').text(result);
                }
            })
        },
    };

    let getpaydonecnt = {
        init: function () {
            getpaydonecnt.getcnt();
        },
        getcnt: function () {
            $.ajax({
                url: '/getpaydonecnt',
                success: function (result) {
                    console.log(result);
                    $('#getpaydonecnt').text(result);
                }
            })
        },
    };

    function formatNumber(number) {
        return number.toLocaleString();
    }

    $(document).ready(function () {
        ajax.init();
        getcnttomatched.init();
        gettotalprice.init();
        getcancelledcnt.init();
        getconfirmpercent.init();
        getpaydonecnt.init();

        setInterval(function () {
            ajax.init();
            getcnttomatched.init();
            gettotalprice.init();
            getcancelledcnt.init();
            getconfirmpercent.init();
            getpaydonecnt.init();
        }, 5000);
    });

    //인기 간병인 TOP10 테이블 :: 순위 뿌리기 (1~10)
    document.addEventListener("DOMContentLoaded", function () {
        var rankNumbers = document.querySelectorAll(".rank-number");
        for (var i = 0; i < rankNumbers.length; i++) {
            rankNumbers[i].textContent = i + 1;
        }
    });

    //인기 간병인 TOP10 테이블 :: 평점 배경색 조건부 적용
    document.addEventListener("DOMContentLoaded", function () {
        var avgRateElements = document.querySelectorAll('#avgRate');

        avgRateElements.forEach(function (avgRateElement) {
            var avgRate = parseFloat(avgRateElement.innerText);

            if (avgRate == 5) {
                avgRateElement.classList.add('bg-label-danger');
            } else if (avgRate >= 4 && avgRate < 5) {
                avgRateElement.classList.add('bg-label-warning');
            } else if (avgRate >= 3 && avgRate < 4) {
                avgRateElement.classList.add('bg-label-info');
            } else if (avgRate >= 2 && avgRate < 3) {
                avgRateElement.classList.add('bg-label-success');
            } else if (avgRate >= 1 && avgRate < 2) {
                avgRateElement.classList.add('bg-label-primary');
            } else if (avgRate >= 0 && avgRate < 1) {
                avgRateElement.classList.add('bg-label-secondary');
            }
        });
    });

</script>


<div class="container-xxl flex-grow-1 container-p-y">
    <h4 class="fw-semibold py-3 mb-4"><span class="text-muted fw-light">상세 매칭 분석 /</span> Search detail</h4>
    <div class="card mb-4">
        <div class="card-body">
            <div class="row gx-3 gy-2 align-items-center">
                <div class="col-md-3 col-xl-2">
                    <label class="form-label" for="selectServiceOpt">서비스별</label>
                    <select id="selectServiceOpt" class="form-select color-dropdown">
                        <option value="" selected></option>
                        <option value="bg-secondary">요양</option>
                        <option value="bg-success">간병</option>
                        <option value="bg-danger">장애</option>
                        <option value="bg-warning">돌봄</option>
                        <option value="bg-info">재활</option>
                        <option value="bg-dark">기타</option>
                    </select>
                </div>
                <div class="col-md-3 col-xl-2">
                    <label class="form-label" for="selectAgeOpt">연령대별</label>
                    <select class="form-select placement-dropdown" id="selectAgeOpt">
                        <option value="" selected></option>
                        <option value="under 40">40대 이하</option>
                        <option value="50">50대</option>
                        <option value="60">60대</option>
                        <option value="70">70대</option>
                        <option value="80">80대</option>
                        <option value="90">90대 이하</option>
                    </select>
                </div>
                <div class="col-md-3 col-xl-2">
                    <label class="form-label" for="selectGenOpt">성별별</label>
                    <select class="form-select placement-dropdown" id="selectGenOpt">
                        <option value="" selected></option>
                        <option value="M">남성</option>
                        <option value="F">여성</option>
                    </select>
                </div>
                <div class="col-md-3 col-xl-2">
                    <label class="form-label" for="startDate">시작일</label>
                    <input class="form-control me-2" id="startDate" type="date">
                </div>
                <div class="col-md-3 col-xl-2">
                    <label class="form-label" for="endDate">종료일</label>
                    <input class="form-control me-2" id="endDate" type="date">
                </div>
                <div class="col-md-3 col-xl-2 text-center">
                    <button id="searchBtn" class="btn btn-primary">Search</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="content-wrapper">
    <!-- Content -->
    <div class="container-xxl flex-grow-1 container-p-y">
        <div class="row">
            <div class="col-md-5 col-xl-5">
                <div class="card shadow-none bg-transparent border border-primary mb-3">
                    <div class="card-body">
                        <h5 class="card-title">매칭건수</h5>
                        <h5><strong><big id="getcnt"></big>건</strong></h5>
                        <p class="card-text"><span style="color: blue;">주문취소</span> 상태인 매칭 미포함</p>
                    </div>
                </div>
                <div class="card shadow-none bg-transparent border border-secondary mb-3">
                    <div class="card-body">
                        <h5 class="card-title">매칭금액</h5>
                        <h5><strong><big id="gettotalprice"></big>원</strong></h5>
                        <p class="card-text"><span style="color: blue;">결제완료</span> 상태인 매칭만 해당</p>
                    </div>
                </div>
                <div class="card shadow-none bg-transparent border border-danger mb-3">
                    <div class="card-body">
                        <h5 class="card-title">매칭취소 건수</h5>
                        <h5><strong><big id="getcancelledcnt"></big>건</strong></h5>
                        <p class="card-text"><span style="color: blue;">매칭취소, 환불</span> 상태인 매칭만 해당</p>
                    </div>
                </div>
                <div class="card shadow-none bg-transparent border border-warning mb-3">
                    <div class="card-body">
                        <h5 class="card-title">매칭확정률</h5>
                        <h5><strong><big id="getconfirmpercent"></big>%</strong></h5>
                        <p class="card-text"><span style="color: blue;">전체 주문 건 대비 취소 건</span>에 대한 비율</p>
                    </div>
                </div>
                <div class="card shadow-none bg-transparent border border-info mb-3">
                    <div class="card-body">
                        <h5 class="card-title">결제완료 건수</h5>
                        <h5><strong><big id="getpaydonecnt"></big>건</strong></h5>
                        <p class="card-text"><span style="color: blue;">결제완료</span>시 매칭계약 확정</p>
                    </div>
                </div>
            </div>
            <div class="col-md-7 col-xl-7">
                <div class="card shadow-none bg-transparent border border-success mb-3">
                    <div class="card-body">
                        <h5 class="card-title">성별별, 연령별 매칭 현황</h5>
                        <figure class="highcharts-figure">
                            <div id="container"></div>
                            <table id="datatable">
                                <thead>
                                <tr>
                                    <th></th>
                                    <th>남성</th>
                                    <th>여성</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th>40대 이하</th>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th>50대</th>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th>60대</th>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th>70대</th>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th>80대</th>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th>90대 이상</th>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
                        </figure>
                    </div>
                </div>
            </div>
        </div>

        <br/>
        <br/>
        <!-- Table within card -->
        <h5 class="mb-4">인기 간병인 TOP 10</h5>
        <div class="table-responsive text-nowrap">
            <table class="table card-table">
                <thead>
                <tr>
                    <th>순위</th>
                    <th>간병인 명</th>
                    <th>주요 매칭회원</th>
                    <th>누적 매출</th>
                    <th class="text-center">누적 매칭 개수</th>
                    <th class="text-center">평균 평점</th>
                </tr>
                </thead>

                <tbody class="table-border-bottom-0">
                <c:forEach var="obj" items="${top10list}" varStatus="status">
                    <tr>
                        <td>
                            <i class="fab fa-angular fa-lg text-danger me-3"></i>
                            <strong class="rank-number">
                                <% int rank = 1; %>
                            </strong>
                        </td>
                        <td>${obj.name}</td>
                        <td>
                            <ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
                                <c:set var="count" value="0"/>
                                <c:forEach var="matchedObj" items="${matchedlist}" varStatus="matchedStatus">
                                    <c:if test="${matchedObj.name == obj.name && count lt 5}">
                                        <c:set var="memberName" value="${matchedObj.memberName}"/>
                                        <c:set var="memberImg" value="${matchedObj.memberImg}"/>
                                        <li
                                                data-bs-toggle="tooltip"
                                                data-popup="tooltip-custom"
                                                data-bs-placement="top"
                                                class="avatar avatar-xs pull-up"
                                                title="${memberName}"
                                        >
                                            <a href="/member/findimpl?keyword1=email&keyword2=name&keyword3=birth&keyword4=birth&search1=&search2=${memberName}&startDate=&endDate=">
                                                <img src="/uimg/${memberImg}" alt="Avatar" class="rounded-circle"/>
                                            </a>
                                        </li>
                                        <c:set var="count" value="${count + 1}"/>
                                    </c:if>
                                </c:forEach>
                                <td>${obj.totalPrice}원</td>
                                <td class="text-center">${obj.matchCnt}건</td>
                                <td class="text-center">
                                    <span id="avgRate" class="badge badge-center rank-badge">${obj.avgRate}</span>
                                </td>
                            </ul>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <!--/ Table within card -->
    </div>
</div>


<style>
    #container {
        height: 400px;
    }

    .highcharts-figure,
    .highcharts-data-table table {
        min-width: 310px;
        max-width: 800px;
        margin: 1em auto;
    }

    #datatable {
        font-family: Verdana, sans-serif;
        border-collapse: collapse;
        border: 1px solid #ebebeb;
        margin: 10px auto;
        text-align: center;
        width: 100%;
        max-width: 500px;
    }

    #datatable caption {
        padding: 1em 0;
        font-size: 1.2em;
        color: #555;
    }

    #datatable th {
        font-weight: 600;
        padding: 0.5em;
    }

    #datatable td,
    #datatable th,
    #datatable caption {
        padding: 0.5em;
    }

    #datatable thead tr,
    #datatable tr:nth-child(even) {
        background: #f8f8f8;
    }

    #datatable tr:hover {
        background: #f1f7ff;
    }
</style>