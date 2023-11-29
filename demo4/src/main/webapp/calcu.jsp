<%--
  Created by IntelliJ IDEA.
  User: Thong
  Date: 23/11/2023
  Time: 3:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <title>Ứng dụng Calculator</title>
</head>
<body>
<form action="/discount" method="post">
  <lable>Product Description</lable>
  <input type="text" name="name">
  <lable>List Price</lable>
  <input type="number" name="price">
  <lable>Discount Percent</lable>
  <input type="number" name="discount">
  <button>Calculate Discount</button>
</form>
<p>Discount Amount: ${amount}</p>
<p>Discount Price: ${price}</p>
</body>

</html>
