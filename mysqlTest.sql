--数据库基础使用练习


--1、	查询当前访问数据库的用户信息
show processlist;

--2、	查询数据库服务器中的数据库列表
show databases;

--3、使用数据库scott
use scott;

--4、查看当前数据库名称
select database();

--5、查看数据库scott的创建语句
show create database scott;

--6、查询数据库scott中的表列表
show tables;

--7、查看数据库scott.emp表的创建语句
show create table emp;

--8、查看数据库scott.emp表的结构描述
desc emp;

--9、查看当前日期
select current_date();

--10、查看当前日期和时间
select current_timestamp();

--11、查看距离元旦还有多少天(data1-data2,因此可以为负数)
select datedrff('2018-6-28','2019-1-1');


--查询student表
--12、查询学生数量
select count(id) from student;

--13、查询班级学生各科的平均分
select avg(math) as '数学平均分',avg(chinese) as '语文平均分' from student;

--14、查询班级中语文成绩最高的学生的编号，姓名，和语文成绩
select id,name,max(chainese) from student;

--15、查询学生姓名，编号，和总分，并且按照总分降序排序
select id,name,math+chinese as total from student order by total desc; 

--16、查询姓李的学生的编号，姓名，总分，并且按照编号升序排序(默认升序)
select id,name,chinese+math as total from student where name like ‘李%’ order by id;


--scott数据库表相关查询操作
--17、查询和FORD同一部门的员工
select empno,ename from emp where deptno=(select deptno from emp where ename=’FORD’);
	
--18、查询高于自己部门平均工资的员工信息
select * from emp,(select dno,avg(sal) from emp group by deptno) tmp where sal>tmp.avg and emp.deptno=tmp.dno order by deptno;

--19、查询和FORD的部门和岗位完全相同的所有雇员，不含FORD本人
select * from emp,(select job,deptno from emp where ename='FORD') tmp where emp.job=tmp.job and emp.deptno=tmp.deptno and emp.ename!='FORD';
	
--20、查询和10号部门工作相同的雇员的名字，岗位，工资，部门号。但是不包含10部门的员工
select ename,emp.job,sal,deptno from emp ,(select job from emp where deptno=10 group by job) tmp where deptno!=10 and emp.job=tmp.job; 
21、
22、
23、
24、
25、


