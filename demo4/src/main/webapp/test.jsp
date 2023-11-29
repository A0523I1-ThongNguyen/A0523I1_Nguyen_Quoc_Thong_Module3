<%--
  Created by IntelliJ IDEA.
  User: Thong
  Date: 27/11/2023
  Time: 3:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<form action="/km" method="get">
  <label>Noi Dung</label>
  <input type="text" name="noidung">
  <label>Gia</label>
  <input type="number" name="gia">
  <label>Khuyen mai</label>
  <input type="number" name="khuyenmai">
  <button>ket qua</button>
</form>

<h4>khuyen mai : ${applyKhuyenMai}</h4>
<h4>gia sau khi khuyen mai : ${giaMua}</h4>
</body>
</html>
