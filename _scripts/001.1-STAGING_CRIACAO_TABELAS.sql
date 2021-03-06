/**************************************************************  ********************************************************************/
IF EXISTS (SELECT 1 FROM sys.Objects WHERE  Object_id = OBJECT_ID(N'[ImportacaoTipoArquivo]') AND Type = N'U')
BEGIN
   DROP TABLE ImportacaoTipoArquivo
END
GO


CREATE TABLE ImportacaoTipoArquivo
(
	ID									INT				NOT NULL PRIMARY KEY,
	Nome								VARCHAR(30)		NOT NULL
) 
GO

INSERT INTO ImportacaoTipoArquivo VALUES (1, 'Candidatos')
INSERT INTO ImportacaoTipoArquivo VALUES (2, 'Bens Dos Candidatos')
INSERT INTO ImportacaoTipoArquivo VALUES (3, 'Legendas')
INSERT INTO ImportacaoTipoArquivo VALUES (4, 'Vagas')
GO
/**************************************************************  ********************************************************************/



/**************************************************************  ********************************************************************/
IF EXISTS (SELECT 1 FROM sys.Objects WHERE  Object_id = OBJECT_ID(N'[ImportacaoArquivo]') AND Type = N'U')
BEGIN
   DROP TABLE ImportacaoArquivo
END
GO

CREATE TABLE ImportacaoArquivo
 (
	ID									INT IDENTITY	NOT NULL PRIMARY KEY,
	NomeArquivo							VARCHAR(200)	NOT NULL,
	TipoArquivoID						INT				NOT NULL FOREIGN KEY (TipoArquivoID) REFERENCES ImportacaoTipoArquivo(ID),
	Ano									INT				NOT NULL,
	UF									VARCHAR(02)		NOT NULL
 )
GO
/**************************************************************  ********************************************************************/
 


/**************************************************************  ********************************************************************/
IF EXISTS (SELECT 1 FROM sys.Objects WHERE  Object_id = OBJECT_ID(N'[ImportacaoCandidato]') AND Type = N'U')
BEGIN
   DROP TABLE ImportacaoCandidato
END
GO

CREATE TABLE ImportacaoCandidato
 (
	ID									INT IDENTITY PRIMARY KEY NOT NULL,
	ImportacaoArquivoID				    INT NOT NULL FOREIGN KEY (ImportacaoArquivoID) REFERENCES ImportacaoArquivo(ID),
	DATA_GERACAO						VARCHAR(10) NULL,
    HORA_GERACAO						VARCHAR(8) NULL,
    ANO_ELEICAO 						VARCHAR(4) NULL,
	ANO			 						INT NULL,
    NUM_TURNO 							VARCHAR(1) NULL,
    DESCRICAO_ELEICAO 					VARCHAR(50) NULL,
    SIGLA_UF 							VARCHAR(02) NULL,
    SIGLA_UE 							VARCHAR(5) NULL,
    DESCRICAO_UE 						VARCHAR(50) NULL,
    CODIGO_CARGO 						VARCHAR(02) NULL,
    DESCRICAO_CARGO 					VARCHAR(100) NULL,
    NOME_CANDIDATO 						VARCHAR(100) NULL,
    SEQUENCIAL_CANDIDATO 				VARCHAR(12) NULL,
    NUMERO_CANDIDATO 					VARCHAR(5) NULL,
    CPF_CANDIDATO 						VARCHAR(11) NULL,
    NOME_URNA_CANDIDATO 				VARCHAR(30) NULL,
    COD_SITUACAO_CANDIDATURA 			VARCHAR(30) NULL,
    DES_SITUACAO_CANDIDATURA 			VARCHAR(50) NULL,
    NUMERO_PARTIDO 						VARCHAR(20) NULL,
    SIGLA_PARTIDO 						VARCHAR(10) NULL,
    NOME_PARTIDO 						VARCHAR(50) NULL,
    CODIGO_LEGENDA 						VARCHAR(50) NULL,
    SIGLA_LEGENDA 						VARCHAR(50) NULL,
    COMPOSICAO_LEGENDA 					VARCHAR(200) NULL,
    NOME_LEGENDA 						VARCHAR(100) NULL,
    CODIGO_OCUPACAO 					VARCHAR(100) NULL,
    DESCRICAO_OCUPACAO 					VARCHAR(100) NULL,
    DATA_NASCIMENTO 					VARCHAR(100) NULL,
    NUM_TITULO_ELEITORAL_CANDIDATO 		VARCHAR(100) NULL,
    IDADE_DATA_ELEICAO 					VARCHAR(50) NULL,
    CODIGO_SEXO 						VARCHAR(50) NULL,
    DESCRICAO_SEXO 						VARCHAR(50) NULL,
    COD_GRAU_INSTRUCAO 					VARCHAR(50) NULL,
    DESCRICAO_GRAU_INSTRUCAO 			VARCHAR(50) NULL,
    CODIGO_ESTADO_CIVIL 				VARCHAR(50) NULL,
    DESCRICAO_ESTADO_CIVIL 				VARCHAR(50) NULL,
    CODIGO_COR_RACA 					VARCHAR(50) NULL,
    DESCRICAO_COR_RACA 					VARCHAR(50) NULL,
    CODIGO_NACIONALIDADE 				VARCHAR(50) NULL,
    DESCRICAO_NACIONALIDADE 			VARCHAR(50) NULL,
    SIGLA_UF_NASCIMENTO 				VARCHAR(50) NULL,
    CODIGO_MUNICIPIO_NASCIMENTO 		VARCHAR(25) NULL,
    NOME_MUNICIPIO_NASCIMENTO 			VARCHAR(50) NULL,
    DESPESA_MAX_CAMPANHA 				VARCHAR(50) NULL,
    COD_SIT_TOT_TURNO 					VARCHAR(100) NULL,
    DESC_SIT_TOT_TURNO 					VARCHAR(50) NULL,
    NM_EMAIL 							VARCHAR(100) NULL
)
GO
/**************************************************************  ********************************************************************/




/**************************************************************  ********************************************************************/
IF EXISTS (SELECT 1 FROM sys.Objects WHERE  Object_id = OBJECT_ID(N'[ImportacaoBensCandidato]') AND Type = N'U')
BEGIN
   DROP TABLE ImportacaoBensCandidato
END
GO


CREATE TABLE ImportacaoBensCandidato
(
	ID									INT IDENTITY PRIMARY KEY NOT NULL,
	ImportacaoArquivoID				    INT NOT NULL FOREIGN KEY (ImportacaoArquivoID) REFERENCES ImportacaoArquivo(ID),
	DATA_GERACAO						VARCHAR(10) NULL,
    HORA_GERACAO						VARCHAR(8) NULL,
    ANO_ELEICAO 						VARCHAR(4) NULL,
    DESCRICAO_ELEICAO					VARCHAR(50) NULL,
    SIGLA_UF 							VARCHAR(2) NULL,
    SQ_CANDIDATO 						VARCHAR(12) NULL,
    CD_TIPO_BEM_CANDIDATO 				VARCHAR(2) NULL,
    DS_TIPO_BEM_CANDIDATO 				VARCHAR(100) NULL,
    DETALHE_BEM 						VARCHAR(200) NULL,
    VALOR_BEM 							VARCHAR(15) NULL,
    DATA_ULTIMA_ATUALIZACAO 			VARCHAR(10) NULL,
    HORA_ULTIMA_ATUALIZACAO				VARCHAR(8) NULL
)
GO
/**************************************************************  ********************************************************************/



/**************************************************************  ********************************************************************/
IF EXISTS (SELECT 1 FROM sys.Objects WHERE  Object_id = OBJECT_ID(N'[ImportacaoLegenda]') AND Type = N'U')
BEGIN
   DROP TABLE ImportacaoLegenda
END
GO

CREATE TABLE ImportacaoLegenda
(
	ID									INT IDENTITY PRIMARY KEY NOT NULL,
	ImportacaoArquivoID				    INT NOT NULL FOREIGN KEY (ImportacaoArquivoID) REFERENCES ImportacaoArquivo(ID),
	DATA_GERACAO						VARCHAR(10) NULL,
    HORA_GERACAO						VARCHAR(08) NULL,
    ANO_ELEICAO 						VARCHAR(04) NULL,
    NUM_TURNO							VARCHAR(1) NULL,
	DESCRICAO_ELEICAO					VARCHAR(50) NULL,
	SIGLA_UF							VARCHAR(2) NULL,
	SIGLA_UE							VARCHAR(5) NULL,
	NOME_UE								VARCHAR(50) NULL,
	CODIGO_CARGO						VARCHAR(2) NULL,
	DESCRICAO_CARGO						VARCHAR(100) NULL,
	TIPO_LEGENDA						VARCHAR(15) NULL,
	NUM_PARTIDO							VARCHAR(02) NULL,
	SIGLA_PARTIDO						VARCHAR(10) NULL,
	NOME_PARTIDO						VARCHAR(50) NULL,
	SIGLA_COLIGACAO						VARCHAR(04) NULL,
	NOME_COLIGACAO						VARCHAR(100) NULL,
	COMPOSICAO_COLIGACAO				VARCHAR(200) NULL,
	SEQUENCIAL_COLIGACAO				VARCHAR(12) NULL
)
GO
/**************************************************************  ********************************************************************/


/**************************************************************  ********************************************************************/
IF EXISTS (SELECT 1 FROM sys.Objects WHERE  Object_id = OBJECT_ID(N'[ImportacaoVaga]') AND Type = N'U')
BEGIN
   DROP TABLE ImportacaoVaga
END
GO

CREATE TABLE ImportacaoVaga
(

	ID									INT IDENTITY PRIMARY KEY NOT NULL,
	ImportacaoArquivoID				    INT NOT NULL FOREIGN KEY (ImportacaoArquivoID) REFERENCES ImportacaoArquivo(ID),
	DATA_GERACAO						VARCHAR(10) NULL,
    HORA_GERACAO						VARCHAR(08) NULL,
    ANO_ELEICAO 						VARCHAR(04) NULL,
	DESCRICAO_ELEICAO					VARCHAR(50) NULL,
    SIGLA_UF							VARCHAR(2) NULL,
    SIGLA_UE							VARCHAR(5) NULL,
    NOME_UE								VARCHAR(50) NULL,
    CODIGO_CARGO						VARCHAR(2) NULL,
    DESCRICAO_CARGO						VARCHAR(100) NULL,
    QTDE_VAGAS							VARCHAR(02) NULL
)
GO
/**************************************************************  ********************************************************************/






/************************************************ CRIA��O DAS TABELA DE BENS ******************************************************************/
IF EXISTS (SELECT 1 FROM sys.Objects WHERE  Object_id = OBJECT_ID(N'[BensCandidatoAgrupado]') AND Type = N'U')
BEGIN
   DROP TABLE [BensCandidatoAgrupado]
END
GO

CREATE TABLE [dbo].[BensCandidatoAgrupado]
(
	[ID]			[int] IDENTITY(1,1) NOT NULL,
	[ANO_ELEICAO]	[INT]				NULL,
	[SIGLA_UF]		[varchar](2)		NULL,
	[SQ_CANDIDATO]	[varchar](50)		NULL,
	[VLRTOTAL]		[numeric](16, 2)	NULL,
	[QTDTOTAL]		[int]				NULL,

	CONSTRAINT [PK_BensCandidatoAgrupado] PRIMARY KEY CLUSTERED 
	(
	[ID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/************************************************ CRIA��O DAS TABELA DE BENS ******************************************************************/
