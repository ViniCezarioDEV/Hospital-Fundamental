CREATE TABLE IF NOT EXISTS `medico` (
	`nome` int AUTO_INCREMENT NOT NULL UNIQUE,
	`cpf` varchar(20) NOT NULL,
	`registro_do_conselho_de_enfermagem` varchar(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS `tipo_do_medico` (
	`generalista` int AUTO_INCREMENT NOT NULL UNIQUE,
	`especialista` boolean NOT NULL,
	`residente` boolean NOT NULL
);

CREATE TABLE IF NOT EXISTS `especialidade_do_medico` (
	`pediatra` int AUTO_INCREMENT NOT NULL UNIQUE,
	`clinica_geral` boolean NOT NULL,
	`gastroenterologia` boolean NOT NULL,
	`dermatologia` boolean NOT NULL
);

CREATE TABLE IF NOT EXISTS `consulta` (
	`data_marcada` int AUTO_INCREMENT NOT NULL UNIQUE,
	`hora_de_realizacao` datetime NOT NULL,
	`nome_do_medico_responsavel` varchar(255) NOT NULL,
	`valor_da_consulta` float NOT NULL
);

CREATE TABLE IF NOT EXISTS `paciente` (
	`nome` int AUTO_INCREMENT NOT NULL UNIQUE,
	`data_nascimento` date NOT NULL,
	`endereco` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`cpf` varchar(20) NOT NULL,
	`rg` int NOT NULL
);

CREATE TABLE IF NOT EXISTS `convenio` (
	`nome` int AUTO_INCREMENT NOT NULL UNIQUE,
	`cnpj` int NOT NULL,
	`tempo_carencia` int NOT NULL,
	`numero_da_carteira_do_convenio` int NOT NULL
);

CREATE TABLE IF NOT EXISTS `internacao` (
	`data_de_entrada` int AUTO_INCREMENT NOT NULL UNIQUE,
	`data_prevista_de_alta` date NOT NULL,
	`data_da_alta` date NOT NULL,
	`descricao_do_procedimento` varchar(510) NOT NULL
);

CREATE TABLE IF NOT EXISTS `quarto` (
	`descricao_do_quarto` int AUTO_INCREMENT NOT NULL UNIQUE,
	`valor_diaria` float NOT NULL,
	`numero_do_quarto` int NOT NULL
);

CREATE TABLE IF NOT EXISTS `tipo_do_quarto` (
	`apartamento` int AUTO_INCREMENT NOT NULL UNIQUE,
	`quarto_duplo` boolean NOT NULL,
	`enfermagem` boolean NOT NULL
);

CREATE TABLE IF NOT EXISTS `receita` (
	`medicamentos_usados` int AUTO_INCREMENT NOT NULL UNIQUE,
	`quantidade_de_medicamentos` int NOT NULL,
	`instrucoes_de_uso_dos_medicamentos` varchar(510) NOT NULL
);










