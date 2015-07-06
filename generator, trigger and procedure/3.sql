create procedure proc(nomavt varchar(10),nomr varchar(20),datavt timestamp,censb numeric(7,2))
returns (id integer)
as
  declare variable temp1 varchar(20);
  declare variable temp2 varchar(10);

begin
  id=0;
  select a.nomerreisa 
    from reise a 
    where a.nomerreisa=:nomr into :temp1;
  if (temp1 is null) then
    id=-1;
  if (:id<>-1) then
  begin
    select a.nomeravtobusa 
      from avtobus a 
      where a.nomeravtobusa=:nomavt into :temp2;
    if (temp2 is null) then
      id=-2;
    if (:id<>-2) then
    begin
      insert into otpravlenie values(:nomavt,:nomr,:datavt,0,:censb);
      select a.identificator
        from otpravlenie a
        where (a.dataivremia=:datavt ) and (a.nomerreisa=:nomr)
          into :id;
    end
  end
end;
