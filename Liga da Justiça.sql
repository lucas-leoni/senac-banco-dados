-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/MLkDMx
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

CREATE TABLE `HEROI` (
    `cd_heroi` int  NOT NULL ,
    `nome` varchar(50)  NOT NULL ,
    `peso` decimal  NOT NULL ,
    `altura` decimal  NOT NULL ,
    `dt_nasc` date  NOT NULL ,
    PRIMARY KEY (
        `cd_heroi`
    )
);

CREATE TABLE `HABILIDADE` (
    `cd_habilidade` int  NOT NULL ,
    `nome` varchar(50)  NOT NULL ,
    `descricao` varchar(255)  NOT NULL ,
    PRIMARY KEY (
        `cd_habilidade`
    )
);

CREATE TABLE `REGISTRO_HABILIDADE` (
    `id` int  NOT NULL ,
    `cd_heroi` int  NOT NULL ,
    `cd_habilidade` int  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

CREATE TABLE `VILAO` (
    `cd_vilao` int  NOT NULL ,
    `nome` varchar(50)  NOT NULL ,
    `peso` decimal  NOT NULL ,
    `altura` decimal  NOT NULL ,
    `dt_nasc` date  NOT NULL ,
    PRIMARY KEY (
        `cd_vilao`
    )
);

CREATE TABLE `MALDADE` (
    `cd_maldade` int  NOT NULL ,
    `nome` varchar(50)  NOT NULL ,
    `descricao` varchar(255)  NOT NULL ,
    `cd_vilao` int  NOT NULL ,
    PRIMARY KEY (
        `cd_maldade`
    )
);

CREATE TABLE `ATENDIMENTO` (
    `cd_atendimento` int  NOT NULL ,
    `data` date  NOT NULL ,
    `tempo` time  NOT NULL ,
    `observacao` varchar(255)  NOT NULL ,
    `cd_maldade` int  NOT NULL ,
    `cd_heroi` int  NOT NULL ,
    PRIMARY KEY (
        `cd_atendimento`
    )
);

ALTER TABLE `REGISTRO_HABILIDADE` ADD CONSTRAINT `fk_REGISTRO_HABILIDADE_cd_heroi` FOREIGN KEY(`cd_heroi`)
REFERENCES `HEROI` (`cd_heroi`);

ALTER TABLE `REGISTRO_HABILIDADE` ADD CONSTRAINT `fk_REGISTRO_HABILIDADE_cd_habilidade` FOREIGN KEY(`cd_habilidade`)
REFERENCES `HABILIDADE` (`cd_habilidade`);

ALTER TABLE `MALDADE` ADD CONSTRAINT `fk_MALDADE_cd_vilao` FOREIGN KEY(`cd_vilao`)
REFERENCES `VILAO` (`cd_vilao`);

ALTER TABLE `ATENDIMENTO` ADD CONSTRAINT `fk_ATENDIMENTO_cd_maldade` FOREIGN KEY(`cd_maldade`)
REFERENCES `MALDADE` (`cd_maldade`);

ALTER TABLE `ATENDIMENTO` ADD CONSTRAINT `fk_ATENDIMENTO_cd_heroi` FOREIGN KEY(`cd_heroi`)
REFERENCES `HEROI` (`cd_heroi`);

