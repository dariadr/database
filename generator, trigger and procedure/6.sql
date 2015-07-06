create exception osh7 'населённого пункта с таким названием не существует';

create trigger tr4 for prodbil
before insert
as
  declare variable temp1 integer;
  declare variable temp2 integer;

begin
  select a.identify 
    from marshrut a 
    join otpravlenie b on  (b.nomerreisa=a.nomerreisa)  
    where (a.naselenniipunkt=new.nachaloputi) and (b.identificator=new.identificator) into :temp1;
  if (temp1 is null) then exception osh7;
  select a.identify 
    from marshrut a 
    join otpravlenie b on  (b.nomerreisa=a.nomerreisa)  
    where (a.naselenniipunkt=new.konecputi) and  (b.identificator=new.identificator) into :temp2;
  if (temp2 is null) then exception osh7;
  insert into prodazha values(new.identificator,new.cenabileta,new.dataivremia,new.nomermesta,:temp1,:temp2,new.tip);
end;


create trigger tr5 for prodbil
before update
as
  declare variable temp1 integer;
  declare variable temp2 integer;
begin

    select a.identify 
      from marshrut a 
      join otpravlenie b on  (b.nomerreisa=a.nomerreisa)  
      where (a.naselenniipunkt=new.nachaloputi) and (b.identificator=new.identificator) into :temp1;
    if (temp1 is null) then exception osh7;

    select a.identify 
      from marshrut a 
      join otpravlenie b on  (b.nomerreisa=a.nomerreisa)  
      where (a.naselenniipunkt=new.konecputi) and  (b.identificator=new.identificator) into :temp2;
    if (temp2 is null) then exception osh7;
    
  update prodazha set
    identificator=new.identificator,
    dataivremia=new.dataivremia,
    nomermesta=new.nomermesta,
    tip=new.tip,
    konecputi=:temp2,
    nachaloputi=:temp1,
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

