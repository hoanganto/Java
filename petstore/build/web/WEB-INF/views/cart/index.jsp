<%-- 
    Document   : index
    Created on : Dec 13, 2024, 9:33:01 AM
    Author     : PHT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="row">
    <div class="col-sm-12">
        <h2>Your Cart</h2>
    </div>
</div>
<div class="row">
    <div class="col-sm-12">
        <table class="table table-striped">
            <tr>
                <th style="text-align: right;">No.</th>
                <th style="text-align: right;">Id</th>
                <th>Image</th>
                <th>Description</th>
                <th style="text-align: right;">Old Price</th>
                <th style="text-align: right;">Discount</th>
                <th style="text-align: right;">New Price</th>
                <th style="text-align: right;">Quantity</th>
                <th style="text-align: right;">Amount</th>
                <th>Operations</th>
            </tr>
            <c:forEach var="item" items="${cart.items}" varStatus="loop">
                <tr>
                    <td style="text-align: right;">${loop.count}</td>
                    <td style="text-align: right;">${item.product.id}</td>
                    <td><img src="<c:url value="/products/${item.product.id}.jpg" />" width="120px" /></td>
                    <td>${item.product.description}</td>
                    <td style="text-align: right;"><fmt:formatNumber value="${item.product.price}" maxFractionDigits="2" minFractionDigits="2" type="currency" /></td>
                    <td style="text-align: right;"><fmt:formatNumber value="${item.product.discount}" type="percent" /></td>
                    <td style="text-align: right;"><fmt:formatNumber value="${item.product.newPrice}" maxFractionDigits="2" minFractionDigits="2" type="currency" /></td>
                    <td style="text-align: right;"><input type="number" name="quantity" value="${item.quantity}" style="width:80px;" /></td>
                    <td style="text-align: right;"><fmt:formatNumber value="${item.cost}" maxFractionDigits="2" minFractionDigits="2" type="currency" /></td>
                    <td>
                        <a href="" class="update" data-id="${item.product.id}"><i class="bi bi-pencil-square"></i> Update</a>
                        <a href="<c:url value="/cart/delete.do?id=${item.product.id}" />"><i class="bi bi-trash3"></i> Delete</a>
                    </td>
                </tr>                
            </c:forEach>
            <tr>
                <th colspan="8" style="text-align: right;">Total</th>
                <th style="text-align: right;"><fmt:formatNumber value="${cart.total}" maxFractionDigits="2" minFractionDigits="2" type="currency" /></th>
                <th><a href="<c:url value="/cart/checkout.do" />"><i class="bi bi-cart-check"></i> Check Out</a></th>
            </tr>
        </table>
        <a href="<c:url value="/cart/checkout.do" />" class="btn btn-outline-success" ><i class="bi bi-cart-check"></i> Check Out</a>
    </div>
</div>
<script>
    $(".update").click(function () {
        //lấy id & quantity
        var id = $(this).data("id");
        var quantity = $(this).closest("tr").find("input[name='quantity']").val();
        //tạo url
        url = `<c:url value="/cart/update.do?id=\${id}&quantity=\${quantity}" />`
        //cập nhật href
        $(this).attr("href", url);
    });
</script>                 