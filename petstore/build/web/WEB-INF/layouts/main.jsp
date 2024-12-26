<%-- 
    Document   : main
    Created on : Nov 8, 2024, 9:26:51 AM
    Author     : PHT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pet Store</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link href="<c:url value="/css/site.css" />" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="row header">
                <div class="col" style="position:relative;">
                    <jsp:include page="_header.jsp" />
                </div>
            </div>
            <div class="row content">
                <div class="col">
                    <jsp:include page="/WEB-INF/views/${controller}/${action}.jsp" />
                </div>
            </div>
            <div class="row footer">
                <div class="col">
                    Copyrights &copy; 2024 by HSU Students. All Rights Reversed.
                </div>
            </div>
        </div>
        <!--Alert-->
        <div class="alert alert-${alert.type} alert-dismissible d-none" style="position: fixed; bottom: 0; left: 5%; right: 5%;">
            <button type="button" class="btn-close" onclick="$('.alert').toggleClass('d-none')"></button>
            <strong>${alert.title}!</strong> ${alert.message}
        </div>
    </body>
</html>
<!-- Login dialog -->
<jsp:include page="_dlgLogin.jsp" />

<script>
    <c:if test="${param.alert == 1}">
    $(".alert").toggleClass("d-none");
    </c:if>
    <c:if test="${param.login == 1}">
    new bootstrap.Modal($('#dlgLogin')).show();
    </c:if>
</script>  