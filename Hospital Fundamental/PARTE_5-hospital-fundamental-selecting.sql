-- 1. Todos os dados e o valor médio das consultas do ano de 2020
SELECT 
    consulta.id_consulta, 
    consulta.id_medico, 
    consulta.id_paciente, 
    consulta.data_marcada, 
    consulta.valor_da_consulta,
    AVG(consulta.valor_da_consulta) OVER () AS valor_medio_consultas
FROM consulta
WHERE YEAR(consulta.data_marcada) = 2020;

-- X. Todos os dados e o valor médio das consultas feitas sob convênio
SELECT 
    consulta.id_consulta, 
    consulta.id_medico, 
    consulta.id_paciente, 
    consulta.data_marcada, 
    consulta.valor_da_consulta,
    AVG(consulta.valor_da_consulta) OVER () AS valor_medio_consultas_convenio
FROM consulta
JOIN convenio ON consulta.id_paciente = convenio.id_paciente;

-- 2. Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta
SELECT 
    internacao.id_internacao,
    internacao.data_de_entrada, 
    internacao.data_prevista_de_alta, 
    internacao.data_da_alta, 
    internacao.descricao_do_procedimento, 
    internacao.id_paciente, 
    internacao.id_medico, 
    internacao.id_quarto
FROM internacao
WHERE internacao.data_da_alta > internacao.data_prevista_de_alta;

-- 3. Receituário completo da primeira consulta registrada com receituário associado
SELECT 
    receita.id_receita, 
    receita.medicamentos_usados, 
    receita.quantidade_de_medicamentos, 
    receita.instrucoes_de_uso_dos_medicamentos, 
    consulta.id_consulta, 
    consulta.data_marcada, 
    consulta.id_medico
FROM receita
JOIN consulta ON receita.id_consulta = consulta.id_consulta
ORDER BY consulta.data_marcada
LIMIT 1;

-- 4. Todos os dados da consulta de maior valor e também da de menor valor (ambas não realizadas sob convênio)
SELECT 
    consulta.id_consulta, 
    consulta.id_medico, 
    consulta.id_paciente, 
    consulta.data_marcada, 
    consulta.valor_da_consulta
FROM consulta
WHERE consulta.id_consulta = (
    SELECT id_consulta
    FROM consulta
    WHERE valor_da_consulta = (
        SELECT MAX(valor_da_consulta)
        FROM consulta
        WHERE id_paciente NOT IN (SELECT id_paciente FROM convenio)
    )
    LIMIT 1
)
OR consulta.id_consulta = (
    SELECT id_consulta
    FROM consulta
    WHERE valor_da_consulta = (
        SELECT MIN(valor_da_consulta)
        FROM consulta
        WHERE id_paciente NOT IN (SELECT id_paciente FROM convenio)
    )
    LIMIT 1
);

-- 5. Todos os dados das internações em seus respectivos quartos, calculando o total da internação
SELECT 
    internacao.data_de_entrada, 
    internacao.descricao_do_procedimento, 
    quarto.numero_do_quarto
FROM internacao
JOIN quarto ON internacao.id_quarto = quarto.id_quarto
WHERE quarto.tipo_do_quarto = 'apartamento';  -- ou o nome correto da coluna

-- 6. Data, procedimento e número de quarto de internações em quartos do tipo "apartamento"
SELECT 
    internacao.data_de_entrada, 
    internacao.descricao_do_procedimento, 
    quarto.numero_do_quarto
FROM internacao
JOIN quarto ON internacao.id_quarto = quarto.id_quarto
WHERE quarto.tipo_do_quarto = 'apartamento';

-- 7. Nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes eram menores de 18 anos
SELECT 
    paciente.nome AS nome_paciente,
    consulta.data_marcada, 
    especialidade.descricao AS especialidade
FROM consulta
JOIN paciente ON consulta.id_paciente = paciente.id_paciente
JOIN medico ON consulta.id_medico = medico.id_medico
JOIN medico_especialidade ON medico.id_medico = medico_especialidade.id_medico
JOIN especialidade ON medico_especialidade.id_especialidade = especialidade.id_especialidade
WHERE TIMESTAMPDIFF(YEAR, paciente.data_nascimento, consulta.data_marcada) < 18
AND especialidade.descricao != 'pediatria'
ORDER BY consulta.data_marcada;

-- 8. Nome do paciente, nome do médico, data da internação e procedimentos das internações realizadas por médicos da especialidade “gastroenterologia”
SELECT 
    paciente.nome AS nome_paciente,
    medico.nome AS nome_medico,
    internacao.data_de_entrada,
    internacao.descricao_do_procedimento
FROM internacao
JOIN paciente ON internacao.id_paciente = paciente.id_paciente
JOIN medico ON internacao.id_medico = medico.id_medico
JOIN medico_especialidade ON medico.id_medico = medico_especialidade.id_medico
JOIN especialidade ON medico_especialidade.id_especialidade = especialidade.id_especialidade
JOIN quarto ON internacao.id_quarto = quarto.id_quarto
WHERE especialidade.descricao = 'gastroenterologia'
AND quarto.tipo_do_quarto = 'enfermaria';

-- 9. Os nomes dos médicos, seus CRMs e a quantidade de consultas que cada um realizou
SELECT 
    medico.nome AS nome_medico,
    medico.registro_do_conselho_de_enfermagem,
    COUNT(consulta.id_consulta) AS quantidade_de_consultas
FROM medico
JOIN consulta ON consulta.id_medico = medico.id_medico
GROUP BY medico.id_medico;

-- 10. Todos os médicos que tenham "Gabriel" no nome
SELECT 
    medico.nome, 
    medico.registro_do_conselho_de_enfermagem
FROM medico
WHERE medico.nome LIKE '%Gabriel%';

-- 11 Os nomes, CREs e número de internações de enfermeiros que participaram de mais de uma internação.
SELECT 
    enfermeiro.nome AS nome_enfermeiro, 
    enfermeiro.registro_enfermagem AS registro_enfermagem,
    COUNT(internacao_enfermeiro.id_internacao) AS numero_internacoes
FROM enfermeiro
JOIN internacao_enfermeiro ON enfermeiro.id_enfermeiro = internacao_enfermeiro.id_enfermeiro
JOIN internacao ON internacao_enfermeiro.id_internacao = internacao.id_internacao
GROUP BY enfermeiro.id_enfermeiro
HAVING COUNT(internacao_enfermeiro.id_internacao) > 1;
