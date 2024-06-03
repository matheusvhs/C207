use projeto;

select a.*, d.id_disciplina, d.nome_disciplina 
from aluno a join matricula m on a.id_aluno = m.aluno_id_aluno 
join cursa c on m.id_matricula = c.matricula_id_matricula 
join disciplina d on d.id_disciplina = c.disciplina_id_disciplina 
where a.id_aluno = 1
;