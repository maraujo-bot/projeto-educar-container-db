
INSERT INTO Voluntario (nome, email) VALUES ('Ana Silva', 'ana.educar@email.com');
INSERT INTO Usuario (nome, telefone, endereco) VALUES ('Carlos Souza', '92991112222', 'Rua 2, Compensa, Manaus');
INSERT INTO ItemAcervo (titulo, autor, tipo) VALUES ('O Alquimista', 'Paulo Coelho', 'Livro');
INSERT INTO ItemAcervo (titulo, autor, tipo) VALUES ('Revista Superinteressante Ed. 450', 'Abril', 'Revista');
INSERT INTO Emprestimo (id_usuario, id_voluntario, id_item, data_saida, data_devolucao_prevista) 
VALUES (1, 1, 1, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 14 DAY));
UPDATE ItemAcervo SET status_disponibilidade = 'Emprestado' WHERE id_item = 1;
