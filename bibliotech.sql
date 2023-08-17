CREATE TABLE `LIVRO`(
    `cod_livro` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `titulo` VARCHAR(50) NOT NULL,
    `genero` VARCHAR(50) NOT NULL,
    `dt_publicacao` DATE NOT NULL,
    `status` VARCHAR(50) NOT NULL,
    `autor` VARCHAR(120) NOT NULL,
    `editora` VARCHAR(50) NOT NULL
);

CREATE TABLE `USUARIO`(
    `id_usuario` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nome` VARCHAR(120) NOT NULL,
    `dt_nascimento` DATE NOT NULL,
    `endereco` VARCHAR(120) NOT NULL,
    `telefone` VARCHAR(50) NOT NULL,
    `email` VARCHAR(50) NOT NULL
);

CREATE TABLE `EMPRESTIMO`(
    `cod_emprestimo` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `dt_emprestimo` DATE NOT NULL,
    `dt_prev_devolucao` DATE NOT NULL,
    `dt_real_devolucao` DATE DEFAULT NULL,
    `cod_livro` INT NOT NULL,
    `id_usuario` INT NOT NULL
);

ALTER TABLE
    `EMPRESTIMO` ADD CONSTRAINT `emprestimo_cod_livro_foreign` FOREIGN KEY(`cod_livro`) REFERENCES `LIVRO`(`cod_livro`);

ALTER TABLE
    `EMPRESTIMO` ADD CONSTRAINT `emprestimo_id_usuario_foreign` FOREIGN KEY(`id_usuario`) REFERENCES `USUARIO`(`id_usuario`);