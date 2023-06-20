<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <option value="top-0 start-0">10대</option>
                        <option value="top-0 start-50 translate-middle-x">20대</option>
                        <option value="top-0 end-0">30대</option>
                        <option value="top-50 start-0 translate-middle-y">40대</option>
                        <option value="top-50 start-50 translate-middle">50대</option>
                        <option value="top-50 end-0 translate-middle-y">60대</option>
                        <option value="bottom-0 start-0">70대</option>
                        <option value="bottom-0 start-50 translate-middle-x">80대</option>
                        <option value="bottom-0 end-0">90대</option>
                    </select>
                </div>
                <div class="col-md-3 col-xl-2">
                    <label class="form-label" for="selectGenOpt">성별별</label>
                    <select class="form-select placement-dropdown" id="selectGenOpt">
                        <option value="" selected></option>
                        <option value="top-0 start-0">남성</option>
                        <option value="top-0 start-50 translate-middle-x">여성</option>
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
        <div class="card mb-4 col-md-2">
            <div class="input-group">
                <div class="col-md-7">
                    <select
                            class="form-select"
                            id="selectGroupOrderBy"
                            aria-label="Example select with button addon"
                    >
                        <option selected>Choose...</option>
                        <option value="totPrice">누적 매출순</option>
                        <option value="totCnt">누적 매칭순</option>
                        <option value="totRate">평균 평점순</option>
                    </select>
                </div>
                <div class="col-md-5 d-flex justify-content-end">
                    <button class="btn btn-outline-primary" onclick="submitSelectedGroup()">Search</button>
                </div>
            </div>
        </div>
        <div class="table-responsive text-nowrap">
            <table class="table card-table">
                <thead>
                <tr>
                    <th>순위</th>
                    <th>간병인 명</th>
                    <th>주요 매칭회원</th>
                    <th>누적 매출</th>
                    <th>간병 일당</th>
                    <th class="text-center">누적 매칭 개수</th>
                    <th class="text-center">평균 평점</th>
                </tr>
                </thead>
                <tbody class="table-border-bottom-0">
                <tr>
                    <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>1</strong></td>
                    <td>Albert Cook</td>
                    <td>
                        <ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
                            <li
                                    data-bs-toggle="tooltip"
                                    data-popup="tooltip-custom"
                                    data-bs-placement="top"
                                    class="avatar avatar-xs pull-up"
                                    title="Lilian Fuller"
                            >
                                <img src="/img/avatars/5.png" alt="Avatar" class="rounded-circle"/>
                            </li>
                            <li
                                    data-bs-toggle="tooltip"
                                    data-popup="tooltip-custom"
                                    data-bs-placement="top"
                                    class="avatar avatar-xs pull-up"
                                    title="Sophia Wilkerson"
                            >
                                <img src="/img/avatars/6.png" alt="Avatar" class="rounded-circle"/>
                            </li>
                            <li
                                    data-bs-toggle="tooltip"
                                    data-popup="tooltip-custom"
                                    data-bs-placement="top"
                                    class="avatar avatar-xs pull-up"
                                    title="Christina Parker"
                            >
                                <img src="/img/avatars/7.png" alt="Avatar" class="rounded-circle"/>
                            </li>
                            <td>1,840,000원</td>
                            <td>120,000원</td>
                            <td class="text-center">12건</td>
                            <td class="text-center"><span class="badge badge-center bg-label-warning">4.5</span></td>
                        </ul>
                        <%--                        <span class="badge badge-center bg-label-primary">1</span>--%>
                        <%--                        <span class="badge badge-center bg-label-secondary">2</span>--%>
                        <%--                        <span class="badge badge-center bg-label-success">3</span>--%>
                        <%--                        <span class="badge badge-center bg-label-danger">4</span>--%>
                        <%--                        <span class="badge badge-center bg-label-warning">5</span>--%>
                    </td>
                </tr>

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