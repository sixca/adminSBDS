<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="content-wrapper">
    <!-- Content -->

    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Notice Register /</span> 공지 & 이벤트 등록하기</h4>

        <div class="row">
            <div class="col-md-12">
                <div class="card mb-4">
                    <div class="card-header d-flex align-items-center justify-content-between">
                        <h5 class="mb-0">Notice 등록</h5>
                        <small class="text-muted">등록 후 NOTICE 노출을 원치 않다면, 관리화면에서 상태를 '미발행'으로 변경 또는 '삭제'해주세요</small>
                    </div>
                    <form id="register_form" class="col s10">
                        <!-- Account -->
                        <div class="card-body">
                            <div class="d-flex align-items-start align-items-sm-center gap-4">
                                <input name="admId" type="hidden" value="${loginadm.getId()}">
                                <input class="d-none mt-5 ml-5" type="file" name="imgName" style="display: none"
                                       id="imgname">
                                <a href="javascript:void(0);" onclick="$('#imgname').trigger('click')">
                                    <img
                                            src="/uimg/addimg.svg"
                                            alt="user-avatar"
                                            class="d-block rounded"
                                            height="500"
                                            width="500"
                                            id="preview"
                                    />
                                </a>
                                <div class="button-wrapper">
                                    <div class="mb-3 col-md-6">
                                        <label for="titletype" class="form-label">Notice Type</label>
                                        <select id="titletype" class="select2 form-select">
                                            <option value="">Select Type</option>
                                            <option value="[공지] ">[공지]</option>
                                            <option value="[이벤트] ">[이벤트]</option>
                                        </select>
                                    </div>
                                    <div class="mb-3 col-md-6 col-xl-12">
                                        <label class="form-label" for="title">Title</label>
                                        <div class="input-group input-group-merge">
                                            <input
                                                    type="text"
                                                    id="title"
                                                    name="title"
                                                    class="form-control"
                                            />
                                        </div>
                                    </div>
                                    <div class="mb-3 col-md-12">
                                        <label for="content" class="form-label">Content</label>
                                        <textarea class="form-control" id="content" name="content" rows="5"></textarea>
                                    </div>
                                    <button type="button" id="register_btn" class="btn btn-primary me-2 mb-4">Register</button>
                                    <button type="reset" class="btn btn-outline-secondary account-image-reset mb-4">
                                        <i class="bx bx-reset d-block d-sm-none"></i>
                                        <span class="d-none d-sm-block">Reset</span>
                                    </button>
                                    <a href="/notice/allpage" class="btn btn-secondary px-4 mb-4">Back</a>

                                    <p class="text-muted mb-0">Allowed JPG, GIF or PNG. Max size of 800K</p>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- / Content -->

        <div class="content-backdrop fade"></div>
    </div>
    <!-- Content wrapper -->
</div>

    <script>
        function readImage(input) {
            if (input.files && input.files[0]) {
                const reader = new FileReader();
                reader.onload = e => {
                    const previewImage = document.getElementById("preview");
                    previewImage.src = e.target.result;
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        let noticeRegister = {
            init: function () {
                $('#register_btn').click(function () {
                    noticeRegister.send();
                });
            },
            send: function () {
                alert("Notice 등록 완료");
                $('#register_form').attr({
                    method: 'post',
                    action: '/notice/registerImpl',
                    enctype: 'multipart/form-data'
                });
                $('#register_form').submit();
            }
        };
        $(function () {
            noticeRegister.init();
            $('#imgname').on("change", e => {
                readImage(e.target)
            })
        });

        //Title Type 선택시 (공지,이벤트) 타이틀에 text 추가
        $(function () {
            $('#titletype').change(function () {
                let selectedType = $(this).val();
                $('#title').val(selectedType + $('#title').val());
            });
        });
    </script>