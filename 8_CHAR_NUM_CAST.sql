DESC example_table;
ALTER TABLE example_table modify column id INT AUTO_INCREMENT;
-- (1) 문자형 데이터를 숫자형 필터링에 사용
INSERT INTO example_table (id, small_integer) VALUES
  (null, 10),
  (null, 20),
  (null, 30),
  (null, 40),
  (null, 50);
SELECT * FROM example_table;

SELECT id, small_integer FROM example_table WHERE small_integer > 25;
SELECT id, small_integer FROM example_table WHERE small_integer > '25';

INSERT INTO example_table (id, variable_length_string) VALUES
  (null, '10'),
  (null, '20'),
  (null, '30'),
  (null, '40'),
  (null, '50');

SELECT id, variable_length_string FROM example_table WHERE variable_length_string > 25;  -- 타입캐스팅 오버헤드 발생
SELECT id, variable_length_string FROM example_table WHERE variable_length_string > '25';

INSERT INTO example_table (id, variable_length_string) VALUES
  (null, 'Sixty'),
  (null, 'Seventy'),
  (null, 'Eighty');
INSERT INTO example_table (id, variable_length_string) VALUES
  (null, '90'),
  (null, '100');

SELECT id, variable_length_string
FROM example_table;
-- 의도치 않은 데이터 제외 : Truncated incorrect DOUBLE value: 'Three'
SELECT id, variable_length_string
FROM example_table
WHERE variable_length_string > 60;
-- 데이터 제외되지 않지만 일반적으로 의도치 않는 동작 : 문자열 매 자릿수마다 Unicode 순서 선후 비교
SELECT id, variable_length_string
FROM example_table
WHERE variable_length_string > 'Seventy';

-- 문자는 문자대로, 숫자는 숫자대로 다루기!
-- 정렬용 A-Z 까지 순서 판단하기 좋지 않은가? "ORDER BY"
-- DB 에서는 명시적 ORDER BY 비권장
   -- Application 에서 하는 것을 권장
   -- 인덱스에 이미 정렬된 상태를 권장