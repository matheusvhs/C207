use projeto;

insert into professor() values 
(default, 'João Bosco', '05/06/1959', 'M', 'Rua dos Bobos, 0', 'jãobosco@bol.com.br', '(35) 99982-0765'),
(default, 'Rayssa Nawane', '05/04/1997', 'F', 'Rua dos Alfeneiros, 7', 'raynanaue@hotmail.com', '(35) 95796-0236'),
(default, 'Katarina Apelona', '20/08/1991', 'F', 'Rua dos Médicos, 746', 'katarina2008@gmail.com', '(31) 99981-0503'),
(default, 'Luiz Carlos', '23/11/1984', 'M', 'Av. El Dorado, 265', 'lc265pf@outlook.com', '(35) 98857-3465'),
(default, 'Marcos', '23/11/1989', 'M', 'Av. das Nações, 123', 'marvinidlc@gmail.com', '(35) 3521-5902')
;

insert into aluno() values 
(default, 'Matheus', '05/09/2000', 'M', 'Rua Amizade, 123', 'matheusvhs@gmail.com', '(35) 98810-1900'),
(default, 'Ana Castela', '23/12/2002', 'F', 'Rua dos Boi, 14', 'ramtchum@hotmail.com', '(61) 95544-1212'),
(default, 'Júlia', '12/06/2000', 'F', 'Rua dos Médicos, 746', 'jujuba@gmail.com', '(31) 99981-0887'),
(default, 'Lucas', '23/11/1999', 'M', 'Av. Nicolau Jacinto', 'lukinhas_b@outlook.com', '(11) 91275-3432'),
(default, 'Gabriel', '11/11/1989', 'M', 'Rua dos Professores, 10', 'fallen@gmail.com', '(11) 9991-3511')
;

insert into disciplina() values 
('M03', 'Calculo 1', '120 horas', 1),
('C07', 'Banco de Dados 1', '100 horas',2),
('MO1', 'Matemática', '120 horas', 3),
('C04', 'Algorítimos 3', '120 horas', 4),
('E201', 'Circuitos 1', '120 horas', 5),
('H01', 'Administração', '100 horas', 1),
('F01', 'Física 1', '120 horas', 3)
;

insert into matricula() values 
(default, 'GES', '15/01/2020', '6º Semestre', 'Matriculado', 1),
(default, 'GEB', '20/01/2021', '4º Semestre', 'Matriculado', 2),
(default, 'GEP', '08/02/2019', '8º Semestre', 'Matriculado', 3),
(default, 'GEB', '19/06/2019', '9º Semestre', 'Matriculado', 4),
(default, 'GEC', '15/01/2022', '4º Semestre', 'Matriculado', 5)
;

insert into cursa(disciplina_id_disciplina, matricula_id_matricula, NP1, NP2) values 
('M03', 1, '0', '0'),
('C07', 1, '0', '0'),
('F01', 1, '0', '0'),
('H01', 1, '0', '0'),
('M03', 2, '0', '0'),
('C07', 2, '0', '0'),
('F01', 2, '0', '0'),
('H01', 2, '0', '0'),
('M03', 3, '0', '0'),
('C07', 3, '0', '0'),
('F01', 3, '0', '0'),
('H01', 3, '0', '0'),
('C07', 4, '0', '0'),
('H01', 4, '0', '0'),
('M03', 5, '0', '0'),
('C07', 5, '0', '0'),
('F01', 5, '0', '0'),
('H01', 5, '0', '0')
;


