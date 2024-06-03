insert into cursa(disciplina_id_disciplina, matricula_id_matricula, NP1, NP2) values 
('E201', 2, '0', '0');

update cursa set NP1 = '30' where disciplina_id_disciplina = 'M03' and matricula_id_matricula = 1
;

delete from cursa where disciplina_id_disciplina = 'M03' and matricula_id_matricula = 1;