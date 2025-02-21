CREATE TABLE registered_user (
	id            int           PRIMARY KEY AUTO_INCREMENT
,   name          varchar(10)   NOT NULL  -- DEFAULT NULL
,   birth_year    int           NOT NULL
,   address       varchar(20)   NOT NULL
,   height        int        -- DEFAULT NULL 생략 가능 (NULLABLE 컬럼)
,   registered_at date       -- 데이터 발생 일시 created_at 을 많이 사용
# ,   updated_at    datetime
# ,   last_login    datetime
)
;
# ALTER TABLE registered_user DROP COLUMN updated_at;
# ALTER TABLE registered_user DROP COLUMN last_login;
SHOW CREATE TABLE registered_user;

-- CREATE
INSERT INTO registered_user
    -- 컬럼명 명시
    (`id`,`name`,`birth_year`,`address`,`height`,`registered_at`)
VALUES
    -- 데이터를 명시된 컬럼명 순서에 맞춰서 입력
    (1, '사용자1', 2000, '우리집', 180, now());
INSERT INTO registered_user
-- 컬럼명 명시하지 않는 경우 : Create Table 구문에 선언된 컬럼 순서를 따름
VALUES
(2, '사용자2', 2001, '우리집', 180, now()),
(3, '사용자2', 2002, '우리집', 180, now()),
(null, '사용자4', 2004, '우리집', null, null),
(null, '사용자5', 2005, '우리집', null, null);

-- READ
-- SELECT (col1, col2, ...) FROM <TABLE_NAME>;
SELECT * FROM registered_user;

-- UPDATE
UPDATE registered_user
SET height = 200
-- 작업 대상 데이터 필터링 (bool 로 판단될 수 있는 조건식)
WHERE id = 4;

-- DELETE
DELETE FROM registered_user WHERE id = 3;
DELETE FROM registered_user WHERE id > 3;
DELETE FROM registered_user WHERE 1;

set SQL_SAFE_UPDATES = 1;
set SQL_SAFE_UPDATES = 0;

-- 함수 단순조회
SELECT CURRENT_DATE();

INSERT INTO registered_user VALUES
(null, '김자바', 1995, '서울', 175, '2024-02-23'),  -- date 타입의 리터럴 'YYYY-MM-DD'
(null, '이JS', 1996, '경기', 167, '2023-02-23'),
(null, '박Python', 1997, '대전', 185, '2022-02-23'),
(null, '최HTTP', 1998, '부산', 180, '2021-02-23'),
(null, '정CSS', 1999, '일산', 179, '2020-02-23');

-- UPDATE, DELETE 조건을 다양하게 적용하려면 'SQL_SAFE_UPDATES = 0'
DELETE FROM registered_user where address = '우리집';
