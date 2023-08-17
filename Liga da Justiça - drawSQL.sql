CREATE TABLE `HABILIDADE`(
    `cd_habilidade` INT NOT NULL,
    `nome` VARCHAR(50) NOT NULL,
    `descricao` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `HABILIDADE` ADD PRIMARY KEY(`cd_habilidade`);
CREATE TABLE `VILAO`(
    `cd_vilao` INT NOT NULL,
    `nome` VARCHAR(50) NOT NULL,
    `peso` DECIMAL(8, 2) NOT NULL,
    `altura` DECIMAL(8, 2) NOT NULL,
    `dt_nasc` DATE NOT NULL
);
ALTER TABLE
    `VILAO` ADD PRIMARY KEY(`cd_vilao`);
CREATE TABLE `ATENDIMENTO`(
    `cd_atendimento` INT NOT NULL,
    `data` DATE NOT NULL,
    `tempo` TIME NOT NULL,
    `observacao` VARCHAR(255) NOT NULL,
    `cd_maldade` INT NOT NULL,
    `cd_heroi` INT NOT NULL
);
ALTER TABLE
    `ATENDIMENTO` ADD PRIMARY KEY(`cd_atendimento`);
CREATE TABLE `REGISTRO_HABILIDADE`(
    `id` INT NOT NULL,
    `cd_heroi` INT NOT NULL,
    `cd_habilidade` INT NOT NULL
);
ALTER TABLE
    `REGISTRO_HABILIDADE` ADD PRIMARY KEY(`id`);
CREATE TABLE `HEROI`(
    `cd_heroi` INT NOT NULL,
    `nome` VARCHAR(50) NOT NULL,
    `peso` DECIMAL(8, 2) NOT NULL,
    `altura` DECIMAL(8, 2) NOT NULL,
    `dt_nasc` DATE NOT NULL
);
ALTER TABLE
    `HEROI` ADD PRIMARY KEY(`cd_heroi`);
CREATE TABLE `MALDADE`(
    `cd_maldade` INT NOT NULL,
    `nome` VARCHAR(50) NOT NULL,
    `descricao` VARCHAR(255) NOT NULL,
    `cd_vilao` INT NOT NULL
);
ALTER TABLE
    `MALDADE` ADD PRIMARY KEY(`cd_maldade`);
ALTER TABLE
    `ATENDIMENTO` ADD CONSTRAINT `atendimento_cd_maldade_foreign` FOREIGN KEY(`cd_maldade`) REFERENCES `MALDADE`(`cd_maldade`);
ALTER TABLE
    `REGISTRO_HABILIDADE` ADD CONSTRAINT `registro_habilidade_cd_habilidade_foreign` FOREIGN KEY(`cd_habilidade`) REFERENCES `HABILIDADE`(`cd_habilidade`);
ALTER TABLE
    `MALDADE` ADD CONSTRAINT `maldade_cd_vilao_foreign` FOREIGN KEY(`cd_vilao`) REFERENCES `VILAO`(`cd_vilao`);
ALTER TABLE
    `REGISTRO_HABILIDADE` ADD CONSTRAINT `registro_habilidade_cd_heroi_foreign` FOREIGN KEY(`cd_heroi`) REFERENCES `HEROI`(`cd_heroi`);
ALTER TABLE
    `ATENDIMENTO` ADD CONSTRAINT `atendimento_cd_heroi_foreign` FOREIGN KEY(`cd_heroi`) REFERENCES `HEROI`(`cd_heroi`);