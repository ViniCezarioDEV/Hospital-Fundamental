ALTER TABLE `medico` ADD COLUMN `em_atividade` BOOLEAN NOT NULL DEFAULT TRUE;

-- Atualizando os médicos para definir se estão ativos ou inativos
UPDATE `medico`
SET `em_atividade` = FALSE
WHERE `id_medico` IN (1, 3); -- Definindo os médicos com IDs 1 e 3 como inativos

UPDATE `medico`
SET `em_atividade` = TRUE
WHERE `id_medico` NOT IN (1, 3); -- Definindo todos os outros médicos como ativos