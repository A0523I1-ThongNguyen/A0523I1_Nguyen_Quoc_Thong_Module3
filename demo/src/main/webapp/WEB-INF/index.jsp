<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ứng dụng Product Discount Calculator</title>
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
</body>
<p>Discount Amount: ${amount}</p>
<p>Discount Price: ${price}</p>
</html>