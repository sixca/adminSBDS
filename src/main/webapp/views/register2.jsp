<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let register_form={
        init:function (){   //클릭 시, send 후 register_form 초기화
            $('#register_btn').addClass('disabled');    //비활성화

            $('#register_btn').click(function(){
                register_form.send();
            });
            $('#pwd2').keyup(function(){
                var adminId = $('#adminId').val();
                var pwd = $('#pwd').val();
                var pwd2 = $('#pwd2').val();

                if(adminId != '' && pwd != '' && pwd2 != ''){
                    $('#register_btn').removeClass('disabled');   // 다 채워지면 버튼 활성화. (disabled Class 삭제)
                }
            });  // 값이 존재할 시, register_btn 활성화
            $('#adminId').keyup(function(){
                var txt_id = $('#adminId').val();
                if(txt_id.length <= 3 ){
                    $('#idspan').text('4자리 이상이어야 합니다');
                    return;
                }
                $.ajax({   //value를 아작스로 전송한다
                    url:'/checkid',
                    data:{adminId:txt_id},    //키값 adminId에 txt_id값 전송
                    success:function (result){
                        // console.log(result);
                        // console.log(txt_id);
                        if(result == 0){
                            $('#idspan').text('사용 가능합니다.');
                            $('#idspan').css('color', 'blue');
                            // $('#pwd').focus();  // pwd이름의 인풋태그로 포커스 (커서 옮기기)
                        }
                        if(result == 1){
                            $('#idspan').text('중복된 ID입니다.')
                            $('#idspan').css('color', 'red');
                        }
                        if(result == 2){
                            $('#idspan').text('ID는 10자리를 초과할 수 없습니다.')
                            $('#idspan').css('color', 'red');
                        }
                    }
                });
            });
            $('#pwd2').on('input',function (){
                let pwd = $('#pwd').val();
                let pwd2 = $('#pwd2').val();
                if (pwd.length < 4 || pwd.length > 10) {
                    window.alert('비밀번호는 4글자 이상, 10글자 이하만 이용 가능합니다.');  //경로 알러트창 띄우기.
                    document.getElementById('pwd').value = '';
                }
                if (pwd != '' && pwd2 != '') {
                    if (pwd == pwd2) {
                        document.getElementById('check').innerHTML = '비밀번호가 일치합니다.'
                        document.getElementById('check').style.color = 'blue';
                    } else {
                        document.getElementById('check').innerHTML = '비밀번호가 일치하지 않습니다.';
                        document.getElementById('check').style.color = 'red';
                    }
                }
            });
        },
        send:function (){
            var adminId = $('#adminId').val();
            var pwd = $('#pwd').val();
            if(adminId.length <= 3){
                $('#idspan').text('4자리 이상이어야 합니다');
                $('#id').focus();
                return;
            }
            if(pwd == ''){
                $('#pwd').focus();
                return;
            }
            //비었는지 안 비었는지 체크, 공백이면 submit 불가.

            $('#register_form').attr({    // 속성 세팅
                'action':'/registerimpl',      //MainController에 보내는 Action
                'method':'post'
            });
            $('#register_form').submit();    // 제출 :: 서버로 데이터 전송
        }
    };
    $(function (){
        register_form.init();
    });
</script>

<div id="page-wrapper">
    <div class="header">
        <h1 class="page-header">
            Register Administer Account
        </h1>
    </div>
    <div id="page-inner">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-action">
                        관리자 등록 양식
                    </div>
                    <div class="card-content">
                        <form id="register_form" class="col s12">
                            <div class="row">
                                <div class="input-field col s6">
                                    <input placeholder="" id="first_name" type="text" class="validate">
                                    <label for="first_name">First Name</label>
                                </div>
                                <div class="input-field col s6">
                                    <input id="last_name" type="text" class="validate">
                                    <label for="last_name">Last Name</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s12">
                                    <input name="adminId" id="adminId" type="text">
                                    <label for="adminId">ID</label>
                                    <span id="idspan"></span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s12">
                                    <input name="pwd" id="pwd" type="password" class="validate">
                                    <label for="pwd">Password</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s12">
                                    <input name="pwd2" id="pwd2" type="password" class="validate">
                                    <label for="pwd2">Confirm Password</label>
                                </div>
                            </div>
                            <span id="check"></span>
                            <div class="form-group">
                                <div class="modal-footer">
                                    <button id="register_btn" type="button" class="btn btn-default" data-dismiss="modal">Register</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </form>
                        <div class="clearBoth"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /. PAGE INNER  -->
</div>
<!-- /. PAGE WRAPPER -->
