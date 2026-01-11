create table alunno(
	id_alunno int primary key auto_increment,
	nome varchar(40) not null,
	cognome varchar(40) not null,
	cf varchar(16) unique not null,
	data date not null,
	email varchar(30) not null,
	id_classe int,
	foreign key(id_classe) references classi (id_classe)
); 

create table tutori(
	id_tutore int primary  key auto_increment,
	nome varchar(40) not null,
	cognome varchar(40) not null,
	cf varchar(16) not null,
	email varchar (40) not null
);

create table alunni_tutori(
	id_alunno int,
	id_tutore int,
	primary key (id_alunno, id_tutore),
	foreign key (id_alunno) references alunno (id_alunno),
	foreign key (id_tutore) references tutori (id_tutore)
);

create table classi(
	id_classe int primary key auto_increment,
	sezione varchar(3) not null,
	indirizzo varchar(20) not null 
);
