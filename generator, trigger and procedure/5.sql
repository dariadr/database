create view prodbil (nomermesta,tip,dataivremia,cenabileta,identificator,nachaloputi,konecputi)
as
  select 
    k.nomermesta,
    k.tip,
    k.dataivremia,
    k.cenabileta,
    k.identificator,
    a.naselenniipunkt,
    b.naselenniipunkt
  from prodazha k 
       join  marshrut a on a.identify=k.nachaloputi 
       join marshrut b on k.konecputi=b.identify;
