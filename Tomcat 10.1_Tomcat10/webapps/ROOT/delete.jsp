<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/21/2023
  Time: 2:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Delete Product</title>
</head>
<style>
  table, tr, td, th {
    border: 1px solid black;
    border-collapse: collapse;
  }
</style>
<body>
<h1>Xóa sản phẩm</h1>
<a href="/products">Quay lại menu</a>
<form action="/products?action=delete" method="post">
  <table>
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Price</th>
      <th>Producer</th>
    </tr>
    <tr>
      <td><input type="hidden" name="id2" value="<c:out value="${product.getId()}"/>"></td>
      <td><c:out value="${product.getId()}"/></td>
      <td><c:out value="${product.getName()}"/></td>
      <td><c:out value="${product.getPrice()}"/></td>
      <td><c:out value="${product.getProducer()}"/></td>
      <td>
        <button>Xóa</button>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
