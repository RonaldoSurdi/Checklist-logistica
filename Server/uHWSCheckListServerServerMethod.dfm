object HWS_ServerMethods: THWS_ServerMethods
  OldCreateOrder = False
  OnCreate = DSServerModuleCreate
  OnDestroy = DSServerModuleDestroy
  Height = 642
  Width = 925
  object HWS_SQLConnection_Banco_Cliente: TSQLConnection
    DriverName = 'MySQL'
    GetDriverFunc = 'getSQLDriverMYSQL'
    LibraryName = 'dbxmys.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXMySQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver160.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=16.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMySqlMetaDataCommandFactory,DbxMySQLDr' +
        'iver160.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMySqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMySQLDriver,Version=16.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverMYSQL'
      'LibraryName=dbxmys.dll'
      'LibraryNameOsx=libsqlmys.dylib'
      'VendorLib=LIBMYSQL.dll'
      'VendorLibWin64=libmysql.dll'
      'VendorLibOsx=libmysqlclient.dylib'
      'HostName=localhost'
      'Database=ck999999'
      'User_Name=user_hwschecklis'
      'Password=jds8hd4oo21HuSAs9823d'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'BlobSize=-1'
      'ErrorResourceFile=')
    VendorLib = 'LIBMYSQL.dll'
    Left = 448
    Top = 200
  end
  object HWS_SQLTable_AA01: TSQLTable
    IndexName = 'PRIMARY'
    MaxBlobSize = -1
    SQLConnection = HWS_SQLConnection_Banco_Cliente
    TableName = 'aa01'
    Left = 64
    Top = 80
    object HWS_SQLTable_AA01AA_CODCHK: TIntegerField
      FieldName = 'AA_CODCHK'
      Required = True
    end
    object HWS_SQLTable_AA01AA_CODIGO: TIntegerField
      FieldName = 'AA_CODIGO'
      Required = True
    end
    object HWS_SQLTable_AA01AA_DESC: TStringField
      DisplayWidth = 120
      FieldName = 'AA_DESC'
      Size = 120
    end
    object HWS_SQLTable_AA01AA_CODERP: TIntegerField
      FieldName = 'AA_CODERP'
    end
    object HWS_SQLTable_AA01AA_CODANT: TIntegerField
      FieldName = 'AA_CODANT'
    end
  end
  object HWS_SQLTable_AB01: TSQLTable
    IndexName = 'PRIMARY'
    MaxBlobSize = -1
    SQLConnection = HWS_SQLConnection_Banco_Cliente
    TableName = 'ab01'
    Left = 64
    Top = 136
    object HWS_SQLTable_AB01AB_CODCHK: TIntegerField
      FieldName = 'AB_CODCHK'
      Required = True
    end
    object HWS_SQLTable_AB01AB_CODIGO: TIntegerField
      FieldName = 'AB_CODIGO'
      Required = True
    end
    object HWS_SQLTable_AB01AB_DESC: TStringField
      FieldName = 'AB_DESC'
      Size = 40
    end
    object HWS_SQLTable_AB01AB_CODANT: TIntegerField
      FieldName = 'AB_CODANT'
    end
  end
  object HWS_SQLTable_AC01: TSQLTable
    IndexName = 'PRIMARY'
    MaxBlobSize = -1
    SQLConnection = HWS_SQLConnection_Banco_Cliente
    TableName = 'ac01'
    Left = 64
    Top = 200
    object HWS_SQLTable_AC01AC_CODCHK: TIntegerField
      FieldName = 'AC_CODCHK'
      Required = True
    end
    object HWS_SQLTable_AC01AC_CODTIPO: TIntegerField
      FieldName = 'AC_CODTIPO'
      Required = True
    end
    object HWS_SQLTable_AC01AC_CODGRUPO: TIntegerField
      FieldName = 'AC_CODGRUPO'
      Required = True
    end
  end
  object HWS_SQLTable_AD01: TSQLTable
    IndexName = 'PRIMARY'
    MaxBlobSize = -1
    SQLConnection = HWS_SQLConnection_Banco_Cliente
    TableName = 'ad01'
    Left = 64
    Top = 264
    object HWS_SQLTable_AD01AD_CODCHK: TIntegerField
      FieldName = 'AD_CODCHK'
      Required = True
    end
    object HWS_SQLTable_AD01AD_CODIGO: TIntegerField
      FieldName = 'AD_CODIGO'
      Required = True
      DisplayFormat = '000000'
    end
    object HWS_SQLTable_AD01AD_PERGUNTA: TStringField
      DisplayWidth = 500
      FieldName = 'AD_PERGUNTA'
      Size = 500
    end
    object HWS_SQLTable_AD01AD_TIPO: TStringField
      FieldName = 'AD_TIPO'
      Size = 1
    end
    object HWS_SQLTable_AD01AD_STATUS: TStringField
      FieldName = 'AD_STATUS'
      Size = 1
    end
    object HWS_SQLTable_AD01AD_CODANT: TIntegerField
      FieldName = 'AD_CODANT'
    end
  end
  object HWS_SQLTable_AE01: TSQLTable
    IndexName = 'PRIMARY'
    MaxBlobSize = -1
    SQLConnection = HWS_SQLConnection_Banco_Cliente
    TableName = 'ae01'
    Left = 64
    Top = 328
    object HWS_SQLTable_AE01AE_CODCHK: TIntegerField
      FieldName = 'AE_CODCHK'
      Required = True
    end
    object HWS_SQLTable_AE01AE_GRUPO: TIntegerField
      FieldName = 'AE_GRUPO'
      Required = True
    end
    object HWS_SQLTable_AE01AE_CODPER: TIntegerField
      FieldName = 'AE_CODPER'
      Required = True
    end
  end
  object HWS_SQLTable_AF01: TSQLTable
    IndexName = 'PRIMARY'
    MaxBlobSize = -1
    SQLConnection = HWS_SQLConnection_Banco_Cliente
    TableName = 'af01'
    Left = 64
    Top = 384
    object HWS_SQLTable_AF01AF_CODCHK: TIntegerField
      FieldName = 'AF_CODCHK'
      Required = True
    end
    object HWS_SQLTable_AF01AF_CODIGO: TIntegerField
      FieldName = 'AF_CODIGO'
      Required = True
    end
    object HWS_SQLTable_AF01AF_RESPOSTA: TStringField
      FieldName = 'AF_RESPOSTA'
      Size = 50
    end
    object HWS_SQLTable_AF01AF_CODANT: TIntegerField
      FieldName = 'AF_CODANT'
    end
  end
  object HWS_SQLTable_AG01: TSQLTable
    IndexName = 'PRIMARY'
    MaxBlobSize = -1
    SQLConnection = HWS_SQLConnection_Banco_Cliente
    TableName = 'ag01'
    Left = 64
    Top = 448
    object HWS_SQLTable_AG01AG_CODCHK: TIntegerField
      FieldName = 'AG_CODCHK'
      Required = True
    end
    object HWS_SQLTable_AG01AG_PERPAI: TIntegerField
      FieldName = 'AG_PERPAI'
      Required = True
    end
    object HWS_SQLTable_AG01AG_PERFILHA: TIntegerField
      FieldName = 'AG_PERFILHA'
      Required = True
    end
    object HWS_SQLTable_AG01AG_CODRESPAI: TIntegerField
      FieldName = 'AG_CODRESPAI'
      Required = True
    end
  end
  object HWS_SQLTable_AH01: TSQLTable
    IndexName = 'PRIMARY'
    MaxBlobSize = -1
    SQLConnection = HWS_SQLConnection_Banco_Cliente
    TableName = 'ah01'
    Left = 64
    Top = 512
    object HWS_SQLTable_AH01AH_CODCHK: TIntegerField
      FieldName = 'AH_CODCHK'
      Required = True
    end
    object HWS_SQLTable_AH01AH_CODPER: TIntegerField
      FieldName = 'AH_CODPER'
      Required = True
    end
    object HWS_SQLTable_AH01AH_CODRES: TIntegerField
      FieldName = 'AH_CODRES'
      Required = True
    end
    object HWS_SQLTable_AH01AH_ID: TIntegerField
      FieldName = 'AH_ID'
      Required = True
    end
    object HWS_SQLTable_AH01AH_FOTO: TStringField
      FieldName = 'AH_FOTO'
      Size = 1
    end
    object HWS_SQLTable_AH01AH_IDANT: TIntegerField
      FieldName = 'AH_IDANT'
    end
  end
  object HWS_SQLTable_HA01: TSQLTable
    MaxBlobSize = -1
    SQLConnection = HWS_SQLConnection_Banco_HWS
    TableName = 'ha01'
    Left = 688
    Top = 192
    object HWS_SQLTable_HA01HA_CODIGO: TIntegerField
      FieldName = 'HA_CODIGO'
      Required = True
    end
    object HWS_SQLTable_HA01HA_RAZAO: TStringField
      FieldName = 'HA_RAZAO'
      Size = 70
    end
    object HWS_SQLTable_HA01HA_FANTASIA: TStringField
      FieldName = 'HA_FANTASIA'
      Size = 70
    end
    object HWS_SQLTable_HA01HA_TIPO: TStringField
      FieldName = 'HA_TIPO'
      Size = 1
    end
    object HWS_SQLTable_HA01HA_CNPJ: TStringField
      FieldName = 'HA_CNPJ'
      Size = 14
    end
    object HWS_SQLTable_HA01HA_DATATRACKING: TStringField
      FieldName = 'HA_DATATRACKING'
      Size = 6
    end
    object HWS_SQLTable_HA01HA_DATACHECKLIST: TStringField
      FieldName = 'HA_DATACHECKLIST'
      Size = 6
    end
    object HWS_SQLTable_HA01HA_STATUS: TStringField
      FieldName = 'HA_STATUS'
      Size = 1
    end
  end
  object HWS_SQLConnection_Banco_HWS: TSQLConnection
    DriverName = 'MySQL'
    GetDriverFunc = 'getSQLDriverMYSQL'
    LibraryName = 'dbxmys.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXMySQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver160.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=16.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMySqlMetaDataCommandFactory,DbxMySQLDr' +
        'iver160.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMySqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMySQLDriver,Version=16.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverMYSQL'
      'LibraryName=dbxmys.dll'
      'LibraryNameOsx=libsqlmys.dylib'
      'VendorLib=LIBMYSQL.dll'
      'VendorLibWin64=libmysql.dll'
      'VendorLibOsx=libmysqlclient.dylib'
      'HostName=localhost'
      'Database=hwsmobile'
      'User_Name=user_hwschecklis'
      'Password=jds8hd4oo21HuSAs9823d'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'BlobSize=-1'
      'ErrorResourceFile=')
    VendorLib = 'LIBMYSQL.dll'
    Left = 448
    Top = 136
  end
  object HWS_DataSetProvider_AA01: TDataSetProvider
    DataSet = HWS_SQLTable_AA01
    Left = 208
    Top = 88
  end
  object HWS_DataSetProvider_AB01: TDataSetProvider
    DataSet = HWS_SQLTable_AB01
    Left = 208
    Top = 136
  end
  object HWS_DataSetProvider_AC01: TDataSetProvider
    DataSet = HWS_SQLTable_AC01
    Left = 208
    Top = 200
  end
  object HWS_DataSetProvider_AD01: TDataSetProvider
    DataSet = HWS_SQLTable_AD01
    Left = 208
    Top = 264
  end
  object HWS_DataSetProvider_AE01: TDataSetProvider
    DataSet = HWS_SQLTable_AE01
    Left = 208
    Top = 328
  end
  object HWS_DataSetProvider_AF01: TDataSetProvider
    DataSet = HWS_SQLTable_AF01
    Left = 208
    Top = 384
  end
  object HWS_DataSetProvider_AG01: TDataSetProvider
    DataSet = HWS_SQLTable_AG01
    Left = 208
    Top = 448
  end
  object HWS_DataSetProvider_AH01: TDataSetProvider
    DataSet = HWS_SQLTable_AH01
    Left = 208
    Top = 512
  end
  object HWS_DataSetProvider_HA01: TDataSetProvider
    DataSet = HWS_SQLTable_HA01
    Left = 832
    Top = 192
  end
  object HWS_DataSetProvider_HD01: TDataSetProvider
    DataSet = HWS_SQLTable_HD01
    Left = 832
    Top = 256
  end
  object HWS_SQLTable_A901: TSQLTable
    IndexFieldNames = 'A9_CODIGO'
    MaxBlobSize = -1
    SQLConnection = HWS_SQLConnection_Banco_Cliente
    TableName = 'a901'
    Left = 64
    Top = 16
    object HWS_SQLTable_A901A9_CODIGO: TIntegerField
      FieldName = 'A9_CODIGO'
      Required = True
    end
    object HWS_SQLTable_A901A9_DESC: TStringField
      FieldName = 'A9_DESC'
      Size = 150
    end
    object HWS_SQLTable_A901A9_STATUS: TStringField
      FieldName = 'A9_STATUS'
      Size = 1
    end
    object HWS_SQLTable_A901A9_CODREV: TIntegerField
      FieldName = 'A9_CODREV'
    end
    object HWS_SQLTable_A901A9_APP: TIntegerField
      FieldName = 'A9_APP'
    end
  end
  object HWS_DataSetProvider_A901: TDataSetProvider
    DataSet = HWS_SQLTable_A901
    Left = 200
    Top = 24
  end
  object HWS_SQLTable_AI01: TSQLTable
    IndexName = 'PRIMARY'
    MaxBlobSize = -1
    SQLConnection = HWS_SQLConnection_Banco_Cliente
    TableName = 'ai01'
    Left = 64
    Top = 568
    object HWS_SQLTable_AI01AI_CODCHK: TIntegerField
      FieldName = 'AI_CODCHK'
      Required = True
    end
    object HWS_SQLTable_AI01AI_CODPER: TIntegerField
      FieldName = 'AI_CODPER'
      Required = True
    end
    object HWS_SQLTable_AI01AI_CODRES: TIntegerField
      FieldName = 'AI_CODRES'
      Required = True
    end
  end
  object HWS_DataSetProvider_AI01: TDataSetProvider
    DataSet = HWS_SQLTable_AI01
    Left = 208
    Top = 568
  end
  object HWS_SQLTable_AJ01: TSQLTable
    IndexName = 'PRIMARY'
    MaxBlobSize = -1
    SQLConnection = HWS_SQLConnection_Banco_Cliente
    TableName = 'aj01'
    Left = 376
    Top = 24
    object HWS_SQLTable_AJ01AJ_CODCHK: TIntegerField
      FieldName = 'AJ_CODCHK'
      Required = True
    end
    object HWS_SQLTable_AJ01AJ_CODGRP: TIntegerField
      FieldName = 'AJ_CODGRP'
      Required = True
    end
    object HWS_SQLTable_AJ01AJ_CODRES: TIntegerField
      FieldName = 'AJ_CODRES'
      Required = True
    end
    object HWS_SQLTable_AJ01AJ_QTDRESTR: TIntegerField
      FieldName = 'AJ_QTDRESTR'
    end
  end
  object HWS_DataSetProvider_AJ01: TDataSetProvider
    DataSet = HWS_SQLTable_AJ01
    Left = 520
    Top = 24
  end
  object HWS_DataSetProvider_HG01: TDataSetProvider
    DataSet = HWS_SQLTable_HG01
    Left = 832
    Top = 328
  end
  object HWS_DataSetProvider_HI01: TDataSetProvider
    DataSet = HWS_SQLTable_HI01
    Left = 832
    Top = 392
  end
  object HWS_SQLTable_HG01: TSQLTable
    IndexFieldNames = 'HG_CODEMP;HG_CODIGO'
    MaxBlobSize = -1
    SQLConnection = HWS_SQLConnection_Banco_HWS
    TableName = 'hg01'
    Left = 688
    Top = 328
    object HWS_SQLTable_HG01HG_CODIGO: TIntegerField
      FieldName = 'HG_CODIGO'
      Required = True
    end
    object HWS_SQLTable_HG01HG_CODEMP: TIntegerField
      FieldName = 'HG_CODEMP'
    end
    object HWS_SQLTable_HG01HG_NOME: TStringField
      FieldName = 'HG_NOME'
      Size = 255
    end
    object HWS_SQLTable_HG01HG_EMAIL: TStringField
      FieldName = 'HG_EMAIL'
      Size = 255
    end
    object HWS_SQLTable_HG01HG_USER: TStringField
      FieldName = 'HG_USER'
      Size = 50
    end
    object HWS_SQLTable_HG01HG_SENHA: TStringField
      FieldName = 'HG_SENHA'
      Size = 250
    end
    object HWS_SQLTable_HG01HG_DATACAD: TSQLTimeStampField
      FieldName = 'HG_DATACAD'
    end
    object HWS_SQLTable_HG01HG_DATAUPD: TSQLTimeStampField
      FieldName = 'HG_DATAUPD'
    end
    object HWS_SQLTable_HG01HG_RESENHA: TStringField
      FieldName = 'HG_RESENHA'
      Size = 1
    end
  end
  object HWS_SQLTable_HI01: TSQLTable
    IndexFieldNames = 'HI_CODEMP;HI_CODIGO'
    MaxBlobSize = -1
    SQLConnection = HWS_SQLConnection_Banco_HWS
    TableName = 'hi01'
    Left = 688
    Top = 392
    object HWS_SQLTable_HI01HI_CODIGO: TIntegerField
      FieldName = 'HI_CODIGO'
      Required = True
    end
    object HWS_SQLTable_HI01HI_CODEMP: TIntegerField
      FieldName = 'HI_CODEMP'
    end
    object HWS_SQLTable_HI01HI_NOME: TStringField
      FieldName = 'HI_NOME'
      Size = 255
    end
    object HWS_SQLTable_HI01HI_EMAIL: TStringField
      FieldName = 'HI_EMAIL'
      Size = 255
    end
    object HWS_SQLTable_HI01HI_USER: TStringField
      FieldName = 'HI_USER'
      Size = 50
    end
    object HWS_SQLTable_HI01HI_SENHA: TStringField
      FieldName = 'HI_SENHA'
      Size = 250
    end
    object HWS_SQLTable_HI01HI_DATACAD: TSQLTimeStampField
      FieldName = 'HI_DATACAD'
    end
    object HWS_SQLTable_HI01HI_DATAUPD: TSQLTimeStampField
      FieldName = 'HI_DATAUPD'
    end
    object HWS_SQLTable_HI01HI_RESENHA: TStringField
      FieldName = 'HI_RESENHA'
      Size = 1
    end
  end
  object HWS_SQLTable_HD01: TSQLTable
    IndexFieldNames = 'HD_CODCLI;HD_CHIP'
    MaxBlobSize = -1
    SQLConnection = HWS_SQLConnection_Banco_HWS
    TableName = 'hd01'
    Left = 688
    Top = 256
    object HWS_SQLTable_HD01HD_CODCLI: TIntegerField
      FieldName = 'HD_CODCLI'
      Required = True
    end
    object HWS_SQLTable_HD01HD_CHIP: TStringField
      FieldName = 'HD_CHIP'
      Required = True
      Size = 30
    end
    object HWS_SQLTable_HD01HD_DESC: TStringField
      FieldName = 'HD_DESC'
      Size = 50
    end
    object HWS_SQLTable_HD01HD_STATUS: TStringField
      FieldName = 'HD_STATUS'
      Size = 1
    end
  end
end
