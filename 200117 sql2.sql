-- emp 테이블에서 사번,이름,급여,보너스, 급여+보너스를 화면에 보여주세요.
select empno, ename, sal, comm, sal+comm from emp; 

-- null 값을 갖는 컬럼을 다른 컬럼과 연산을 하게 되면 연산결과가 null값으로 처리된다.

-- nvl() 함수 : null 값을 특정 값으로 변경하는 함수.
--             모든 데이터 타입에 적용이 가능하다.
--             nvl() 함수를 사용할 때는 전환되는 값의 자료형을 일치시켜야 한다.
-- 형식) nvl(null 값이 들어있는 컬럼명, 변경할 값)
-- 실제 table에서 변경되는 것은 아니나 연산이 가능해짐
select empno, ename, sal, comm, sal+nvl(comm,0) from emp; 

-- nvl2() 함수 : 자바에서 삼항연산자와 비슷한 함수.
-- 형식) nvl2(expr, expr1, expr2)
--  -> expr의 값이 null이 아닐 경우에는 expr1 값을 반환하고,
--     expr의 값이 null일 경우 expr2 값을 반환한다.

select * from emp;
-- emp 테이블에서 관리자(MGR)가 있는 경우 1, 없는 경우 0을 반환
select empno, ename, nvl2(mgr, 1, 0) from emp;

-- as 키워드 : 컬럼 제목에 이름을 변경하는 키워드, 컬럼 바로 뒤에 사용.
--            컬럼 명과 별칭 사이에 as키워드를 넣기도 함.
select empno, ename, sal, comm, sal+nvl(comm,0) as "급여+보너스" from emp; 
-- 보통 별칭은 ""안에 작성, 홑따옴표 아님!
select empno, ename, sal, comm, sal+nvl(comm,0) "급여+보너스" from emp; 
-- 한칸만 띄어줘도 as키워드와 동일하게 인식됨.

--[문제1] emp 테이블에서 사번, 사원명, 급여, 급여의 10% 인상액을 화면에 보여주세요.
select empno, ename, sal, sal*1.1 "asce sal" from emp;

--[문제2] emp 테이블에서 각 사원의 담당업무를 화면에 보여주세요.
select job from emp;

-- distict 키워드 : 중복을 제거하는 키워드.
--                 주로 하나의 컬럼에서 중복된 값을 제외하고 보여줄 때 사용.
--                 distinct 키워드는 항상 select 키워드 다음에 기술한다.
--                 distinct 키워드 뒤에 나오는 컬럼들은 모두 distinct 키워드의 영향을 받는다.
--                 distinct 뒤에 여러 개의 컬럼들이 기술이 되면 해당 컬럼들은
--                 중복 되지 않은 상태로 나타난다.
SELECT DISTINCT job from emp;

-- emp 테이블에서 담당업무와 부서번호의 중복을 제거
SELECT DISTINCT job, deptno from emp;

-- member라는 테이블을 만들어보자
CREATE TABLE member(
 num number(7) primary key,     -- 회원번호
 memid VARCHAR2(20) not null,   -- 회원 id
 memname VARCHAR2(20) not null, -- 회원 이름
 pwd VARCHAR2(20) not null,     -- 회원 pwd
 age NUMBER(3),                 -- 회원 나이
 mileage NUMBER(8) not null,    -- 회원 마일리지
 job VARCHAR2(30),              -- 회원 직업
 addr VARCHAR2(100),            -- 회원 주소
 regdate DATE not null          -- 회원 가입일
 );                

-- member 테이블에 고객 정보를 저장해 보자.
INSERT INTO member VALUES (1, 'id1', '홍길동', '1111', 25, 0, '학생', '부산시 동래구', '2013-08-08');
INSERT INTO member VALUES (2, 'id2', '김길동', '2222', 30, 1500, '직장인', '서울시 강남구', '2013-09-05');
INSERT INTO member VALUES (3, 'id3', '공성현', '3333', 33, 10000, '직장인', '부산시 중구', '2013-09-09');
INSERT INTO member VALUES (4, 'id4', '김영희', '4444', 18, 3000, '학생', '경상남도 마산시', '2012-01-01');
INSERT INTO member VALUES (5, 'id5', '박말자', '5555', 45, 5000, '주부', '경기도 남양주시', '2013-05-05');
INSERT INTO member VALUES (6, 'id6', '김철수', '6666', 55, 0, '교수', '제주도 서귀포시', '2013-08-08'); 
INSERT INTO member VALUES (7, 'id7', '홍길동', '7777', 41, 6000, '학생', '경상북도 경주시', '2012-12-25');
INSERT INTO member VALUES (8, 'id8', '김상현', '8888', 31, 0, '무직', '서울시 마포구', '2013-04-18');
INSERT INTO member VALUES (9, 'id9', '이지연', '9999', 25, 0, '학생', '강원도 강릉시', '2013-02-06');
INSERT INTO member VALUES (10, 'id10', '홍길동', '0000', 52, 10000, '주부', '서울시 강북구', '2013-09-15');
 
 drop table category;
 drop table dept;
 drop table member;
 drop table products;
 
 CREATE TABLE EMP
       (EMPNO NUMBER(4) NOT NULL,
        ENAME VARCHAR2(10),
        JOB VARCHAR2(9),
        MGR NUMBER(4),
        HIREDATE DATE,
        SAL NUMBER(7, 2),
        COMM NUMBER(7, 2),
        DEPTNO NUMBER(2));

INSERT INTO EMP VALUES
        (7369, 'SMITH',  'CLERK',     7902,
        TO_DATE('1980-12-17', 'YYYY-MM-DD'),  800, NULL, 20);
INSERT INTO EMP VALUES
        (7499, 'ALLEN',  'SALESMAN',  7698,
        TO_DATE('1981-02-20', 'YYYY-MM-DD'), 1600,  300, 30);
INSERT INTO EMP VALUES
        (7521, 'WARD',   'SALESMAN',  7698,
        TO_DATE('1981-02-22', 'YYYY-MM-DD'), 1250,  500, 30);
INSERT INTO EMP VALUES
        (7566, 'JONES',  'MANAGER',   7839,
        TO_DATE('1981-04-02', 'YYYY-MM-DD'),  2975, NULL, 20);
INSERT INTO EMP VALUES
        (7654, 'MARTIN', 'SALESMAN',  7698,
        TO_DATE('1981-09-28', 'YYYY-MM-DD'), 1250, 1400, 30);
INSERT INTO EMP VALUES
        (7698, 'BLAKE',  'MANAGER',   7839,
        TO_DATE('1981-05-01', 'YYYY-MM-DD'),  2850, NULL, 30);
INSERT INTO EMP VALUES
        (7782, 'CLARK',  'MANAGER',   7839,
        TO_DATE('1981-06-09', 'YYYY-MM-DD'),  2450, NULL, 10);
INSERT INTO EMP VALUES
        (7788, 'SCOTT',  'ANALYST',   7566,
        TO_DATE('1982-12-09', 'YYYY-MM-DD'), 3000, NULL, 20);
INSERT INTO EMP VALUES
        (7839, 'KING',   'PRESIDENT', NULL,
        TO_DATE('1981-11-17', 'YYYY-MM-DD'), 5000, NULL, 10);
INSERT INTO EMP VALUES
        (7844, 'TURNER', 'SALESMAN',  7698,
        TO_DATE('1981-09-08', 'YYYY-MM-DD'),  1500,    0, 30);
INSERT INTO EMP VALUES
        (7876, 'ADAMS',  'CLERK',     7788,
        TO_DATE('1983-01-12', 'YYYY-MM-DD'), 1100, NULL, 20);
INSERT INTO EMP VALUES
        (7900, 'JAMES',  'CLERK',     7698,
        TO_DATE('1981-12-03', 'YYYY-MM-DD'),   950, NULL, 30);
INSERT INTO EMP VALUES
        (7902, 'FORD',   'ANALYST',   7566,
        TO_DATE('1981-12-03', 'YYYY-MM-DD'),  3000, NULL, 20);
INSERT INTO EMP VALUES
        (7934, 'MILLER', 'CLERK',     7782,
        TO_DATE('1982-01-23', 'YYYY-MM-DD'), 1300, NULL, 10);


-- DEPT 테이블 생성하기
CREATE TABLE DEPT(
          DEPTNO NUMBER(2) primary key,
          DNAME VARCHAR2(14),
          LOC VARCHAR2(13) 
 );

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES',      'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');



-- member 테이블 생성하기
CREATE TABLE MEMBER(
  NUM NUMBER(11) DEFAULT '1' NOT NULL,
  USERID VARCHAR2(15) NOT NULL,
  NAME VARCHAR2(15) NOT NULL,
  PASSWD VARCHAR(8) NOT NULL,
  AGE NUMBER(3) DEFAULT '1' NOT NULL,
  MILEAGE NUMBER(8) DEFAULT '0' NOT NULL,
  JOB VARCHAR(30),
  ADDR VARCHAR2(100) NOT NULL,
  REG_DATE DATE NOT NULL,
  PRIMARY KEY(NUM)
);

-- 고객 정보 저장 */
insert into member 
            values ('1','id1','홍길동','1234',25,0,'학생','부산시 동래구','2013-08-08');
insert into member
            values ('2','id2','김길동','2345',30,1500,'직장인','서울시 강남구','2013-09-05');
insert into member 
            values ('3','id3','공성현','3456',33,10000,'직장인','부산시','2013-09-09');
insert into member
            values ('4','id4','김영희','4321',18,3000,'학생','경상남도 마산시','2012-01-01');
insert into member
            values ('5','id5','박말자','5555',45,5000,'주부','경기도 남양주시','2013-05-05');
insert into member
            values ('6','id6','김철수','1234',55,0,'교수','제주도 북제주','2013-08-08');
insert into member 
            values ('7','id7','홍길동','1234',41,6000,'학생','경주시','2012-12-25');

insert into member 
            values ('8','id8','김상현','1234',31,0,'무직','부산시 동래구','2013-04-18');
insert into member
            values ('9','id9','이지연','1234',25,0,'학생','강원도 철원','2013-02-06');
insert into member
            values ('10','id10','홍길동','6712',62,10000,'주부','서울시 강북','2013-09-15');


-- 카테고리 저장테이블 */
CREATE TABLE CATEGORY(
  CNUM NUMBER(5) DEFAULT '1' NOT NULL,
  CATEGORY_CODE VARCHAR2(8) NOT NULL,
  CATEGORY_NAME VARCHAR2(30) NOT NULL,
  DELETE_CHK CHAR(1) DEFAULT 'N' NOT NULL,
  PRIMARY KEY(CNUM)
);

-- 카테고리 SEQUENCE */
CREATE SEQUENCE CATEGORY_SEQ
  START WITH 1
  INCREMENT BY 1 ;

-- 카테고리 저장 */
INSERT INTO CATEGORY VALUES('1','00010000','전자제품','N');
INSERT INTO CATEGORY VALUES('2','00010001','TV','N');
INSERT INTO CATEGORY VALUES('3','00010002','컴퓨터','N');
INSERT INTO CATEGORY VALUES('4','00010003','MP3','N');
INSERT INTO CATEGORY VALUES('5','00010004','에어컨','N');
INSERT INTO CATEGORY VALUES('6','00020000','의류','N');
INSERT INTO CATEGORY VALUES('7','00020001','남방','N');
INSERT INTO CATEGORY VALUES('8','00020002','속옷','N');
INSERT INTO CATEGORY VALUES('9','00020003','바지','N');
INSERT INTO CATEGORY VALUES('10','00030000','도서','N');
INSERT INTO CATEGORY VALUES('11','00030001','컴퓨터도서','N');
INSERT INTO CATEGORY VALUES('12','00030002','소설','N');


-- 상품 상세 정보 테이블 */
CREATE TABLE PRODUCTS(
 PNUM NUMBER(11),                                   -- 제품번호
 CATEGORY_FK VARCHAR(8) NOT NULL,                   -- 카테고리
 PRODUCTS_NAME VARCHAR(50) NOT NULL,                -- 제품명
 EP_CODE_FK VARCHAR(5) NOT NULL,                    -- 제품코드
 INPUT_PRICE NUMBER(10) DEFAULT '0' NOT NULL,       -- 입고가
 OUTPUT_PRICE NUMBER(10) DEFAULT '0' NOT NULL,      -- 출고가
 TRANS_COST NUMBER(5) DEFAULT '0' NOT NULL,         -- 배송비
 MILEAGE NUMBER(6) DEFAULT '0' NOT NULL,            -- 마일리지
 COMPANY VARCHAR(30),                               -- 제조사
 STATUS CHAR(1) DEFAULT '1' NOT NULL,               -- 재고상태
 PRIMARY KEY(PNUM)
);
-- 상품 테이블 SEQUENCE 
CREATE SEQUENCE PRODUCTS_SEQ
  START WITH 1
  INCREMENT BY 1 ;
-- 상품 내용 저장 
INSERT INTO PRODUCTS
   VALUES(PRODUCTS_SEQ.NEXTVAL,'00010001','S벽걸이 TV','00001','5000000','8000000','0','100000','삼성','1');

INSERT INTO PRODUCTS
   VALUES(PRODUCTS_SEQ.NEXTVAL,'00010001','D TV','00002','300000','400000','0','50000','대우','1');

INSERT INTO PRODUCTS
   VALUES(PRODUCTS_SEQ.NEXTVAL,'00010004','S에어컨','00001','1000000','1100000','5000','10000','삼성','2');

INSERT INTO PRODUCTS
   VALUES(PRODUCTS_SEQ.NEXTVAL,'00010000','C밥솥','00003','200000','200000','5500','0','현대','1');

INSERT INTO PRODUCTS
   VALUES(PRODUCTS_SEQ.NEXTVAL,'00010004','L에어컨','00003','1200000','1300000','0','0','LG','1');

INSERT INTO PRODUCTS
   VALUES(PRODUCTS_SEQ.NEXTVAL,'00020001','남성남방','00002','100000','150000','2500','0','','1');

INSERT INTO PRODUCTS
   VALUES(PRODUCTS_SEQ.NEXTVAL,'00020001','여성남방','00002','120000','200000','0','0','','3');

INSERT INTO PRODUCTS
   VALUES(PRODUCTS_SEQ.NEXTVAL,'00020002','사각팬티','00002','10000','20000','0','0','보디가드','1');

INSERT INTO PRODUCTS
   VALUES(PRODUCTS_SEQ.NEXTVAL,'00020003','멜빵바지','00002','5000','8000','0','0','','1');

INSERT INTO PRODUCTS
   VALUES(PRODUCTS_SEQ.NEXTVAL,'00030001','무따기시리즈','00001','25000','30000','2000','0','길벗','1');
 
 SELECT * from member;
 
 -- [문제1] member 테이블에서 회원의 이름과 나이, 직업을 화면에 보여주세요.
 SELECT memname, age, job from member;
 
 
 select * from products;
 -- [문제2] products 테이블에서 제품명, 입고가, 출고가, 제조사를 화면에 보여주세요.
 SELECT products_name, input_price, output_price, company from products;
 
 -- literal 문자열
 -- 컬럼명이나 별칭이 아닌 select 목록에 포함되는 문자, 표현식 숫자를 의미.
 -- 날짜와 문자열의 경우 단일 인용분호('')를 사용해야 한다.
 
 -- [문제] emp 테이블에서 이름과 연봉을 "KING의 1년 연봉은 60000입니다."라고 출력.
select ename || '의 1년 연봉은 ' || sal*12 || '입니다.' "사원의 연봉" from emp;

-- where절(조건절)
-- 모든 자료를 가져오는 것이 아니라 사용자가 원하는 자료만
-- 조회하고자 한다면 where절을 사용한다.
-- where 절은 조건절을 포함하여 from 절 다음에 기술을 해야 한다.
--  형식) select 컬럼1, 컬럼2,... from 테이블이름 where 조건식;

-- where 조건절에서 자료를 검색할 때 사용되는 연산자
  1) =    : 조건이 같은가?  where name = '홍길동';
  2) <    : 조건이 작은가?  where age < 30;
  3) <=   : 조건이 작거나 같은가?
  4) >    : 조건이 큰가?
  5) >=   : 조건이 크거나 같은가?
  6) !=   : 조건이 같지 않은가?
  7) <>   : 조건이 같지 않은가? (!=과 같은 의미,어디에도 속하지 않음)
            where name <> '홍길동';
  8) BETWEEN A and B : A와 B사이에 있는가?
            ※ 주의) 작은 값을 앞에 기술하고 큰 값을 뒤에 기술
  9) IN(list) : list 값 중에 어느 하나와 일치하는가?
 10) NOT BTWEEN A and B :  A와 B 사이에 있지 않다.(A,B 값 포함하지 않음)
 11) NOT IN(list) : list의 값과 전체와 일치하지 않는가?

-- emp 테이블에서 담당업무(job)이 MANAGER
select * from emp where job = 'MANAGER';
select * from emp where job = 'SALESMAN';
select * from emp;

-- [문제1] emp 테이블에서 담당업수가 'CLERK'인 
--        사원의 사번, 이름, 담당업무, 급여를 화면에 출력
select empno, ename, job, sal from emp where job = 'CLERK';

-- [문제2] emp 테이블에서 1982년 1월 1일 이후에 입사한
--        사원의 사번, 이름, 담당업무, 급여, 입사일자를 화면에 보여주세요.
select empno, ename, job, sal, hiredate from emp where hiredate > '82/01/01';

-- [문제3] emp 테이블에서 급여가 1300 ~  1500 사이인
--        사원의 이름, 담당업무, 급여, 부서번호를 화면에 보여주세요.
select ename, job, sal, deptno from emp where sal BETWEEN 1300 and 1500;

-- [문제4] emp 테이블에서 사번이 7902, 7788, 7566인 
--        사원의 사번, 이름, 담당업무를 화면에 보여주세요.
select empno, ename, job from emp where empno in (7902,7788,7566);

-- [문제5] emp 테이블에서 보너스가 300이거나, 500이거나, 1400인
--        사원의 모든 정보를 화면에 보여주세요.
select * from emp where comm in(300,500,1400);

-- [문제6] memeber 테이블에서 이름이 홍길동이면서 직업이 학생인 회원의 모든 정보 화면 출력
select * from member where memname = '홍길동' and job = '학생';

-- [문제7] products 테이블에서 제조사가 '삼성' 또는 '현대'이면서
--        판매가가 100만원 미만의 상품을 화면에 보여주세요.
select products_name from products where company in('삼성','현대') and output_price < 1000000;
select * from products;

-- [문제8] emp 테이블에서 급여가 1100 이상이고, 담당업무가 MANAGER인
--        사원의 사번, 이름, 담당업무, 급여를 화면에 보여주세요.
select empno, ename, job, sal from emp where sal >= 1100 and job = 'MANAGER';

-- like 연산자 : 검색
-- 검색 문자열 값에 대한 와일드 카드 검색을 위해 사용
-- where ename like '%S%' ==> ename 컬럼에 S자를 포함하는 사원의 이름 검색
-- where ename like 'S%'  ==> ename 컬럼의 첫글자가 S자로 시작하는 사원의 이름을 검색
-- where ename like '%S'  ==> ename 컬럼의 마지막 글자가 S자로 끝나는 사원의 이름 검색
-- where ename like '_S%' ==> ename 컬럼의 두번째 글자가 S자인 사원의 이름 검색

-- emp 테이블에서 사원의 이름에 'S'자가 들어가는
-- 사원의 이름과 담당업무를 화면에 보여주세요.
select ename, job 
from emp 
where ename like '%S%';

-- [문제1] emp테이블에서 이름이 'S'자로 끝나는
--        사원의 이름과 담당업무, 부서번호를 화면에 보여주세요.
SELECT ename, job, deptno
FROM emp
where ename like '%S';

-- [문제2] emp 테이블에서 이름의 세번째에 'R'이 들어가는
--        사원의 이름과 담당업무, 급여를 화면에 보여주세요.
select ename, job, sal
from emp
where ename like '__R%';

-- [문제3] emp 테이블에서 이름의 두번째에 'O'가 들어가는
--        사원의 모든 정보를 화면에 보여주세요.
select *
from emp
where ename like '_O%';

-- [문제4] emp 테이블에서 입사년도가 82년도인 사원의
--        사번, 이름, 입사일자를 화면에 보여주세요.
select empno, ename, hiredate
from emp
where hiredate like '82%';

-- [문제5] member 테이블에서 성이 김씨인 
--        회원의 모든정보를 화면에 보여주세요.
select *
from member
where memname like '김%';

-- [문제6] member 테이블에서 주소에 '서울시'가 포함된
--        회원의 이름과 주소, 직업을 화면에 보여주세요.
select memname, addr, job
from member
where addr like '서울시%';
-- 응용소프트웨어 기초기술 활용

-- order by절
-- 자료를 정렬하여 나타낼 때 필요한 구문.
-- order by절을 사용할 때는 select 구문의 맨 마지막에 위치
--  (결과가 나온 뒤 정렬하기 때문!)
-- asc  : 오름차순
-- desc : 내림차순
-- 기본적으로 order by절을 사용할 시에는 default가 asc(오름차순)이다.
-- (이 경우에는 asc 생략 가능)
-- null 값은 오름차순에서 제일 나중에 나오고, 내림차순에서는 제일 먼저 나옴.

-- member 테이블에서 정렬 시 이름을 기준으로 오름차순으로 정렬하여 화면에 보여주세요.
-- 단, 이름이 같은 경우 나이를 내림차순으로 정렬하여 화면에 보여주세요.
select *
from member
order by memname, age desc;

-- [문제1] emp 테이블에서 부서번호로 오름차순 정렬을 하고,
--        부서번호가 같은 경우 급여를 기준으로 내림차순으로 정렬하여 화면 출력.
select *
from emp
order by dept, sal desc;

-- [문제2] products 테이블에서 판매가격이 높은데서 낮은 순으로 정렬하여,
--        모든 정보를 화면에 보여주세요.
select *
from products
order by output_price desc;

-- [문제3] products 테이블에서 배송비를 내림차순으로 정렬하시오.
--        단, 배송비가 같은 경우 마일리지를 기준으로 내림차순으로 정렬하여
--        모든 정보를 화면에 보여주세요.
select *
from products
order by trans_cost desc, mileage desc;

-- [문제4] emp 테이블에서 입사 일자가 오래된 사원부터
--        최근에 입사한 사원을 기준으로 정렬하되,
--        사원명, 입사일자를 화면에 보여주세요.
select ename, hiredate
from emp
order by hiredate;

-- [문제5] emp 테이블에서 급여를 기준으로 내림차순으로 정렬하여
--        모든 정보를 화면에 보여주세요.
select *
from emp
order by sal desc;

-- [문제6] emp 테이블에서 급여가 1100 이상인 사원들의 모든 정보를 
--        보여주되, 입사일이 빠른 순으로 모든 정보를 화면에 보여주세요.
select *
from emp
where sal >= 1100
order by hiredate;

-- [문제7] emp 테이블에서 부서번호를 기준으로 오름차순으로 정렬하여 나타내고,
--        부서번호가 같은 경우 담당업무를 오름차순으로 정렬하세요.
--        만약 담당업무가 같다고 하면, 급여가 많은데서 적은 순으로 정렬하여 
--        모든 정보를 화면에 보여주세요.
select *
from emp
order by deptno, job, sal desc;
