alter table carpediem.Categoria
ADD url varchar(50);

alter table carpediem.Categoria
ADD constraint url unique (url);

UPDATE carpediem.Categoria
SET url = 'fai-da-te'
WHERE nome = 'Fai-da-te';

UPDATE carpediem.Categoria
SET url = 'ortaggi-e-foraggi'
WHERE nome = 'Ortaggi e Foraggi';

UPDATE carpediem.Categoria
SET url = 'ricette-della-nonna'
WHERE nome = 'Ricette della Nonna';

UPDATE carpediem.Categoria
SET url = 'rimedi-casalinghi'
WHERE nome = 'Rimedi Casalinghi';

UPDATE carpediem.Categoria
SET url = 'reduci-di-guerra'
WHERE nome = 'Reduci di Guerra';

UPDATE carpediem.Categoria
SET url = 'c-era-una-volta'
WHERE nome = 'C era una volta';