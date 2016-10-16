insert into carpediem.Utente (email, password, data, nome, cognome, telefono, indirizzo, path_foto) 
values 	('ugo_saugo@gmail.com', 'hugo25', '1925-12-22', 'Ugo', 'Albertini', '0468349761', 'Via Ladri 7', 'img/profile/ugo.jpg'),
		('lapina@gmail.com', 'tagliatelle', '1930-04-11', 'Pina', 'Dallabona', '0268749711', 'Via Gatti 5', 'img/profile/pina.jpg'),
		('mariella@gmail.com', 'mari', '1935-12-22', 'Mariella', 'Mantovani', '0468389761', 'Vicolo chiuso', 'img/profile/mariella.jpg'),
		('orazio@gmail.com', 'oraz', '1939-04-11', 'Orazio', 'Segantini', '046149711', 'Via 28 Giugno', 'img/profile/orazio.jpg'),
		('leonardo@gmail.com', 'leon', '1942-04-11', 'Leonardo', 'Giannini', '046449711', 'Viale Martiri', 'img/profile/leonardo.jpg');

insert into carpediem.Categoria (nome, colore)
values 	('Fai-da-te', 'vio'),
		('Ortaggi e Foraggi', 'ara'),
		('Ricette della Nonna', 'blu'),
		('Rimedi Casalinghi', 'ros'),
		('Reduci di Guerra', 'ver'),
		('C''era una volta', 'azz');
		
insert into carpediem.Post (titolo, categoria, utente, testo, media)
values 	('C''era una volta in america', 6, 1, 'C''era una volta in america colonna sonora', 'https://www.youtube.com/embed/nbFfHDOXDkY'),
	   	('Il caffe della Peppina', 3, 1, 'Non si beve alla mattina ne col latte ne col te', 'https://www.youtube.com/embed/-xL2Y2HKEI8'),
       	('Le Tagliatelle di Nonna Pina', 3, 2, 'Son molto più efficaci di ogni vitamina', 'https://www.youtube.com/embed/HAzbZbjztbc'),
		('Rimedio per il rafreddore', 4, 5, 'Sciroppo alle cipolle. - Questo rimedio viene considerato adatto per il raffreddore accompagnato da tosse. Sfrutta le proprietà antibatteriche e antinfiammatorie della cipolla e la capacità del miele di calmare la tosse. Può aiutare a disciogliere ed eliminare il muco. Potrete anche sostituire il miele con lo zucchero di canna integrale.', 'https://www.youtube.com/embed/jJtZ1nRo9wQ');
 	   
