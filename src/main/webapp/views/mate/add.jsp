<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script>
    let mate_register = {
        init: function () {
            $('#register_btn').click(function () {
                mate_register.send();
            });
        },
    send: function () {
            $('#register_form').attr({
                method: 'post',
                action: '/mate/addimpl',
                enctype: 'multipart/form-data'   // imgname <-> img파일
            });
            $('#register_form').submit();
        }
    };
    $(function () {
        mate_register.init();
    });

    // 업로드할 사진 첨부 시, 화면에 보이기
    let showMemberImg = {
        init: function () {
            const uploadBtn = document.getElementById('imgMate');
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

    //비밀번호 Check
    let pwdCheck = {
        init: function () {
            $('#password2').on('input', function () {
                let pwd = $('#password').val();
                let pwd2 = $('#password2').val();
                if (pwd.length < 4 || pwd.length > 10) {
                    window.alert('비밀번호는 4글자 이상, 10글자 이하만 이용 가능합니다.');
                    document.getElementById('password').value = '';
                }
                if (pwd !== '' && pwd2 !== '') {
                    if (pwd === pwd2) {
                        document.getElementById('check').innerHTML = '비밀번호가 일치합니다.';
                        document.getElementById('check').classList.remove('alert-warning'); // 기존 'alert-warning' 클래스 제거
                        document.getElementById('check').classList.add('alert-success');
                    } else {
                        document.getElementById('check').innerHTML = '비밀번호가 일치하지 않습니다.';
                        document.getElementById('check').classList.remove('alert-success'); // 기존 'alert-success' 클래스 제거
                        document.getElementById('check').classList.add('alert-warning');
                    }
                }
            });
        },
    };

    $(function () {
        pwdCheck.init();
    });
</script>

<div class="content-wrapper">
    <!-- Content -->

    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Register Mate /</span> 메이트 등록</h4>

        <div class="row">
            <div class="col-md-12">
                <div class="card mb-4">
                    <h5 class="card-header">Profile Details</h5>
                    <!-- Account -->
                    <form id="register_form">
                        <div class="card-body">
                            <div class="d-flex align-items-start align-items-sm-center gap-4">
                                <img
                                        src="/uimg/addimg.svg"
                                        alt="user-avatar"
                                        class="d-block rounded"
                                        height="100"
                                        width="100"
                                        id="uploadedAvatar"
                                />
                                <div class="button-wrapper">
                                    <label for="imgMate" class="btn btn-primary me-2 mb-4" tabindex="0">
                                        <span class="d-none d-sm-block">Upload new photo</span>
                                        <i class="bx bx-upload d-block d-sm-none"></i>
                                        <input
                                                type="file"
                                                id="imgMate"
                                                name="imgMate"
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
                                            autofocus
                                    />
                                </div>
                                <div class="mb-3 col-md-6">
                                    <label for="email" class="form-label">E-mail</label>
                                    <input
                                            class="form-control"
                                            type="email"
                                            id="email"
                                            name="email"
                                            placeholder="@email.com"
                                    />
                                </div>
                                <div class="mb-3 col-md-6">
                                    <label for="password" class="form-label">Password</label>
                                    <input class="form-control" id="password" name="password" type="password"
                                           placeholder="특수문자를 포함한 8자리 이상"/>
                                </div>
                                <div class="mb-3 col-md-6">
                                    <label for="password2" class="form-label">Password-Check</label>
                                    <input class="form-control" id="password2" type="password"
                                           placeholder="다시 입력하세요"/>
                                </div>
                                <span class="alert" role="alert" id="check"></span>

                                <div class="mb-3 col-md-6">
                                    <label for="area" class="form-label">Area</label>
                                    <input class="form-control" type="text" id="area" name="area"
                                           placeholder="시/구/동"/>
                                </div>
                                <div class="mb-3 col-md-6">
                                    <label class="form-label" for="jobPeriod">Job Period</label>
                                    <div class="input-group input-group-merge">
                                        <span class="input-group-text">(경력 연차)</span>
                                        <input
                                                type="number"
                                                id="jobPeriod"
                                                name="jobPeriod"
                                                class="form-control"                                        />
                                    </div>
                                </div>

                                <div class="mb-3 col-md-6">
                                    <label for="license" class="form-label">License</label>
                                    <input
                                            class="form-control"
                                            type="text"
                                            id="license"
                                            name="license"
                                            placeholder="자격증 명"
                                            autofocus
                                    />
                                </div>
                                <div class="mb-3 col-md-6">
                                    <label for="valid" class="form-label">Valid</label>
                                    <select id="valid" name="valid" class="select2 form-select">
                                        <option value="1">정상</option>
                                        <option value="0">정지</option>
                                    </select>
                                </div>
                            </div>
                            <div class="mt-2">
                                <button id="register_btn" type="submit" class="btn btn-primary me-2">Save changes</button>
                                <button type="button" class="btn btn-outline-secondary" onclick="window.location.href='/mate/all'">Back</button>
                            </div>
                            <!-- /Account -->
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- / Content -->
        <div class="content-backdrop fade"></div>
    </div>
</div>








