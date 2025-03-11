-- 1. Consulta para listar todos os mercados com suas localizações e horários de funcionamento
SELECT nome, localizacao, horario_funcionamento 
FROM mercado;



-- 2. Consulta para contar quantos mercados estão localizados em cada estado
SELECT SUBSTRING_INDEX(localizacao, ',', -1) AS estado, COUNT(*) AS total_mercados
FROM mercado
GROUP BY estado;



-- 3. Consulta para encontrar o mercado com o maior horário de funcionamento
SELECT nome, horario_funcionamento, 
       TIME_FORMAT(SEC_TO_TIME(TIME_TO_SEC(SUBSTRING_INDEX(horario_funcionamento, '-', 1)) - TIME_TO_SEC(SUBSTRING_INDEX(horario_funcionamento, '-', -1))), '%H:%i') AS duracao
FROM mercado
ORDER BY TIME_TO_SEC(SUBSTRING_INDEX(horario_funcionamento, '-', 1)) - TIME_TO_SEC(SUBSTRING_INDEX(horario_funcionamento, '-', -1)) DESC
LIMIT 1;

