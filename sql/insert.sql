insert into carpediem.Utente (email, password, data, nome, cognome, telefono, indirizzo, path_foto) 
values 	('ugo_saugo@gmail.com', 'hugo25', '1925-12-22', 'Ugo', 'Albertini', '0468349761', 'Via Ladri 7', null),
		('lapina@gmail.com', 'tagliatelle', '1930-04-11', 'Pina', 'Dallabona', '0268749711', 'Via Gatti 5', null);

insert into carpediem.Categoria (nome, colore)
values 	('Fai-da-te', 'rosso'),
		('Ortaggi e Foraggi', 'verde'),
		('Ricette della Nonna', 'giallo'),
		('Rimedi Casalinghi', 'blu'),
		('Reduci di Guerra', 'marrone'),
		('C era una volta', 'rosa');
		
insert into carpediem.Post (titolo, categoria, utente, testo, media)
values ('c era una volta in america', 6, 1, 'c era una volta in america colonna sonora', 'https://www.youtube.com/watch?v=nbFfHDOXDkY'),
	   ('Il caffe della Peppina', 3, 1, 'Non si beve alla mattina ne col latte ne col te', 'https://www.youtube.com/watch?v=-xL2Y2HKEI8'),
       ('Le Tagliatelle di Nonna Pina', 3, 2, 'Son molto più efficaci di ogni vitamina', 'https://www.youtube.com/watch?v=HAzbZbjztbc');
