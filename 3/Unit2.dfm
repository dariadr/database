object DataModule2: TDataModule2
  OldCreateOrder = False
  Left = 804
  Top = 172
  Height = 527
  Width = 642
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = 's2itm:d:\sb\ivt-11\droz_dv.ib'
    Params.Strings = (
      'user_name=droz_dv')
    DefaultTransaction = IBTransaction1
    Left = 48
    Top = 40
  end
  object IBTransaction1: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 128
    Top = 40
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    Active = True
    SQL.Strings = (
      'select * from  AVTOBUS order by NOMERAVTOBUSA;')
    Left = 208
    Top = 40
  end
  object IBUpdateSQL1: TIBUpdateSQL
    RefreshSQL.Strings = (
      'select * from prodazha'
      '(IDENTIFICATOR=:IDENTIFICATOR) and (NOMERMESTA=:NOMERMESTA);'
      '')
    ModifySQL.Strings = (
      'update PRODAZHA set '
      'CENABILETA=:CENABILETA,'
      'DATAIVREMIA=:DATAIVREMIA,'
      'NOMERMESTA=:NOMERMESTA,'
      'IDENTIFICATOR=:IDENTIFICATOR,'
      'NACHALOPUTI=(select IDENTIFY from marshrut a '
      'join REISE b on a.NOMERREISA=b.NOMERREISA '
      'join OTPRAVLENIE c on b.NOMERREISA=c.NOMERREISA '
      
        'where (a.NASELENNIIPUNKT=:NACHALO) and (c.IDENTIFICATOR=:old_IDE' +
        'NTIFICATOR)),'
      'KONECPUTI=(select IDENTIFY from marshrut a '
      'join REISE b on a.NOMERREISA=b.NOMERREISA '
      'join OTPRAVLENIE c on b.NOMERREISA=c.NOMERREISA '
      
        'where (a.NASELENNIIPUNKT=:konec) and (c.IDENTIFICATOR=:old_IDENT' +
        'IFICATOR)),'
      'TIP=:TIP'
      
        'where (IDENTIFICATOR=:old_IDENTIFICATOR) and (NOMERMESTA=:old_NO' +
        'MERMESTA);'
      '')
    InsertSQL.Strings = (
      
        'insert into PRODAZHA(CENABILETA,DATAIVREMIA,NOMERMESTA,IDENTIFIC' +
        'ATOR,NACHALOPUTI,KONECPUTI,TIP) '
      'values(:CENABILETA,:DATAIVREMIA,:NOMERMESTA,:IDENTIFICATOR,'
      '(select IDENTIFY from marshrut a '
      'join REISE b on a.NOMERREISA=b.NOMERREISA '
      'join OTPRAVLENIE c on b.NOMERREISA=c.NOMERREISA '
      
        'where (a.NASELENNIIPUNKT=:NACHALO) and (c.IDENTIFICATOR=:old_IDE' +
        'NTIFICATOR)),'
      '(select IDENTIFY from marshrut a '
      'join REISE b on a.NOMERREISA=b.NOMERREISA '
      'join OTPRAVLENIE c on b.NOMERREISA=c.NOMERREISA '
      
        'where (a.NASELENNIIPUNKT=:konec) and (c.IDENTIFICATOR=:old_IDENT' +
        'IFICATOR)),:TIP);')
    DeleteSQL.Strings = (
      'delete from PRODAZHA '
      'where (NOMERMESTA=:old_NOMERMESTA)'
      ' and (IDENTIFICATOR=:old_IDENTIFICATOR);')
    Left = 48
    Top = 168
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 48
    Top = 104
  end
  object IBQuery2: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    Active = True
    SQL.Strings = (
      'select * from proc1(:vr1,:vr2);')
    Left = 280
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'vr1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vr2'
        ParamType = ptUnknown
      end>
  end
  object DataSource2: TDataSource
    DataSet = IBQuery2
    Left = 128
    Top = 104
  end
  object IBQuery3: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    Active = True
    SQL.Strings = (
      
        'select a.CENABILETA, a.DATAIVREMIA, a.NOMERMESTA, a.IDENTIFICATO' +
        'R,(b.NASELENNIIPUNKT) as nachalo,(c.NASELENNIIPUNKT) as konec,a.' +
        'TIP'
      'from  PRODAZHA a '
      'join MARSHRUT b on a.NACHALOPUTI=b.IDENTIFY'
      'join MARSHRUT c on a.KONECPUTI=c.IDENTIFY'
      'order by  IDENTIFICATOR, NOMERMESTA;')
    UpdateObject = IBUpdateSQL1
    Left = 352
    Top = 40
    object IBQuery3CENABILETA: TIBBCDField
      FieldName = 'CENABILETA'
      Origin = '"PRODAZHA"."CENABILETA"'
      Precision = 7
      Size = 2
    end
    object IBQuery3DATAIVREMIA: TDateTimeField
      FieldName = 'DATAIVREMIA'
      Origin = '"PRODAZHA"."DATAIVREMIA"'
      Required = True
    end
    object IBQuery3NOMERMESTA: TSmallintField
      FieldName = 'NOMERMESTA'
      Origin = '"PRODAZHA"."NOMERMESTA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQuery3IDENTIFICATOR: TIntegerField
      FieldName = 'IDENTIFICATOR'
      Origin = '"PRODAZHA"."IDENTIFICATOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQuery3NACHALO: TIBStringField
      FieldName = 'NACHALO'
      Origin = '"MARSHRUT"."NASELENNIIPUNKT"'
      Required = True
      Size = 75
    end
    object IBQuery3KONEC: TIBStringField
      FieldName = 'KONEC'
      Origin = '"MARSHRUT"."NASELENNIIPUNKT"'
      Required = True
      Size = 75
    end
    object IBQuery3TIP: TIBStringField
      FieldName = 'TIP'
      Origin = '"PRODAZHA"."TIP"'
      Required = True
      Size = 75
    end
  end
  object DataSource3: TDataSource
    DataSet = IBQuery3
    Left = 208
    Top = 104
  end
  object IBDataSet1: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    ForcedRefresh = True
    DeleteSQL.Strings = (
      'delete from marshrut'
      'where (NASELENNIIPUNKT=:old_NASELENNIIPUNKT) '
      'and (NOMERREISA=:old_NOMERREISA);'
      '')
    InsertSQL.Strings = (
      'insert into marshrut(dlinaputi,kluch,NASELENNIIPUNKT,NOMERREISA)'
      'values(:dlinaputi,:kluch,:NASELENNIIPUNKT,:NOMERREISA);')
    RefreshSQL.Strings = (
      
        'SELECT  KLUCH, NOMERREISA, DLINAPUTI, NASELENNIIPUNKT,identify  ' +
        ' from marshrut'
      'where (NASELENNIIPUNKT=:NASELENNIIPUNKT) '
      'and (NOMERREISA=:NOMERREISA);')
    SelectSQL.Strings = (
      
        'select KLUCH, NOMERREISA, DLINAPUTI, NASELENNIIPUNKT,identify fr' +
        'om  MARSHRUT'
      'order by  NOMERREISA,KLUCH;')
    ModifySQL.Strings = (
      'update marshrut set '
      'dlinaputi=:dlinaputi,'
      'kluch=:kluch,'
      'NASELENNIIPUNKT=:NASELENNIIPUNKT,'
      'NOMERREISA=:NOMERREISA'
      
        'where (NASELENNIIPUNKT=:old_NASELENNIIPUNKT) and (NOMERREISA=:ol' +
        'd_NOMERREISA);')
    Active = True
    Left = 48
    Top = 240
    object IBDataSet1KLUCH: TSmallintField
      FieldName = 'KLUCH'
      Origin = '"MARSHRUT"."KLUCH"'
      Required = True
    end
    object IBDataSet1NOMERREISA: TIBStringField
      FieldName = 'NOMERREISA'
      Origin = '"MARSHRUT"."NOMERREISA"'
      Required = True
    end
    object IBDataSet1DLINAPUTI: TSmallintField
      FieldName = 'DLINAPUTI'
      Origin = '"MARSHRUT"."DLINAPUTI"'
      Required = True
    end
    object IBDataSet1NASELENNIIPUNKT: TIBStringField
      FieldName = 'NASELENNIIPUNKT'
      Origin = '"MARSHRUT"."NASELENNIIPUNKT"'
      Required = True
      Size = 75
    end
    object IBDataSet1IDENTIFY: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'IDENTIFY'
      Origin = '"MARSHRUT"."IDENTIFY"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
  end
  object DataSource4: TDataSource
    DataSet = IBDataSet1
    Left = 280
    Top = 104
  end
  object IBStoredProc1: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'PROC'
    Left = 48
    Top = 320
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'NOMAVT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOMR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAVT'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'CENSB'
        ParamType = ptInput
      end>
  end
end
