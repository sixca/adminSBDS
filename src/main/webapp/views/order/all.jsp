<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="page-wrapper">
    <div class="header">
        <h1 class="page-header">
            주문 관리
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
                                    <th class="center">주문 번호</th>
                                    <th class="center">회원 번호</th>
                                    <th class="center">총 결제금액</th>
                                    <th class="center">주문날짜</th>
                                    <th class="center">수령인명</th>
                                    <th class="center">주소</th>
                                    <th class="center">전화번호</th>
                                    <th class="center">주문 상품 갯수</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr class="odd gradeX">
                                    <td class="center">1</td>
                                    <td class="center">23</td>
                                    <td class="center">50,000원</td>
                                    <td class="center">2023-05-21</td>
                                    <td class="center">김화자</td>
                                    <td class="center">서울시 영등포구 여의도동 23-1</td>
                                    <td class="center">010-1111-2222</td>
                                    <td class="center">3</td>
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

