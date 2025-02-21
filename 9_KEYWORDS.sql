CREATE TABLE `create` (
    id int PRIMARY KEY AUTO_INCREMENT,
    value int
)
;

SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT';
SELECT @@sql_mode;
CREATE TABLE "table" (
    id int PRIMARY KEY AUTO_INCREMENT,
    value int
)
;

select 'select';
