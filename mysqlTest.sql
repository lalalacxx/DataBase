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
21��
22��
23��
24��
25��


