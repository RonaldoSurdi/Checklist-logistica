object HWS_ServerContainer: THWS_ServerContainer
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 271
  Width = 415
  object HWS_DSServer: TDSServer
    AutoStart = False
    HideDSAdmin = True
    ChannelResponseTimeout = 0
    Left = 96
    Top = 11
  end
  object HWS_DSAuthenticationManager: TDSAuthenticationManager
    OnUserAuthenticate = HWS_DSAuthenticationManagerUserAuthenticate
    OnUserAuthorize = HWS_DSAuthenticationManagerUserAuthorize
    Roles = <>
    Left = 96
    Top = 85
  end
  object HWS_DSServerClass: TDSServerClass
    OnGetClass = HWS_DSServerClassGetClass
    Server = HWS_DSServer
    LifeCycle = 'Session'
    Left = 200
    Top = 11
  end
  object HWS_DSTCPServerTransport: TDSTCPServerTransport
    Port = 212
    Server = HWS_DSServer
    BufferKBSize = 32
    Filters = <>
    AuthenticationManager = HWS_DSAuthenticationManager
    KeepAliveEnablement = kaDefault
    Left = 96
    Top = 152
  end
end
