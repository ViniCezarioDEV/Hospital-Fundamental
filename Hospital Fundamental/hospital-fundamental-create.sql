USE hospital_fundamental;

CREATE TABLE IF NOT EXISTS `medico` (
    `id_medico` INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
    `nome` VARCHAR(512) NOT NULL UNIQUE,
    `cpf` VARCHAR(20) NOT NULL UNIQUE,
    `registro_do_conselho_de_enfermagem` VARCHAR(50) NOT NULL UNIQUE,
    `tipo_do_medico` ENUM('generalista', 'especialista', 'residente') NOT NULL,
    `especialidade_do_medico` ENUM('pediatra', 'clinica_geral', 'gastroenterologia', 'dermatologia') NOT NULL
);

CREATE TABLE IF NOT EXISTS `paciente` (
    `id_paciente` INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
    `nome` VARCHAR(512) NOT NULL UNIQUE,
    `data_nascimento` DATE NOT NULL,
    `endereco` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `cpf` VARCHAR(20) NOT NULL UNIQUE,
    `rg` INT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS `consulta` (
    `id_consulta` INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
    `data_marcada` DATE NOT NULL,
    `hora_de_realizacao` TIME NOT NULL,
    `valor_da_consulta` FLOAT(15) NOT NULL,
    `id_medico` INT NOT NULL,  -- Chave estrangeira para o médico
    `id_paciente` INT NOT NULL, -- Chave estrangeira para o paciente
    FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`),
    FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`)
);

CREATE TABLE IF NOT EXISTS `convenio` (
    `nome_convenio` VARCHAR(255) NOT NULL,
    `cnpj_convenio` INT NOT NULL,
    `tempo_carencia` INT NOT NULL,
    `numero_da_carteira_do_convenio` INT NOT NULL UNIQUE,
    `id_paciente` INT,  -- Chave estrangeira para paciente
    FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`)
);

CREATE TABLE IF NOT EXISTS `internacao` (
    `id_internacao` INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
    `data_de_entrada` DATE NOT NULL,
    `data_prevista_de_alta` DATE NOT NULL,
    `data_da_alta` DATE NOT NULL,
    `descricao_do_procedimento` VARCHAR(510) NOT NULL,
    `id_paciente` INT NOT NULL, -- Chave estrangeira para paciente
    `id_medico` INT NOT NULL, -- Chave estrangeira para médico
    FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`),
    FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`)
);

CREATE TABLE IF NOT EXISTS `quarto` (
    `numero_do_quarto` INT NOT NULL,
    `descricao_do_quarto` VARCHAR(255) NOT NULL,
    `valor_diaria` FLOAT(10) NOT NULL,
    `tipo_do_quarto` ENUM('apartamento', 'quarto_duplo', 'enfermagem') NOT NULL,
    `id_internacao` INT, -- Chave estrangeira para internação
    FOREIGN KEY (`id_internacao`) REFERENCES `internacao` (`id_internacao`)
);

CREATE TABLE IF NOT EXISTS `receita` (
    `id_receita` INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
    `medicamentos_usados` TEXT NOT NULL,
    `quantidade_de_medicamentos` INT NOT NULL,
    `instrucoes_de_uso_dos_medicamentos` VARCHAR(510) NOT NULL,
    `id_consulta` INT NOT NULL, -- Chave estrangeira para a consulta
    `id_medico` INT NOT NULL, -- Chave estrangeira para o médico
    FOREIGN KEY (`id_consulta`) REFERENCES `consulta` (`id_consulta`),
    FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`)
);
