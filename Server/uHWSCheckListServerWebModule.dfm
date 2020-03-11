object HWS_WebModule: THWS_WebModule
  OldCreateOrder = False
  OnCreate = WebModuleCreate
  Actions = <
    item
      Name = 'ReverseStringAction'
      PathInfo = '/ReverseString'
    end
    item
      Name = 'ServerFunctionInvokerAction'
      PathInfo = '/ServerFunctionInvoker'
    end
    item
      Default = True
      Name = 'DefaultAction'
      PathInfo = '/'
      OnAction = WebModuleDefaultAction
    end>
  BeforeDispatch = WebModuleBeforeDispatch
  Height = 324
  Width = 404
  object HWS_DSHTTPWebDispatcher: TDSHTTPWebDispatcher
    DSContext = 'datasnap/'
    RESTContext = 'rest/'
    CacheContext = 'cache/'
    DSHostname = 'localhost'
    DSPort = 212
    Filters = <>
    AuthenticationManager = HWS_ServerContainer.HWS_DSAuthenticationManager
    CredentialsPassThrough = False
    SessionTimeout = 1200000
    WebDispatch.MethodType = mtAny
    WebDispatch.PathInfo = 'datasnap*'
    Left = 72
    Top = 11
  end
  object HWS_WebFileDispatcher: TWebFileDispatcher
    WebFileExtensions = <
      item
        MimeType = 'text/css'
        Extensions = 'css'
      end
      item
        MimeType = 'text/javascript'
        Extensions = 'js'
      end
      item
        MimeType = 'image/x-png'
        Extensions = 'png'
      end
      item
        MimeType = 'text/html'
        Extensions = 'htm;html'
      end
      item
        MimeType = 'image/jpeg'
        Extensions = 'jpg;jpeg;jpe'
      end
      item
        MimeType = 'image/gif'
        Extensions = 'gif'
      end>
    BeforeDispatch = HWS_WebFileDispatcherBeforeDispatch
    WebDirectories = <
      item
        DirectoryAction = dirInclude
        DirectoryMask = '*'
      end
      item
        DirectoryAction = dirExclude
        DirectoryMask = '\templates\*'
      end>
    RootDirectory = '.'
    Left = 72
    Top = 72
  end
  object HWS_DSProxyGenerator: TDSProxyGenerator
    ExcludeClasses = 'DSMetadata'
    MetaDataProvider = HWS_DSServerMetaDataProvider
    Writer = 'Java Script REST'
    Left = 72
    Top = 128
  end
  object HWS_DSServerMetaDataProvider: TDSServerMetaDataProvider
    Left = 240
    Top = 240
  end
  object HWS_DSProxyDispatcher: TDSProxyDispatcher
    RequiredProxyFilesPath = 'proxy'
    DSProxyGenerator = HWS_DSProxyGenerator
    Left = 264
    Top = 128
  end
end
