USE demo;

-- Bảng Employee dùng cho bài thực hành "không dùng Transaction"
-- (code Java sẽ DROP và tạo lại bảng này mỗi lần chạy test)
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (
    id INT(3) NOT NULL AUTO_INCREMENT,
    name VARCHAR(120) NOT NULL,
    salary INT(220) NOT NULL,
    created_Date DATETIME,
    PRIMARY KEY (id)
);
