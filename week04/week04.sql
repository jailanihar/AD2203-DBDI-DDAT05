CREATE TABLE pbgroups(
    code VARCHAR(10) PRIMARY KEY,
    description VARCHAR(255) NOT NULL,
    school VARCHAR(255) NOT NULL,
    intake INT NOT NULL
);

CREATE TABLE students(
    id CHAR(9) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    ic_number CHAR(9) UNIQUE NOT NULL,
    address TEXT NOT NULL,
    phone_number1 VARCHAR(50) NOT NULL,
    phone_number2 VARCHAR(50),
    group_code VARCHAR(10) NOT NULL,
    FOREIGN KEY (group_code) REFERENCES pbgroups(code)
);

INSERT INTO pbgroups VALUES
('DDAT05', 'Data Analytics 5', 'SICT', 14),
('DCNG05', 'Cloud and Networking 5', 'SICT', 14);

INSERT INTO students VALUES
('24FTT1234', 'Abu', '00-123456',
'Antah di Kampong Berantah', '673123456',
'673654321', 'DDAT05');

INSERT INTO students VALUES
('24FTT2345', 'Bakar', '00-234567',
'Antah di Kampong Berantah', '673123456',
'673654321', 'DDAT05');

INSERT INTO
students(id, name, ic_number, address, phone_number1, group_code)
VALUES
('24FTT4321', 'Curi', '00-345678',
'Kampong L3C', '673678678', 'DCNG05');

INSERT INTO
students
(id, ic_number, address, name, phone_number2, phone_number1, group_code)
VALUES
('24FTT1111', '00-345678', 'Ong Sum Ping', 'Daging',
'673111222', '6731111222', 'DDAT05');

-- There will be an error in this statement because group DADT03 does not exist
-- in pbgroups table
INSERT INTO students VALUES
('24FTT2345', 'Bakar', '00-234567',
'Antah di Kampong Berantah', '673123456',
'673654321', 'DADT03');