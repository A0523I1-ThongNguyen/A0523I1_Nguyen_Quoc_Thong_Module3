<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/21/2023
  Time: 2:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm mới sản phẩm</title>
</head>
<body>
<a href="/products">Quay lại</a>
<form action="/products?action=add" method="post">
        <fieldset>
        <legend>Add new Product</legend>
        <table>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>Price:</td>
                <td><input type="number" name="price"></td>
            </tr>
            <tr>
                <td>Mô tả sản phẩm:</td>
                <td><input type="text" name="mt_Product"></td>
            </tr>
            <tr>
                <td>Nhà sản xuất:</td>
                <td><input type="text" name="producer"></td>
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