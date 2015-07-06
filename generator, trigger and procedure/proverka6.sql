update prodbil set
identificator=1,nomermesta=15,tip='обычный'
where (identificator=2) and (nomermesta=34);
insert into prodbil values(3,'детский','12.12.2011 12:12:12',1000,1,'Кемерово','Новокузнецк');
commit;
