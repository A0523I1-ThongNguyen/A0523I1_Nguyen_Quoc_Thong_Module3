<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/21/2023
  Time: 4:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Tìm kiếm sản phẩm</title>
</head>
<body>
<h1>Tìm kiếm sản phẩm</h1>
<a href="/products">Quay lại menu</a>
<form action="/products?action=search" method="post">
  <table>
    <tr>
      <td>Name:</td>
      <td><input type="text" name="name"></td>
      <td>
        <button>Tìm kiếm</button>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
