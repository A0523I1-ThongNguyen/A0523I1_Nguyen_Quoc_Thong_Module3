<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/21/2023
  Time: 1:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Danh sách sản phẩm</title>
</head>
<style>
    table, tr, td, th {
        border: 1px solid black;
        border-collapse: collapse;
    }
</style>
<body>
<h1>Danh sách sản phẩm</h1>
<table style="border: none">
    <tr style="border: none">
        <td style="border: none">
            <a href="/products?action=showAdd">Thêm mới sản phẩm</a>
        </td>
        <td style="border: none">
            <a href="/products?action=showSearch">Tìm kiếm sản phẩm</a>
        </td>
    </tr>
</table>
<table>
    <tr>
        <th>STT</th>
        <th>ID</th>
        <th>Name</th>
        <th>Price</th>
        <th>Producer</th>
    </tr>
    <c:forEach items="${list}" var="product" varStatus="loop">
        <tr>
            <td><c:out value="${loop.count}"/></td>
            <td><c:out value="${product.getId()}"/></td>
            <td><c:out value="${product.getName()}"/></td>
            <td><c:out value="${product.getPrice()}"/></td>
            <td><c:out value="${product.getProducer()}"/></td>
            <td><a href="/products?action=showUpdate&id=${product.getId()}">Sửa</a></td>
            <td>
                <a href="/products?action=showDelete&id=${product.getId()}">Xóa</a>
            </td>
            <td>
                <a href="/products?action=showCTProduct&id=${product.getId()}">Xem chi tiết sản phẩm</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
<script>
    function clickSearch() {
        document.getElementById("search").style.display = "block";
    }
</script>
</html>
