SELECT 
    u.nome AS Morador,
    u.telefone AS Contato,
    i.titulo AS Titulo_Do_Livro,
    e.data_devolucao_prevista AS Data_Limite,
    DATEDIFF(CURDATE(), e.data_devolucao_prevista) AS Dias_De_Atraso
FROM Emprestimo e
JOIN Usuario u ON e.id_usuario = u.id_usuario
JOIN ItemAcervo i ON e.id_item = i.id_item
WHERE e.status_devolucao_real IS NULL 
  AND e.data_devolucao_prevista < CURDATE();
