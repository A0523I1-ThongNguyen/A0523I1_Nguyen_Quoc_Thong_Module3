<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/21/2023
  Time: 3:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Sửa thông tin</title>
</head>
<body>
<a href="/products">Quay lại</a>
<form action="/products?action=update" method="post">
  <fieldset>
    <legend>Update a Product</legend>
    <table>
      <tr>
        <td><input type="hidden" name="id" value="<c:out value="${product.getId()}"/>"></td>
      </tr>
      <tr>
        <td>Name:</td>
        <td><input type="text" name="name" value="<c:out value="${product.getName()}"/>"></td>
      </tr>
      <tr>
        <td>Price:</td>
        <td><input type="number" name="price" value="<c:out value="${product.getPrice()}"/>"></td>
      </tr>
      <tr>
        <td>Mô tả sản phẩm:</td>
        <td><input type="text" name="mt_Product" value="<c:out value="${product.getMt_Product()}"/>"></td>
      </tr>
      <tr>
        <td>Nhà sản xuất:</td>
        <td><input type="text" name="producer" value="<c:out value="${product.getProducer()}"/>"></td>
      </tr>
      <tr>
        <td></td>
        <td>
          <button> Add</button>
        </td>
      </tr>
    </table>
  </fieldset>
</form>
</body>
</html>
