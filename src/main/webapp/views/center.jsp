<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://cdn.jsdelivr.net/npm/apexcharts@3.29.0/dist/apexcharts.min.js"></script>

<script>
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
    let getcntwaiting = {
        init: function () {
            getcntwaiting.getcnt();
        },
        getcnt: function () {
            $.ajax({
                url: '/getcntwaiting',
                success: function (result) {
                    console.log(result);
                    $('#getcntwaiting').text(result);
                }
            })
        },
    };
    $(document).ready(function () {
        getcnttomatched.init();
        getcntwaiting.init();
        setInterval(function () {
            getcnttomatched.init();
            getcntwaiting.init();
        }, 5000); // 자동 리셋 기능 5초
    });

    let websocket_center = {
        stompClient: null,
        init: function () {
            this.connect();
        },
        connect: function () {
            var sid = this.id;
            var socket = new SockJS('${adminserver}/wss');
            this.stompClient = Stomp.over(socket);

            this.stompClient.connect({}, function (frame) {

                console.log('Connected: ' + frame);
                this.subscribe('/sendadm', function (msg) {
                    $('#content1_msg').text(JSON.parse(msg.body).content1 + '건');
                    $('#content2_msg').text(JSON.parse(msg.body).content2 + '건');
                    $('#content3_msg').text(JSON.parse(msg.body).content3 + '건');
                    $('#content4_msg').text(JSON.parse(msg.body).content4 + '건');
                    $('#content5_msg').text(JSON.parse(msg.body).content5 + '건');

                    $('#progress1').text((JSON.parse(msg.body).content1 / 48 * 100).toFixed(1) + '%');
                    $('#progress2').text((JSON.parse(msg.body).content2 / 246 * 100).toFixed(1) + '%');
                    $('#progress3').text((JSON.parse(msg.body).content3 / 78 * 100).toFixed(1) + '%');
                    $('#progress4').text((JSON.parse(msg.body).content4 / 134 * 100).toFixed(1) + '%');
                    $('#progress5').text((JSON.parse(msg.body).content5 / 222 * 100).toFixed(1) + '%');
                });
            });
        }
    };
    $(function () {
        websocket_center.init();
    });

</script>

<div class="content-wrapper">
    <!-- Content -->

    <div class="container-xxl flex-grow-1 container-p-y">
        <div class="row">
            <c:choose>
                <c:when test="${loginadm == null}">
                        <!-- Examples -->
                        <div class="row mb-5">
                            <div class="col-md-6 col-lg-4 mb-3">
                                <div class="card h-100">
                                    <img class="card-img-top" src="/uimg/main.jpg" alt="Card image cap" />
                                    <div class="card-body">
                                        <h5 class="card-title">국내 실버산업을 선도하는 SBDS</h5>
                                        <p class="card-text">
                                            Leading the way in the domestic silver industry, SBDS sets the standard for excellence. With a focus on innovation and quality, SBDS continues to drive growth and shape the future of the silver market. Join us and be a part of the forefront of the silver industry transformation.                                        </p>
                                        <a href="javascript:void(0)" class="btn btn-outline-primary">View History</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-4 mb-3">
                                <div class="card h-100">
                                    <div class="card-body">
                                        <h5 class="card-title">임직원 매칭</h5>
                                        <h6 class="card-subtitle text-muted">Support Your Older Family</h6>
                                    </div>
                                    <img class="img-fluid" src="/uimg/main2.jpg" alt="Card image cap" />
                                    <div class="card-body">
                                        <p class="card-text">Empower and care for your elderly loved ones with our comprehensive support and services.</p>
                                        <a href="javascript:void(0);" class="card-link">Manual Link</a>
                                        <a href="javascript:void(0);" class="card-link">Contact</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-4 mb-3">
                                <div class="card h-100">
                                    <div class="card-body">
                                        <h5 class="card-title">2023 체육대회 안내</h5>
                                        <h6 class="card-subtitle text-muted">This is Competition.</h6>
                                        <img
                                                class="img-fluid d-flex mx-auto my-4"
                                                src="/uimg/main3.jpg"
                                                alt="Card image cap"
                                        />
                                        <p class="card-text">Prepare yourself for the athletic event! Get ready for the sports competition and experience the joy our company brings to its employees!</p>
                                        <a href="javascript:void(0);" class="card-link">View Schedule</a>
                                        <a href="javascript:void(0);" class="card-link">Contact</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                </c:when>
                <c:otherwise>
                    <div class="col-lg-8 mb-4 order-0">
                        <div class="card">
                            <div class="d-flex align-items-end row">
                                <div class="col-sm-7">
                                    <div class="card-body">
                                        <h5 class="card-title text-primary">SBDS은 오늘도 성장중 🎉</h5>
                                        <p class="mb-4">
                                            오늘까지 <span class="fw-bold" id="getcnt" style="font-size: 25px;"></span>
                                            명의 간병 매칭서비스가 이루어졌습니다.
                                        </p>
                                        <div class="alert alert-primary alert-dismissible text-center" role="alert">
                                            현재 <span id="getcntwaiting"
                                                     style="font-size: 20px; font-weight: bold;"></span>
                                            명이 매칭을 기다리고 있어요!
                                            <button type="button" class="btn-close" data-bs-dismiss="alert"
                                                    aria-label="Close"></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-5 text-center text-sm-left">
                                    <div class="card-body pb-0 px-0 px-md-4">
                                        <img
                                                src="/img/illustrations/man-with-laptop-light.png"
                                                height="140"
                                                alt="View Badge User"
                                                data-app-dark-img="illustrations/man-with-laptop-dark.png"
                                                data-app-light-img="illustrations/man-with-laptop-light.png"
                                        />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 order-1">
                        <div class="row">
                            <div class="col-lg-6 col-md-12 col-6 mb-4">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="card-title d-flex align-items-start justify-content-between">
                                            <div class="avatar flex-shrink-0">
                                                <img
                                                        src="/img/icons/unicons/chart-success.png"
                                                        alt="chart success"
                                                        class="rounded"
                                                />
                                            </div>
                                            <div class="dropdown">
                                                <button
                                                        class="btn p-0"
                                                        type="button"
                                                        id="cardOpt3"
                                                        data-bs-toggle="dropdown"
                                                        aria-haspopup="true"
                                                        aria-expanded="false"
                                                >
                                                    <i class="bx bx-dots-vertical-rounded"></i>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="cardOpt3">
                                                    <a class="dropdown-item" href="javascript:void(0);">View More</a>
                                                    <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                                                </div>
                                            </div>
                                        </div>
                                        <span class="fw-semibold d-block mb-1">매칭결제</span>
                                        <h3 id="content1_msg" class="card-title mb-2"></h3>
                                        <small class="text-success fw-semibold"><i id="progress1"
                                                                                   class="bx bx-up-arrow-alt"></i>
                                        </small>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-12 col-6 mb-4">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="card-title d-flex align-items-start justify-content-between">
                                            <div class="avatar flex-shrink-0">
                                                <img
                                                        src="/img/icons/unicons/wallet-info.png"
                                                        alt="Credit Card"
                                                        class="rounded"
                                                />
                                            </div>
                                            <div class="dropdown">
                                                <button
                                                        class="btn p-0"
                                                        type="button"
                                                        id="cardOpt6"
                                                        data-bs-toggle="dropdown"
                                                        aria-haspopup="true"
                                                        aria-expanded="false"
                                                >
                                                    <i class="bx bx-dots-vertical-rounded"></i>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="cardOpt6">
                                                    <a class="dropdown-item" href="javascript:void(0);">View More</a>
                                                    <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                                                </div>
                                            </div>
                                        </div>
                                        <span class="fw-semibold d-block mb-1">제품결제</span>
                                        <h3 id="content2_msg" class="card-title text-nowrap mb-1"></h3>
                                        <small class="text-success fw-semibold"><i id="progress2"
                                                                                   class="bx bx-up-arrow-alt"></i></small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Total Revenue -->
                    <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4">
                        <div class="card">
                            <div class="row row-bordered g-0">
                                <div class="col-md-8">
                                    <h5 class="card-header m-0 me-2 pb-3">실시간 APP 이용자 현황</h5>
                                    <div id="totalRevenueChart" class="px-2"></div>

                                </div>
                                <div class="col-md-4">
                                    <div class="card-body">
                                        <div class="text-center">
                                            <div class="dropdown">
                                                <button
                                                        class="btn btn-sm btn-outline-primary dropdown-toggle"
                                                        type="button"
                                                        id="growthReportId"
                                                        data-bs-toggle="dropdown"
                                                        aria-haspopup="true"
                                                        aria-expanded="false"
                                                >
                                                    2023
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-end"
                                                     aria-labelledby="growthReportId">
                                                    <a class="dropdown-item" href="javascript:void(0);">2023</a>
                                                    <a class="dropdown-item" href="javascript:void(0);">2022</a>
                                                    <a class="dropdown-item" href="javascript:void(0);">2021</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="growthChart"></div>
                                    <div class="text-center fw-semibold pt-3 mb-2">이번 달까지 전년비 78% 매출 달성!</div>

                                    <div class="d-flex px-xxl-4 px-lg-2 p-4 gap-xxl-3 gap-lg-1 gap-3 justify-content-between">
                                        <div class="d-flex">
                                            <div class="me-2">
                                        <span class="badge bg-label-primary p-2"><i
                                                class="bx bx-dollar text-primary"></i></span>
                                            </div>
                                            <div class="d-flex flex-column">
                                                <small>2022</small>
                                                <h6 class="mb-0">+42% </h6>
                                            </div>
                                        </div>
                                        <div class="d-flex">
                                            <div class="me-2">
                                        <span class="badge bg-label-info p-2"><i
                                                class="bx bx-wallet text-info"></i></span>
                                            </div>
                                            <div class="d-flex flex-column">
                                                <small>2021</small>
                                                <h6 class="mb-0">+20%</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--/ Total Revenue -->
                    <div class="col-12 col-md-8 col-lg-4 order-3 order-md-2">
                        <div class="row">
                            <div class="col-6 mb-4">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="card-title d-flex align-items-start justify-content-between">
                                            <div class="avatar flex-shrink-0">
                                                <img src="/img/icons/unicons/paypal.png" alt="Credit Card"
                                                     class="rounded"/>
                                            </div>
                                            <div class="dropdown">
                                                <button
                                                        class="btn p-0"
                                                        type="button"
                                                        id="cardOpt4"
                                                        data-bs-toggle="dropdown"
                                                        aria-haspopup="true"
                                                        aria-expanded="false"
                                                >
                                                    <i class="bx bx-dots-vertical-rounded"></i>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="cardOpt4">
                                                    <a class="dropdown-item" href="javascript:void(0);">View More</a>
                                                    <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                                                </div>
                                            </div>
                                        </div>
                                        <span class="fw-semibold d-block mb-1">KakaoPay결제</span>
                                        <h3 id="content3_msg" class="card-title text-nowrap mb-2"></h3>
                                        <small class="text-danger fw-semibold"><i id="progress3"
                                                                                  class="bx bx-down-arrow-alt"></i>
                                        </small>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6 mb-4">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="card-title d-flex align-items-start justify-content-between">
                                            <div class="avatar flex-shrink-0">
                                                <img src="/img/icons/unicons/cc-primary.png" alt="Credit Card"
                                                     class="rounded"/>
                                            </div>
                                            <div class="dropdown">
                                                <button
                                                        class="btn p-0"
                                                        type="button"
                                                        id="cardOpt1"
                                                        data-bs-toggle="dropdown"
                                                        aria-haspopup="true"
                                                        aria-expanded="false"
                                                >
                                                    <i class="bx bx-dots-vertical-rounded"></i>
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="cardOpt1">
                                                    <a class="dropdown-item" href="javascript:void(0);">View More</a>
                                                    <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                                                </div>
                                            </div>
                                        </div>
                                        <span class="fw-semibold d-block mb-1">카드결제</span>
                                        <h3 id="content4_msg" class="card-title mb-2"></h3>
                                        <small class="text-success fw-semibold"><i id="progress4"
                                                                                   class="bx bx-up-arrow-alt"></i></small>
                                    </div>
                                </div>
                            </div>
                            <!-- </div>
                  <div class="row"> -->
                            <div class="col-12 mb-4">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between flex-sm-row flex-column gap-3">
                                            <div class="d-flex flex-sm-column flex-row align-items-start justify-content-between">
                                                <div class="card-title">
                                                    <h5 class="text-nowrap mb-2">매칭설문 제출현황</h5>
                                                    <span class="badge bg-label-warning rounded-pill">2023년도</span>
                                                </div>
                                                <div class="mt-sm-auto">
                                                    <small class="text-success text-nowrap fw-semibold"
                                                    ><i id="progress5" class="bx bx-chevron-up"></i> </small
                                                    >
                                                    <h3 id="content5_msg" class="mb-0"></h3>
                                                </div>
                                            </div>
                                            <div id="profileReportChart"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <!-- / Content -->
    <div class="content-backdrop fade"></div>
</div>