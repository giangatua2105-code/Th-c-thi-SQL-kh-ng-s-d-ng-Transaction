package com.codegym.dao;

import com.codegym.model.User;
import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {
    public void insertUser(User user) throws Exception;
    public User selectUser(int id);
    public List<User> selectAllUsers();
    public boolean deleteUser(int id) throws Exception;
    public boolean updateUser(User user) throws Exception;

    // Tìm kiếm user theo country (gần đúng, không phân biệt hoa thường)
    public List<User> searchByCountry(String country);

    // Sắp xếp user theo name: order = "asc" (A-Z) hoặc "desc" (Z-A)
    public List<User> sortByName(String order);

    // Sử dụng Stored Procedure
    public User getUserById(int id);
    public void insertUserStore(User user) throws SQLException;

    // Sử dụng Transaction: thêm user và phân quyền cùng lúc
    public void addUserTransaction(User user, int[] permissionIds) throws SQLException;

    // Thực thi SQL KHÔNG dùng Transaction (cố tình gây lỗi để quan sát rác dữ liệu)
    public void insertUpdateWithoutTransaction() throws SQLException;
}
