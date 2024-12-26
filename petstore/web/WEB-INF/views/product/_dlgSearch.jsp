<%-- 
    Document   : _dlgSearch
    Created on : Nov 29, 2024, 10:15:04 AM
    Author     : PHT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- The Modal -->
<div class="modal" id="dlgSearch">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Searching Products</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <form action="<c:url value="/product/index.do" />">   
                    <input type="hidden" name="page" value="${param.page}" />
                    <div class="mb-3">
                        <label for="searchField" class="form-label">Search by:</label>
                        <select name="searchField" id="searchField" class="form-control">
                            <option value="id" ${searchField=="id"?"selected":""}>Id</option>
                            <option value="description" ${searchField=="description"?"selected":""}>Description</option>
                            <option value="price" ${searchField=="price"?"selected":""}>Price</option>
                            <option value="discount" ${searchField=="discount"?"selected":""}>Discount</option>
                            <option value="categoryId" ${searchField=="categoryId"?"selected":""}>Category</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="operator" class="form-label">Operator:</label>
                        <select name="operator" id="operator" class="form-control">
                            <option ${operator=="="?"selected":""}>=</option>
                            <option ${operator=="<="?"selected":""}>&lt;=</option>
                            <option ${operator==">="?"selected":""}>&gt;=</option>
                            <option ${operator=="contains"?"selected":""}>contains</option>
                        </select>
                    </div>
                    <div class="mb-3 mt-3">
                        <label for="searchText" class="form-label">Search text:</label>
                        <input type="text" class="form-control" id="searchText" name="searchText" value="${searchText}" placeholder="Search text">
                    </div>
                    <div style="text-align: right;">
                        <button type="submit" class="btn btn-outline-success" name="op" value="search"><i class="bi bi-search"></i> Search</button>
                        <button type="submit" class="btn btn-outline-success" name="op" value="searchClear"><i class="bi bi-x-circle"></i> Clear</button>
                        <button type="button" data-bs-dismiss="modal" class="btn btn-outline-danger" name="op" value="cancel"><i class="bi bi-dash-circle"></i> Cancel</button>
                    </div>
                </form>  
            </div>

            <!-- Modal footer -->
            <!--            <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancel</button>
                        </div>-->
        </div>
    </div>
</div> 
