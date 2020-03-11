/*
SQLyog Enterprise - MySQL GUI v7.15 
MySQL - 5.5.21 : Database - ck999999
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`ck999999` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_bin */;

USE `ck999999`;

/*Table structure for table `a701` */

DROP TABLE IF EXISTS `a701`;

CREATE TABLE `a701` (
  `A7_COD` int(11) NOT NULL AUTO_INCREMENT,
  `A7_DESCRICAO` varchar(60) COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`A7_COD`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `a901` */

DROP TABLE IF EXISTS `a901`;

CREATE TABLE `a901` (
  `A9_CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `A9_DESC` varchar(150) COLLATE latin1_bin DEFAULT NULL,
  `A9_STATUS` varchar(1) COLLATE latin1_bin DEFAULT NULL,
  `A9_CODREV` int(11) DEFAULT NULL,
  `A9_APP` int(11) DEFAULT NULL,
  PRIMARY KEY (`A9_CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `aa01` */

DROP TABLE IF EXISTS `aa01`;

CREATE TABLE `aa01` (
  `AA_CODCHK` int(11) NOT NULL,
  `AA_CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `AA_DESC` varchar(120) COLLATE latin1_bin DEFAULT NULL,
  `AA_CODERP` int(11) DEFAULT NULL,
  `AA_CODANT` int(11) DEFAULT NULL,
  PRIMARY KEY (`AA_CODIGO`,`AA_CODCHK`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1 COLLATE=latin1_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `ab01` */

DROP TABLE IF EXISTS `ab01`;

CREATE TABLE `ab01` (
  `AB_CODCHK` int(11) NOT NULL,
  `AB_CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `AB_DESC` varchar(40) COLLATE latin1_bin DEFAULT NULL,
  `AB_CODANT` int(11) DEFAULT NULL,
  PRIMARY KEY (`AB_CODIGO`,`AB_CODCHK`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `ac01` */

DROP TABLE IF EXISTS `ac01`;

CREATE TABLE `ac01` (
  `AC_CODCHK` int(11) NOT NULL,
  `AC_CODTIPO` int(11) NOT NULL,
  `AC_CODGRUPO` int(11) NOT NULL,
  PRIMARY KEY (`AC_CODCHK`,`AC_CODTIPO`,`AC_CODGRUPO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `ad01` */

DROP TABLE IF EXISTS `ad01`;

CREATE TABLE `ad01` (
  `AD_CODCHK` int(11) NOT NULL,
  `AD_CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `AD_PERGUNTA` varchar(500) COLLATE latin1_bin DEFAULT NULL,
  `AD_TIPO` varchar(1) COLLATE latin1_bin DEFAULT NULL,
  `AD_STATUS` varchar(1) COLLATE latin1_bin DEFAULT NULL,
  `AD_CODANT` int(11) DEFAULT NULL,
  `AD_SEQ` int(11) DEFAULT NULL,
  PRIMARY KEY (`AD_CODIGO`,`AD_CODCHK`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1 COLLATE=latin1_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `ae01` */

DROP TABLE IF EXISTS `ae01`;

CREATE TABLE `ae01` (
  `AE_CODCHK` int(11) NOT NULL,
  `AE_GRUPO` int(11) NOT NULL,
  `AE_CODPER` int(11) NOT NULL,
  PRIMARY KEY (`AE_CODCHK`,`AE_GRUPO`,`AE_CODPER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `af01` */

DROP TABLE IF EXISTS `af01`;

CREATE TABLE `af01` (
  `AF_CODCHK` int(11) NOT NULL,
  `AF_CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `AF_RESPOSTA` varchar(50) COLLATE latin1_bin DEFAULT NULL,
  `AF_CODANT` int(11) DEFAULT NULL,
  PRIMARY KEY (`AF_CODCHK`,`AF_CODIGO`),
  KEY `AF_CODIGO` (`AF_CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `ag01` */

DROP TABLE IF EXISTS `ag01`;

CREATE TABLE `ag01` (
  `AG_CODCHK` int(11) NOT NULL,
  `AG_PERPAI` int(11) NOT NULL,
  `AG_PERFILHA` int(11) NOT NULL,
  `AG_CODRESPAI` int(11) DEFAULT NULL,
  PRIMARY KEY (`AG_CODCHK`,`AG_PERPAI`,`AG_PERFILHA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `ah01` */

DROP TABLE IF EXISTS `ah01`;

CREATE TABLE `ah01` (
  `AH_CODCHK` int(11) NOT NULL,
  `AH_CODPER` int(11) NOT NULL,
  `AH_CODRES` int(11) NOT NULL,
  `AH_ID` int(11) NOT NULL AUTO_INCREMENT,
  `AH_IDANT` int(11) DEFAULT NULL,
  PRIMARY KEY (`AH_CODCHK`,`AH_CODPER`,`AH_CODRES`),
  UNIQUE KEY `AF_ID` (`AH_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19319 DEFAULT CHARSET=latin1 COLLATE=latin1_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `ai01` */

DROP TABLE IF EXISTS `ai01`;

CREATE TABLE `ai01` (
  `AI_CODCHK` int(11) NOT NULL,
  `AI_CODPER` int(11) NOT NULL,
  `AI_CODRES` int(11) NOT NULL,
  PRIMARY KEY (`AI_CODCHK`,`AI_CODPER`,`AI_CODRES`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `aj01` */

DROP TABLE IF EXISTS `aj01`;

CREATE TABLE `aj01` (
  `AJ_CODCHK` int(11) NOT NULL,
  `AJ_CODGRP` int(11) NOT NULL,
  `AJ_CODRES` int(11) NOT NULL,
  `AJ_QTDRESTR` int(11) DEFAULT NULL,
  PRIMARY KEY (`AJ_CODCHK`,`AJ_CODRES`,`AJ_CODGRP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `ba01` */

DROP TABLE IF EXISTS `ba01`;

CREATE TABLE `ba01` (
  `BA_ID` int(11) NOT NULL AUTO_INCREMENT,
  `BA_PLACA` varchar(8) COLLATE latin1_bin NOT NULL,
  `BA_CHIP` varchar(30) COLLATE latin1_bin NOT NULL,
  `BA_TIPO` int(11) DEFAULT NULL,
  `BA_DESC` varchar(50) COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`BA_PLACA`,`BA_CHIP`),
  UNIQUE KEY `BA_ID` (`BA_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=242284 DEFAULT CHARSET=latin1 COLLATE=latin1_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `bb01` */

DROP TABLE IF EXISTS `bb01`;

CREATE TABLE `bb01` (
  `BB_CODCHK` int(11) DEFAULT NULL,
  `BB_CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `BB_CODUSER` int(11) DEFAULT NULL,
  `BB_PLACA` varchar(8) COLLATE latin1_bin DEFAULT NULL,
  `BB_CHIP` varchar(30) COLLATE latin1_bin DEFAULT NULL,
  `BB_DTCHECK` date DEFAULT NULL,
  `BB_HRCHECK` varchar(5) COLLATE latin1_bin DEFAULT NULL,
  `BB_OBS` varchar(500) COLLATE latin1_bin DEFAULT NULL,
  `BB_STATUS` varchar(2) COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`BB_CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=latin1 COLLATE=latin1_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `bc01` */

DROP TABLE IF EXISTS `bc01`;

CREATE TABLE `bc01` (
  `BC_CODCHK` int(11) NOT NULL,
  `BC_CODIGO` int(11) NOT NULL,
  `BC_CODPER` int(11) NOT NULL,
  `BC_ID` int(11) NOT NULL,
  PRIMARY KEY (`BC_CODCHK`,`BC_CODIGO`,`BC_ID`,`BC_CODPER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `checklistsrealizados` */

DROP TABLE IF EXISTS `checklistsrealizados`;

CREATE TABLE `checklistsrealizados` (
  `BB_PLACA` varchar(10) COLLATE latin1_bin NOT NULL,
  `BB_PERGUNTA` varchar(5) COLLATE latin1_bin NOT NULL,
  `BB_ID` varchar(4) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`BB_PLACA`,`BB_PERGUNTA`,`BB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `ex01` */

DROP TABLE IF EXISTS `ex01`;

CREATE TABLE `ex01` (
  `EX_ID` int(11) NOT NULL AUTO_INCREMENT,
  `EX_COD_INI` int(11) DEFAULT NULL,
  `EX_COD_END` int(11) DEFAULT NULL,
  `EX_DATA` datetime DEFAULT NULL,
  `EX_REEXP` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`EX_ID`),
  KEY `EX_COD_INI` (`EX_COD_INI`),
  KEY `EX_COD_END` (`EX_COD_END`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

/*Table structure for table `im01` */

DROP TABLE IF EXISTS `im01`;

CREATE TABLE `im01` (
  `IM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `IM_FILE` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `IM_LINES` int(11) DEFAULT NULL,
  `IM_DATA` datetime DEFAULT NULL,
  PRIMARY KEY (`IM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

/*Table structure for table `perguntasdochecklist` */

DROP TABLE IF EXISTS `perguntasdochecklist`;

CREATE TABLE `perguntasdochecklist` (
  `A9_CODIGO` double DEFAULT NULL,
  `A9_DESC` varchar(450) COLLATE latin1_bin DEFAULT NULL,
  `AA_CODIGO` double DEFAULT NULL,
  `AA_DESC` varchar(360) COLLATE latin1_bin DEFAULT NULL,
  `AB_CODIGO` double DEFAULT NULL,
  `AB_DESC` varchar(120) COLLATE latin1_bin DEFAULT NULL,
  `AD_CODIGO` double DEFAULT NULL,
  `AD_PERGUNTA` varchar(900) COLLATE latin1_bin DEFAULT NULL,
  `AF_CODIGO` double DEFAULT NULL,
  `AF_RESPOSTA` varchar(150) COLLATE latin1_bin DEFAULT NULL,
  `AH_ID` double DEFAULT NULL,
  `AD_TIPO` varchar(3) COLLATE latin1_bin DEFAULT NULL,
  `AG_PERFILHA` varchar(33) COLLATE latin1_bin DEFAULT NULL,
  `AI_CODPER` varchar(33) COLLATE latin1_bin DEFAULT NULL,
  `AJ_QTDRESTR` varchar(33) COLLATE latin1_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/* Procedure structure for procedure `hws_retornarespostasdochecklist` */

/*!50003 DROP PROCEDURE IF EXISTS  `hws_retornarespostasdochecklist` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`user_hwschecklis`@`%` PROCEDURE `hws_retornarespostasdochecklist`(in 	
			hws_checklist int,
			hws_dataini varchar(10), 
			hws_datafim varchar(10), 
			hws_placaini varchar(07),
			hws_placafim varchar(07))
begin
	/*verificando quantas respostas possui o checklist */
	declare cursorisdone_01 int default false;
	declare cursorisdone_02 int default false;
	declare vCAMPOS varchar(1000);
	declare vCAMPOS2 varchar(1000);
	declare hws_update varchar(1000);
	declare vCAMPOS_DE_RESPOSTAS varchar(1000);
	declare vBB_CODIGO varchar(11);
	declare vAF_CODIGO varchar(11);
	declare vAF_RESPOSTA varchar(50);
	declare vBB_PLACA varchar(07);
	declare vAD_CODIGO varchar(11);
	declare vAD_PERGUNTA varchar(300);
	declare hws_instrucao varchar(8000);
	declare hws_cursor_respostas_do_checklist cursor for			
		select cast(AF_CODIGO as char(11)) as AF_CODIGO,AF_RESPOSTA from AF01 where AF_CODCHK = hws_checklist;
	declare hws_cursos_busca_respostas cursor for
		select
		lpad(cast(BB_CODIGO as char(11)),11,0) as BB_CODIGO,	
		BB_PLACA,
		lpad(cast(AD_CODIGO as char(11)),6,0) as AD_CODIGO,
		AD_PERGUNTA,
		lpad(cast(AF_CODIGO as char(11)),6,0) as AF_CODIGO,
		AF_RESPOSTA
		from
		BB01
		inner join BC01 on BC_CODCHK = BB_CODCHK and BC_CODIGO = BB_CODIGO
		inner join AD01 on AD_CODCHK = BB_CODCHK and AD_CODIGO = BC_CODPER
		inner join AH01 on AH_CODCHK = BB_CODCHK and AH_ID     = BC_ID
		inner join AF01 on AF_CODCHK = BB_CODCHK and AF_CODIGO = AH_CODRES
		where
		BB_CODCHK = hws_checklist and
		BB_PLACA between hws_placaini and hws_placafim and
		BB_DTCHECK between hws_dataini and hws_datafim
		order by
		BB_CODIGO,
		BB_PLACA,
		AD_CODIGO;
	declare continue handler for not found set cursorisdone_01 = true, cursorisdone_02 = true;
	open hws_cursor_respostas_do_checklist;
	set vCAMPOS_DE_RESPOSTAS = '';
	loop_hws_cursor_respostas_do_checklist: loop
		fetch hws_cursor_respostas_do_checklist into vAF_CODIGO,vAF_RESPOSTA;
	        if cursorisdone_01 then
			leave loop_hws_cursor_respostas_do_checklist;
		end if;
		
		set vCAMPOS = concat('R',lpad(vAF_CODIGO,6,0),' varchar(50) default "",');		
				
		set vCAMPOS_DE_RESPOSTAS = concat(vCAMPOS_DE_RESPOSTAS,vCAMPOS);
		
	end loop loop_hws_cursor_respostas_do_checklist;
	
	close hws_cursor_respostas_do_checklist;
 
	set vCAMPOS_DE_RESPOSTAS = substring(vCAMPOS_DE_RESPOSTAS,1,length(vCAMPOS_DE_RESPOSTAS)-1);
	set @hws_instrucao = concat('create temporary table hws_tabela_retorno (BB_CODIGO int, BB_PLACA varchar(07), AD_CODIGO int, AD_PERGUNTA varchar(500),',vCAMPOS_DE_RESPOSTAS,')');
	
	drop table if exists hws_tabela_retorno;	
	prepare stm_hws_instrucoes from @hws_instrucao;
	execute stm_hws_instrucoes;
	
	set cursorisdone_02 = false;
	
	open hws_cursos_busca_respostas;
	loop_hws_cursos_busca_respostas: loop
		fetch hws_cursos_busca_respostas into vBB_CODIGO, vBB_PLACA, vAD_CODIGO, vAD_PERGUNTA, vAF_CODIGO, vAF_RESPOSTA;
		if cursorisdone_02 then
			leave loop_hws_cursos_busca_respostas;
		end if;
		
		insert into hws_tabela_retorno (BB_CODIGO, BB_PLACA, AD_CODIGO, AD_PERGUNTA) values (vBB_CODIGO, vBB_PLACA, vAD_CODIGO, vAD_PERGUNTA);
	
		set @hws_update = concat('update hws_tabela_retorno set R',vAF_CODIGO,'="',vAF_RESPOSTA,'" where BB_CODIGO = ', vBB_CODIGO,' and BB_PLACA = "',vBB_PLACA,'" and AD_CODIGO = ',vAD_CODIGO);
	
		prepare stm_hws_update from @hws_update;
		execute stm_hws_update;
	end loop loop_hws_cursos_busca_respostas;	
	
	close hws_cursos_busca_respostas;
	
	select * from hws_tabela_retorno;
	
end */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
