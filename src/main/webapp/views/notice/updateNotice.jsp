<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    function readImage(input) {
        // 인풋 태그에 파일이 있는 경우
        if (input.files && input.files[0]) {

            // FileReader 인스턴스 생성
            const reader = new FileReader()
            // 이미지가 로드가 된 경우
            reader.onload = e => {
                const previewImage = document.getElementById("preview")
                previewImage.src = e.target.result
            }
            // reader가 이미지 읽도록 하기
            reader.readAsDataURL(input.files[0])
        }
    }

    let itemUpdate = {
        init: function () {
            $('#update_btn').click(function () {
                itemUpdate.send();
            });
            $('#delete_btn').click(function () {
                let c = confirm("삭제하시겠습니까?");
                if (c == true) {
                    location.href = "/notice/deleteimpl?id=" + ${notice.id};
                }
            })
        },
        send: function () {
            console.log("send function called"); // 디버깅용 콘솔 출력
            $('#update_form').attr({
                method: 'post',
                action: '/notice/updateImpl',
                enctype: 'multipart/form-data'
            });
            $('#update_form').submit();
        }
    };
    $(function () {
        itemUpdate.init();
        $('#imgname').on("change", e => {
            readImage(e.target)
        })
    });
</script>

<div id="page-wrapper">
    <div class="header">
        <h1 class="page-header">
            ${notice.id}번 공지 상세
        </h1>
    </div>

    <div id="page-inner">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-action">
                        공지사항을 수정하세요
                    </div>
                    <div class="card-content">
                        <form id="update_form" class="col s10">
                            <div class="row">
                                <div class="input-field col s7 d-flex justify-content-center">
                                    <input name="id" type="hidden" value="${notice.id}">
                                    <input name="admId" type="hidden" value="${notice.admId}">
                                    <input name="writer" type="hidden" value="${notice.writer}">
                                    <input name="hit" type="hidden" value="${notice.hit}">
                                    <input name="img" type="hidden" value="${notice.img}"/>
                                    <input class="d-none mt-5 ml-5" type="file" name="imgName" style="display: none"
                                           id="imgname">
                                    <a href="javascript:void(0);" onclick="$('#imgname').trigger('click')">
                                        <img src="/uimg/${notice.img}" id="preview" style="height: 500px; width: 500px">
                                    </a>
                                </div>
                                <div class="input-field col s4">
                                    <input id="title" name="title" type="text" class="validate" value="${notice.title}">
                                    <label for="title">공지사항 제목</label>
                                </div>

                                <div class="row">
                                    <div class="col-sm-3">
                                        <input id="update_btn" type="button" class="btn btn-primary px-4"
                                               value="Save Changes" style="margin-bottom: 10px;">
                                        <input id="delete_btn" type="button" class="btn btn-primary px-4"
                                               value="Delete This Profile" style="margin-bottom: 10px;">
                                        <a href="/notice/noticeall" class="btn btn-secondary px-4" style="margin-bottom: 10px;">Back</a>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <div class="clearBoth"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>