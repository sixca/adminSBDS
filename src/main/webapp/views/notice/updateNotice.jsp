<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="content-wrapper">
    <!-- Content -->

    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Notice Detail /</span> 공지, 이벤트 상세 & 업데이트</h4>

        <div class="row">
            <div class="col-md-12">
                <div class="card mb-4">
                    <div class="card-header d-flex align-items-center justify-content-between">
                        <h5 class="mb-0">Notice 수정</h5>
                        <small class="text-muted">${notice.id}번 공지 상세</small>
                    </div>
                    <form id="update_form" class="col s10">
                        <!-- Account -->
                        <div class="card-body">
                            <div class="d-flex align-items-start align-items-sm-center gap-4">
                                <input name="id" type="hidden" value="${notice.id}">
                                <input name="admId" type="hidden" value="${notice.admId}">
                                <input name="hit" type="hidden" value="${notice.hit}">
                                <input name="img" type="hidden" value="${notice.img}"/>

                                <input class="d-none mt-5 ml-5" type="file" name="imgName" style="display: none"
                                       id="imgname">
                                <a href="javascript:void(0);" onclick="$('#imgname').trigger('click')">
                                    <img
                                            src="/uimg/${notice.img}"
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
                                                    value="${notice.title}"
                                            />
                                        </div>
                                    </div>
                                    <div class="mb-3 col-md-12">
                                        <label for="content" class="form-label">Content</label>
                                        <textarea class="form-control" id="content" name="content" rows="5">${notice.content}</textarea>
                                    </div>
                                    <button type="button" id="update_btn" class="btn btn-primary me-2 mb-4">Update</button>
                                    <button type="button" id="delete_btn" class="btn btn-primary me-2 mb-4">Delete</button>
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

        let noticeUpdate = {
            init: function () {
                $('#update_btn').click(function () {
                    noticeUpdate.send();
                });
                $('#delete_btn').click(function () {
                    let c = confirm("삭제하시겠습니까?");
                    if (c == true) {
                        location.href = "/notice/deleteimpl?id=" + ${notice.id};
                    }
                })
            },
            send: function () {
                alert("Update 버튼이 클릭되었습니다.");
                $('#update_form').attr({
                    method: 'post',
                    action: '/notice/updateImpl',
                    enctype: 'multipart/form-data'
                });
                $('#update_form').submit();
            }
        };
        $(function () {
            noticeUpdate.init();
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

