<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/21/2023
  Time: 3:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Chi tiết sản phẩm</title>
</head>
<style>
  table, tr, td, th {
    border: 1px solid black;
    border-collapse: collapse;
  }
</style>
<body>
<h1>Chi tiết sản phẩm</h1>
<a href="/products">Quay lại menu</a>
<table>
  <tr>
    <th>ID</th>
    <th>Name</th>
    <th>Price</th>
    <th>Mô tả sản phẩm</th>
    <th>Producer</th>
  </tr>
  <tr>
    <td><c:out value="${product.getId()}"/></td>
    <td><c:out value="${product.getName()}"/></td>
    <td><c:out value="${product.getPrice()}"/></td>
    <td><c:out value="${product.getMt_Product()}"/></td>
    <td><c:out value="${product.getProducer()}"/></td>
  </tr>
</table>
</body>
</html>
