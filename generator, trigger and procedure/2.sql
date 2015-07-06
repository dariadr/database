create exception osh1 'отправление с таким временем уже прошло';
create exception osh2 'отправление с таким идентификатором не существует';
create exception osh3 'номер места превышает количество мест в автобусе';
create exception osh4 'нет такого типа льготы';
create exception osh5 'населённого пункта с таким идентификатором не существует';
create exception osh6 'уникальность ключа не соблюдена';

create trigger tr7 for prodazha
before update
as
  declare variable temp1 timestamp;
  declare variable temp2 integer;
  declare variable temp3 integer;
  declare variable temp4 varchar(75);
  declare variable temp5 integer;
  declare variable temp6 integer;
  declare variable temp7 numeric(7,2);
  declare variable temp8 smallint;
  declare variable temp9 integer;
  
begin
  if (old.dataivremia<>new.dataivremia) then
  begin
    select a.dataivremia
      from otpravlenie a
      where a.identificator=new.identificator into :temp1;
    if (new.dataivremia>:temp1) then exception osh1;
  end
  if (old.identificator<>new.identificator) then
  begin
    select a.identificator
      from otpravlenie a
      where a.identificator=new.identificator into :temp2;
    if (temp2 is null) then exception osh2;
  end
  if (old.nomermesta<>new.nomermesta) then
  begin
    select c.kolichestvomest
      from otpravlenie a join avtobus c on a.nomeravtobusa=c.nomeravtobusa
      where a.identificator=new.identificator into :temp3;
    if (temp3<new.nomermesta) then exception osh3 ;
  end
  if (old.tip<>new.tip) then
  begin
    select a.tip
      from lgota a
      where a.tip=new.tip into :temp4;
    if (temp4 is  null) then exception osh4;
  end
  if ((old.nachaloputi<>new.nachaloputi)) then
  begin
    select a.identify
      from marshrut a
      join otpravlenie b on  (b.nomerreisa=a.nomerreisa)
      where (a.identify=new.nachaloputi) and (b.identificator=new.identificator) into :temp5;
    if (temp5 is  null) then exception osh5;
  end
  if ((old.konecputi<>new.konecputi)) then
  begin
    select a.identify
      from marshrut a
      join otpravlenie b on  (b.nomerreisa=a.nomerreisa)
      where (a.identify=new.konecputi) and  (b.identificator=new.identificator) into :temp6;
    if (temp6 is  null) then exception osh5;
  end
  if (old.tip<>new.tip) then
  begin
    select a.cenabileta
      from otpravlenie a
      where a.identificator=new.identificator into :temp7;
    select a.proc
      from lgota a
      where a.tip=new.tip into :temp8;
    new.cenabileta=temp7 * temp8/100;
  end
  if ((old.identificator<>new.identificator) or (old.nomermesta<>new.nomermesta)) then
  begin
  select a.identificator 
    from prodazha a 
    where (a.identificator=new.identificator) and (a.nomermesta=new.nomermesta) into :temp9;
  if (temp9 is not null) then exception osh6;
  end
end;


create trigger tr8 for prodazha
before insert
as
  declare variable temp1 timestamp;
  declare variable temp2 integer;
  declare variable temp3 integer;
  declare variable temp4 varchar(75);
  declare variable temp5 integer;
  declare variable temp6 integer;
  declare variable temp7 numeric(7,2);
  declare variable temp8 numeric(7,2);
  declare variable temp9 integer;
begin
  select a.dataivremia 
    from otpravlenie a 
    where a.identificator=new.identificator into :temp1;
  if (new.dataivremia>:temp1) then exception osh1;
  select a.identificator 
    from otpravlenie a 
    where a.identificator=new.identificator into :temp2;
  if (temp2 is  null) then exception osh2;
  select c.kolichestvomest 
    from otpravlenie a  
    join avtobus c on a.nomeravtobusa=c.nomeravtobusa 
    where a.identificator=new.identificator into :temp3;
  if (temp3<new.nomermesta) then exception osh3 ;
  select a.tip 
    from lgota a 
    where a.tip=new.tip into :temp4;
  if (temp4 is null) then exception osh4;
  select a.identify 
    from marshrut a 
    join otpravlenie b
    on a.nomerreisa=b.nomerreisa
    where (a.identify=new.nachaloputi) and (b.identificator=new.identificator)   into :temp5;
  if (temp5 is null) then exception osh5;
  select a.identify 
    from marshrut a 
    join otpravlenie b
    on a.nomerreisa=b.nomerreisa
    where (a.identify=new.konecputi) and (b.identificator=new.identificator) into :temp6;
  if (temp6 is null) then exception osh5;
  select a.cenabileta
    from otpravlenie a
    where a.identificator=new.identificator into :temp7;
  select a.proc
    from lgota a
    where a.tip=new.tip into :temp8;
  new.cenabileta=temp7 * temp8/100;
  select a.identificator 
    from prodazha a 
    where (a.identificator=new.identificator) and (a.nomermesta=new.nomermesta) into :temp9;
  if (temp9 is not  null) then exception osh6;
end;
