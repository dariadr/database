insert into prodazha values(5,199.00,'12.12.12 12:12',45,2,1,'обычный');
update prodazha set 
identificator=4,nomermesta=15
where (identificator=2) and (nomermesta=34);
commit;
