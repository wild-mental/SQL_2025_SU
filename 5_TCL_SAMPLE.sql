-- Transaction Control Language
-- 반드시 하나의 단위로 이루어져야 하는 작업들을 제어!

# 은행 송금 예제
CREATE TABLE bank_account (
    account_number int PRIMARY KEY AUTO_INCREMENT,
    account_owner VARCHAR(10) NOT NULL,
    balance INT(20) DEFAULT 0 NOT NULL
);
SHOW CREATE TABLE bank_account;
SELECT * FROM bank_account;

INSERT INTO bank_account VALUES
	(null, '김셀러', 0),
	(null, '이구매', 500000);

UPDATE bank_account
SET balance = (balance - 100000)
WHERE account_owner = '이구매';

UPDATE bank_account
SET balance = (balance + 100000)
WHERE account_owner = '김셀러';

SELECT * FROM bank_account;

START TRANSACTION;
-- ------ 이 사이에 있는 작업은 모두 한덩어리
UPDATE bank_account SET balance = (balance - 100000) WHERE account_owner = '이구매';
UPDATE bank_account SET balance = (balance + 100000) WHERE account_owner = '김셀러';
SELECT * FROM bank_account;
-- ------ 이 사이에 있는 작업은 모두 한덩어리
COMMIT;


START TRANSACTION;
-- ------ 이 사이에 있는 작업은 모두 한덩어리
UPDATE bank_account SET balance = (balance - 100000) WHERE account_owner = '이구매';
-- Java 등 다른 시스템에서 "어? 판매자가 거부합니다!"
-- UPDATE bank_account SET balance = (balance + 100000) WHERE account_owner = '김셀러';
ROLLBACK;
SELECT * FROM bank_account;
-- ------ 이 사이에 있는 작업은 모두 한덩어리
COMMIT;


-- CASE 3 : 일부 반영 필요한 경우 - 구간별 반영 필요한 경우 SAVEPOINT 사용
INSERT INTO bank_account VALUES
	(null, '나중개', 0);
START TRANSACTION;
UPDATE bank_account SET balance = (balance - 5000) WHERE account_owner = '이구매';
UPDATE bank_account SET balance = (balance + 5000) WHERE account_owner = '나중개';
SAVEPOINT commission_paid;
UPDATE bank_account SET balance = (balance - 100000) WHERE account_owner = '이구매';
-- 김셀러가, 첫구매자만 10만원 혜택 : 상품 가액 (150000)에 맞지 않으면 송금을 아예 취소해버리는 세팅
-- UPDATE bank_account SET balance = (balance + 100000) WHERE account_owner = '김셀러';
ROLLBACK TO commission_paid;
-- ROLLBACK;
COMMIT;
SELECT * FROM bank_account;
-- 수수료 지불 완료 후 거래는 취소
