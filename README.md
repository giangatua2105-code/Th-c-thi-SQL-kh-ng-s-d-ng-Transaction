# User Management (JSP - Servlet - JDBC - MySQL)

CRUD quản lý User theo mô hình MVC, chạy trên Tomcat 10.1+ (Jakarta EE).

## Chạy dự án
1. Chạy `sql/init.sql` trong MySQL.
2. Sửa `jdbcUsername` / `jdbcPassword` trong `UserDAO.java`.
3. `mvn clean package`
4. Copy `target/user-management.war` vào `webapps/` của Tomcat, rồi start Tomcat.
5. Mở http://localhost:8080/user-management/users
