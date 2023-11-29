<%--
  Created by IntelliJ IDEA.
  User: Thong
  Date: 27/11/2023
  Time: 4:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
        <title>Hiển thị danh sách khách hàng</title>
</head>
<body>

<h1>Danh Sach Client</h1>
<table>
<tr>
        <th>STT</th>
        <th>Ten</th>
        <th>Ngay Sinh</th>
        <th>Dia Chi</th>
        <th>Anh</th>
</tr>
<c:forEach items="${list}" var="cl" varStatus="loop">
        <tr>
                <td><c:out value="${loop.count}"/></td>
                <td><c:out value="${cl.name}"/></td>
                <td><c:out value="${cl.birthday}"/></td>
                <td><c:out value="${cl.address}"/></td>
                <td><img src="${cl.picture}" alt=""></td>
        </tr>
</c:forEach>
</table>

</body>
</html>
