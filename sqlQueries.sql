create table Utente (
	id_utente integer not null
        generated  always as identity
        (start with 1, increment by 1),
    email varchar(50) not null,
    password varchar(50) not null,
	data date,
    nome varchar(50),
    cognome varchar(50),
    telefono varchar(16),
    indirizzo varchar(50),
    path_foto varchar(255),
    constraint id_utente primary key (id_utente),
    constraint utente_email unique (email)
);

create table Categoria (
	id_cat integer not null
        generated  always as identity
        (start with 1, increment by 1),
    nome varchar(50),
    colore varchar(10),
    constraint id_cat primary key (id_cat),
    constraint nome unique (nome)
);

create table Post (
	id_post integer not nullinsert into carpediem.Utente (email, password, data, nome, cognome, telefono, indirizzo, path_foto) 
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

        generated  always as identity
        (start with 1, increment by 1),
    titolo varchar(50) not null,
    categoria integer,
    utente integer,
    testo varchar(5000),
    media varchar(255),
    constraint id_post primary key (id_post),
    constraint titolo unique (titolo),
    foreign key (categoria) references Categoria (id_cat),
    foreign key (utente) references Utente (id_utente)
);
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Berta
 * Created: 22-nov-2015
 */

