SELECT id, name, registered_at
FROM registered_user
WHERE registered_at >= '2023-01-01'
  AND id < 15
;

SELECT *
FROM registered_user
WHERE address IN ('서울', '경기');  -- IN 비교 대상이 다른 SQL 질의 (쿼리) 의 결과여도 됨

SELECT *
FROM registered_user
WHERE name LIKE '%Python';

SELECT *
FROM registered_user
WHERE name LIKE '__Python';

SELECT *
FROM registered_user
WHERE height >= 170
  AND height <= 180;

SELECT *
FROM registered_user
WHERE height BETWEEN 175 AND 180;  -- 앞 뒤 범위에 대해서 등호 처리를 수행

INSERT INTO registered_user VALUES
(null, '김자바', 1995, '서울', null, '2024-02-23'),
(null, '김자바', 1995, '서울', 200, null);

SELECT *
FROM registered_user;

-- = 연산자로 null 비교 불가
SELECT * FROM registered_user WHERE height = null;  -- 없음 과 없음의 값 비교 불가
SELECT * FROM registered_user WHERE registered_at is null;  -- 주소값을 비교

# FUNCTION CALL PRACTICE
INSERT INTO registered_user VALUES
(null, 'Annie', 1995, 'New York', 180, '2024-02-23'),
(null, 'Kelly', 1998, 'London', 200, '2020-01-10'),
(null, 'Jason', 2000, 'Dubai', 185, '2023-02-23'),
(null, 'Cathy', 2010, 'Japan', 165, '2021-12-14');

SELECT CURRENT_DATE();
SELECT `name`, CHAR_LENGTH(`name`) FROM registered_user;

SELECT * FROM registered_user WHERE CHAR_LENGTH(`name`) = 5;
SELECT `name`, CHAR_LENGTH(`name`) FROM registered_user WHERE `name` LIKE "_____";
SELECT `name`, CHAR_LENGTH(`name`) FROM registered_user WHERE `name` LIKE "_____%";

ALTER TABLE registered_user ADD COLUMN weight DECIMAL(5, 2);
SHOW CREATE TABLE registered_user;
DESC registered_user;  -- Describe

UPDATE registered_user SET weight = 50 WHERE id IN (14, 15, 16);
UPDATE registered_user SET weight = 100.555 WHERE id IN (17, 18, 19);
UPDATE registered_user SET weight = 75.555 WHERE id > 19;

SELECT id, name, weight FROM registered_user;

SELECT
	`name`, height, weight,
    ROUND(weight, 0) AS 반올림_0번째_자리,
    TRUNCATE(weight, 1) AS 소수점_1자리_절사,
    MOD(height, 165) AS 키_165_MODULO,
    CEIL(weight) AS 몸무게_올림,
	FLOOR(weight) AS 몸무게_내림,
    SIGN(weight) AS 양음수_부호,
    SQRT(weight) AS 몸무게의제곱근
FROM registered_user;

SELECT
    -- 컬럼명, 특정 값, 함수호출, 함수 중첩호출, 서브쿼리
    --  = '특정값으로 평가되는 식' : 스칼라(진행이 안됨 = 단일값), 벡터(진행됨 = 배열 또는 중첩배열)
        -- 수학에서 : 스칼라(양) (1), 벡터(방향) (1,2,3,4,...) ->
    -- AS 컬럼 별칭
	`name`, registered_at,
    LAST_DAY(registered_at),
    DATE_ADD(registered_at, INTERVAL 60 DAY) AS _2개월_후,
    TIMESTAMPDIFF(DAY , registered_at, STR_TO_DATE('2024-02-23', '%Y-%m-%d')) AS 가입_경과일수
FROM registered_user;
