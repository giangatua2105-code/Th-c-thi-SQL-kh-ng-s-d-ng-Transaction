<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm Mới User</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; background-color: #f8fafc; }
        .container { width: 50%; max-width: 500px; margin: auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
        h2 { color: #1b2a7a; text-align: center; }
        .form-group { margin-bottom: 15px; }
        label { font-weight: bold; display: block; margin-bottom: 5px; color: #333; }
        input[type="text"], input[type="email"] { width: 100%; padding: 10px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 4px; }
        .btn { padding: 10px 15px; background-color: #27ae60; color: white; border: none; cursor: pointer; border-radius: 4px; font-weight: bold; width: 100%; margin-top: 10px; }
        .btn:hover { background-color: #219150; }
        a { display: block; text-align: center; margin-top: 15px; color: #1b2a7a; text-decoration: none; font-weight: bold; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Thêm Mới User</h2>
        <form action="${pageContext.request.contextPath}/users?action=create" method="post">
            <div class="form-group">
                <label>Tên đầy đủ:</label>
                <input type="text" name="name" required />
            </div>
            <div class="form-group">
                <label>Email:</label>
                <input type="email" name="email" required />
            </div>
            <div class="form-group">
                <label>Quốc gia:</label>
                <input type="text" name="country" required />
            </div>
            <div class="form-group">
                <label>Quyền hạn (Permissions):</label>
                <div style="display: flex; gap: 15px; margin-top: 5px; flex-wrap: wrap;">
                    <label style="font-weight: normal;"><input type="checkbox" name="permissions" value="1"> Thêm (Add)</label>
                    <label style="font-weight: normal;"><input type="checkbox" name="permissions" value="2"> Sửa (Edit)</label>
                    <label style="font-weight: normal;"><input type="checkbox" name="permissions" value="3"> Xoá (Delete)</label>
                    <label style="font-weight: normal;"><input type="checkbox" name="permissions" value="4"> Xem (View)</label>
                </div>
            </div>
            <button type="submit" class="btn">Lưu thông tin</button>
        </form>
        <a href="${pageContext.request.contextPath}/users">Quay lại danh sách</a>
    </div>
</body>
</html>
