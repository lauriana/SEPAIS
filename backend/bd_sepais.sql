
CREATE DATABASE IF NOT EXISTS `sepaisdb`;
USE `sepaisdb`;

-- Cria a tabela `turma`
CREATE TABLE IF NOT EXISTS `turma` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Insere turmas necessárias para evitar problemas de referência
INSERT INTO `turma` (id, nome) VALUES 
(1, 'Turma A'), 
(2, 'Turma B'), 
(3, 'Turma C'), 
(4, 'Turma D'), 
(5, 'Turma E'), 
(6, 'Turma F'), 
(7, 'Turma G'), 
(8, 'Turma H'), 
(9, 'Turma I'), 
(10, 'Turma J');

-- Cria a tabela `aluno`
CREATE TABLE IF NOT EXISTS `aluno` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(144) NOT NULL,
  `foto_path` VARCHAR(144) NOT NULL,
  `turma_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_aluno_turma1_idx` (`turma_id`),
  CONSTRAINT `fk_aluno_turma1` FOREIGN KEY (`turma_id`) REFERENCES `turma` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Insere alunos, garantindo que `turma_id` seja válido
INSERT INTO `aluno` (id, nome, foto_path, turma_id) VALUES
(1, 'Mateus', 'nenhum', 1),
(2, 'Mariana', 'nenhum', 4),
(3, 'Paulo', 'nenhum', 5),
(4, 'Luan', 'nenhum', 6),
(5, 'Mario', 'nenhum', 2),
(6, 'Luigi', 'nenhum', 2),
(7, 'Wario', 'nenhum', 3),
(8, 'Waluigi', 'nenhum', 7),
(10, 'Sonic', 'nenhum', 8),
(11, 'Bart Simpson', 'nenhum', 2),
(12, 'Homer Simpson', 'nenhum', 5),
(13, 'Marge Simpson', 'nenhum', 1),
(14, 'Lisa Simpson', 'nenhum', 3),
(15, 'Maggie Simpson', 'nenhum', 7),
(16, 'Ned Flanders', 'nenhum', 4),
(17, 'Moe Szyslak', 'nenhum', 6),
(18, 'Apu Nahasapeemapetilon', 'nenhum', 3),
(19, 'Krusty the Clown', 'nenhum', 8),
(20, 'Barney Gumble', 'nenhum', 5),
(21, 'Chief Wiggum', 'nenhum', 2),
(22, 'Mr. Burns', 'nenhum', 1),
(23, 'Ned Flanders', 'nenhum', 6),
(24, 'Sideshow Bob', 'nenhum', 7),
(25, 'Groundskeeper Willie', 'nenhum', 4),
(26, 'Professor Frink', 'nenhum', 2),
(27, 'Waylon Smithers', 'nenhum', 3),
(28, 'Selma Bouvier', 'nenhum', 8),
(29, 'Squeaky-Voiced Teen', 'nenhum', 1),
(30, 'Kang and Kodos', 'nenhum', 5),
(31, 'Lara Croft', 'static/default_user_icon.jpg', 4),
(32, 'Sherlock Holmes', 'static/default_user_icon.jpg', 1),
(33, 'Geralt Da Rívia', 'static/default_user_icon.jpg', 7),
(34, 'Frodo Bolseiro', 'static/default_user_icon.jpg', 8),
(35, 'Samwise Gamgee', 'static/default_user_icon.jpg', 9),
(36, 'Luke Skywalker', 'static/default_user_icon.jpg', 9),
(37, 'Leia Organa', 'static/default_user_icon.jpg', 10);

-- Cria a tabela `responsavel`
CREATE TABLE IF NOT EXISTS `responsavel` (
  `email` VARCHAR(144) NOT NULL,
  `telefone` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Insere responsáveis
INSERT INTO `responsavel` (email, telefone) VALUES
('bilbo.bolseiro@ifpr.edu.br', '11768970088'),
('bonnie@hotmail.com', '11321312313'),
('charliebrown@gmail.com', '98765432100'),
('chica@yahoo.com', '33333333333'),
('darth.vader@gmail.com', '31545364564'),
('eggman.robotnik@gmail.com', '12345678912'),
('foxy@gmail.com', '41777777777'),
('francesco.bernoulli@gmail.com', '12345678935'),
('franklin@gmail.com', '45612398700'),
('hermione.granger@hogwarts.edu.br', '21912345678'),
('king.boo@gmail.com', '12345678944'),
('kratos@gmail.com', '12345678933'),
('linus@gmail.com', '55555555501'),
('lucy@gmail.com', '12345678901'),
('marcie@gmail.com', '12398745600'),
('neymar.junior@gmail.com', '56345678977'),
('peppermint@gmail.com', '24681357900'),
('peppermintfriend@gmail.com', '98712398700'),
('pigpen@gmail.com', '45698712300'),
('rerun@gmail.com', '98745612300'),
('ruce.wayne@gothamcorp.com', '11987654321'),
('sallybrown@gmail.com', '12398712300'),
('schroeder@gmail.com', '13579246801'),
('scooby.doo@gmail.com', '42113325534'),
('snoopy@gmail.com', '13136465468'),
('tony.stark@starkindustries.com', '31998765432'),
('woodstock@gmail.com', '98712345600');

-- Cria a tabela `responsavel_has_aluno`
CREATE TABLE IF NOT EXISTS `responsavel_has_aluno` (
  `aluno_id` INT NOT NULL,
  `responsavel_email` VARCHAR(144) NOT NULL,
  PRIMARY KEY (`aluno_id`, `responsavel_email`),
  CONSTRAINT `fk_responsavel_has_aluno_responsavel1` FOREIGN KEY (`responsavel_email`) REFERENCES `responsavel` (`email`),
  CONSTRAINT `fk_responsavel_has_alunos_alunos1` FOREIGN KEY (`aluno_id`) REFERENCES `aluno` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Insere relação entre responsáveis e alunos
INSERT INTO `responsavel_has_aluno` (aluno_id, responsavel_email) VALUES
(1, 'chica@yahoo.com'),
(1, 'kratos@gmail.com'),
(2, 'chica@yahoo.com'),
(2, 'eggman.robotnik@gmail.com'),
(2, 'hermione.granger@hogwarts.edu.br'),
(3, 'eggman.robotnik@gmail.com'),
(3, 'kratos@gmail.com'),
(3, 'neymar.junior@gmail.com'),
(4, 'foxy@gmail.com'),
(5, 'francesco.bernoulli@gmail.com'),
(10, 'darth.vader@gmail.com');
