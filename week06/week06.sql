CREATE TABLE users (
	username VARCHAR(100) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(255) NOT NULL
);

CREATE TABLE students (
	id VARCHAR(9) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    user_username VARCHAR(100) UNIQUE NOT NULL,
    FOREIGN KEY (user_username) REFERENCES users(username)
);

CREATE TABLE lecturers (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    designation VARCHAR(255) NOT NULL,
    user_username VARCHAR(100) UNIQUE NOT NULL,
    FOREIGN KEY (user_username) REFERENCES users(username)
);

INSERT INTO users VALUES
('24FTT1234', SHA2('123456', 256), 'student');

SELECT username, role FROM users 
WHERE username='24FTT1234'
AND password=SHA2('123456', 256);

-- MD5 (collision example)
-- password = MD5 Hash value generated from password
-- '123456' = '2321sadas990043242'
-- '654321' = '2321sadas990043242'
