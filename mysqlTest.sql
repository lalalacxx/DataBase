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


--案例1
--创建一张学生表
--包含：编号，姓名，生日，性别，邮箱，编号为主键
create table stu(
    id int primary key comment '学生编号'，
    name varchar(16) not null comment '学生姓名',
    birth date comment '学生出生日期',
    gender char(6) default 'male' comment '学生性别',
    email varchar(30) unique comment '学生邮箱'
);

--21、为学生表增加证件照存储路径字段
alter table stu add image varchar(100) comment '证件照路径';

--22、为学生表添加住址字段，若没有设置默认为空字符串
alter table stu add addr varchar(100) comment '家庭住址' default null;

--23、为学生表插入2条记录
insert into stu values(1,'mia',1998-11-09,'女'，'10000@qq.com','d://image','a小区b楼'),(2,'tom',1999-08-21,'男','1234567@qq.com','d://image','a小区c楼');

--24、更新学生信息表中的数据
update table stu set col_name=new_value [where 条件...];

--25、删除指定学生表中的数据
delete from stu [where 条件];
--或者使用truncate
truncate table stu;--删除整个表中的所有数据，表结构依旧存在

--26、为学生表中的邮箱字段添加唯一键
alter table stu add unique(email);

--27、为学生表中的邮箱字段删除唯一键
alter table stu drop index image;
--或者
drop index image on stu;

--案例2
--在scott数据库中创建一张emp_backup表，和emp表的结构数据均相同
--分两步完成
--第一步
create table emp_backup like emp;
--第二步
insert into emp_backup select * from emp;

--案例3
--清空emp_backup中的数据
delete from emp_backup;
--或者使用truncate
truncate table emp_backup;
