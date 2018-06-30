--���ݿ����ʹ����ϰ


--1��	��ѯ��ǰ�������ݿ���û���Ϣ
show processlist;

--2��	��ѯ���ݿ�������е����ݿ��б�
show databases;

--3��ʹ�����ݿ�scott
use scott;

--4���鿴��ǰ���ݿ�����
select database();

--5���鿴���ݿ�scott�Ĵ������
show create database scott;

--6����ѯ���ݿ�scott�еı��б�
show tables;

--7���鿴���ݿ�scott.emp��Ĵ������
show create table emp;

--8���鿴���ݿ�scott.emp��Ľṹ����
desc emp;

--9���鿴��ǰ����
select current_date();

--10���鿴��ǰ���ں�ʱ��
select current_timestamp();

--11���鿴����Ԫ�����ж�����(data1-data2,��˿���Ϊ����)
select datedrff('2018-6-28','2019-1-1');


--��ѯstudent��
--12����ѯѧ������
select count(id) from student;

--13����ѯ�༶ѧ�����Ƶ�ƽ����
select avg(math) as '��ѧƽ����',avg(chinese) as '����ƽ����' from student;

--14����ѯ�༶�����ĳɼ���ߵ�ѧ���ı�ţ������������ĳɼ�
select id,name,max(chainese) from student;

--15����ѯѧ����������ţ����ܷ֣����Ұ����ֽܷ�������
select id,name,math+chinese as total from student order by total desc; 

--16����ѯ�����ѧ���ı�ţ��������ܷ֣����Ұ��ձ����������(Ĭ������)
select id,name,chinese+math as total from student where name like ����%�� order by id;


--scott���ݿ����ز�ѯ����
--17����ѯ��FORDͬһ���ŵ�Ա��
select empno,ename from emp where deptno=(select deptno from emp where ename=��FORD��);
	
--18����ѯ�����Լ�����ƽ�����ʵ�Ա����Ϣ
select * from emp,(select dno,avg(sal) from emp group by deptno) tmp where sal>tmp.avg and emp.deptno=tmp.dno order by deptno;

--19����ѯ��FORD�Ĳ��ź͸�λ��ȫ��ͬ�����й�Ա������FORD����
select * from emp,(select job,deptno from emp where ename='FORD') tmp where emp.job=tmp.job and emp.deptno=tmp.deptno and emp.ename!='FORD';
	
--20����ѯ��10�Ų��Ź�����ͬ�Ĺ�Ա�����֣���λ�����ʣ����źš����ǲ�����10���ŵ�Ա��
select ename,emp.job,sal,deptno from emp ,(select job from emp where deptno=10 group by job) tmp where deptno!=10 and emp.job=tmp.job; 


--����1
--����һ��ѧ����
--��������ţ����������գ��Ա����䣬���Ϊ����
create table stu(
    id int primary key comment 'ѧ�����'��
    name varchar(16) not null comment 'ѧ������',
    birth date comment 'ѧ����������',
    gender char(6) default 'male' comment 'ѧ���Ա�',
    email varchar(30) unique comment 'ѧ������'
);

--21��Ϊѧ��������֤���մ洢·���ֶ�
alter table stu add image varchar(100) comment '֤����·��';

--22��Ϊѧ�������סַ�ֶΣ���û������Ĭ��Ϊ���ַ���
alter table stu add addr varchar(100) comment '��ͥסַ' default null;

--23��Ϊѧ�������2����¼
insert into stu values(1,'mia',1998-11-09,'Ů'��'10000@qq.com','d://image','aС��b¥'),(2,'tom',1999-08-21,'��','1234567@qq.com','d://image','aС��c¥');

--24������ѧ����Ϣ���е�����
update table stu set col_name=new_value [where ����...];

--25��ɾ��ָ��ѧ�����е�����
delete from stu [where ����];
--����ʹ��truncate
truncate table stu;--ɾ���������е��������ݣ���ṹ���ɴ���

--26��Ϊѧ�����е������ֶ����Ψһ��
alter table stu add unique(email);

--27��Ϊѧ�����е������ֶ�ɾ��Ψһ��
alter table stu drop index image;
--����
drop index image on stu;

--����2
--��scott���ݿ��д���һ��emp_backup����emp��Ľṹ���ݾ���ͬ
--���������
--��һ��
create table emp_backup like emp;
--�ڶ���
insert into emp_backup select * from emp;

--����3
--���emp_backup�е�����
delete from emp_backup;
--����ʹ��truncate
truncate table emp_backup;
