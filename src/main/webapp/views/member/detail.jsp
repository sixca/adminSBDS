<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let member_detail = {
        init: function () {
            $('#update_btn').click(function () {
                member_detail.send();
            });
            $('#delete_btn').click(function () {
                var accountActivation = document.getElementById("accountActivation");
                if (accountActivation.checked) {
                    var c = confirm("삭제 하시겠습니까?");
                    if (c == true) {
                        location.href = "/member/deleteimpl?id=${memberinfo.id}";
                    }
                    }else {
                        // accountActivation 체크되지 않은 경우 경고 창 표시 & 다시 화면으로 컴백
                        alert("삭제 전 확인 동의를 체크해주세요");
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
                                    <button type="reset" class="btn btn-outline-secondary account-image-reset mb-4">
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
                                <button type="reset" class="btn btn-outline-secondary" onclick="window.history.back();">Back</button>
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
                                    >해당 계정을 삭제하기 위한 확인을 마쳤습니다 (필수)</label
                                    >
                                </div>
                                <button id="delete_btn" type="button" class="btn btn-danger deactivate-account">
                                    계정 삭제
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