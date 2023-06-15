<script>
    function deleteReview() {
        location.href = "/itemreview/deleteimpl?id=" + ${ireviewinfo.id};
    }

    function submitComment() {
        var comment = document.getElementById("comment").value;
        // 댓글 등록 로직 추가
    }
</script>

<div id="page-wrapper">
    <div class="header">
        <h1 class="page-header">
            제품 후기 상세 <small>Mate Review Detail.</small>
        </h1>
    </div>
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-action">
                        후기 내용
                    </div>
                    <div class="card-content">
                        <table class="table table-condensed">
                            <thead>
                            <tr align="center">
                                <th width="10%">제목</th>
                                <th width="60%">${ireviewinfo.title}</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>작성 회원 번호</td>
                                <td>${ireviewinfo.memberId}</td>
                            </tr>
                            <tr>
                                <td>대상 제품 번호</td>
                                <td>${ireviewinfo.itemId} <span style="float: right; font-weight: bold; color: blue;">평점 : ${ireviewinfo.rate}점</span></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <p>${ireviewinfo.review}</p>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <table id="commentTable" class="table table-condensed">
                            <colgroup>
                                <col width="20%">
                                <col width="20%">
                                <col width="60%">
                            </colgroup>
                            <thead id="replycomment">
                            <tr>
                                <th>작성자</th>
                                <th>등록일자</th>
                                <th>내용</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>admin0529</td>
                                <td>2023-05-30</td>
                                <td>소중한 후기 감사드립니다. 다음에 또 방문해주세요~</td>
                            </tr>
                            </tbody>
                        </table>
                        <table class="table table-condensed">
                            <thead>
                            <tr>
                                <td>
                                    <div class="form-group">
                                        <label for="comment">댓글 입력</label>
                                        <textarea class="form-control" id="comment" rows="3"></textarea>
                                    </div>
                                    <button class="btn btn-primary px-4" onclick="submitComment()" style='float:right'>댓글 등록</button>
                                </td>
                            </tr>
                            </thead>
                        </table>
                        <table class="table table-condensed">
                            <thead>
                            <tr>
                                <td>
                                        <span style='float:right'>
                                            <input type="button" class="btn btn-primary px-4" value="후기 삭제" onclick="deleteReview()">
                                            <a href="javascript:history.back()" class="btn btn-secondary px-4">뒤로가기</a>
                                        </span>
                                </td>
                            </tr>
                            </thead>
                        </table>
                        <div class="clearBoth"><br/></div>
                    </div>
                </div>
            </div>
            <!-- /. PAGE INNER  -->
        </div>
    </div>
</div>

<style>
    #replycomment {
        font-size: 9px;
        color: blue;
    }
</style>
