<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý User</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; background-color: #f8fafc; }
        h2 { color: #1b2a7a; text-align: center; }
        table { width: 80%; margin: 20px auto; border-collapse: collapse; background: white; box-shadow: 0 4px 6px rgba(0,0,0,0.05); }
        th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
        th { background-color: #1b2a7a; color: white; }
        tr:hover { background-color: #f1f5f9; }
        .btn { padding: 8px 12px; text-decoration: none; border-radius: 4px; color: white; font-weight: bold; font-size: 14px; }
        .btn-add { background-color: #27ae60; display: inline-block; }
        .btn-edit { background-color: #2980b9; margin-right: 5px; }
        .btn-delete { background-color: #c0392b; }
        .toolbar { width: 80%; margin: 0 auto 10px; display: flex; flex-wrap: wrap; gap: 10px; align-items: center; }
        .toolbar input[type="text"] { padding: 8px; border: 1px solid #ccc; border-radius: 4px; }
        .toolbar button { padding: 8px 12px; background-color: #1b2a7a; color: white; border: none; border-radius: 4px; font-weight: bold; cursor: pointer; }
        .btn-sort { background-color: #8e44ad; }
        .btn-all { background-color: #7f8c8d; }
        .btn-add { margin-left: 0; margin-bottom: 0; }
    </style>
</head>
<body>
    <h2>Danh Sách Người Dùng (Users)</h2>
    <div class="toolbar">
        <a href="${pageContext.request.contextPath}/users?action=create" class="btn btn-add">Thêm mới User</a>

        <form action="${pageContext.request.contextPath}/users" method="get">
            <input type="hidden" name="action" value="search" />
            <input type="text" name="country" placeholder="Nhập quốc gia..." value="<c:out value='${requestScope.keyword}' />" />
            <button type="submit">Tìm kiếm</button>
        </form>

        <a href="${pageContext.request.contextPath}/users?action=sort&order=asc" class="btn btn-sort">Tên A → Z</a>
        <a href="${pageContext.request.contextPath}/users?action=sort&order=desc" class="btn btn-sort">Tên Z → A</a>
        <a href="${pageContext.request.contextPath}/users" class="btn btn-all">Xem tất cả</a>
    </div>
    <table>
        <tr>
            <th>ID</th><th>Tên User</th><th>Email</th><th>Quốc gia</th><th>Hành động</th>
        </tr>
        <c:if test="${empty requestScope.listUser}">
            <tr><td colspan="5" style="text-align:center;">Không có User nào phù hợp.</td></tr>
        </c:if>
        <c:forEach var="user" items="${requestScope.listUser}">
            <tr>
                <td><c:out value="${user.id}" /></td>
                <td><c:out value="${user.name}" /></td>
                <td><c:out value="${user.email}" /></td>
                <td><c:out value="${user.country}" /></td>
                <td>
                    <a href="${pageContext.request.contextPath}/users?action=edit&id=${user.id}" class="btn btn-edit">Sửa</a>
                    <a href="${pageContext.request.contextPath}/users?action=delete&id=${user.id}" class="btn btn-delete">Xóa</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
