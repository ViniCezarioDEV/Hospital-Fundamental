USE hospital_fundamental;

-- Inserindo dados na tabela de especialidades
INSERT INTO `especialidade` (`descricao`) VALUES 
('pediatria'), 
('clinica geral'), 
('gastroenterologia'), 
('dermatologia'), 
('cardiologia'), 
('ortopedia'), 
('neurologia');

-- Inserindo dados na tabela de médicos
INSERT INTO `medico` (`nome`, `cpf`, `registro_do_conselho_de_enfermagem`) VALUES 
('Dr. João Silva', '12345678901', '12345'),
('Dr. Maria Oliveira', '23456789012', '23456'),
('Dr. Carlos Santos', '34567890123', '34567'),
('Dr. Ana Costa', '45678901234', '45678'),
('Dr. Paula Almeida', '56789012345', '56789'),
('Dr. Lucas Ferreira', '67890123456', '67890'),
('Dr. Fernanda Lima', '78901234567', '78901'),
('Dr. Renan Dias', '89012345678', '89012'),
('Dr. Juliana Martins', '90123456789', '90123'),
('Dr. Bruno Nascimento', '01234567890', '01234');

-- Inserindo dados na tabela de relacionamento médico e especialidade
INSERT INTO `medico_especialidade` (`id_medico`, `id_especialidade`) VALUES 
(1, 1),  -- Dr. João Silva (pediatria)
(2, 2),  -- Dr. Maria Oliveira (clínica geral)
(3, 3),  -- Dr. Carlos Santos (gastroenterologia)
(4, 4),  -- Dr. Ana Costa (dermatologia)
(5, 5),  -- Dr. Paula Almeida (cardiologia)
(6, 6),  -- Dr. Lucas Ferreira (ortopedia)
(7, 7),  -- Dr. Fernanda Lima (neurologia)
(8, 2),  -- Dr. Renan Dias (clínica geral)
(9, 4),  -- Dr. Juliana Martins (dermatologia)
(10, 3); -- Dr. Bruno Nascimento (gastroenterologia)

-- Inserindo dados na tabela de pacientes
INSERT INTO `paciente` (`nome`, `data_nascimento`, `endereco`, `email`, `cpf`, `rg`) VALUES 
('Pedro Almeida', '1985-06-15', 'Rua A, 123', 'pedro@gmail.com', '12345278401', '12345678'),
('Julia Pereira', '1990-03-10', 'Rua B, 456', 'julia@gmail.com', '23456789012', '23456789'),
('Carlos Eduardo', '1988-05-25', 'Rua C, 789', 'carlos@gmail.com', '34567890123', '34567890'),
('Sofia Lima', '1992-12-30', 'Rua D, 101', 'sofia@gmail.com', '44628901234', '45678901'),
('Mariana Santos', '1980-07-19', 'Rua E, 102', 'mariana@gmail.com', '56789012345', '56789012'),
('Lucas Silva', '1975-11-04', 'Rua F, 103', 'lucas@gmail.com', '67890123456', '67890123'),
('Ana Clara', '1995-02-20', 'Rua G, 104', 'anaclara@gmail.com', '78901234567', '78901234'),
('Ricardo Mendes', '1982-09-14', 'Rua H, 105', 'ricardo@gmail.com', '89012345678', '89012345'),
('Felipe Castro', '1993-08-29', 'Rua I, 106', 'felipe@gmail.com', '90123456789', '90123456'),
('Patricia Alves', '1984-01-01', 'Rua J, 107', 'patricia@gmail.com', '01234567890', '01234567'),
('André Gomes', '1978-03-22', 'Rua K, 108', 'andre@gmail.com', '12378945601', '12378945'),
('Tatiane Ribeiro', '1991-11-15', 'Rua L, 109', 'tatiane@gmail.com', '23489012345', '23489012'),
('Fernando Oliveira', '1986-07-11', 'Rua M, 110', 'fernando@gmail.com', '34567890112', '34567894'),
('Bianca Santos', '1983-02-04', 'Rua N, 111', 'bianca@gmail.com', '45672941434', '45678912'),
('Thiago Martins', '1994-09-09', 'Rua O, 112', 'thiago@gmail.com', '56789012356', '56789034');

-- Inserindo dados na tabela consulta
INSERT INTO consulta (data_marcada, hora_de_realizacao, valor_da_consulta, id_medico, id_paciente) VALUES
('2015-01-05', '10:00:00', 150.00, 1, 1),
('2016-02-10', '11:00:00', 200.00, 2, 2),
('2017-03-15', '09:00:00', 180.00, 3, 3),
('2018-04-20', '14:00:00', 220.00, 4, 4),
('2019-05-25', '16:00:00', 160.00, 5, 5),
('2020-06-30', '08:00:00', 190.00, 6, 6),
('2021-07-12', '13:00:00', 175.00, 7, 7),
('2015-08-15', '10:30:00', 150.00, 1, 1),
('2016-09-10', '11:30:00', 200.00, 2, 2),
('2017-10-20', '09:30:00', 180.00, 3, 3),
('2018-11-05', '14:30:00', 220.00, 4, 4),
('2019-12-10', '16:30:00', 160.00, 5, 5),
('2020-01-20', '08:30:00', 190.00, 6, 6),
('2021-02-15', '13:30:00', 175.00, 7, 7),
('2015-03-15', '10:00:00', 150.00, 1, 8),
('2016-04-20', '11:00:00', 200.00, 2, 9),
('2017-05-25', '09:00:00', 180.00, 3, 10),
('2018-06-30', '14:00:00', 220.00, 4, 11),
('2019-07-12', '16:00:00', 160.00, 5, 12),
('2020-08-15', '08:00:00', 190.00, 6, 13),
('2021-09-20', '13:00:00', 175.00, 7, 14),
('2020-10-30', '09:00:00', 220.00, 5, 15);

-- Inserindo dados na tabela convenio
INSERT INTO convenio (nome_convenio, cnpj_convenio, tempo_carencia, numero_da_carteira_do_convenio, id_paciente) VALUES
('Unimed', 12345678000195, 30, 1001, 1),
('Bradesco Saúde', 12345678000196, 60, 1002, 2),
('Amil', 12345678000197, 90, 1003, 3),
('SulAmérica', 12345678000198, 30, 1004, 4);

-- Inserindo dados na tabela quarto
INSERT INTO `quarto` (numero_do_quarto, descricao_do_quarto, valor_diaria, tipo_do_quarto) VALUES
(101, 'Apartamento 1', 300.00, 'apartamento'),  -- Apartamento
(102, 'Apartamento 2', 350.00, 'apartamento'),  -- Apartamento
(201, 'Quarto Duplo 1', 150.00, 'quarto_duplo'), -- Quarto Duplo
(202, 'Quarto Duplo 2', 160.00, 'quarto_duplo'), -- Quarto Duplo
(301, 'Enfermaria 1', 75.00, 'enfermagem'),       -- Enfermaria
(302, 'Enfermaria 2', 80.00, 'enfermagem'),       -- Enfermaria
(303, 'Enfermaria 3', 70.00, 'enfermagem');       -- Enfermaria

-- Inserindo dados na tabela internação
INSERT INTO `internacao` (data_de_entrada, data_prevista_de_alta, data_da_alta, descricao_do_procedimento, id_paciente, id_medico, id_quarto) VALUES
('2015-03-01', '2015-03-05', '2015-03-04', 'Apêndice', 1, 1, 1), -- Paciente 1, Médico 1, Quarto 101
('2016-06-10', '2016-06-15', '2016-06-14', 'Fratura de perna', 2, 2, 3), -- Paciente 2, Médico 2, Quarto 201
('2017-09-20', '2017-09-25', '2017-09-24', 'Pneumonia', 1, 3, 2), -- Paciente 1, Médico 3, Quarto 102
('2018-05-15', '2018-05-20', '2018-05-19', 'Cirurgia Geral', 3, 1, 1), -- Paciente 3, Médico 1, Quarto 101
('2019-08-10', '2019-08-12', '2019-08-11', 'Internação por desidratação', 4, 2, 5), -- Paciente 4, Médico 2, Quarto 301
('2020-11-05', '2020-11-10', '2020-11-09', 'Observação', 2, 4, 3), -- Paciente 2, Médico 4, Quarto 201
('2021-01-15', '2021-01-20', '2021-01-19', 'Covid-19', 5, 3, 6); -- Paciente 5, Médico 3, Quarto 302

-- Inserindo dados na tabela receita
INSERT INTO receita (medicamentos_usados, quantidade_de_medicamentos, instrucoes_de_uso_dos_medicamentos, id_consulta, id_medico) VALUES
('Paracetamol, Amoxicilina', 2, 'Tomar a cada 8 horas', 1, 1),
('Ibuprofeno, Cetirizina', 2, 'Tomar antes das refeições', 2, 2),
('Omeprazol, Metformina', 2, 'Tomar com água', 3, 3),
('AAS, Dipirona', 2, 'Tomar a cada 12 horas', 4, 4),
('Losartana, Atorvastatina', 2, 'Tomar à noite', 5, 5),
('Simvastatina, Clopidogrel', 2, 'Tomar pela manhã', 6, 6),
('Alendronato, Cálcio', 2, 'Tomar em jejum', 7, 7),
('Amoxicilina, Prednisona', 2, 'Tomar após o almoço', 8, 1),
('Ciprofloxacino, Ranitidina', 2, 'Tomar com 1 copo d\'água', 9, 2),
('Lansoprazol, Clonazepam', 2, 'Tomar ao deitar', 10, 3),
('Tamsulosina, Hydrochlorothiazide', 2, 'Tomar pela manhã', 11, 4),
('Bromoprida, Metoclopramida', 2, 'Tomar 30 minutos antes das refeições', 12, 5),
('Dexametasona, Salbutamol', 2, 'Inalar 2 vezes ao dia', 13, 6),
('Amiodarona, Propranolol', 2, 'Tomar 1 vez ao dia', 14, 7),
('Citalopram, Fluoxetina', 2, 'Tomar pela manhã', 15, 1),
('Escitalopram, Venlafaxina', 2, 'Tomar à noite', 16, 2),
('Gabapentina, Pregabalina', 2, 'Tomar 3 vezes ao dia', 17, 3),
('Sertralina, Duloxetina', 2, 'Tomar antes das refeições', 18, 4),
('Clonazepam, Lorazepam', 2, 'Tomar à noite', 19, 5),
('Risperidona, Aripiprazol', 2, 'Tomar ao acordar', 20, 6);

INSERT INTO `enfermeiro` (nome, cpf, registro_enfermagem) VALUES
('Ana Silva', '12345678901', 'ENF-001'),
('Carlos Souza', '23456789012', 'ENF-002'),
('Maria Oliveira', '34567890123', 'ENF-003'),
('João Pereira', '45678901234', 'ENF-004'),
('Fernanda Lima', '56789012345', 'ENF-005'),
('Roberto Costa', '67890123456', 'ENF-006'),
('Juliana Mendes', '78901234567', 'ENF-007'),
('Paulo Santos', '89012345678', 'ENF-008'),
('Mariana Ferreira', '90123456789', 'ENF-009'),
('Lucas Almeida', '01234567890', 'ENF-010');

INSERT INTO `internacao_enfermeiro` (id_internacao, id_enfermeiro) VALUES
(1, 1),  -- Internação 1 com Enfermeiro 1
(1, 2),  -- Internação 1 com Enfermeiro 2
(2, 2),  -- Internação 2 com Enfermeiro 2
(2, 3),  -- Internação 2 com Enfermeiro 3
(3, 1),  -- Internação 3 com Enfermeiro 1
(3, 4),  -- Internação 3 com Enfermeiro 4
(4, 3),  -- Internação 4 com Enfermeiro 3
(4, 5),  -- Internação 4 com Enfermeiro 5
(5, 6),  -- Internação 5 com Enfermeiro 6
(6, 7),  -- Internação 6 com Enfermeiro 7
(6, 8);  -- Internação 6 com Enfermeiro 8
