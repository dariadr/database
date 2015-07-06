create exception osh1 'отправление с таким временем уже прошло';
create exception osh2 'отправление с таким идентификатором не существует';
create exception osh3 'номер места превышает количество мест в автобусе';
create exception osh4 'нет такого типа льготы';
create exception osh5 'населённого пункта с таким идентификатором не существует';
create exception osh6 'уникальность ключа не соблюдена';

alter trigger tr4
before insert
as
  declare variable temp1 timestamp;
  declare variable temp2 integer;
  declare variable temp4 varchar(75);
  declare variable temp5 varchar(75);
  declare variable temp6 varchar(75);
  declare variable temp7 numeric(7,2);
  declare variable temp8 numeric(7,2);
  declare variable temp9 integer;
  declare variable temp10 integer;
begin
select a.dataivremia from otpravlenie a where (a.identificator=new.identificator) into :temp1;
if (new.dataivremia>:temp1) then exception osh1;

select a.identificator from otpravlenie a where a.identificator=new.identificator into :temp2;
if (temp2 is null) then exception osh2;

select c.kolichestvomest from otpravlenie a join avtobus c on (a.nomeravtobusa=c.nomeravtobusa) and (a.identificator=new.identificator) into :temp2;
if (temp2<new.nomermesta) then exception osh3 ;

select a.tip from lgota a where a.tip=new.tip into :temp4;
if (temp4 is  null) then exception osh4;

select a.naselenniipunkt,a.identify from marshrut a where a.identify=new.identif1 into :temp5,:temp9;
if (temp5 is null) then exception osh5;
new.nachaloputi=:temp5;
new.identif1=:temp9;
select a.naselenniipunkt,a.identify from marshrut a where a.identify=new.identif2 into :temp6,:temp10;
if (temp6 is null) then exception osh5;
new.konecputi=:temp6;
new.identif2=:temp10;
select a.cenabileta from otpravlenie a where a.identificator=new.identificator into :temp7;
select a.proc from lgota a where a.tip=new.tip into :temp8;
new.cenabileta=temp7 * temp8/100;
select a.identificator from prodazha a where (a.identificator=new.identificator) and (a.nomermesta=new.nomermesta) into :temp2;
if (temp2 is  null) then exception osh6;
insert into prodazha values(new.identificator,new.cenabileta,new.dataivremia,new.nomermesta,new.identif1,new.identif2,new.tip);
end;


alter trigger tr5
before update
as
  declare variable temp1 timestamp;
  declare variable temp2 integer;
  declare variable temp3 integer;
  declare variable temp4 varchar(75);
  declare variable temp5 varchar(75);
  declare variable temp6 varchar(75);
  declare variable temp7 numeric(7,2);
  declare variable temp8 numeric(7,2);
  declare variable temp9 integer;
  declare variable temp10 integer;
begin
  select a.dataivremia from otpravlenie a where a.identificator=new.identificator into :temp1;
  if (new.dataivremia>:temp1) then exception osh1;
  select a.identificator from otpravlenie a where a.identificator=new.identificator into :temp2;
  if (temp2 is  null) then exception osh2;
select c.kolichestvomest from otpravlenie a  join avtobus c on (a.nomeravtobusa=c.nomeravtobusa) and (a.identificator=new.identificator) into :temp3;
if (temp3<new.nomermesta) then exception osh3 ;

select a.tip from lgota a where a.tip=new.tip into :temp4;
if (temp4 is null) then exception osh4;

select a.naselenniipunkt,a.identify from marshrut a where a.identify=new.identif1 into :temp5,:temp9;
if (temp5 is null) then exception osh5;
new.nachaloputi=:temp5;
new.identif1=:temp9;

select a.naselenniipunkt,a.identify from marshrut a where a.identify=new.identif2 into :temp6,:temp10;
if (temp6 is null) then exception osh5;
new.konecputi=:temp6;
new.identif2=:temp10;
if (old.tip<>new.tip) then
begin
  select a.cenabileta from otpravlenie a where a.identificator=new.identificator into :temp7;
  select a.proc from lgota a where a.tip=new.tip into :temp8;
  new.cenabileta=temp7 * temp8/100;
end
select a.identificator from prodazha a where (a.identificator=new.identificator) and (a.nomermesta=new.nomermesta) into :temp2;
if (temp2 is  null) then exception osh6;
update prodazha set
identificator=new.identificator,
dataivremia=new.dataivremia,
nomermesta=new.nomermesta,
tip=new.tip,
konecputi=new.konecputi,
nachaloputi=new.nachaloputi,
cenabileta=new.cenabileta
where (identificator=old.identificator) and (nomermesta=old.nomermesta);
end;


create trigger tr6 for prodbil
before delete
as
begin
delete from prodazha
where (identificator=old.identificator) and (nomermesta=old.nomermesta);
end;

