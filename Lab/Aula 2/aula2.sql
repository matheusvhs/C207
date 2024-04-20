create database aula01;

use aula01;

create table Usuario(
	ID int not null primary key auto_increment,
    NOME varchar(45) not null,
    IDADE int not null,
    endereco varchar(45)
);

insert into Usuario() values (default,'João',18,'Rua 01');
insert into Usuario(nome, idade) values ('Matheus',23);

update Usuario set nome = 'Charles' where id = 1;

delete from Usuario where id = 2;

SELECT * FROM aula01.usuario;




