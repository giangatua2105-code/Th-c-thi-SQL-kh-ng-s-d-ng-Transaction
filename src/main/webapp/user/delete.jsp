<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xác nhận Xóa User</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; background-color: #f8fafc; text-align: center; }
        .container { width: 40%; max-width: 450px; margin: auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
        h2 { color: #c0392b; margin-top: 0; }
        .info-box { background: #f9f9f9; padding: 15px; border-radius: 4px; margin-bottom: 20px; text-align: left; }
        .btn { padding: 10px 20px; color: white; border: none; cursor: pointer; text-decoration: none; border-radius: 4px; font-weight: bold; margin: 0 5px; display: inline-block;}
        .btn-delete { background-color: #c0392b; }
        .btn-delete:hover { background-color: #a93226; }
        .btn-cancel { background-color: #95a5a6; }
        .btn-cancel:hover { background-color: #7f8c8d; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Xác Nhận Xóa User!</h2>
        <p>Bạn có chắc chắn muốn xóa User này khỏi hệ thống cơ sở dữ liệu vĩnh viễn không?</p>
        <div class="info-box">
            <p><strong>Tên:</strong> <c:out value="${requestScope.user.name}" /></p>
            <p><strong>Email:</strong> <c:out value="${requestScope.user.email}" /></p>
            <p><strong>Quốc gia:</strong> <c:out value="${requestScope.user.country}" /></p>
        </div>
        <form action="${pageContext.request.contextPath}/users?action=delete" method="post">
            <input type="hidden" name="id" value="<c:out value='${requestScope.user.id}' />" />
            <button type="submit" class="btn btn-delete">Đồng ý Xóa</button>
            <a href="${pageContext.request.contextPath}/users" class="btn btn-cancel">Hủy bỏ</a>
        </form>
    </div>
</body>
</html>
