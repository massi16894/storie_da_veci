create table Utente (
	id_utente integer not null
        generated  always as identity
        (start with 1, increment by 1),
    email varchar(50) not null,
    password varchar(50) not null,
	data varchar(5),
    nome varchar(50),
    cognome varchar(50),
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
	id_post integer not null
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
