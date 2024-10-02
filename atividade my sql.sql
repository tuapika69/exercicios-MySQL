-- 1. Identificar departamentos com mais de 15 funcionários
SELECT * FROM departamento
WHERE qtdfuncionariosdepto > 15;

-- 2. Selecionar os nomes dos funcionários cujo salário é maior ou igual a R$ 4.000
SELECT nome_funcionario
FROM funcionario
WHERE salario >= 4000;

-- 3. Calcular a média salarial dos funcionários
SELECT AVG(salario) AS media_salarial
FROM funcionario;

-- 4. Calcular a média salarial com duas casas decimais
SELECT ROUND(AVG(salario), 2) AS media_salarial
FROM funcionario;

-- 5. Encontrar funcionários cujo nome contém "Gomes"
SELECT nome_funcionario
FROM funcionario
WHERE nome_funcionario LIKE '%Gomes%';

-- 6. Calcular o salário anual de todos os funcionários
SELECT nome_funcionario, salario * 12 AS salario_anual
FROM funcionario;

-- 7. Identificar o funcionário com o salário mais alto
SELECT *
FROM funcionario
WHERE salario = (SELECT MAX(salario) FROM funcionario);

-- 8. Identificar os 2 salários mais altos
SELECT DISTINCT salario
FROM funcionario
ORDER BY salario DESC
LIMIT 2;

-- 9. Identificar o funcionário mais velho de cada cargo
SELECT *
FROM funcionario
WHERE idade IN (SELECT MAX(idade) FROM funcionario GROUP BY cargo);

-- 10. Encontrar departamentos com pelo menos um funcionário com salário superior a R$ 5.000
SELECT DISTINCT departamento.*
FROM departamento
JOIN funcionario ON departamento.sigla_depto = funcionario.sigla_depto
WHERE funcionario.salario > 5000;

-- 11. Encontrar departamentos onde pelo menos um funcionário tem um salário superior à média de todos
SELECT DISTINCT departamento.*
FROM departamento
JOIN funcionario ON departamento.sigla_depto = funcionario.sigla_depto
WHERE funcionario.salario > (SELECT AVG(salario) FROM funcionario);

-- 12. Encontrar departamentos com pelo menos um funcionário cujo nome contenha "Costa"
SELECT DISTINCT departamento.*
FROM departamento
JOIN funcionario ON departamento.sigla_depto = funcionario.sigla_depto
WHERE funcionario.nome_funcionario LIKE '%Costa%';

-- 13. Encontrar departamentos onde pelo menos um funcionário tem um salário superior à média do seu departamento
SELECT DISTINCT departamento.*
FROM departamento
JOIN funcionario ON departamento.sigla_depto = funcionario.sigla_depto
WHERE funcionario.salario > (
    SELECT AVG(salario)
    FROM funcionario
    WHERE sigla_depto = departamento.sigla_depto
);
