<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row">
    <div class="col-sm-12">
        <div class="float-end">
            <a href="<c:url value="/product/index.do?page=1" />" class="btn btn-sm btn-primary ${param.page==1?"disabled":""}" title="First"><i class="bi bi-caret-left-fill"></i></a>
            <a href="<c:url value="/product/index.do?page=${page-1}" />" class="btn btn-sm btn-primary ${param.page==1?"disabled":""}" title="Previous"><i class="bi bi-caret-left"></i></a>
            <a href="<c:url value="/product/index.do?page=${page+1}" />" class="btn btn-sm btn-primary ${param.page==pageCount?"disabled":""}" title="Next"><i class="bi bi-caret-right"></i></a>
            <a href="<c:url value="/product/index.do?page=${pageCount}" />" class="btn btn-sm btn-primary ${param.page==pageCount?"disabled":""}" title="Last"><i class="bi bi-caret-right-fill"></i></a>
            <input type="text" id="txtPage" value="${page}" class="btn btn-sm btn-primary" style="width: 40px;" />
            <a href="#" class="btn btn-sm btn-primary" title="Goto" id="btnGoto"><i class="bi bi-arrow-right-square"></i></a>            
            Page ${page}/${pageCount}
        </div>
    </div>
</div>
<script>
    $("#btnGoto").click(function () {
        //lấy value của txtPage
        var page = $("#txtPage").val()
        //tạo url
        url = "<c:url value='/product/index.do?page="+page+"' />"
        //cập nhật href
        $(this).attr("href", url);
    });
</script>  