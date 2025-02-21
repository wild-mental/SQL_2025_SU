-- DDL 의 유형
    -- 1) 테이블 제어(CUD) : 테이블 추가 삭제 테이블명 변경
    -- 2) 컬럼 제어(CUD) : 컬럼 추가 삭제 컬럼명 변경
    -- 3) 제약조건 제어(CUD) : CONSTRAINT 추가 삭제 이름 변경
    -- 4) 테이블 데이터 초기화 TRUNCATE

-- 서비스의 회원 관리용 테이블을 만들자!
CREATE TABLE app_user
(
  	id INT(3) PRIMARY KEY
,  	username VARCHAR(20) UNIQUE NOT NULL
,   real_name VARCHAR(30) NOT NULL
,   email VARCHAR(80)
)
;
SHOW CREATE TABLE app_user;
ALTER TABLE app_user ADD COLUMN (u_address varchar(30));

ALTER TABLE app_user ADD COLUMN email varchar(30);
ALTER TABLE app_user ADD CONSTRAINT UNIQUE (email);
ALTER TABLE app_user DROP CONSTRAINT email;
ALTER TABLE app_user DROP COLUMN email;

INSERT INTO app_user values (
  1, 'random_user', '김진명', '서울 111-999 번지'
);
SELECT * FROM app_user;
INSERT INTO app_user values (
  2, 'random_user2', '김가명', '서울 111-998 번지'
);

RENAME TABLE app_user to member;
SELECT * FROM member;
TRUNCATE TABLE member;  -- 데이터만 날리지만 '테이블 초기화' 라는 관점에서 DDL
DROP TABLE member;
