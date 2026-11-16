-- ATUALIZAÇÃO 16/11 - BANCO DE DADOS DIDÁTICO DO SABOR & CIA
-- Execute no MySQL conectado ao VSCode.
-- Não cria uma ligação automática entre o site e o MySQL.

CREATE DATABASE IF NOT EXISTS sabor_cia
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE sabor_cia;

-- Usuários: cadastro e perfil
CREATE TABLE IF NOT EXISTS usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(120) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  senha_hash VARCHAR(255) NULL,
  data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Receitas: publicações dos usuários
CREATE TABLE IF NOT EXISTS receitas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT NOT NULL,
  titulo VARCHAR(180) NOT NULL,
  categoria VARCHAR(80),
  tempo_minutos INT,
  ingredientes TEXT,
  modo_preparo TEXT,
  data_publicacao DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- Favoritos: receitas salvas por cada usuário
CREATE TABLE IF NOT EXISTS favoritos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT NOT NULL,
  receita_id INT NOT NULL,
  data_favorito DATETIME DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY unico_favorito (usuario_id, receita_id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  FOREIGN KEY (receita_id) REFERENCES receitas(id)
);

-- Comentários: opiniões sobre as receitas
CREATE TABLE IF NOT EXISTS comentarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT NOT NULL,
  receita_id INT NOT NULL,
  texto TEXT NOT NULL,
  avaliacao TINYINT,
  data_comentario DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  FOREIGN KEY (receita_id) REFERENCES receitas(id)
);

-- Mesmos cinco usuários fictícios do arquivo JSON (sem senhas no SQL).
INSERT INTO usuarios (id, nome, email) VALUES
(1,'Ana Silva','ana@saborcia.exemplo'),
(2,'Carlos Souza','carlos@saborcia.exemplo'),
(3,'Beatriz Lima','beatriz@saborcia.exemplo'),
(4,'Daniel Alves','daniel@saborcia.exemplo'),
(5,'Fernanda Costa','fernanda@saborcia.exemplo')
ON DUPLICATE KEY UPDATE nome=VALUES(nome);

-- Testes:
SHOW TABLES;
SELECT id, nome, email FROM usuarios;
