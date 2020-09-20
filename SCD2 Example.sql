use sumedha;

show tables;

select*from member5;

select * from memberstaging6;

create table dummy_etl_scd2_1
select * from member5;

create table dummy_etl_scd2_2
select * from memberstaging6;

update member5 a
join memberstaging6 b
on a.Member_Id_M = Member_Id_MS
set a.ActiveFlag_M = 'N',
a.EndDateM = Curdate();

Select * from member5;
#Case when a.Name_M <> b.Name_MS then b.Name_MS end,

Delete from member5 where Name_M in('X','Y');

Insert into member5(Member_Id_M,Name_M,ActiveFlag_M,EndDateM,StartDateM)
select Member_Id_M, 
Case when a.Name_M <> b.Name_MS then b.Name_MS end, 
'Y',
Null,
Curdate()
from member5 a
join memberstaging6 b
on a.Member_Id_M = Member_Id_MS;

insert into member5(Member_Id_M,Name_M,ActiveFlag_M,EndDateM,StartDateM)
Select Member_Id_MS,Name_MS,'Y',Null,Curdate()
from memberstaging6 a
left join member5 b
on a.Member_Id_MS = b.Member_Id_M
where b.Member_Id_M is null;


#Member_Id_M, Name_M, ActiveFlag_M,EndDateM, StartDateM
