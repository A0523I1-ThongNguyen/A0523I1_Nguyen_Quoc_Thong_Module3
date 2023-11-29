<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/21/2023
  Time: 4:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Danh sách tìm kiếm</title>
</head>
<style>
  table, tr, td, th {
    border: 1px solid black;
    border-collapse: collapse;
  }
</style>
<body>
<h1>Danh sách tìm kiếm</h1>
<a href="/products">Quay lại menu</a>
<table>
  <tr>
    <th>ID</th>
    <th>Name</th>
    <th>Price</th>
    <th>Producer</th>
  </tr>
  <c:forEach items="${list2}" var="product" varStatus="loop">
    <tr>
      <td><c:out value="${product.getId()}"/></td>
      <td><c:out value="${product.getName()}"/></td>
      <td><c:out value="${product.getPrice()}"/></td>
      <td><c:out value="${product.getProducer()}"/></td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
