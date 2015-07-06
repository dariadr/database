create procedure proc1(time1 timestamp,time2 timestamp)
returns (zapis1 varchar(20) ,zapis2 integer,zapis3 integer,zapis4 integer,zapis5 integer,zapis6 integer)
as
begin
  for select  distinct a.nomerreisa,
  (select count(c.identificator) 
    from otpravlenie b 
         join reise e on  e.nomerreisa=b.nomerreisa and e.nomerreisa=a.nomerreisa
         join prodazha c on c.identificator=b.identificator 
         where tip='обычный' and b.dataivremia between :time1 and :time2) as obichnii,
  (select count(c.identificator) 
    from otpravlenie b 
         join reise r on  r.nomerreisa=b.nomerreisa and r.nomerreisa=a.nomerreisa
         join prodazha c on c.identificator=b.identificator 
         where tip='детский' and b.dataivremia between :time1 and :time2) as detckii,
  (select count(c.identificator) 
    from otpravlenie b 
         join reise t on  t.nomerreisa=b.nomerreisa and t.nomerreisa=a.nomerreisa
         join prodazha c on c.identificator=b.identificator 
         where tip='пенсионный' and b.dataivremia between :time1 and :time2) as pensionnii,
  (select count(c.identificator) 
    from otpravlenie b 
         join reise y on  y.nomerreisa=b.nomerreisa and y.nomerreisa=a.nomerreisa
         join prodazha c on c.identificator=b.identificator
         where tip='студенческий' and b.dataivremia between :time1 and :time2) as studencheskii,
  (select count(c.identificator) 
    from otpravlenie b 
         join reise i on  i.nomerreisa=b.nomerreisa and i.nomerreisa=a.nomerreisa
         join prodazha c on c.identificator=b.identificator 
         where tip='депутатский' and b.dataivremia between :time1 and :time2) as deputatskii 
    from  otpravlenie b 
          join reise a on  a.nomerreisa=b.nomerreisa 
          where b.dataivremia between :time1 and :time2 
           into :zapis1,:zapis2,:zapis3,:zapis4,:zapis5,:zapis6
  do
  suspend;
end;
