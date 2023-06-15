<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-sm-8 text-left">
    <div class="container">
        <div class="row content">
            <div class="col-sm-8  text-left ">
                <h3>Cust All Page</h3>
                <form action="/cust/findimpl2" method="get">
                    <div>
                        <input type="hidden" name="keyword1" value="id">
                        <input type="hidden" name="keyword2" value="name">
                        ID<input type="text"  name="search1" <c:if test="${value1 != ''}">value="${value1}"</c:if>>
                        NAME<input type="text"  name="search2" <c:if test="${value2 != ''}">value="${value2}"</c:if>>
                        <button type="submit">검색</button>
                    </div>
                </form>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>NAME</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="c" items="${cpage.getList()}">
                        <tr>
                            <td><a href="/cust/get?id=${c.id}">${c.id}</a></td>
                            <td>${c.name}</td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
                <c:if test="${cpage.getList() == null}">
                    <h4>데이터가 없습니다.</h4>
                </c:if>
                <jsp:include page="../findpage.jsp"/>
            </div>
        </div> <!-- -->
    </div>
</div>
