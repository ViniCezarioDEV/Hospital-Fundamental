USE hospital_fundamental;

-- Criar tabelas sem chaves estrangeiras inicialmente
CREATE TABLE IF NOT EXISTS `especialidade` (
    `id_especialidade` INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
    `descricao` VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS `medico` (
    `id_medico` INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
    `nome` VARCHAR(512) NOT NULL UNIQUE,
    `cpf` VARCHAR(20) NOT NULL UNIQUE,
    `registro_do_conselho_de_enfermagem` VARCHAR(50) NOT NULL UNIQUE
);

-- Tabela de relacionamento médico e especialidade
CREATE TABLE IF NOT EXISTS `medico_especialidade` (
    `id_medico` INT NOT NULL,
    `id_especialidade` INT NOT NULL,
    PRIMARY KEY (`id_medico`, `id_especialidade`)
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

CREATE TABLE IF NOT EXISTS `quarto` (
    `numero_do_quarto` INT NOT NULL,
    `descricao_do_quarto` VARCHAR(255) NOT NULL,
    `valor_diaria` FLOAT(10) NOT NULL,
    `tipo_do_quarto` ENUM('apartamento', 'quarto_duplo', 'enfermagem') NOT NULL,
    PRIMARY KEY (`numero_do_quarto`) -- Definir como chave primária
);

CREATE TABLE IF NOT EXISTS `internacao` (
    `id_internacao` INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
    `data_de_entrada` DATE NOT NULL,
    `data_prevista_de_alta` DATE NOT NULL,
    `data_da_alta` DATE NOT NULL,
    `descricao_do_procedimento` VARCHAR(510) NOT NULL,
    `id_paciente` INT NOT NULL, -- Chave estrangeira para paciente
    `id_medico` INT NOT NULL, -- Chave estrangeira para médico
    `id_quarto` INT NOT NULL -- Chave estrangeira para quarto
);

CREATE TABLE IF NOT EXISTS `enfermeiro` (
    `id_enfermeiro` INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
    `nome` VARCHAR(512) NOT NULL,
    `cpf` VARCHAR(20) NOT NULL UNIQUE,
    `registro_enfermagem` VARCHAR(50) NOT NULL UNIQUE
);

-- Tabela de relacionamento entre internação e enfermeiro
CREATE TABLE IF NOT EXISTS `internacao_enfermeiro` (
    `id_internacao` INT NOT NULL,
    `id_enfermeiro` INT NOT NULL,
    PRIMARY KEY (`id_internacao`, `id_enfermeiro`)
);

CREATE TABLE IF NOT EXISTS `consulta` (
    `id_consulta` INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
    `data_marcada` DATE NOT NULL,
    `hora_de_realizacao` TIME NOT NULL,
    `valor_da_consulta` FLOAT(15) NOT NULL,
    `id_medico` INT NOT NULL,  -- Chave estrangeira para o médico
    `id_paciente` INT NOT NULL -- Chave estrangeira para o paciente
);

CREATE TABLE IF NOT EXISTS `convenio` (
    `nome_convenio` VARCHAR(255) NOT NULL,
    `cnpj_convenio` VARCHAR(20) NOT NULL,
    `tempo_carencia` INT NOT NULL,
    `numero_da_carteira_do_convenio` INT NOT NULL UNIQUE,
    `id_paciente` INT,  -- Chave estrangeira para paciente
    `id_medico` INT -- Chave estrangeira para médico
);

CREATE TABLE IF NOT EXISTS `receita` (
    `id_receita` INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
    `medicamentos_usados` TEXT NOT NULL,
    `quantidade_de_medicamentos` INT NOT NULL,
    `instrucoes_de_uso_dos_medicamentos` VARCHAR(510) NOT NULL,
    `id_consulta` INT NOT NULL, -- Chave estrangeira para a consulta
    `id_medico` INT NOT NULL -- Chave estrangeira para o médico
);

-- Adicionar as chaves estrangeiras agora
ALTER TABLE `medico_especialidade`
ADD FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`) ON DELETE CASCADE,
ADD FOREIGN KEY (`id_especialidade`) REFERENCES `especialidade` (`id_especialidade`) ON DELETE CASCADE;

ALTER TABLE `internacao`
ADD FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`),
ADD FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`),
ADD FOREIGN KEY (`id_quarto`) REFERENCES `quarto` (`numero_do_quarto`);

ALTER TABLE `internacao_enfermeiro`
ADD FOREIGN KEY (`id_internacao`) REFERENCES `internacao` (`id_internacao`),
ADD FOREIGN KEY (`id_enfermeiro`) REFERENCES `enfermeiro` (`id_enfermeiro`);

ALTER TABLE `consulta`
ADD FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`),
ADD FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`);

ALTER TABLE `convenio`
ADD FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`),
ADD FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`);

ALTER TABLE `receita`
ADD FOREIGN KEY (`id_consulta`) REFERENCES `consulta` (`id_consulta`),
ADD FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`);
