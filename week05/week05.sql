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
('24FTT1111', '00-345679', 'Ong Sum Ping', 'Daging',
'673111222', '6731111222', 'DDAT05');

-- There will be an error in this statement because group DADT03 does not exist
-- in pbgroups table
-- INSERT INTO students VALUES
-- ('24FTT2345', 'Bakar', '00-234567',
-- 'Antah di Kampong Berantah', '673123456',
-- '673654321', 'DADT03');

SELECT * FROM students;

SELECT id, name, address FROM students;

SELECT * FROM pbgroups;

-- Wrong select statement when retrieving
-- from multiple tables
SELECT * FROM students, pbgroups;

SELECT * FROM students, pbgroups
WHERE students.group_code=pbgroups.code;

SELECT students.id, students.name, pbgroups.intake
FROM students, pbgroups
WHERE students.group_code=pbgroups.code;

SELECT students.id, students.name,
pbgroups.intake, pbgroups.school
FROM students, pbgroups
WHERE students.group_code=pbgroups.code;

SELECT * FROM students, pbgroups
WHERE students.group_code=pbgroups.code
AND students.group_code='DDAT05';

-- Each student will be assigned to one group only
-- Each group can have one or more (many) students

-- Each group can take one or more (many) modules
-- Each module can be taken by one or more (many) groups

CREATE TABLE modules (
    code CHAR(6) PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

INSERT INTO modules VALUES
('GS1108', 'Pengajian Islam'),
('GS1113', 'Melayu Islam Beraja'),
('AD2203', 'Database Design and Implementations'),
('AD2204', 'Python Programming');

CREATE TABLE groups_modules (
    group_code VARCHAR(10),
    module_code CHAR(6),
    sem_no INT NOT NULL,
    PRIMARY KEY(group_code, module_code),
    FOREIGN KEY (group_code) REFERENCES pbgroups(code),
    FOREIGN KEY (module_code) REFERENCES modules(code)
);

INSERT INTO groups_modules VALUES
('DDAT05','GS1108', 1),('DCNG05','GS1108', 2),
('DDAT05','GS1113', 2),('DCNG05','GS1113', 1),
('DDAT05','AD2203', 2),('DDAT05','AD2204', 2);

-- This insert is invalid because duplicate
-- group and module codes combination
-- INSERT INTO groups_modules VALUES
-- ('DDAT05', 'GS1108');

SELECT * FROM groups_modules;

SELECT groups_modules.group_code,
groups_modules.module_code, modules.name
FROM groups_modules, modules
WHERE groups_modules.module_code=modules.code
AND groups_modules.group_code='DDAT05';

SELECT gm.group_code,
gm.module_code, m.name
FROM groups_modules gm, modules m
WHERE gm.module_code=m.code
AND gm.group_code='DDAT05';