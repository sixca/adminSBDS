<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="page-wrapper">
    <div class="header">
        <h1 class="page-header">
            간병인 관리
        </h1>
        <a href="/mate/add" class="btn-floating btn-small right" style="margin-top: 20px;"><i class="material-icons">add</i></a>
    </div>

    <div id="page-inner">
        <div class="row">
            <c:forEach var="obj" items="${mlist}" varStatus="status">
                <div class="col-md-4 col-sm-4">
                    <div class="card blue-grey darken-1">

                        <div class="card-content white-text">
                            <div class="image-wrapper">
                                <img class="card-img" src="/uimg/${obj.img}" alt="Card Image" style="border-radius: 50%;">
                            </div>
                            <span class="card-title">${obj.name}</span>
                            <p class="card-title" style="font-size: 13px; color:darkorange; text-align: right; font-weight: bold;">평균 평점 : ${rlist[status.index].rate}점</p>
                            <p>${obj.jobPeriod}년 경력 / ${obj.license} / ${obj.area}</p>
                        </div>
                        <div class="card-action">
                            <a href="/mate/detail?id=${obj.id}">Detail</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <!-- /. ROW  -->
</div>
<!-- /. PAGE INNER -->
</div>
<!-- /. PAGE WRAPPER -->

<style>

    .header{
        display: flex;
        align-items: center;
    }

    .btn-floating{

    }

    .card {
        height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }

    .card-image {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .image-wrapper {
        width: 100%;
        height: 0;
        padding-bottom: 100%; /* Maintain a 1:1 aspect ratio */
        position: relative;
    }

    .card-img {
        position: absolute;
        width: 100%;
        height: 100%;
        object-fit: cover; /* Maintain aspect ratio and cover container */
    }

    .card-content {
        flex: 1;
        padding: 1rem;
    }

    .card-action {
        padding: 1rem;
        background-color: #eee;
    }
</style>
