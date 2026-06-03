CREATE DATABASE projeto_educar_container;
USE projeto_educar_container;
CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    endereco VARCHAR(255),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Voluntario (
    id_voluntario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    ativo BOOLEAN DEFAULT TRUE
);
CREATE TABLE ItemAcervo (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100),
    tipo ENUM('Livro', 'Revista') NOT NULL,
    status_disponibilidade ENUM('Disponivel', 'Emprestado', 'Manutencao') DEFAULT 'Disponivel'
);
CREATE TABLE Emprestimo (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_voluntario INT NOT NULL,
    id_item INT NOT NULL,
    data_saida DATE NOT NULL,
    data_devolucao_prevista DATE NOT NULL,
    data_devolucao_real DATE NULL,
    status_emprestimo ENUM('Ativo', 'Devolvido', 'Atrasado') DEFAULT 'Ativo',
    CONSTRAINT fk_emprestimo_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    CONSTRAINT fk_emprestimo_voluntario FOREIGN KEY (id_voluntario) REFERENCES Voluntario(id_voluntario),
    CONSTRAINT fk_emprestimo_item FOREIGN KEY (id_item) REFERENCES ItemAcervo(id_item)
);
