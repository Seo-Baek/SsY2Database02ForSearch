-- emp ���̺��� ���,�̸�,�޿�,���ʽ�, �޿�+���ʽ��� ȭ�鿡 �����ּ���.
select empno, ename, sal, comm, sal+comm from emp; 

-- null ���� ���� �÷��� �ٸ� �÷��� ������ �ϰ� �Ǹ� �������� null������ ó���ȴ�.

-- nvl() �Լ� : null ���� Ư�� ������ �����ϴ� �Լ�.
--             ��� ������ Ÿ�Կ� ������ �����ϴ�.
--             nvl() �Լ��� ����� ���� ��ȯ�Ǵ� ���� �ڷ����� ��ġ���Ѿ� �Ѵ�.
-- ����) nvl(null ���� ����ִ� �÷���, ������ ��)
-- ���� table���� ����Ǵ� ���� �ƴϳ� ������ ��������
select empno, ename, sal, comm, sal+nvl(comm,0) from emp; 

-- nvl2() �Լ� : �ڹٿ��� ���׿����ڿ� ����� �Լ�.
-- ����) nvl2(expr, expr1, expr2)
--  -> expr�� ���� null�� �ƴ� ��쿡�� expr1 ���� ��ȯ�ϰ�,
--     expr�� ���� null�� ��� expr2 ���� ��ȯ�Ѵ�.

select * from emp;
-- emp ���̺��� ������(MGR)�� �ִ� ��� 1, ���� ��� 0�� ��ȯ
select empno, ename, nvl2(mgr, 1, 0) from emp;

-- as Ű���� : �÷� ���� �̸��� �����ϴ� Ű����, �÷� �ٷ� �ڿ� ���.
--            �÷� ��� ��Ī ���̿� asŰ���带 �ֱ⵵ ��.
select empno, ename, sal, comm, sal+nvl(comm,0) as "�޿�+���ʽ�" from emp; 
-- ���� ��Ī�� ""�ȿ� �ۼ�, Ȭ����ǥ �ƴ�!
select empno, ename, sal, comm, sal+nvl(comm,0) "�޿�+���ʽ�" from emp; 
-- ��ĭ�� ����൵ asŰ����� �����ϰ� �νĵ�.

--[����1] emp ���̺��� ���, �����, �޿�, �޿��� 10% �λ���� ȭ�鿡 �����ּ���.
select empno, ename, sal, sal*1.1 "asce sal" from emp;

--[����2] emp ���̺��� �� ����� �������� ȭ�鿡 �����ּ���.
select job from emp;

-- distict Ű���� : �ߺ��� �����ϴ� Ű����.
--                 �ַ� �ϳ��� �÷����� �ߺ��� ���� �����ϰ� ������ �� ���.
--                 distinct Ű����� �׻� select Ű���� ������ ����Ѵ�.
--                 distinct Ű���� �ڿ� ������ �÷����� ��� distinct Ű������ ������ �޴´�.
--                 distinct �ڿ� ���� ���� �÷����� ����� �Ǹ� �ش� �÷�����
--                 �ߺ� ���� ���� ���·� ��Ÿ����.
SELECT DISTINCT job from emp;

-- emp ���̺��� �������� �μ���ȣ�� �ߺ��� ����
SELECT DISTINCT job, deptno from emp;

-- member��� ���̺��� ������
CREATE TABLE member(
 num number(7) primary key,     -- ȸ����ȣ
 memid VARCHAR2(20) not null,   -- ȸ�� id
 memname VARCHAR2(20) not null, -- ȸ�� �̸�
 pwd VARCHAR2(20) not null,     -- ȸ�� pwd
 age NUMBER(3),                 -- ȸ�� ����
 mileage NUMBER(8) not null,    -- ȸ�� ���ϸ���
 job VARCHAR2(30),              -- ȸ�� ����
 addr VARCHAR2(100),            -- ȸ�� �ּ�
 regdate DATE not null          -- ȸ�� ������
 );                

-- member ���̺� �� ������ ������ ����.
INSERT INTO member VALUES (1, 'id1', 'ȫ�浿', '1111', 25, 0, '�л�', '�λ�� ������', '2013-08-08');
INSERT INTO member VALUES (2, 'id2', '��浿', '2222', 30, 1500, '������', '����� ������', '2013-09-05');
INSERT INTO member VALUES (3, 'id3', '������', '3333', 33, 10000, '������', '�λ�� �߱�', '2013-09-09');
INSERT INTO member VALUES (4, 'id4', '�迵��', '4444', 18, 3000, '�л�', '��󳲵� �����', '2012-01-01');
INSERT INTO member VALUES (5, 'id5', '�ڸ���', '5555', 45, 5000, '�ֺ�', '��⵵ �����ֽ�', '2013-05-05');
INSERT INTO member VALUES (6, 'id6', '��ö��', '6666', 55, 0, '����', '���ֵ� ��������', '2013-08-08'); 
INSERT INTO member VALUES (7, 'id7', 'ȫ�浿', '7777', 41, 6000, '�л�', '���ϵ� ���ֽ�', '2012-12-25');
INSERT INTO member VALUES (8, 'id8', '�����', '8888', 31, 0, '����', '����� ������', '2013-04-18');
INSERT INTO member VALUES (9, 'id9', '������', '9999', 25, 0, '�л�', '������ ������', '2013-02-06');
INSERT INTO member VALUES (10, 'id10', 'ȫ�浿', '0000', 52, 10000, '�ֺ�', '����� ���ϱ�', '2013-09-15');
 
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


-- DEPT ���̺� �����ϱ�
CREATE TABLE DEPT(
          DEPTNO NUMBER(2) primary key,
          DNAME VARCHAR2(14),
          LOC VARCHAR2(13) 
 );

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES',      'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');



-- member ���̺� �����ϱ�
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

-- �� ���� ���� */
insert into member 
            values ('1','id1','ȫ�浿','1234',25,0,'�л�','�λ�� ������','2013-08-08');
insert into member
            values ('2','id2','��浿','2345',30,1500,'������','����� ������','2013-09-05');
insert into member 
            values ('3','id3','������','3456',33,10000,'������','�λ��','2013-09-09');
insert into member
            values ('4','id4','�迵��','4321',18,3000,'�л�','��󳲵� �����','2012-01-01');
insert into member
            values ('5','id5','�ڸ���','5555',45,5000,'�ֺ�','��⵵ �����ֽ�','2013-05-05');
insert into member
            values ('6','id6','��ö��','1234',55,0,'����','���ֵ� ������','2013-08-08');
insert into member 
            values ('7','id7','ȫ�浿','1234',41,6000,'�л�','���ֽ�','2012-12-25');

insert into member 
            values ('8','id8','�����','1234',31,0,'����','�λ�� ������','2013-04-18');
insert into member
            values ('9','id9','������','1234',25,0,'�л�','������ ö��','2013-02-06');
insert into member
            values ('10','id10','ȫ�浿','6712',62,10000,'�ֺ�','����� ����','2013-09-15');


-- ī�װ� �������̺� */
CREATE TABLE CATEGORY(
  CNUM NUMBER(5) DEFAULT '1' NOT NULL,
  CATEGORY_CODE VARCHAR2(8) NOT NULL,
  CATEGORY_NAME VARCHAR2(30) NOT NULL,
  DELETE_CHK CHAR(1) DEFAULT 'N' NOT NULL,
  PRIMARY KEY(CNUM)
);

-- ī�װ� SEQUENCE */
CREATE SEQUENCE CATEGORY_SEQ
  START WITH 1
  INCREMENT BY 1 ;

-- ī�װ� ���� */
INSERT INTO CATEGORY VALUES('1','00010000','������ǰ','N');
INSERT INTO CATEGORY VALUES('2','00010001','TV','N');
INSERT INTO CATEGORY VALUES('3','00010002','��ǻ��','N');
INSERT INTO CATEGORY VALUES('4','00010003','MP3','N');
INSERT INTO CATEGORY VALUES('5','00010004','������','N');
INSERT INTO CATEGORY VALUES('6','00020000','�Ƿ�','N');
INSERT INTO CATEGORY VALUES('7','00020001','����','N');
INSERT INTO CATEGORY VALUES('8','00020002','�ӿ�','N');
INSERT INTO CATEGORY VALUES('9','00020003','����','N');
INSERT INTO CATEGORY VALUES('10','00030000','����','N');
INSERT INTO CATEGORY VALUES('11','00030001','��ǻ�͵���','N');
INSERT INTO CATEGORY VALUES('12','00030002','�Ҽ�','N');


-- ��ǰ �� ���� ���̺� */
CREATE TABLE PRODUCTS(
 PNUM NUMBER(11),                                   -- ��ǰ��ȣ
 CATEGORY_FK VARCHAR(8) NOT NULL,                   -- ī�װ�
 PRODUCTS_NAME VARCHAR(50) NOT NULL,                -- ��ǰ��
 EP_CODE_FK VARCHAR(5) NOT NULL,                    -- ��ǰ�ڵ�
 INPUT_PRICE NUMBER(10) DEFAULT '0' NOT NULL,       -- �԰�
 OUTPUT_PRICE NUMBER(10) DEFAULT '0' NOT NULL,      -- ���
 TRANS_COST NUMBER(5) DEFAULT '0' NOT NULL,         -- ��ۺ�
 MILEAGE NUMBER(6) DEFAULT '0' NOT NULL,            -- ���ϸ���
 COMPANY VARCHAR(30),                               -- ������
 STATUS CHAR(1) DEFAULT '1' NOT NULL,               -- ������
 PRIMARY KEY(PNUM)
);
-- ��ǰ ���̺� SEQUENCE 
CREATE SEQUENCE PRODUCTS_SEQ
  START WITH 1
  INCREMENT BY 1 ;
-- ��ǰ ���� ���� 
INSERT INTO PRODUCTS
   VALUES(PRODUCTS_SEQ.NEXTVAL,'00010001','S������ TV','00001','5000000','8000000','0','100000','�Ｚ','1');

INSERT INTO PRODUCTS
   VALUES(PRODUCTS_SEQ.NEXTVAL,'00010001','D TV','00002','300000','400000','0','50000','���','1');

INSERT INTO PRODUCTS
   VALUES(PRODUCTS_SEQ.NEXTVAL,'00010004','S������','00001','1000000','1100000','5000','10000','�Ｚ','2');

INSERT INTO PRODUCTS
   VALUES(PRODUCTS_SEQ.NEXTVAL,'00010000','C���','00003','200000','200000','5500','0','����','1');

INSERT INTO PRODUCTS
   VALUES(PRODUCTS_SEQ.NEXTVAL,'00010004','L������','00003','1200000','1300000','0','0','LG','1');

INSERT INTO PRODUCTS
   VALUES(PRODUCTS_SEQ.NEXTVAL,'00020001','��������','00002','100000','150000','2500','0','','1');

INSERT INTO PRODUCTS
   VALUES(PRODUCTS_SEQ.NEXTVAL,'00020001','��������','00002','120000','200000','0','0','','3');

INSERT INTO PRODUCTS
   VALUES(PRODUCTS_SEQ.NEXTVAL,'00020002','�簢��Ƽ','00002','10000','20000','0','0','���𰡵�','1');

INSERT INTO PRODUCTS
   VALUES(PRODUCTS_SEQ.NEXTVAL,'00020003','�ủ����','00002','5000','8000','0','0','','1');

INSERT INTO PRODUCTS
   VALUES(PRODUCTS_SEQ.NEXTVAL,'00030001','������ø���','00001','25000','30000','2000','0','���','1');
 
 SELECT * from member;
 
 -- [����1] member ���̺��� ȸ���� �̸��� ����, ������ ȭ�鿡 �����ּ���.
 SELECT memname, age, job from member;
 
 
 select * from products;
 -- [����2] products ���̺��� ��ǰ��, �԰�, ���, �����縦 ȭ�鿡 �����ּ���.
 SELECT products_name, input_price, output_price, company from products;
 
 -- literal ���ڿ�
 -- �÷����̳� ��Ī�� �ƴ� select ��Ͽ� ���ԵǴ� ����, ǥ���� ���ڸ� �ǹ�.
 -- ��¥�� ���ڿ��� ��� ���� �ο��ȣ('')�� ����ؾ� �Ѵ�.
 
 -- [����] emp ���̺��� �̸��� ������ "KING�� 1�� ������ 60000�Դϴ�."��� ���.
select ename || '�� 1�� ������ ' || sal*12 || '�Դϴ�.' "����� ����" from emp;

-- where��(������)
-- ��� �ڷḦ �������� ���� �ƴ϶� ����ڰ� ���ϴ� �ڷḸ
-- ��ȸ�ϰ��� �Ѵٸ� where���� ����Ѵ�.
-- where ���� �������� �����Ͽ� from �� ������ ����� �ؾ� �Ѵ�.
--  ����) select �÷�1, �÷�2,... from ���̺��̸� where ���ǽ�;

-- where ���������� �ڷḦ �˻��� �� ���Ǵ� ������
  1) =    : ������ ������?  where name = 'ȫ�浿';
  2) <    : ������ ������?  where age < 30;
  3) <=   : ������ �۰ų� ������?
  4) >    : ������ ū��?
  5) >=   : ������ ũ�ų� ������?
  6) !=   : ������ ���� ������?
  7) <>   : ������ ���� ������? (!=�� ���� �ǹ�,��𿡵� ������ ����)
            where name <> 'ȫ�浿';
  8) BETWEEN A and B : A�� B���̿� �ִ°�?
            �� ����) ���� ���� �տ� ����ϰ� ū ���� �ڿ� ���
  9) IN(list) : list �� �߿� ��� �ϳ��� ��ġ�ϴ°�?
 10) NOT BTWEEN A and B :  A�� B ���̿� ���� �ʴ�.(A,B �� �������� ����)
 11) NOT IN(list) : list�� ���� ��ü�� ��ġ���� �ʴ°�?

-- emp ���̺��� ������(job)�� MANAGER
select * from emp where job = 'MANAGER';
select * from emp where job = 'SALESMAN';
select * from emp;

-- [����1] emp ���̺��� �������� 'CLERK'�� 
--        ����� ���, �̸�, ������, �޿��� ȭ�鿡 ���
select empno, ename, job, sal from emp where job = 'CLERK';

-- [����2] emp ���̺��� 1982�� 1�� 1�� ���Ŀ� �Ի���
--        ����� ���, �̸�, ������, �޿�, �Ի����ڸ� ȭ�鿡 �����ּ���.
select empno, ename, job, sal, hiredate from emp where hiredate > '82/01/01';

-- [����3] emp ���̺��� �޿��� 1300 ~  1500 ������
--        ����� �̸�, ������, �޿�, �μ���ȣ�� ȭ�鿡 �����ּ���.
select ename, job, sal, deptno from emp where sal BETWEEN 1300 and 1500;

-- [����4] emp ���̺��� ����� 7902, 7788, 7566�� 
--        ����� ���, �̸�, �������� ȭ�鿡 �����ּ���.
select empno, ename, job from emp where empno in (7902,7788,7566);

-- [����5] emp ���̺��� ���ʽ��� 300�̰ų�, 500�̰ų�, 1400��
--        ����� ��� ������ ȭ�鿡 �����ּ���.
select * from emp where comm in(300,500,1400);

-- [����6] memeber ���̺��� �̸��� ȫ�浿�̸鼭 ������ �л��� ȸ���� ��� ���� ȭ�� ���
select * from member where memname = 'ȫ�浿' and job = '�л�';

-- [����7] products ���̺��� �����簡 '�Ｚ' �Ǵ� '����'�̸鼭
--        �ǸŰ��� 100���� �̸��� ��ǰ�� ȭ�鿡 �����ּ���.
select products_name from products where company in('�Ｚ','����') and output_price < 1000000;
select * from products;

-- [����8] emp ���̺��� �޿��� 1100 �̻��̰�, �������� MANAGER��
--        ����� ���, �̸�, ������, �޿��� ȭ�鿡 �����ּ���.
select empno, ename, job, sal from emp where sal >= 1100 and job = 'MANAGER';

-- like ������ : �˻�
-- �˻� ���ڿ� ���� ���� ���ϵ� ī�� �˻��� ���� ���
-- where ename like '%S%' ==> ename �÷��� S�ڸ� �����ϴ� ����� �̸� �˻�
-- where ename like 'S%'  ==> ename �÷��� ù���ڰ� S�ڷ� �����ϴ� ����� �̸��� �˻�
-- where ename like '%S'  ==> ename �÷��� ������ ���ڰ� S�ڷ� ������ ����� �̸� �˻�
-- where ename like '_S%' ==> ename �÷��� �ι�° ���ڰ� S���� ����� �̸� �˻�

-- emp ���̺��� ����� �̸��� 'S'�ڰ� ����
-- ����� �̸��� �������� ȭ�鿡 �����ּ���.
select ename, job 
from emp 
where ename like '%S%';

-- [����1] emp���̺��� �̸��� 'S'�ڷ� ������
--        ����� �̸��� ������, �μ���ȣ�� ȭ�鿡 �����ּ���.
SELECT ename, job, deptno
FROM emp
where ename like '%S';

-- [����2] emp ���̺��� �̸��� ����°�� 'R'�� ����
--        ����� �̸��� ������, �޿��� ȭ�鿡 �����ּ���.
select ename, job, sal
from emp
where ename like '__R%';

-- [����3] emp ���̺��� �̸��� �ι�°�� 'O'�� ����
--        ����� ��� ������ ȭ�鿡 �����ּ���.
select *
from emp
where ename like '_O%';

-- [����4] emp ���̺��� �Ի�⵵�� 82�⵵�� �����
--        ���, �̸�, �Ի����ڸ� ȭ�鿡 �����ּ���.
select empno, ename, hiredate
from emp
where hiredate like '82%';

-- [����5] member ���̺��� ���� �达�� 
--        ȸ���� ��������� ȭ�鿡 �����ּ���.
select *
from member
where memname like '��%';

-- [����6] member ���̺��� �ּҿ� '�����'�� ���Ե�
--        ȸ���� �̸��� �ּ�, ������ ȭ�鿡 �����ּ���.
select memname, addr, job
from member
where addr like '�����%';
-- �������Ʈ���� ���ʱ�� Ȱ��

-- order by��
-- �ڷḦ �����Ͽ� ��Ÿ�� �� �ʿ��� ����.
-- order by���� ����� ���� select ������ �� �������� ��ġ
--  (����� ���� �� �����ϱ� ����!)
-- asc  : ��������
-- desc : ��������
-- �⺻������ order by���� ����� �ÿ��� default�� asc(��������)�̴�.
-- (�� ��쿡�� asc ���� ����)
-- null ���� ������������ ���� ���߿� ������, �������������� ���� ���� ����.

-- member ���̺��� ���� �� �̸��� �������� ������������ �����Ͽ� ȭ�鿡 �����ּ���.
-- ��, �̸��� ���� ��� ���̸� ������������ �����Ͽ� ȭ�鿡 �����ּ���.
select *
from member
order by memname, age desc;

-- [����1] emp ���̺��� �μ���ȣ�� �������� ������ �ϰ�,
--        �μ���ȣ�� ���� ��� �޿��� �������� ������������ �����Ͽ� ȭ�� ���.
select *
from emp
order by dept, sal desc;

-- [����2] products ���̺��� �ǸŰ����� �������� ���� ������ �����Ͽ�,
--        ��� ������ ȭ�鿡 �����ּ���.
select *
from products
order by output_price desc;

-- [����3] products ���̺��� ��ۺ� ������������ �����Ͻÿ�.
--        ��, ��ۺ� ���� ��� ���ϸ����� �������� ������������ �����Ͽ�
--        ��� ������ ȭ�鿡 �����ּ���.
select *
from products
order by trans_cost desc, mileage desc;

-- [����4] emp ���̺��� �Ի� ���ڰ� ������ �������
--        �ֱٿ� �Ի��� ����� �������� �����ϵ�,
--        �����, �Ի����ڸ� ȭ�鿡 �����ּ���.
select ename, hiredate
from emp
order by hiredate;

-- [����5] emp ���̺��� �޿��� �������� ������������ �����Ͽ�
--        ��� ������ ȭ�鿡 �����ּ���.
select *
from emp
order by sal desc;

-- [����6] emp ���̺��� �޿��� 1100 �̻��� ������� ��� ������ 
--        �����ֵ�, �Ի����� ���� ������ ��� ������ ȭ�鿡 �����ּ���.
select *
from emp
where sal >= 1100
order by hiredate;

-- [����7] emp ���̺��� �μ���ȣ�� �������� ������������ �����Ͽ� ��Ÿ����,
--        �μ���ȣ�� ���� ��� �������� ������������ �����ϼ���.
--        ���� �������� ���ٰ� �ϸ�, �޿��� �������� ���� ������ �����Ͽ� 
--        ��� ������ ȭ�鿡 �����ּ���.
select *
from emp
order by deptno, job, sal desc;
