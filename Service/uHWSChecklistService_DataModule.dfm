object HWS_ClientModule: THWS_ClientModule
  OldCreateOrder = False
  Height = 573
  Width = 596
  object HWS_DSRestConnection: TDSRestConnection
    Protocol = 'http'
    Host = 'app000001.hwsmobile.com.br'
    Port = 8080
    Context = 'datasnap/'
    LoginPrompt = False
    Connection = 'Keep-Alive'
    Left = 104
    Top = 48
    UniqueId = '{E88907C5-64A8-4A7B-8705-FFBB64CA657A}'
  end
  object HWS_SQLConnection: TSQLConnection
    DriverName = 'Datasnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'HostName=app000001.hwsmobile.com.br'
      'Port=211'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=16.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'Filters={}')
    Left = 96
    Top = 120
    UniqueId = '{FF5A8B26-FB4B-4787-ACC4-BBE21742353A}'
  end
  object HWS_SqlServerMethod_F_HWS_RetornaChkExp: TSqlServerMethod
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
        Name = 'HWS_tipoIni'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'HWS_tipoEnd'
        ParamType = ptInput
      end
      item
        DataType = ftDataSet
        Name = 'Retorno'
        ParamType = ptResult
      end>
    SQLConnection = HWS_SQLConnection
    ServerMethodName = 'THWS_ServerMethods.F_HWS_RetornaChkExp'
    Left = 120
    Top = 304
  end
  object HWS_SqlServerMethod_F_HWS_InsertChkExp: TSqlServerMethod
    GetMetadata = False
    Params = <
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'HWS_ChkCodIni'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'HWS_ChkCodEnd'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'HWS_ChkIdExp'
        ParamType = ptInput
      end
      item
        DataType = ftObject
        Precision = 8000
        Name = 'Retorno'
        ParamType = ptResult
        Size = 8000
      end>
    SQLConnection = HWS_SQLConnection
    ServerMethodName = 'THWS_ServerMethods.F_HWS_InsertChkExp'
    Left = 128
    Top = 224
  end
  object HWS_ClientDataSet_F_HWS_RetornaChkExp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'HWS_DataSetProvider_F_HWS_RetornaChkExp'
    Left = 120
    Top = 400
  end
  object HWS_DataSetProvider_F_HWS_RetornaChkExp: TDataSetProvider
    DataSet = HWS_SqlServerMethod_F_HWS_RetornaChkExp
    Left = 120
    Top = 480
  end
  object HWS_SqlServerMethod_F_HWS_RetornaReExp: TSqlServerMethod
    GetMetadata = False
    Params = <
      item
        DataType = ftDataSet
        Name = 'Retorno'
        ParamType = ptResult
        Value = 'TDataSet'
      end>
    SQLConnection = HWS_SQLConnection
    ServerMethodName = 'THWS_ServerMethods.F_HWS_RetornaReExp'
    Left = 384
    Top = 224
  end
  object HWS_ClientDataSet_F_HWS_RetornaReExp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'HWS_DataSetProvider_F_HWS_RetornaReExp'
    Left = 384
    Top = 400
  end
  object HWS_DataSetProvider_F_HWS_RetornaReExp: TDataSetProvider
    DataSet = HWS_SqlServerMethod_F_HWS_RetornaReExp
    Left = 384
    Top = 480
  end
  object HWS_SqlServerMethod_F_HWS_InsertChkPlacas: TSqlServerMethod
    GetMetadata = False
    Params = <
      item
        DataType = ftObject
        Precision = 8000
        Name = 'HWS_filePlacas'
        ParamType = ptInput
      end
      item
        DataType = ftObject
        Precision = 8000
        Name = 'Retorno'
        ParamType = ptResult
        Size = 8000
      end>
    SQLConnection = HWS_SQLConnection
    ServerMethodName = 'THWS_ServerMethods.F_HWS_InsertChkPlacas'
    Left = 384
    Top = 304
  end
end
