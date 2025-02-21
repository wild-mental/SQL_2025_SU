show tables;

create database mysql_intro_sample;

CREATE USER 'admin_acc' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON *.* to 'admin_acc';
SELECT * FROM mysql.user WHERE User = 'admin_acc';

CREATE USER 'app_service_acc' IDENTIFIED BY '1234';
GRANT SELECT ON *.* to 'app_service_acc';
SELECT * FROM mysql.user WHERE User = 'app_service_acc';

CREATE USER 'admin_acc'@'localhost' IDENTIFIED BY '1234';
CREATE USER 'developer_acc'@'localhost' IDENTIFIED BY '1234';
CREATE USER 'readonly_acc'@'localhost' IDENTIFIED BY '1234';

-- Role 생성
CREATE ROLE 'admin';
CREATE ROLE developer;
CREATE ROLE readonly;

-- Role에 권한 할당
GRANT ALL PRIVILEGES ON *.* TO 'admin';
GRANT SELECT, INSERT, UPDATE, DELETE ON *.* TO 'developer';
GRANT SELECT ON *.* TO 'readonly';

-- 계정에 Role 할당
GRANT admin TO 'admin_acc'@'localhost';
GRANT developer TO 'developer_acc'@'localhost';
GRANT readonly TO 'readonly_acc'@'localhost';

SELECT * FROM mysql.user;

CREATE USER 'admin_acc'@'%' IDENTIFIED BY '1234';
CREATE USER 'developer_acc'@'%' IDENTIFIED BY '1234';
CREATE USER 'readonly_acc'@'%' IDENTIFIED BY '1234';
