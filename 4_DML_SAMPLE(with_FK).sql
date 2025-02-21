CREATE TABLE product_order (
    id bigint PRIMARY KEY AUTO_INCREMENT
,   user_id bigint NOT NULL -- 관계가 의미적으로는 드러나지만 스키마에 KEY 로 적용되지 않은 사례
,   product_name varchar(10) NOT NULL -- 일단 큰 값으로 텍스트 데이터 등 데이터 타입 정의, 이후 개발 완료 및 성능 튜닝이 필요한 경우 조정
,   product_category varchar(10) NOT NULL
,   price int NOT NULL
,   amount int NOT NULL
)
;
INSERT INTO product_order VALUES
(null, 6, '색소폰', '금관악기', 450000, 1),
(null, 7, '갤럭시 fit5', '스마트 워치', 100000, 30);
select * from product_order;
SELECT * FROM registered_user;
INSERT INTO product_order VALUES
(null, 9223372036854775807, '아이패드', '태블릿 피씨', 800000, 1);

CREATE TABLE product_order_fk (
    id bigint PRIMARY KEY AUTO_INCREMENT,
    user_id int NOT NULL,  -- 관계가 의미적으로는 드러나지만 스키마에 KEY 로 적용되지 않은 사례
    product_name varchar(10) NOT NULL, -- 일단 큰 값으로 텍스트 데이터 등 데이터 타입 정의, 이후 개발 완료 및 성능 튜닝이 필요한 경우 조정
    product_category varchar(10) NOT NULL,
    price int NOT NULL,
    amount int NOT NULL,
    -- 제대로 된 참조 대상 Key 컬럼을 지정
    FOREIGN KEY (user_id) REFERENCES registered_user(id)
);

SHOW CREATE TABLE product_order_fk;

SELECT * from registered_user;
INSERT INTO product_order_fk VALUES
(null, 14, '색소폰', '금관악기', 450000, 1),
(null, 15, '갤럭시 fit5', '스마트 워치', 100000, 30);
SELECT * FROM product_order_fk;
-- 아래 데이터는 잘못 생성된 데이터로, 입력해선 안되는 케이스를 잘 차단해준 것임
INSERT INTO product_order_fk VALUES
(null, 99, '아이패드', '태블릿 피씨', 800000, 1);

-- FK 키를 중간에 생성해 주기
SELECT * FROM product_order;
DELETE FROM product_order WHERE id = 3;
ALTER TABLE product_order MODIFY COLUMN user_id  int NOT NULL;
SHOW CREATE TABLE product_order;
-- 키 생성 시 기존 데이터 정합성도 검사함!
ALTER TABLE product_order
ADD CONSTRAINT fk_productorder_userid
FOREIGN KEY (user_id) REFERENCES registered_user(id);

DELETE
FROM product_order
WHERE user_id
      NOT IN (SELECT id
              FROM registered_user);
