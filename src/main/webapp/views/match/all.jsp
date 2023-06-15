<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="page-wrapper">
    <div class="header">
        <h1 class="page-header">
            매칭 관리
        </h1>
    </div>
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <!-- Advanced Tables -->
                <div class="card">
                    <div class="card-action">
                        Advanced Tables
                    </div>
                    <div class="card-content">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                <tr>
                                    <th class="center">매칭 no</th>
                                    <th class="center">간병인 no</th>
                                    <th class="center">회원 no</th>
                                    <th class="center">개시일자</th>
                                    <th class="center">종료일자</th>
                                    <th class="center">종류</th>
                                    <th class="center">지역</th>
                                    <th class="center">대상 성별</th>
                                    <th class="center">대상 생년월일</th>
                                    <th class="center">상태</th>
                                    <th class="center">가격</th>
                                    <th class="center">결제수단</th>
                                    <th class="center">결제일자</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr class="odd gradeX">
                                    <td class="center">1</td>
                                    <td class="center">23</td>
                                    <td class="center">35</td>
                                    <td class="center">2023-07-01</td>
                                    <td class="center">2023-07-28</td>
                                    <td class="center">요양</td>
                                    <td class="center">서울시 성동구</td>
                                    <td class="center">남</td>
                                    <td class="center">1944-02-07</td>
                                    <td class="center">결제완료</td>
                                    <td class="center">1,200,000원</td>
                                    <td class="center">CARD</td>
                                    <td class="center">2023-06-10</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
                <!--End Advanced Tables -->
            </div>
        </div>
    </div>
</div>


<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
</script>

