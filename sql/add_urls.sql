alter table carpediem.Categoria
ADD url varchar(50);

alter table carpediem.Categoria
ADD constraint url unique (url);

insert into carpediem.Categoria (url)
values 	'fai-da-te'
where nome = 'Fai-da-te',
values 	'ortaggi-e-foraggi'
where nome = 'Ortaggi e Foraggi',
values 	'ricette-della-nonna'
where nome = 'Ricette della Nonna',
values 	'rimedi-casalinghi'
where nome = 'Rimedi Casalinghi',
values 	'reduci-di-guerra'
where nome = 'Reduci di Guerra',
values 	'c-era-una-volta'
where nome = 'C era una volta';