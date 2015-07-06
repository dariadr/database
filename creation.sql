create database 's2itm:d:\sb\ivt-11\droz_dv.ib' user 'droz_dv' password '914345' page_size=1024;

create table avtobus(
  rashodbensina numeric(7,3) check(rashodbensina>0 or rashodbensina is null),
  kolichestvomest smallint not null check (kolichestvomest>0),
  nomeravtobusa varchar(10) not null primary key);
  
create table reise(
  cenabileta numeric(7,2) not null check (cenabileta>0) ,
  nomerreisa varchar(20) not null PRIMARY KEY);

create table mesto(
  naselenniipunkt varchar(75) not null primary key
  );

create table marshrut(
  kluch smallint not null check(kluch>0 and kluch<1001),
  nomerreisa varchar(20) not null REFERENCES reise(nomerreisa),
  dlinaputi smallint not null CHECK(dlinaputi>=0),
  naselenniipunkt varchar(75) not null references mesto(naselenniipunkt),
  identify integer not null PRIMARY KEY,
  constraint marsh1 unique(nomerreisa, kluch),
  constraint marsh2 unique(nomerreisa, naselenniipunkt));


create table otpravlenie(
  nomeravtobusa varchar(10) not null references avtobus(nomeravtobusa) on update cascade,
  nomerreisa varchar(20) not null references reise(nomerreisa),
  dataivremia timestamp not null,
  identificator integer not null PRIMARY KEY,
  cenabileta numeric(7,2) not null check (cenabileta>0),
  constraint otpr1 unique(dataivremia,  nomerreisa),
  constraint otpr2 unique(dataivremia,  nomeravtobusa)
);/*�������� �����*/

  

create table lgota(
  tip varchar(75) not null primary key,
  proc smallint check (proc>=0 and proc<=100)
  );
  
create table prodazha(                                     
  identificator integer not null references otpravlenie(identificator),
  cenabileta numeric(7,2) check (cenabileta>=0),
  dataivremia timestamp not null,
  nomermesta smallint not null check (nomermesta>0),
  nachaloputi integer not null REFERENCES marshrut(identify),
  konecputi integer not null REFERENCES marshrut(identify),
  tip varchar(75) not null references lgota(tip) ,
  constraint prod PRIMARY KEY(nomermesta, identificator)
  ) ;

create asc index otprav on prodazha(dataivremia);

create table period(
  tip varchar(75) not null primary key
  );
  
create table raspisanie(
  tip varchar(75) not null REFERENCES period(tip),
  identificatorraspisania integer not null PRIMARY KEY,
  nomerreisa varchar(20) not null REFERENCES reise(nomerreisa),
  constraint rasp unique(nomerreisa,tip)
  ); 

  
create table vremiaraspisania(
  vremia time not null,
  nomerdnia smallint not null check (nomerdnia>0 and nomerdnia<367),
  identificatorraspisania integer not null REFERENCES raspisanie(identificatorraspisania),
  constraint vrrasp PRIMARY KEY(identificatorraspisania, nomerdnia,vremia)
  );


create table vremiadeistvia(                         
  identificatorraspisania integer not null REFERENCES raspisanie(identificatorraspisania) ,
  nachalo date not null,
  konec date not null,
  constraint deist1 unique(identificatorraspisania, konec),
  constraint deist2 unique(identificatorraspisania, nachalo)); 



  insert into avtobus values(45,65,'�656��42');
  insert into avtobus values(30,23,'�798��42');
  insert into avtobus values(23.4,45,'�7954��42');
  insert into avtobus values(14.7,56,'�798��42');
  insert into avtobus values(34.5,23,'�798��42');
  insert into reise values(200.34,2356);
  insert into reise values(200.34,2355);
  insert into reise values(300.56,2354);
  insert into reise values(400.78,2353);
  insert into reise values(250.98,2352);
  insert into mesto values('��������');
  insert into mesto values('�����������');
  insert into mesto values('������������');
  insert into mesto values('������');
  insert into mesto values('������');
  insert into mesto values('����������');
  insert into mesto values('����');
  insert into lgota values('�������',50);
  insert into lgota values('�������',100);
  insert into lgota values('����������',50);
  insert into lgota values('������������',70);  
  insert into lgota values('�����������',0);
  insert into period values('����������');
  insert into period values('������������');
  insert into period values('�����������');
  insert into period values('�� ��������');
  insert into period values('������ ���');
  insert into marshrut values(1,2355,0,'��������',1);
  insert into marshrut values(2,2355,45,'�����������',2);
  insert into marshrut values(3,2355,34,'������',3);
  insert into marshrut values(1,2354,0,'����������',4);
  insert into marshrut values(2,2354,67,'������������',5);
  insert into marshrut values(1,2356,64,'������',6);
  insert into marshrut values(2,2356,62,'����',7);
  insert into otpravlenie values('�656��42',2355,'12.12.12 12:12',4576756,199.00);
  insert into otpravlenie values('�656��42',2356,'12.12.12 12:13',4576755,199.00);
  insert into otpravlenie values('�798��42',2354,'12.12.12 12:14',4576754,259.00);
  insert into otpravlenie values('�798��42',2356,'12.12.12 12:15',4576753,418.00);
  insert into otpravlenie values('�798��42',2354,'12.12.12 12:16',4576753,199.00);
  insert into prodazha values(1,99.00,'12.12.11 12:12',16,1,2,'�������');
  insert into prodazha values(2,99.00,'12.12.12 12:12',34,7,6,'�������');
  insert into prodazha values(2,199.00,'12.12.12 12:12',45,7,6,'�������');
  insert into prodazha values(3,149.00,'12.12.12 12:12',23,4,5,'����������');
  insert into prodazha values(3,259.00,'12.12.12 12:12',15,5,4,'�������');
  insert into prodazha values(4,199.00,'12.12.12 12:12',14,7,6,'�������');
  insert into raspisanie values('����������',23559787,2355);
  insert into raspisanie values('����������',23559788,2356);
  insert into raspisanie values('������������',23559789,2356);
  insert into raspisanie values('������������',23559790,2354);
  insert into raspisanie values('������ ���',23559791,2353);
  insert into vremiaraspisania values('12:12',134,1);
  insert into vremiaraspisania values('12:11',365,1);
  insert into vremiaraspisania values('15:11',145,2);
  insert into vremiaraspisania values('12:12',23,2);
  insert into vremiaraspisania values('12:10',36,3);
  insert into vremiadeistvia values(1,'13.12.12','21.12.12');
  insert into vremiadeistvia values(2,'13.12.12','21.12.12');
  insert into vremiadeistvia values(3,'13.12.12','21.12.12');
  insert into vremiadeistvia values(5,'13.12.12','22.12.12');
  insert into vremiadeistvia values(4,'13.12.12','21.12.12');
  commit;
  
