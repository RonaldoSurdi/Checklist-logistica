object HWS_ClientModule: THWS_ClientModule
  OldCreateOrder = False
  Height = 1177
  Width = 960
  object HWS_SqlServerMethod_F_HWS_ConectaBancoCliente: TSqlServerMethod
    GetMetadata = False
    Params = <
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'HWS_CodCliente'
        ParamType = ptInput
      end
      item
        DataType = ftObject
        Precision = 8000
        Name = 'Retorno'
        ParamType = ptResult
        Size = 8000
      end>
    SQLConnection = HWS_SQLConnectionDataSnap
    ServerMethodName = 'THWS_ServerMethods.F_HWS_ConectaBancoCliente'
    Left = 136
    Top = 257
  end
  object HWS_DSRestConnection: TDSRestConnection
    Protocol = 'http'
    Host = 'app999999.hwsmobile.com.br'
    Port = 8090
    Context = 'datasnap/'
    UserName = 'hwsadminmobile'
    Password = 'Yd459*jhdD82Klaw82HHww1oPqjd'
    LoginPrompt = False
    Connection = 'Keep-Alive'
    Left = 136
    Top = 16
    UniqueId = '{708102B9-07BC-4D49-99AF-F574405C5E93}'
  end
  object HWS_SQLConnectionDataSnap: TSQLConnection
    DriverName = 'Datasnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'HostName=app000001.hwsmobile.com.br'
      'Port=212'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=16.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'Filters={}'
      'DSAuthenticationUser=hwsadminmobile'
      'DSAuthenticationPassword=Yd459*jhdD82Klaw82HHww1oPqjd')
    Connected = True
    Left = 136
    Top = 72
    UniqueId = '{9C3A8D4D-6072-419E-B294-7BD9BD44EC67}'
  end
  object HWSDSProviderConnection: TDSProviderConnection
    ServerClassName = 'THWS_ServerMethods'
    Connected = True
    SQLConnection = HWS_SQLConnectionDataSnap
    Left = 136
    Top = 128
  end
  object HWS_SqlServerMethod_F_HWS_RetornaStatusDoCliente: TSqlServerMethod
    GetMetadata = False
    Params = <
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'HWS_CodCliente'
        ParamType = ptInput
      end
      item
        DataType = ftObject
        Precision = 8000
        Name = 'Retorno'
        ParamType = ptResult
        Size = 8000
      end>
    SQLConnection = HWS_SQLConnectionDataSnap
    ServerMethodName = 'THWS_ServerMethods.F_HWS_RetornaStatusDoCliente'
    Left = 136
    Top = 184
  end
  object HWS_ClientDataSet_AA01: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'HWS_DataSetProvider_AA01'
    RemoteServer = HWSDSProviderConnection
    Left = 392
    Top = 129
    object HWS_ClientDataSet_AA01AA_CODCHK: TIntegerField
      FieldName = 'AA_CODCHK'
      Required = True
      DisplayFormat = '000000'
    end
    object HWS_ClientDataSet_AA01AA_CODIGO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'AA_CODIGO'
      Required = True
      DisplayFormat = '000000'
    end
    object HWS_ClientDataSet_AA01AA_DESC: TStringField
      DisplayWidth = 120
      FieldName = 'AA_DESC'
      Size = 120
    end
    object HWS_ClientDataSet_AA01AA_CODERP: TIntegerField
      FieldName = 'AA_CODERP'
      DisplayFormat = '000000'
    end
    object HWS_ClientDataSet_AA01AA_CODANT: TIntegerField
      FieldName = 'AA_CODANT'
    end
  end
  object HWS_ClientDataSet_AB01: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'HWS_DataSetProvider_AB01'
    RemoteServer = HWSDSProviderConnection
    Left = 392
    Top = 193
    object HWS_ClientDataSet_AB01AB_CODCHK: TIntegerField
      FieldName = 'AB_CODCHK'
      Required = True
      DisplayFormat = '000000'
    end
    object HWS_ClientDataSet_AB01AB_CODIGO: TIntegerField
      FieldName = 'AB_CODIGO'
      Required = True
      DisplayFormat = '000000'
    end
    object HWS_ClientDataSet_AB01AB_DESC: TStringField
      FieldName = 'AB_DESC'
      Size = 40
    end
    object HWS_ClientDataSet_AB01AB_CODANT: TIntegerField
      FieldName = 'AB_CODANT'
    end
  end
  object HWS_ClientDataSet_AC01: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'HWS_DataSetProvider_AC01'
    RemoteServer = HWSDSProviderConnection
    Left = 392
    Top = 249
    object HWS_ClientDataSet_AC01AC_CODCHK: TIntegerField
      FieldName = 'AC_CODCHK'
      Required = True
      DisplayFormat = '000000'
    end
    object HWS_ClientDataSet_AC01AC_CODTIPO: TIntegerField
      FieldName = 'AC_CODTIPO'
      Required = True
      DisplayFormat = '000000'
    end
    object HWS_ClientDataSet_AC01AC_CODGRUPO: TIntegerField
      FieldName = 'AC_CODGRUPO'
      Required = True
      DisplayFormat = '000000'
    end
  end
  object HWS_ClientDataSet_AD01: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'HWS_DataSetProvider_AD01'
    RemoteServer = HWSDSProviderConnection
    Left = 392
    Top = 305
    object HWS_ClientDataSet_AD01AD_CODCHK: TIntegerField
      FieldName = 'AD_CODCHK'
      Required = True
      DisplayFormat = '000000'
    end
    object HWS_ClientDataSet_AD01AD_CODIGO: TIntegerField
      FieldName = 'AD_CODIGO'
      Required = True
      DisplayFormat = '000000'
    end
    object HWS_ClientDataSet_AD01AD_PERGUNTA: TStringField
      DisplayWidth = 500
      FieldName = 'AD_PERGUNTA'
      Size = 500
    end
    object HWS_ClientDataSet_AD01AD_TIPO: TStringField
      FieldName = 'AD_TIPO'
      Size = 1
    end
    object HWS_ClientDataSet_AD01AD_STATUS: TStringField
      FieldName = 'AD_STATUS'
      Size = 1
    end
    object HWS_ClientDataSet_AD01AD_CODANT: TIntegerField
      FieldName = 'AD_CODANT'
    end
  end
  object HWS_ClientDataSet_AE01: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'HWS_DataSetProvider_AE01'
    RemoteServer = HWSDSProviderConnection
    Left = 392
    Top = 361
    object HWS_ClientDataSet_AE01AE_CODCHK: TIntegerField
      FieldName = 'AE_CODCHK'
      Required = True
      DisplayFormat = '000000'
    end
    object HWS_ClientDataSet_AE01AE_GRUPO: TIntegerField
      FieldName = 'AE_GRUPO'
      Required = True
      DisplayFormat = '000000'
    end
    object HWS_ClientDataSet_AE01AE_CODPER: TIntegerField
      FieldName = 'AE_CODPER'
      Required = True
      DisplayFormat = '000000'
    end
  end
  object HWS_ClientDataSet_AF01: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'HWS_DataSetProvider_AF01'
    RemoteServer = HWSDSProviderConnection
    Left = 392
    Top = 425
    object HWS_ClientDataSet_AF01AF_CODCHK: TIntegerField
      FieldName = 'AF_CODCHK'
      Required = True
      DisplayFormat = '000000'
    end
    object HWS_ClientDataSet_AF01AF_CODIGO: TIntegerField
      FieldName = 'AF_CODIGO'
      Required = True
      DisplayFormat = '000000'
    end
    object HWS_ClientDataSet_AF01AF_RESPOSTA: TStringField
      FieldName = 'AF_RESPOSTA'
      Size = 50
    end
    object HWS_ClientDataSet_AF01AF_CODANT: TIntegerField
      FieldName = 'AF_CODANT'
    end
  end
  object HWS_ClientDataSet_AG01: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'HWS_DataSetProvider_AG01'
    RemoteServer = HWSDSProviderConnection
    Left = 392
    Top = 481
    object HWS_ClientDataSet_AG01AG_CODCHK: TIntegerField
      FieldName = 'AG_CODCHK'
      Required = True
      DisplayFormat = '000000'
    end
    object HWS_ClientDataSet_AG01AG_PERPAI: TIntegerField
      FieldName = 'AG_PERPAI'
      Required = True
      DisplayFormat = '000000'
    end
    object HWS_ClientDataSet_AG01AG_PERFILHA: TIntegerField
      FieldName = 'AG_PERFILHA'
      Required = True
      DisplayFormat = '000000'
    end
    object HWS_ClientDataSet_AG01AG_CODRESPAI: TIntegerField
      FieldName = 'AG_CODRESPAI'
      Required = True
      DisplayFormat = '000000'
    end
    object HWS_ClientDataSet_AG01AD_PERGUNTA: TWideStringField
      FieldKind = fkLookup
      FieldName = 'AD_PERGUNTA'
      LookupDataSet = HWS_ClientDataSet_AD01
      LookupKeyFields = 'AD_CODCHK;AD_CODIGO'
      LookupResultField = 'AD_PERGUNTA'
      KeyFields = 'AG_CODCHK;AG_PERFILHA'
      Size = 300
      Lookup = True
    end
    object HWS_ClientDataSet_AG01AF_RESPOSTA: TWideStringField
      FieldKind = fkLookup
      FieldName = 'AF_RESPOSTA'
      LookupDataSet = HWS_ClientDataSet_AF01
      LookupKeyFields = 'AF_CODCHK;AF_CODIGO'
      LookupResultField = 'AF_RESPOSTA'
      KeyFields = 'AG_CODCHK;AG_CODRESPAI'
      Size = 50
      Lookup = True
    end
  end
  object HWS_ClientDataSet_AH01: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'HWS_DataSetProvider_AH01'
    RemoteServer = HWSDSProviderConnection
    Left = 392
    Top = 537
    object HWS_ClientDataSet_AH01AH_CODCHK: TIntegerField
      FieldName = 'AH_CODCHK'
      Required = True
      DisplayFormat = '000000'
    end
    object HWS_ClientDataSet_AH01AH_CODPER: TIntegerField
      FieldName = 'AH_CODPER'
      Required = True
      DisplayFormat = '000000'
    end
    object HWS_ClientDataSet_AH01AH_CODRES: TIntegerField
      FieldName = 'AH_CODRES'
      Required = True
      DisplayFormat = '000000'
    end
    object HWS_ClientDataSet_AH01AH_ID: TIntegerField
      FieldName = 'AH_ID'
      Required = True
      DisplayFormat = '000000'
    end
    object HWS_ClientDataSet_AH01AH_FOTO: TStringField
      FieldName = 'AH_FOTO'
      Size = 1
    end
    object HWS_ClientDataSet_AH01AH_IDANT: TIntegerField
      FieldName = 'AH_IDANT'
    end
  end
  object HWS_ClientDataSet_HA01: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'HWS_DataSetProvider_HA01'
    RemoteServer = HWSDSProviderConnection
    Left = 720
    Top = 145
    object HWS_ClientDataSet_HA01HA_CODIGO: TIntegerField
      FieldName = 'HA_CODIGO'
      Required = True
    end
    object HWS_ClientDataSet_HA01HA_RAZAO: TStringField
      FieldName = 'HA_RAZAO'
      Size = 70
    end
    object HWS_ClientDataSet_HA01HA_FANTASIA: TStringField
      FieldName = 'HA_FANTASIA'
      Size = 70
    end
    object HWS_ClientDataSet_HA01HA_TIPO: TStringField
      FieldName = 'HA_TIPO'
      Size = 1
    end
    object HWS_ClientDataSet_HA01HA_CNPJ: TStringField
      FieldName = 'HA_CNPJ'
      Size = 14
    end
    object HWS_ClientDataSet_HA01HA_DATATRACKING: TStringField
      FieldName = 'HA_DATATRACKING'
      Size = 6
    end
    object HWS_ClientDataSet_HA01HD_DATACHECKLIST: TStringField
      FieldName = 'HD_DATACHECKLIST'
      Size = 6
    end
    object HWS_ClientDataSet_HA01HA_STATUS: TStringField
      FieldName = 'HA_STATUS'
      Size = 1
    end
  end
  object HWS_ClientDataSet_HD01: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'HWS_DataSetProvider_HD01'
    RemoteServer = HWSDSProviderConnection
    Left = 720
    Top = 201
    object HWS_ClientDataSet_HD01HD_CODCLI: TIntegerField
      FieldName = 'HD_CODCLI'
      Required = True
      DisplayFormat = '000000'
    end
    object HWS_ClientDataSet_HD01HD_CHIP: TStringField
      FieldName = 'HD_CHIP'
      Required = True
      Size = 15
    end
    object HWS_ClientDataSet_HD01HD_DESC: TStringField
      FieldName = 'HD_DESC'
      Size = 50
    end
    object HWS_ClientDataSet_HD01HD_STATUS: TStringField
      FieldName = 'HD_STATUS'
      Size = 1
    end
  end
  object HWS_DataSource_AA01: TDataSource
    DataSet = HWS_ClientDataSet_AA01
    Left = 544
    Top = 128
  end
  object HWS_SqlServerMethod_F_HWS_ProximoAutoIncBancoCliente: TSqlServerMethod
    GetMetadata = False
    Params = <
      item
        DataType = ftString
        Precision = 2000
        Name = 'Tabela'
        ParamType = ptInput
        Size = 2000
      end
      item
        DataType = ftString
        Precision = 2000
        Name = 'Campo'
        ParamType = ptInput
        Size = 2000
      end
      item
        DataType = ftString
        Precision = 2000
        Name = 'Formato'
        ParamType = ptInput
        Size = 2000
      end
      item
        DataType = ftString
        Precision = 2000
        Name = 'Retorno'
        ParamType = ptResult
        Size = 2000
      end>
    SQLConnection = HWS_SQLConnectionDataSnap
    ServerMethodName = 'THWS_ServerMethods.F_HWS_ProximoAutoIncBancoCliente'
    Left = 136
    Top = 328
  end
  object HWS_DataSource_AB01: TDataSource
    DataSet = HWS_ClientDataSet_AB01
    Left = 544
    Top = 192
  end
  object HWS_DataSource_AD01: TDataSource
    DataSet = HWS_ClientDataSet_AD01
    Left = 544
    Top = 304
  end
  object HWS_DataSource_AF01: TDataSource
    DataSet = HWS_ClientDataSet_AF01
    Left = 544
    Top = 424
  end
  object HWS_SqlServerMethod_F_HWS_GravaPerguntasXRespostas: TSqlServerMethod
    GetMetadata = False
    Params = <
      item
        DataType = ftObject
        Precision = 8000
        Name = 'HWS_PerXRes'
        ParamType = ptInput
      end
      item
        DataType = ftObject
        Precision = 8000
        Name = 'Retorno'
        ParamType = ptResult
        Size = 8000
      end>
    SQLConnection = HWS_SQLConnectionDataSnap
    ServerMethodName = 'THWS_ServerMethods.F_HWS_GravaPerguntasXRespostas'
    Left = 160
    Top = 392
  end
  object HWS_ClientDataSet_A901: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'HWS_DataSetProvider_A901'
    RemoteServer = HWSDSProviderConnection
    Left = 392
    Top = 72
    object HWS_ClientDataSet_A901A9_CODIGO: TIntegerField
      FieldName = 'A9_CODIGO'
      Required = True
      DisplayFormat = '000000'
    end
    object HWS_ClientDataSet_A901A9_DESC: TStringField
      FieldName = 'A9_DESC'
      Size = 150
    end
    object HWS_ClientDataSet_A901A9_STATUS: TStringField
      FieldName = 'A9_STATUS'
      Size = 1
    end
    object HWS_ClientDataSet_A901A9_CODREV: TIntegerField
      FieldName = 'A9_CODREV'
      DisplayFormat = '000000'
    end
    object HWS_ClientDataSet_A901A9_APP: TIntegerField
      FieldName = 'A9_APP'
    end
  end
  object HWS_DataSource_A901: TDataSource
    DataSet = HWS_ClientDataSet_A901
    Left = 536
    Top = 72
  end
  object HWS_SqlServerMethod_F_HWS_RevisarCheckList: TSqlServerMethod
    GetMetadata = False
    Params = <
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'HWS_Codigo'
        ParamType = ptInput
      end
      item
        DataType = ftObject
        Precision = 8000
        Name = 'Retorno'
        ParamType = ptResult
        Size = 8000
      end>
    SQLConnection = HWS_SQLConnectionDataSnap
    ServerMethodName = 'THWS_ServerMethods.F_HWS_RevisarCheckList'
    Left = 160
    Top = 456
  end
  object HWS_ClientDataSet_AI01: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'HWS_DataSetProvider_AI01'
    RemoteServer = HWSDSProviderConnection
    Left = 392
    Top = 601
    object HWS_ClientDataSet_AI01AI_CODCHK: TIntegerField
      FieldName = 'AI_CODCHK'
      Required = True
      DisplayFormat = '000000'
    end
    object HWS_ClientDataSet_AI01AI_CODPER: TIntegerField
      FieldName = 'AI_CODPER'
      Required = True
      DisplayFormat = '000000'
    end
    object HWS_ClientDataSet_AI01AI_CODRES: TIntegerField
      FieldName = 'AI_CODRES'
      Required = True
      DisplayFormat = '000000'
    end
    object HWS_ClientDataSet_AI01AD_PERGUNTA: TWideStringField
      FieldKind = fkLookup
      FieldName = 'AD_PERGUNTA'
      LookupDataSet = HWS_ClientDataSet_AD01
      LookupKeyFields = 'AD_CODCHK;AD_CODIGO'
      LookupResultField = 'AD_PERGUNTA'
      KeyFields = 'AI_CODCHK;AI_CODPER'
      Size = 300
      Lookup = True
    end
    object HWS_ClientDataSet_AI01AF_RESPOSTA: TWideStringField
      FieldKind = fkLookup
      FieldName = 'AF_RESPOSTA'
      LookupDataSet = HWS_ClientDataSet_AF01
      LookupKeyFields = 'AF_CODCHK;AF_CODIGO'
      LookupResultField = 'AF_RESPOSTA'
      KeyFields = 'AI_CODCHK;AI_CODRES'
      Size = 50
      Lookup = True
    end
  end
  object HWS_DataSource_AI01: TDataSource
    DataSet = HWS_ClientDataSet_AI01
    Left = 536
    Top = 600
  end
  object HWS_ClientDataSet_AJ01: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'HWS_DataSetProvider_AJ01'
    RemoteServer = HWSDSProviderConnection
    Left = 392
    Top = 680
    object HWS_ClientDataSet_AJ01AJ_CODCHK: TIntegerField
      FieldName = 'AJ_CODCHK'
      Required = True
      DisplayFormat = '000000'
    end
    object HWS_ClientDataSet_AJ01AJ_CODGRP: TIntegerField
      FieldName = 'AJ_CODGRP'
      Required = True
      DisplayFormat = '000000'
    end
    object HWS_ClientDataSet_AJ01AJ_CODRES: TIntegerField
      FieldName = 'AJ_CODRES'
      Required = True
      DisplayFormat = '000000'
    end
    object HWS_ClientDataSet_AJ01AJ_QTDRESTR: TIntegerField
      FieldName = 'AJ_QTDRESTR'
      DisplayFormat = '00'
    end
    object HWS_ClientDataSet_AJ01AB_DESC: TWideStringField
      FieldKind = fkLookup
      FieldName = 'AB_DESC'
      LookupDataSet = HWS_ClientDataSet_AB01
      LookupKeyFields = 'AB_CODCHK;AB_CODIGO'
      LookupResultField = 'AB_DESC'
      KeyFields = 'AJ_CODCHK;AJ_CODGRP'
      Size = 40
      Lookup = True
    end
    object HWS_ClientDataSet_AJ01AF_RESPOSTA: TWideStringField
      FieldKind = fkLookup
      FieldName = 'AF_RESPOSTA'
      LookupDataSet = HWS_ClientDataSet_AF01
      LookupKeyFields = 'AF_CODCHK;AF_CODIGO'
      LookupResultField = 'AF_RESPOSTA'
      KeyFields = 'AJ_CODCHK;AJ_CODRES'
      Size = 50
      Lookup = True
    end
  end
  object HWS_DataSource_AJ01: TDataSource
    DataSet = HWS_ClientDataSet_AJ01
    Left = 536
    Top = 680
  end
  object HWS_DataSource_AG01: TDataSource
    DataSet = HWS_ClientDataSet_AG01
    Left = 544
    Top = 480
  end
  object HWS_DataSource_HD01: TDataSource
    DataSet = HWS_ClientDataSet_HD01
    Left = 856
    Top = 200
  end
  object HWS_SqlServerMethod_F_HWS_RetornaEstruturaDasPerguntas: TSqlServerMethod
    GetMetadata = False
    Params = <
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'HWS_CheckList'
        ParamType = ptInput
      end
      item
        DataType = ftDataSet
        Name = 'Retorno'
        ParamType = ptResult
      end>
    SQLConnection = HWS_SQLConnectionDataSnap
    ServerMethodName = 'THWS_ServerMethods.F_HWS_RetornaEstruturaDasPerguntas'
    Left = 160
    Top = 536
  end
  object HWS_ClientDataSet_F_HWS_RetornaEstruturaDasPerguntas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'HWS_DataSetProvider_F_HWS_RetornaEstruturaDasPerguntas'
    Left = 160
    Top = 656
  end
  object HWS_DataSetProvider_F_HWS_RetornaEstruturaDasPerguntas: TDataSetProvider
    DataSet = HWS_SqlServerMethod_F_HWS_RetornaEstruturaDasPerguntas
    Left = 160
    Top = 592
  end
  object HWS_SqlServerMethod_F_HWS_PodeExcluirPerguntaFilha: TSqlServerMethod
    GetMetadata = False
    Params = <
      item
        DataType = ftString
        Precision = 2000
        Name = 'HWS_CheckList'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 2000
        Name = 'HWS_Pergunta'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 2000
        Name = 'Retorno'
        ParamType = ptResult
      end>
    SQLConnection = HWS_SQLConnectionDataSnap
    ServerMethodName = 'THWS_ServerMethods.F_HWS_PodeExcluirPerguntaFilha'
    Left = 160
    Top = 728
  end
  object HWS_SqlServerMethod_F_HWS_ExcluirPerguntaFilha: TSqlServerMethod
    GetMetadata = False
    Params = <
      item
        DataType = ftString
        Precision = 2000
        Name = 'HWS_CheckList'
        ParamType = ptInput
        Size = 2000
      end
      item
        DataType = ftString
        Precision = 2000
        Name = 'HWS_PerguntaPai'
        ParamType = ptInput
        Size = 2000
      end
      item
        DataType = ftString
        Precision = 2000
        Name = 'HWS_PerguntaFilha'
        ParamType = ptInput
        Size = 2000
      end
      item
        DataType = ftObject
        Precision = 8000
        Name = 'Retorno'
        ParamType = ptResult
        Size = 8000
      end>
    SQLConnection = HWS_SQLConnectionDataSnap
    ServerMethodName = 'THWS_ServerMethods.F_HWS_ExcluirPerguntaFilha'
    Left = 160
    Top = 784
  end
  object HWS_SqlServerMethod_F_HWS_PodeExcluirPerguntaReprovacao: TSqlServerMethod
    GetMetadata = False
    Params = <
      item
        DataType = ftString
        Precision = 2000
        Name = 'HWS_CheckList'
        ParamType = ptInput
        Size = 2000
      end
      item
        DataType = ftString
        Precision = 2000
        Name = 'HWS_Pergunta'
        ParamType = ptInput
        Size = 2000
      end
      item
        DataType = ftString
        Precision = 2000
        Name = 'Retorno'
        ParamType = ptResult
        Size = 2000
      end>
    SQLConnection = HWS_SQLConnectionDataSnap
    ServerMethodName = 'THWS_ServerMethods.F_HWS_PodeExcluirPerguntaReprovacao'
    Left = 160
    Top = 848
  end
  object HWS_SqlServerMethod_F_HWS_PodeExcluirRestricao: TSqlServerMethod
    GetMetadata = False
    Params = <
      item
        DataType = ftString
        Precision = 2000
        Name = 'HWS_CheckList'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 2000
        Name = 'HWS_GrupoPergunta'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 2000
        Name = 'Retorno'
        ParamType = ptResult
      end>
    SQLConnection = HWS_SQLConnectionDataSnap
    ServerMethodName = 'THWS_ServerMethods.F_HWS_PodeExcluirRestricao'
    Left = 488
    Top = 736
  end
  object HWS_ClientDataSet_HG01: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'HWS_DataSetProvider_HG01'
    RemoteServer = HWSDSProviderConnection
    Left = 720
    Top = 264
    object HWS_ClientDataSet_HG01HG_CODIGO: TIntegerField
      FieldName = 'HG_CODIGO'
      Required = True
      DisplayFormat = '000000'
    end
    object HWS_ClientDataSet_HG01HG_CODEMP: TIntegerField
      FieldName = 'HG_CODEMP'
      DisplayFormat = '000000'
    end
    object HWS_ClientDataSet_HG01HG_NOME: TStringField
      FieldName = 'HG_NOME'
      Size = 255
    end
    object HWS_ClientDataSet_HG01HG_EMAIL: TStringField
      FieldName = 'HG_EMAIL'
      Size = 255
    end
    object HWS_ClientDataSet_HG01HG_USER: TStringField
      FieldName = 'HG_USER'
      Size = 50
    end
    object HWS_ClientDataSet_HG01HG_SENHA: TStringField
      FieldName = 'HG_SENHA'
      Size = 250
    end
    object HWS_ClientDataSet_HG01HG_DATACAD: TSQLTimeStampField
      FieldName = 'HG_DATACAD'
    end
    object HWS_ClientDataSet_HG01HG_DATAUPD: TSQLTimeStampField
      FieldName = 'HG_DATAUPD'
    end
    object HWS_ClientDataSet_HG01HG_RESENHA: TStringField
      FieldName = 'HG_RESENHA'
      Size = 1
    end
  end
  object HWS_DataSource_HG01: TDataSource
    DataSet = HWS_ClientDataSet_HG01
    Left = 856
    Top = 264
  end
  object HWS_ClientDataSet_HI01: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'HWS_DataSetProvider_HI01'
    RemoteServer = HWSDSProviderConnection
    Left = 720
    Top = 336
    object HWS_ClientDataSet_HI01HI_CODIGO: TIntegerField
      FieldName = 'HI_CODIGO'
      Required = True
      DisplayFormat = '000000'
    end
    object HWS_ClientDataSet_HI01HI_CODEMP: TIntegerField
      FieldName = 'HI_CODEMP'
      DisplayFormat = '000000'
    end
    object HWS_ClientDataSet_HI01HI_NOME: TStringField
      FieldName = 'HI_NOME'
      Size = 255
    end
    object HWS_ClientDataSet_HI01HI_EMAIL: TStringField
      FieldName = 'HI_EMAIL'
      Size = 255
    end
    object HWS_ClientDataSet_HI01HI_USER: TStringField
      FieldName = 'HI_USER'
      Size = 50
    end
    object HWS_ClientDataSet_HI01HI_SENHA: TStringField
      FieldName = 'HI_SENHA'
      Size = 250
    end
    object HWS_ClientDataSet_HI01HI_DATACAD: TSQLTimeStampField
      FieldName = 'HI_DATACAD'
    end
    object HWS_ClientDataSet_HI01HI_DATAUPD: TSQLTimeStampField
      FieldName = 'HI_DATAUPD'
    end
    object HWS_ClientDataSet_HI01HI_RESENHA: TStringField
      FieldName = 'HI_RESENHA'
      Size = 1
    end
  end
  object HWS_DataSource_HI01: TDataSource
    DataSet = HWS_ClientDataSet_HI01
    Left = 856
    Top = 336
  end
  object HWS_SqlServerMethod_F_HWS_ProximoAutoIncBancoHWS: TSqlServerMethod
    GetMetadata = False
    Params = <
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'Tabela'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'Campo'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'Formato'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'Retorno'
        ParamType = ptResult
        Size = 2000
      end>
    SQLConnection = HWS_SQLConnectionDataSnap
    ServerMethodName = 'THWS_ServerMethods.F_HWS_ProximoAutoIncBancoHWS'
    Left = 768
    Top = 448
  end
  object HWS_SqlServerMethod_F_HWS_RetornaCheckListsRealizados: TSqlServerMethod
    GetMetadata = False
    Params = <
      item
        DataType = ftString
        Precision = 2000
        Name = 'HWS_DaData'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 2000
        Name = 'HWS_AteData'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 2000
        Name = 'HWS_DaPlaca'
        ParamType = ptInput
        Size = 2000
      end
      item
        DataType = ftString
        Precision = 2000
        Name = 'HWS_AtePlaca'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 2000
        Name = 'HWS_DoStatus'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 2000
        Name = 'HWS_AteStatus'
        ParamType = ptInput
      end
      item
        DataType = ftDataSet
        Precision = 8000
        Name = 'Retorno'
        ParamType = ptResult
        Size = 8000
      end>
    SQLConnection = HWS_SQLConnectionDataSnap
    ServerMethodName = 'THWS_ServerMethods.F_HWS_RetornaCheckListsRealizados'
    Left = 160
    Top = 928
  end
  object HWS_DataSetProvider_F_HWS_RetornaCheckListsRealizados: TDataSetProvider
    DataSet = HWS_SqlServerMethod_F_HWS_RetornaCheckListsRealizados
    Left = 160
    Top = 984
  end
  object HWS_ClientDataSet_F_HWS_RetornaCheckListsRealizados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'HWS_DataSetProvider_F_HWS_RetornaCheckListsRealizados'
    Left = 160
    Top = 1040
  end
  object HWS_DataSource_F_HWS_RetornaCheckListsRealizados: TDataSource
    DataSet = HWS_ClientDataSet_F_HWS_RetornaCheckListsRealizados
    Left = 160
    Top = 1096
  end
  object HWS_SqlServerMethod_F_HWS_InserirVeiculosNaInclusaoDoChip: TSqlServerMethod
    GetMetadata = False
    Params = <
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'HWS_Chip'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'HWS_CodCliente'
        ParamType = ptInput
      end
      item
        DataType = ftObject
        Precision = 8000
        Name = 'Retorno'
        ParamType = ptResult
        Size = 8000
      end>
    SQLConnection = HWS_SQLConnectionDataSnap
    ServerMethodName = 'THWS_ServerMethods.F_HWS_InserirVeiculosNaInclusaoDoChip'
    Left = 488
    Top = 800
  end
  object HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_Detalhe: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'HWS_DataSetProvider_F_HWS_ImpressaoCheckListsAnalitico_Detalhe'
    Left = 488
    Top = 976
    object HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_DetalheBB_CODIGO: TIntegerField
      FieldName = 'BB_CODIGO'
    end
    object HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_DetalheBB_PLACA: TStringField
      FieldName = 'BB_PLACA'
      Size = 7
    end
    object HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_DetalheAD_CODIGO: TIntegerField
      FieldName = 'AD_CODIGO'
    end
    object HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_DetalheAD_PERGUNTA: TStringField
      FieldName = 'AD_PERGUNTA'
      Size = 500
    end
    object HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_DetalheAD_TIPO: TStringField
      FieldName = 'AD_TIPO'
      Size = 1
    end
    object HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_DetalheAG_PERPAI: TIntegerField
      FieldName = 'AG_PERPAI'
    end
    object HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_DetalheBB_DTCHECK: TDateField
      FieldName = 'BB_DTCHECK'
    end
    object HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_DetalheBB_HRCHECK: TStringField
      FieldName = 'BB_HRCHECK'
      Size = 5
    end
    object HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_DetalheBB_OBS: TStringField
      FieldName = 'BB_OBS'
      Size = 500
    end
    object HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_DetalheBB_STATUS: TStringField
      FieldName = 'BB_STATUS'
      Size = 50
    end
    object HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_DetalheHI_USER: TStringField
      FieldName = 'HI_USER'
      Size = 30
    end
    object HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_DetalheOK: TStringField
      FieldName = 'OK'
      Size = 50
    end
    object HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_DetalheÑ_OK: TStringField
      FieldName = #209'_OK'
      Size = 50
    end
    object HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_DetalheSim: TStringField
      FieldName = 'Sim'
      Size = 50
    end
    object HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_DetalheNão: TStringField
      FieldName = 'N'#227'o'
      Size = 50
    end
    object HWS_ClientDataSet_F_HWS_ImpressaoCheckListsAnalitico_DetalheÑ_Obrigatório: TStringField
      FieldName = #209'_Obrigat'#243'rio'
      Size = 50
    end
  end
  object HWS_DataSetProvider_F_HWS_ImpressaoCheckListsAnalitico_Detalhe: TDataSetProvider
    DataSet = HWS_SqlServerMethod_F_HWS_ImpressaoCheckListsAnalitico_Detalhe
    Left = 488
    Top = 920
  end
  object HWS_SqlServerMethod_F_HWS_ImpressaoCheckListsAnalitico_Detalhe: TSqlServerMethod
    GetMetadata = False
    Params = <
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'HWS_CodEmpresa'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'HWS_CheckList'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'HWS_DaData'
        ParamType = ptInput
        Value = '2012-01-01'
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'HWS_AteData'
        ParamType = ptInput
        Value = '2012-12-31'
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'HWS_DaPlaca'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'HWS_AtePlaca'
        ParamType = ptInput
        Value = 'ZZZZZZZ'
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'HWS_DoStatus'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'HWS_AteStatus'
        ParamType = ptInput
        Value = 'ZZ'
      end
      item
        DataType = ftDataSet
        Name = 'ReturnParameter'
        ParamType = ptResult
        Value = 'TDataSet'
      end>
    SQLConnection = HWS_SQLConnectionDataSnap
    ServerMethodName = 'THWS_ServerMethods.F_HWS_ImpressaoCheckListsAnalitico_Detalhe'
    Left = 488
    Top = 864
  end
  object SqlServerMethod1: TSqlServerMethod
    GetMetadata = False
    Params = <
      item
        DataType = ftBlob
        Name = 'HWS_Imagem'
        ParamType = ptInput
      end
      item
        DataType = ftObject
        Precision = 8000
        Name = 'ReturnParameter'
        ParamType = ptResult
        Size = 8000
      end>
    SQLConnection = HWS_SQLConnectionDataSnap
    ServerMethodName = 'THWS_ServerMethods.F_HWS_RecebeImagens'
    Left = 768
    Top = 560
  end
end
