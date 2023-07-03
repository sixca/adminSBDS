<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="content-wrapper d-flex align-items-center justify-content-center">
    <!-- Content -->
    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="fw-bold py-3 mb-4">
            <span class="text-muted fw-light">Item Register /</span> 제품 등록하기
        </h4>

        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card col-md-12 mb-4">
                    <div class="card-header d-flex align-items-center justify-content-between">
                        <h5 class="mb-0">제품 등록</h5>
                        <small class="text-muted">등록 후 상품 노출을 원치 않는다면, 유효상태를 'N'으로 변경 또는 '삭제'해주세요</small>
                    </div>
                    <form id="register_form" class="col s10">
                        <!-- Account -->
                        <div class="card-body" style="margin-left: 200px;">
                            <div class="d-flex align-items-start align-items-sm-center gap-4">
                                <input name="registerId" type="hidden" value="${loginadm.getId()}">
                                <input class="d-none mt-5 ml-5" type="file" name="imgName" style="display: none"
                                       id="imgname">
                                <a href="javascript:void(0);" onclick="$('#imgname').trigger('click')">
                                    <img
                                            src="/uimg/addimg.svg"
                                            alt="user-avatar"
                                            class="d-block rounded"
                                            height="300"
                                            width="300"
                                            id="preview"
                                    />
                                </a>
                                <div class="button-wrapper">
                                    <div class="mb-3 col-md-6">
                                        <label for="itemSize" class="form-label">Item Category</label>
                                        <select id="itemSize" name="itemSize" class="select2 form-select">
                                            <option value="">카테고리</option>
                                            <option value="S">건강식품</option>
                                            <option value="M">영양제</option>
                                            <option value="L">처방약</option>
                                        </select>
                                    </div>
                                    <div class="mb-3 col-md-6">
                                        <label for="color" class="form-label">Brand</label>
                                        <select id="color" name="color" class="select2 form-select">
                                            <option value="">브랜드</option>
                                            <option value="BLUE">동국제약</option>
                                            <option value="RED">동아제약</option>
                                            <option value="BLACK">한미약품</option>
                                            <option value="WHITE">현대약품</option>
                                        </select>
                                    </div>
                                    <div class="mb-3 col-md-6 col-xl-12">
                                        <label class="form-label" for="name">제품명</label>
                                        <div class="input-group input-group-merge">
                                            <input
                                                    type="text"
                                                    id="name"
                                                    name="name"
                                                    class="form-control"
                                            />
                                        </div>
                                    </div>
                                    <div class="mb-3 col-md-6 col-xl-12">
                                        <label class="form-label" for="price">가격</label>
                                        <div class="input-group input-group-merge">
                                            <input
                                                    type="number"
                                                    id="price"
                                                    name="price"
                                                    class="form-control"
                                            />
                                        </div>
                                    </div>
                                    <div class="mb-3 col-md-12">
                                        <label for="content" class="form-label">Content</label>
                                        <textarea class="form-control" id="content" rows="5"></textarea>
                                    </div>
                                    <button type="button" id="register_btn" class="btn btn-primary me-2 mb-4">Register</button>
                                    <button type="reset" class="btn btn-outline-secondary account-image-reset mb-4">
                                        <i class="bx bx-reset d-block d-sm-none"></i>
                                        <span class="d-none d-sm-block">Reset</span>
                                    </button>
                                    <a href="/item/all" class="btn btn-secondary px-4 mb-4">Back</a>

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

        let itemRegister = {
            init: function () {
                $('#register_btn').click(function () {
                    itemRegister.send();
                });
            },
            send: function () {
                alert("제품 등록 완료");
                $('#register_form').attr({
                    method: 'post',
                    action: '/item/registerImpl',
                    enctype: 'multipart/form-data'
                });
                $('#register_form').submit();
            }
        };
        $(function () {
            itemRegister.init();
            $('#imgname').on("change", e => {
                readImage(e.target)
            })
        });

    </script>

