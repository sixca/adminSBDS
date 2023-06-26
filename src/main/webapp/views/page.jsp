<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!-- pagination start -->
<div class="demo-inline-spacing">
  <nav aria-label="Page navigation">
    <ul class="pagination justify-content-center">

      <c:choose>
        <c:when test="${cpage.getPrePage() != 0}">
          <li class="page-item prev">
            <a class="page-link" href="/${target}/allpage?pageNo=${cpage.getPrePage()}"
            ><i class="tf-icon bx bx-chevrons-left"></i
            ></a>
          </li>
        </c:when>
        <c:otherwise>
          <li class="page-item prev">
            <a class="page-link" href="javascript:void(0);"
            ><i class="tf-icon bx bx-chevrons-left"></i
            ></a>
          </li>
        </c:otherwise>
      </c:choose>

      <c:forEach begin="${cpage.getNavigateFirstPage()}" end="${cpage.getNavigateLastPage()}" var="page">
        <c:choose>
          <c:when test="${cpage.getPageNum() == page}">
            <li class="page-item active">
              <a class="page-link" href="/${target}/allpage?pageNo=${page}">${page}</a>
            </li>
          </c:when>
          <c:otherwise>
            <li class="page-item">
              <a class="page-link" href="/${target}/allpage?pageNo=${page}">${page}</a>
            </li>
          </c:otherwise>
        </c:choose>
      </c:forEach>

      <c:choose>
        <c:when test="${cpage.getNextPage() != 0}">
          <li class="page-item next">
            <a class="page-link" href="/${target}/allpage?pageNo=${cpage.getNextPage()}"
            ><i class="tf-icon bx bx-chevrons-right"></i
            ></a>
          </li>
        </c:when>
        <c:otherwise>
          <li class="page-item next">
            <a class="page-link" href="javascript:void(0);"
            ><i class="tf-icon bx bx-chevrons-right"></i
            ></a>
          </li>
        </c:otherwise>
      </c:choose>
    </ul>
  </nav>
</div>

<!-- pagination end -->
