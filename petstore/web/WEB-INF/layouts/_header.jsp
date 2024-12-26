<%-- 
    Document   : _header
    Created on : Dec 20, 2024, 9:30:10 AM
    Author     : PHT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<a href="<c:url value="/" />" style="text-decoration: none;">
    <img src="<c:url value="/images/logo.jpg" />" height="80" class="rounded-circle" />    
</a>
<span class="title">&nbsp;Fish Store</span>             
<span style="position: absolute; bottom: 0; right: 0;">
    <c:choose>
        <c:when test="${account != null}">
            <i class="bi bi-person-check"></i> Welcome ${account.name} | 
            <a href="<c:url value="/account/logout.do" />" class="btn"><i class="bi bi-box-arrow-right"></i> Logout</a> | 
        </c:when>
        <c:otherwise>
            <a href="<c:url value="/account/register.do" />" class="btn"><i class="bi bi-person-add"></i> Register</a> | 
            <a href="#" data-bs-toggle="modal" data-bs-target="#dlgLogin" id="login" class="btn"><i class="bi bi-box-arrow-in-right"></i> Login</a> | 
        </c:otherwise>
    </c:choose>
    <a href="<c:url value="/cart/index.do" />" class="btn">
        <c:choose>
            <c:when test="${cart == null or cart.total == 0}">
                <i class="bi bi-cart"></i> 
                <fmt:formatNumber value="0" maxFractionDigits="2" minFractionDigits="2" type="currency" />
            </c:when>
            <c:when test="${cart != null and cart.total > 0}">
                <i class="bi bi-cart-fill"></i> 
                <fmt:formatNumber value="${cart.total}" maxFractionDigits="2" minFractionDigits="2" type="currency" />
            </c:when>
        </c:choose>                              
    </a>
</span>
