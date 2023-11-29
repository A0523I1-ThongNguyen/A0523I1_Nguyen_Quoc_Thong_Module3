<%--
  Created by IntelliJ IDEA.
  User: Thong
  Date: 27/11/2023
  Time: 2:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Product Discount calculator</title>
</head>
<body>
<form action="/product" method = "post">
  <label>Product Discription</label>
  <input type="text" name="name">
  <label>Price</label>
  <input type="number" name="price">
  <label>Discount</label>
  <input type="number" name="discount">
  <button>Caculator Discount</button>
</form>
<p>Discount: ${resultDiscount}</p>
<p>Price Product After Discount : ${priceAfterDiscount}</p>
</body>
</html>
