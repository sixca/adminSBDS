<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="page-wrapper">
    <div class="header">
        <h1 class="page-header">
            고객 관리
        </h1>
    </div>

    <div id="page-inner">

        <div class="row">
            <div class="col-md-12">
                <!-- Advanced Tables -->
                <div class="card">
                    <div class="card-action">
                        회원 리스트
                    </div>
                    <div class="card-content">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                <tr>
                                    <th class="center">프로필 사진</th>
                                    <th class="center">회원번호</th>
                                    <th class="center">Email</th>
                                    <th class="center">이름</th>
                                    <th class="center">생년월일</th>
                                    <th class="center">전화번호</th>
                                    <th class="center">주소</th>
                                    <th class="center">탈퇴여부</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="obj" items="${mlist}">
                                        <tr class="odd gradeX">
                                            <td class="center"><img class="small_img" src="/uimg/${obj.img}" style="border-radius: 50%;"></td>
                                            <td class="center"><a href="/member/detail?id=${obj.id}">${obj.id}</a></td>
                                            <td class="center">${obj.email}</td>
                                            <td class="center">${obj.name}</td>
                                            <td class="center">${obj.birth}</td>
                                            <td class="center">${obj.tel}</td>
                                            <td class="center">${obj.addr}</td>
                                            <td class="center">${obj.valid}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!--End Advanced Tables -->
            </div>
        </div>
    </div>
    <!-- /. PAGE INNER  -->
</div>
<!-- /. PAGE WRAPPER -->
<!-- /. WRAPPER -->
<!-- JS Scripts-->


<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
</script>
<style>
    .small_img {
        max-width: 50px;
        max-height: 50px;
    }
</style>
