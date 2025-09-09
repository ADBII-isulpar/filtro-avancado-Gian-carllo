-- 1.
SELECT f.nome_funcionario, CAST(f.salario AS SIGNED) AS salario
FROM Funcionario f
JOIN Departamento d ON f.id_departamento = d.id_departamento
WHERE d.nome_departamento = 'Vendas' AND f.salario > 2500;

-- 2.
SELECT f.nome_funcionario, d.nome_departamento, p.nome_projeto
FROM Funcionario f
JOIN Departamento d ON f.id_departamento = d.id_departamento
JOIN Funcionario_Projeto fp ON f.id_funcionario = fp.id_funcionario
JOIN Projeto p ON fp.id_projeto = p.id_projeto;

-- 3.
SELECT d.nome_departamento, CAST(AVG(f.salario) AS SIGNED) AS salario_medio
FROM Funcionario f
JOIN Departamento d ON f.id_departamento = d.id_departamento
GROUP BY d.nome_departamento;

-- 4.
SELECT d.nome_departamento, CAST(AVG(f.salario) AS SIGNED) AS salario_medio
FROM Funcionario f
JOIN Departamento d ON f.id_departamento = d.id_departamento
GROUP BY d.nome_departamento
HAVING CAST(AVG(f.salario) AS SIGNED) > 5000;

-- 5.
SELECT p.nome_projeto, COUNT(fp.id_funcionario) AS qtd_funcionarios
FROM Projeto p
LEFT JOIN Funcionario_Projeto fp ON p.id_projeto = fp.id_projeto
GROUP BY p.nome_projeto;

-- 6.
SELECT f.nome_funcionario, g.nome_funcionario AS gerente, d.nome_departamento
FROM Funcionario f
LEFT JOIN Funcionario g ON f.id_gerente = g.id_funcionario
JOIN Departamento d ON f.id_departamento = d.id_departamento;

-- 7.
SELECT f.nome_funcionario, p.nome_projeto
FROM Funcionario f
JOIN Funcionario_Projeto fp ON f.id_funcionario = fp.id_funcionario
JOIN Projeto p ON fp.id_projeto = p.id_projeto
WHERE f.id_funcionario IN (
    SELECT id_funcionario
    FROM Funcionario_Projeto
    GROUP BY id_funcionario
    HAVING COUNT(id_projeto) > 1
);

-- 8.
SELECT p.nome_projeto
FROM Projeto p
LEFT JOIN Funcionario_Projeto fp ON p.id_projeto = fp.id_projeto
WHERE fp.id_funcionario IS NULL;

-- 9.
SELECT d.nome_departamento, CAST(SUM(f.salario) AS SIGNED) AS total_salarios
FROM Funcionario f
JOIN Departamento d ON f.id_departamento = d.id_departamento
GROUP BY d.nome_departamento;

-- 10.
SELECT f.nome_funcionario, COUNT(fp.id_projeto) AS qtd_projetos
FROM Funcionario f
LEFT JOIN Funcionario_Projeto fp ON f.id_funcionario = fp.id_funcionario
GROUP BY f.nome_funcionario;
