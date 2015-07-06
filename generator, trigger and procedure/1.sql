create generator g1;
create trigger tr1 for marshrut before insert as
begin
new.identify=gen_id(g1,1);
end;


create generator g2;
create trigger tr2 for otpravlenie before insert as
begin
new.identificator=gen_id(g2,1);
end;


create generator g3;
create trigger tr3 for raspisanie before insert as
begin
new.identificatorraspisania=gen_id(g3,1);
end;

