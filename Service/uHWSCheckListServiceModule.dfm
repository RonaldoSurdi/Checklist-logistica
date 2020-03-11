object HWSCheckListServices: THWSCheckListServices
  OldCreateOrder = False
  OnCreate = ServiceCreate
  OnDestroy = ServiceDestroy
  DisplayName = 'HWSCheckList Services'
  AfterInstall = ServiceAfterInstall
  BeforeUninstall = ServiceBeforeUninstall
  OnContinue = ServiceContinue
  OnPause = ServicePause
  OnStart = ServiceStart
  OnStop = ServiceStop
  Height = 398
  Width = 456
  object HWS_Timer_INI: TTimer
    Interval = 5000
    OnTimer = HWS_Timer_INITimer
    Left = 104
    Top = 48
  end
  object HWS_Timer_Export: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = HWS_Timer_ExportTimer
    Left = 104
    Top = 128
  end
  object HWS_Timer_RE_Export: TTimer
    Enabled = False
    Interval = 300000
    OnTimer = HWS_Timer_RE_ExportTimer
    Left = 104
    Top = 208
  end
  object HWS_Timer_Import: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = HWS_Timer_ImportTimer
    Left = 104
    Top = 288
  end
end
