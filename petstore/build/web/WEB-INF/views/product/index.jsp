<%-- 
    Document   : index
    Created on : Nov 8, 2024, 10:22:11 AM
    Author     : PHT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row">
    <div class="col-sm-12" style="text-align: right;">
        <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#dlgSearch">
            <i class="bi bi-search"></i> Search
        </button>
        <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#dlgSort">
            <i class="bi bi-arrow-down-up"></i> Sort
        </button>
    </div>
</div>
<div class="row">
    <c:forEach var="product" items="${list}">
        <div class="col-sm-4 p-2">
            Id: ${product.id}<br/>
            Description: ${product.description}<br/>
            <strike>Old price: <fmt:formatNumber value="${product.price}" maxFractionDigits="2" minFractionDigits="2" type="currency" /></strike><br/>
            Discount: <fmt:formatNumber value="${product.discount}" type="percent" /><br/>
            <!--New price: <fmt:formatNumber value="${product.price*(1-product.discount)}" type="currency" /><br/>-->
            New price: <span style="font-size:24px;color:red;"><fmt:formatNumber value="${product.newPrice}" maxFractionDigits="2" minFractionDigits="2" type="currency" /></span><br/>
            Category: ${product.categoryId}<br/>             
            <img src="<c:url value="/products/${product.id}.jpg" />" width="100%"/>
            <a href="<c:url value="/cart/add.do?id=${product.id}" />" class="btn btn-sm btn-primary mt-3"><i class="bi bi-cart-plus"></i> Add to Cart</a>
        </div>
    </c:forEach>
</div>
<jsp:include page="_navigation.jsp" />
<jsp:include page="_dlgSearch.jsp" />
<jsp:include page="_dlgSort.jsp" />
