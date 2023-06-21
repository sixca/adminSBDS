<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let member_detail = {
        init: function () {
            $('#update_btn').click(function () {
                member_detail.send();
            });
            $('#delete_btn').click(function () {
                var c = confirm("삭제 하시겠습니까?");
                if (c == true) {
                    location.href = "/member/deleteimpl?id=${memberinfo.id}";
                }
            });
        },
        send: function () {
            $('#detail_form').attr({
                method: 'post',
                action: '/member/updateimpl',
                enctype: 'multipart/form-data'   // imgname <-> img파일
            });
            $('#detail_form').submit();
        }
    };
    $(function () {
        member_detail.init();
    });

    // 업로드할 사진 첨부 시, 화면에 보이기
    let showMemberImg = {
        init: function () {
            const uploadBtn = document.getElementById('imgMember');
            uploadBtn.addEventListener('change', this.getImg.bind(this));
        },
        getImg: function (event) {
            const file = event.target.files[0];
            const reader = new FileReader();

            // FileReader가 파일을 읽은 후에 실행되는 이벤트 핸들러 등록
            reader.onload = function (e) {
                const uploadedAvatar = document.getElementById('uploadedAvatar');
                uploadedAvatar.src = e.target.result; // 결과를 이미지의 src 속성에 할당
            };

            if (file) { // 파일이 존재하는 경우에만 실행
                // 파일을 읽기
                reader.readAsDataURL(file);
            }
        }
    };

    $(document).ready(function () {
        showMemberImg.init();
    });
</script>

<div class="content-wrapper">
    <!-- Content -->

    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Member Update /</span> 회원정보 수정</h4>

        <div class="row">
            <div class="col-md-12">
                <div class="card mb-4">
                    <h5 class="card-header">Profile Details</h5>
                    <!-- Account -->
                    <form id="detail_form">
                        <input type="hidden" name="id" value="${memberinfo.id}">
                        <input type="hidden" name="img" value="${memberinfo.img}">
                        <input type="hidden" name="password" value="${memberinfo.password}">

                        <div class="card-body">
                            <div class="d-flex align-items-start align-items-sm-center gap-4">
                                <img
                                        src="/uimg/${memberinfo.img}"
                                        alt="user-avatar"
                                        class="d-block rounded"
                                        height="100"
                                        width="100"
                                        id="uploadedAvatar"
                                />
                                <div class="button-wrapper">
                                    <label for="imgMember" class="btn btn-primary me-2 mb-4" tabindex="0">
                                        <span class="d-none d-sm-block">Upload new photo</span>
                                        <i class="bx bx-upload d-block d-sm-none"></i>
                                        <input
                                                type="file"
                                                id="imgMember"
                                                name="imgMember"
                                                class="account-file-input"
                                                hidden
                                                accept="image/png, image/jpeg, image/jpg"
                                        />
                                    </label>
                                    <button type="button" class="btn btn-outline-secondary account-image-reset mb-4">
                                        <i class="bx bx-reset d-block d-sm-none"></i>
                                        <span class="d-none d-sm-block">Reset</span>
                                    </button>

                                    <p class="text-muted mb-0">Allowed JPG, GIF or PNG. Max size of 800K</p>
                                </div>
                            </div>
                        </div>
                        <hr class="my-0"/>
                        <div class="card-body">
                            <div class="row">
                                <div class="mb-3 col-md-6">
                                    <label for="name" class="form-label">Full Name</label>
                                    <input
                                            class="form-control"
                                            type="text"
                                            id="name"
                                            name="name"
                                            value="${memberinfo.name}"
                                            autofocus
                                    />
                                </div>
                                <div class="mb-3 col-md-6">
                                    <label for="email" class="form-label">E-mail</label>
                                    <input
                                            class="form-control"
                                            type="text"
                                            id="email"
                                            name="email"
                                            value="${memberinfo.email}"
                                    />
                                </div>
                                <div class="mb-3 col-md-6">
                                    <label for="birth" class="form-label">Birth Date</label>
                                    <input class="form-control" type="date" id="birth" name="birth"
                                           value="${memberinfo.birth}"/>
                                </div>
                                <div class="mb-3 col-md-6">
                                    <label class="form-label" for="tel">Tel Number</label>
                                    <div class="input-group input-group-merge">
                                        <span class="input-group-text">KO (+82)</span>
                                        <input
                                                type="text"
                                                id="tel"
                                                name="tel"
                                                class="form-control"
                                                value="${memberinfo.tel}"
                                        />
                                    </div>
                                </div>

                                <div class="mb-3 col-md-6">
                                    <label for="addr" class="form-label">Address</label>
                                    <input
                                            class="form-control"
                                            type="text"
                                            id="addr"
                                            name="addr"
                                            value="${memberinfo.addr}"
                                            autofocus
                                    />
                                </div>
                                <div class="mb-3 col-md-6">
                                    <label for="valid" class="form-label">Valid</label>
                                    <select id="valid" name="valid" class="select2 form-select">
                                        <option value="1" ${memberinfo.valid == '1' ? 'selected' : ''}>정상</option>
                                        <option value="0" ${memberinfo.valid == '0' ? 'selected' : ''}>정지</option>
                                    </select>
                                </div>
                            </div>
                            <div class="mt-2">
                                <button id="update_btn" type="submit" class="btn btn-primary me-2">Save changes</button>
                                <button type="reset" class="btn btn-outline-secondary">Cancel</button>
                            </div>
                            <!-- /Account -->
                        </div>
                        <div class="card">
                            <h5 class="card-header">Delete Account</h5>
                            <div class="card-body">
                                <div class="mb-3 col-12 mb-0">
                                    <div class="alert alert-warning">
                                        <h6 class="alert-heading fw-bold mb-1">해당 회원계정을 삭제하시겠습니까?</h6>
                                        <p class="mb-0" style="font-size: 10px">회원계정을 삭제 시 복구가 불가능합니다. 주의해주십시오.</p>
                                    </div>
                                </div>
                                <div class="form-check mb-3">
                                    <input
                                            class="form-check-input"
                                            type="checkbox"
                                            name="accountActivation"
                                            id="accountActivation"
                                    />
                                    <label class="form-check-label" for="accountActivation"
                                    >I confirm this account deactivation</label
                                    >
                                </div>
                                <button id="delete_btn" type="button" class="btn btn-danger deactivate-account">
                                    Deactivate Account
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- / Content -->
        <div class="content-backdrop fade"></div>
    </div>
</div>


<%-----------------------------------------%>
<%--    <div id="page-wrapper">--%>
<%--        <div class="header">--%>
<%--            <h1 class="page-header">--%>
<%--                회원 상세--%>
<%--            </h1>--%>
<%--        </div>--%>
<%--        <div class="main-body">--%>
<%--            <div class="row">--%>
<%--                <div class="col-lg-4">--%>
<%--                    <div class="card">--%>
<%--                        <div class="card-body">--%>
<%--                            <div class="d-flex flex-column align-items-center text-center">--%>
<%--                                <img src="/uimg/${memberinfo.img}" alt="Admin" class="rounded-circle p-1 bg-primary"--%>
<%--                                     width="110" style="border-radius: 50%;">--%>
<%--                                <div class="mt-3">--%>
<%--                                    <h4>${memberinfo.name}</h4>--%>
<%--                                    <p class="text-secondary mb-1">${memberinfo.email}</p>--%>
<%--                                    <p class="text-muted font-size-sm">${memberinfo.birth}</p>--%>
<%--                                    <button class="btn btn-outline-primary">Message</button>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <hr class="my-4">--%>
<%--                            <ul class="list-group list-group-flush">--%>
<%--                                <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">--%>
<%--                                    <h6 class="mb-0">--%>
<%--                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"--%>
<%--                                             viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"--%>
<%--                                             stroke-linecap="round" stroke-linejoin="round"--%>
<%--                                             class="feather feather-globe me-2 icon-inline">--%>
<%--                                            <circle cx="12" cy="12" r="10"></circle>--%>
<%--                                            <line x1="2" y1="12" x2="22" y2="12"></line>--%>
<%--                                            <path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path>--%>
<%--                                        </svg>--%>
<%--                                        Website--%>
<%--                                    </h6>--%>
<%--                                    <span class="text-secondary">https://bootdey.com</span>--%>
<%--                                </li>--%>
<%--                                <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">--%>
<%--                                    <h6 class="mb-0">--%>
<%--                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"--%>
<%--                                             viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"--%>
<%--                                             stroke-linecap="round" stroke-linejoin="round"--%>
<%--                                             class="feather feather-github me-2 icon-inline">--%>
<%--                                            <path d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22"></path>--%>
<%--                                        </svg>--%>
<%--                                        Github--%>
<%--                                    </h6>--%>
<%--                                    <span class="text-secondary">bootdey</span>--%>
<%--                                </li>--%>
<%--                                <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">--%>
<%--                                    <h6 class="mb-0">--%>
<%--                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"--%>
<%--                                             viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"--%>
<%--                                             stroke-linecap="round" stroke-linejoin="round"--%>
<%--                                             class="feather feather-twitter me-2 icon-inline text-info">--%>
<%--                                            <path d="M23 3a10.9 10.9 0 0 1-3.14 1.53 4.48 4.48 0 0 0-7.86 3v1A10.66 10.66 0 0 1 3 4s-4 9 5 13a11.64 11.64 0 0 1-7 2c9 5 20 0 20-11.5a4.5 4.5 0 0 0-.08-.83A7.72 7.72 0 0 0 23 3z"></path>--%>
<%--                                        </svg>--%>
<%--                                        Twitter--%>
<%--                                    </h6>--%>
<%--                                    <span class="text-secondary">@bootdey</span>--%>
<%--                                </li>--%>
<%--                                <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">--%>
<%--                                    <h6 class="mb-0">--%>
<%--                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"--%>
<%--                                             viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"--%>
<%--                                             stroke-linecap="round" stroke-linejoin="round"--%>
<%--                                             class="feather feather-instagram me-2 icon-inline text-danger">--%>
<%--                                            <rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect>--%>
<%--                                            <path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path>--%>
<%--                                            <line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line>--%>
<%--                                        </svg>--%>
<%--                                        Instagram--%>
<%--                                    </h6>--%>
<%--                                    <span class="text-secondary">bootdey</span>--%>
<%--                                </li>--%>
<%--                                <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">--%>
<%--                                    <h6 class="mb-0">--%>
<%--                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"--%>
<%--                                             viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"--%>
<%--                                             stroke-linecap="round" stroke-linejoin="round"--%>
<%--                                             class="feather feather-facebook me-2 icon-inline text-primary">--%>
<%--                                            <path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path>--%>
<%--                                        </svg>--%>
<%--                                        Facebook--%>
<%--                                    </h6>--%>
<%--                                    <span class="text-secondary">bootdey</span>--%>
<%--                                </li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="col-lg-8">--%>
<%--                    <div class="card">--%>
<%--                        <div class="card-body">--%>
<%--                            &lt;%&ndash;                        <form id="detail_form">&ndash;%&gt;--%>
<%--                            <input type="hidden" name="id" value="${memberinfo.id}">--%>
<%--                            <input type="hidden" name="img" value="${memberinfo.img}">--%>
<%--                            <input type="hidden" name="password" value="${memberinfo.password}">--%>

<%--                            <div class="row mb-3">--%>
<%--                                <div class="col-sm-3">--%>
<%--                                    <h6 class="mb-0">Full Name</h6>--%>
<%--                                </div>--%>
<%--                                <div class="col-sm-9 text-secondary">--%>
<%--                                    <input type="text" name="name" class="form-control" value="${memberinfo.name}">--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="row mb-3">--%>
<%--                                <div class="col-sm-3">--%>
<%--                                    <h6 class="mb-0">Email</h6>--%>
<%--                                </div>--%>
<%--                                <div class="col-sm-9 text-secondary">--%>
<%--                                    <input type="text" name="email" class="form-control" value="${memberinfo.email}">--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            &lt;%&ndash;                            <div class="row mb-3">&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                                <div class="col-sm-3">&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                                    <h6 class="mb-0">Password</h6>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                                <div class="col-sm-9 text-secondary">&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                                    <input type="password" name="password" class="form-control">&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--                            <div class="row mb-3">--%>
<%--                                <div class="col-sm-3">--%>
<%--                                    <h6 class="mb-0">BirthDay</h6>--%>
<%--                                </div>--%>
<%--                                <div class="col-sm-9 text-secondary">--%>
<%--                                    <input type="text" name="birth" class="form-control" value="${memberinfo.birth}">--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="row mb-3">--%>
<%--                                <div class="col-sm-3">--%>
<%--                                    <h6 class="mb-0">Tel</h6>--%>
<%--                                </div>--%>
<%--                                <div class="col-sm-9 text-secondary">--%>
<%--                                    <input type="text" name="tel" class="form-control" value="${memberinfo.tel}">--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="row mb-3">--%>
<%--                                <div class="col-sm-3">--%>
<%--                                    <h6 class="mb-0">Address</h6>--%>
<%--                                </div>--%>
<%--                                <div class="col-sm-9 text-secondary">--%>
<%--                                    <input type="text" name="addr" class="form-control" value="${memberinfo.addr}">--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="row mb-3">--%>
<%--                                <div class="col-sm-3">--%>
<%--                                    <h6 class="mb-0">탈퇴여부</h6>--%>
<%--                                </div>--%>
<%--                                <div class="col-sm-9 text-secondary">--%>
<%--                                    <select name="valid" class="form-control">--%>
<%--                                        <option value="Y" ${memberinfo.valid == 'Y' ? 'selected' : ''}>Y</option>--%>
<%--                                        <option value="N" ${memberinfo.valid == 'N' ? 'selected' : ''}>N</option>--%>
<%--                                    </select>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="row mb-3">--%>
<%--                                <div class="col-sm-3">--%>
<%--                                    <h6 class="mb-0">프로필 이미지 변경</h6>--%>
<%--                                </div>--%>
<%--                                <div class="col-sm-9 text-secondary">--%>
<%--                                    <input type="file" name="imgMember" class="form-control" placeholder="Input img">--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="row">--%>
<%--                                <div class="col-sm-3"></div>--%>
<%--                                <div class="col-sm-9 text-secondary">--%>
<%--                                    &lt;%&ndash;                                    <input id="update_btn" type="button" class="btn btn-primary px-4" value="Save Changes">&ndash;%&gt;--%>
<%--                                    <input id="delete_btn" type="button" class="btn btn-primary px-4"--%>
<%--                                           value="Delete This Profile">--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            </form>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="row">--%>
<%--                        <div class="col-sm-12">--%>
<%--                            <div class="card">--%>
<%--                                <div class="card-body">--%>
<%--                                    <h5 class="d-flex align-items-center mb-3">--%>
<%--                                        <span class="text-primary font-weight-bold">회원 활동 마일리지</span>--%>
<%--                                    </h5>--%>
<%--                                    <p>상품 구매 마일리지</p>--%>
<%--                                    <div class="progress mb-3" style="height: 5px">--%>
<%--                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 80%"--%>
<%--                                             aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>--%>
<%--                                    </div>--%>
<%--                                    <p>상품 후기 마일리지</p>--%>
<%--                                    <div class="progress mb-3" style="height: 5px">--%>
<%--                                        <div class="progress-bar bg-danger" role="progressbar" style="width: 72%"--%>
<%--                                             aria-valuenow="72" aria-valuemin="0" aria-valuemax="100"></div>--%>
<%--                                    </div>--%>
<%--                                    <p>간병인 매칭 마일리지</p>--%>
<%--                                    <div class="progress mb-3" style="height: 5px">--%>
<%--                                        <div class="progress-bar bg-warning" role="progressbar" style="width: 55%"--%>
<%--                                             aria-valuenow="55" aria-valuemin="0" aria-valuemax="100"></div>--%>
<%--                                    </div>--%>
<%--                                    <p>간병인 후기 마일리지</p>--%>
<%--                                    <div class="progress mb-3" style="height: 5px">--%>
<%--                                        <div class="progress-bar bg-success" role="progressbar" style="width: 89%"--%>
<%--                                             aria-valuenow="89" aria-valuemin="0" aria-valuemax="100"></div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <style>--%>
<%--        body {--%>
<%--            margin-top: 0px;--%>
<%--            color: #1a202c;--%>
<%--            text-align: left;--%>
<%--            background-color: #e2e8f0;--%>
<%--        }--%>

<%--        .main-body {--%>
<%--            padding: 0px;--%>
<%--        }--%>

<%--        .card {--%>
<%--            box-shadow: 0 1px 3px 0 rgba(0, 0, 0, .1), 0 1px 2px 0 rgba(0, 0, 0, .06);--%>
<%--        }--%>

<%--        .card {--%>
<%--            position: relative;--%>
<%--            display: flex;--%>
<%--            flex-direction: column;--%>
<%--            min-width: 0;--%>
<%--            word-wrap: break-word;--%>
<%--            background-color: #fff;--%>
<%--            background-clip: border-box;--%>
<%--            border: 0 solid rgba(0, 0, 0, .125);--%>
<%--            border-radius: .25rem;--%>
<%--        }--%>

<%--        .card-body {--%>
<%--            flex: 1 1 auto;--%>
<%--            min-height: 1px;--%>
<%--            padding: 1rem;--%>
<%--        }--%>

<%--        .gutters-sm {--%>
<%--            margin-right: -8px;--%>
<%--            margin-left: -8px;--%>
<%--        }--%>

<%--        .gutters-sm > .col, .gutters-sm > [class*=col-] {--%>
<%--            padding-right: 8px;--%>
<%--            padding-left: 8px;--%>
<%--        }--%>

<%--        .mb-3, .my-3 {--%>
<%--            margin-bottom: 1rem !important;--%>
<%--        }--%>

<%--        .bg-gray-300 {--%>
<%--            background-color: #e2e8f0;--%>
<%--        }--%>

<%--        .h-100 {--%>
<%--            height: 100% !important;--%>
<%--        }--%>

<%--        .shadow-none {--%>
<%--            box-shadow: none !important;--%>
<%--        }--%>
<%--    </style>--%>