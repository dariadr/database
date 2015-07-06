object DataModule2: TDataModule2
  OldCreateOrder = False
  Left = 578
  Top = 73
  Height = 497
  Width = 642
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = 's2itm:d:\sb\ivt-11\droz_dv.ib'
    Params.Strings = (
      'user_name=droz_dv')
    DefaultTransaction = IBTransaction1
    Left = 48
    Top = 48
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
    Top = 48
  end
  object IBDataSet1: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    ForcedRefresh = True
    AfterPost = IBDataSet1AfterPost
    DeleteSQL.Strings = (
      'delete from reise '
      'where nomerreisa=:old_nomerreisa;')
    InsertSQL.Strings = (
      'insert into reise(cenabileta,NOMERREISA)'
      'values(:cenabileta,:NOMERREISA);')
    RefreshSQL.Strings = (
      
        'select cenabileta,nomerreisa from reise where nomerreisa=:nomerr' +
        'eisa;')
    SelectSQL.Strings = (
      'select * from reise order by nomerreisa;')
    ModifySQL.Strings = (
      'update reise set '
      'cenabileta=:cenabileta,'
      'NOMERREISA=:NOMERREISA'
      'where (NOMERREISA=:old_NOMERREISA);')
    Active = True
    Left = 48
    Top = 112
    object IBDataSet1CENABILETA: TIBBCDField
      FieldName = 'CENABILETA'
      Origin = '"REISE"."CENABILETA"'
      Required = True
      Precision = 7
      Size = 2
    end
    object IBDataSet1NOMERREISA: TIBStringField
      FieldName = 'NOMERREISA'
      Origin = '"REISE"."NOMERREISA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object DataSource1: TDataSource
    DataSet = IBDataSet1
    Left = 48
    Top = 184
  end
  object IBDataSet2: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    ForcedRefresh = True
    AfterPost = IBDataSet2AfterPost
    OnNewRecord = IBDataSet2NewRecord
    DeleteSQL.Strings = (
      'delete from marshrut'
      'where identify=:old_identify;')
    InsertSQL.Strings = (
      'insert into marshrut(kluch,NOMERREISA,dlinaputi,naselenniipunkt)'
      'values(:kluch,:NOMERREISA,:dlinaputi,:naselenniipunkt);')
    RefreshSQL.Strings = (
      
        'SELECT  kluch,NOMERREISA,dlinaputi,naselenniipunkt,identify   fr' +
        'om marshrut'
      'where (NASELENNIIPUNKT=:NASELENNIIPUNKT) '
      'and (NOMERREISA=:NOMERREISA);')
    SelectSQL.Strings = (
      
        'select * from marshrut m where m.NOMERREISA=:NOMERREISA order by' +
        ' kluch;')
    ModifySQL.Strings = (
      'update marshrut set '
      'dlinaputi=:dlinaputi,'
      'kluch=:kluch,'
      'NASELENNIIPUNKT=:NASELENNIIPUNKT,'
      'NOMERREISA=:NOMERREISA'
      
        'where (NASELENNIIPUNKT=:old_NASELENNIIPUNKT) and (NOMERREISA=:ol' +
        'd_NOMERREISA);')
    Active = True
    DataSource = DataSource1
    Left = 112
    Top = 112
    object IBDataSet2KLUCH: TSmallintField
      FieldName = 'KLUCH'
      Origin = '"MARSHRUT"."KLUCH"'
      Required = True
    end
    object IBDataSet2NOMERREISA: TIBStringField
      FieldName = 'NOMERREISA'
      Origin = '"MARSHRUT"."NOMERREISA"'
      Required = True
    end
    object IBDataSet2DLINAPUTI: TSmallintField
      FieldName = 'DLINAPUTI'
      Origin = '"MARSHRUT"."DLINAPUTI"'
      Required = True
    end
    object IBDataSet2NASELENNIIPUNKT: TIBStringField
      FieldName = 'NASELENNIIPUNKT'
      Origin = '"MARSHRUT"."NASELENNIIPUNKT"'
      Required = True
      Size = 75
    end
    object IBDataSet2IDENTIFY: TIntegerField
      FieldName = 'IDENTIFY'
      Origin = '"MARSHRUT"."IDENTIFY"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object IBDataSet2naspunkt: TStringField
      FieldKind = fkLookup
      FieldName = 'naspunkt'
      LookupDataSet = IBDataSet9
      LookupKeyFields = 'NASELENNIIPUNKT'
      LookupResultField = 'NASELENNIIPUNKT'
      KeyFields = 'NASELENNIIPUNKT'
      Lookup = True
    end
  end
  object DataSource2: TDataSource
    DataSet = IBDataSet2
    Left = 112
    Top = 184
  end
  object IBDataSet3: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    ForcedRefresh = True
    AfterPost = IBDataSet3AfterPost
    OnNewRecord = IBDataSet3NewRecord
    DeleteSQL.Strings = (
      'delete from RASPISANIE'
      'where (NOMERREISA=:old_NOMERREISA) and (TIP=:old_TIP);')
    InsertSQL.Strings = (
      'insert into RASPISANIE(TIP,NOMERREISA)'
      'values(:TIP,:NOMERREISA);')
    RefreshSQL.Strings = (
      'SELECT  *   from RASPISANIE'
      'where (NOMERREISA=:NOMERREISA) and (TIP=:TIP);')
    SelectSQL.Strings = (
      'select * from RASPISANIE where NOMERREISA=:NOMERREISA;')
    ModifySQL.Strings = (
      'update RASPISANIE set '
      'TIP=:TIP,'
      'NOMERREISA=:NOMERREISA'
      'where (IDENTIFICATORRASPISANIA=:old_IDENTIFICATORRASPISANIA);')
    Active = True
    DataSource = DataSource1
    Left = 176
    Top = 112
    object IBDataSet3NOMERREISA: TIBStringField
      FieldName = 'NOMERREISA'
      Origin = '"RASPISANIE"."NOMERREISA"'
      Required = True
      Visible = False
    end
    object IBDataSet3tipi: TIBStringField
      FieldKind = fkLookup
      FieldName = 'tipi'
      LookupDataSet = IBDataSet10
      LookupKeyFields = 'TIP'
      LookupResultField = 'TIP'
      KeyFields = 'TIP'
      Origin = '"RASPISANIE"."TIP"'
      Required = True
      Lookup = True
    end
    object IBDataSet3IDENTIFICATORRASPISANIA: TIntegerField
      FieldName = 'IDENTIFICATORRASPISANIA'
      Origin = 'RASPISANIE.IDENTIFICATORRASPISANIA'
    end
    object IBDataSet3TIP: TIBStringField
      FieldName = 'TIP'
      Origin = '"RASPISANIE"."TIP"'
      Required = True
      Size = 75
    end
  end
  object DataSource3: TDataSource
    DataSet = IBDataSet3
    Left = 176
    Top = 184
  end
  object IBDataSet4: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    ForcedRefresh = True
    AfterPost = IBDataSet4AfterPost
    AfterScroll = IBDataSet4AfterScroll
    BeforeScroll = IBDataSet4BeforeScroll
    DeleteSQL.Strings = (
      'delete from OTPRAVLENIE'
      'where (IDENTIFICATOR=:old_IDENTIFICATOR);')
    InsertSQL.Strings = (
      
        'insert into OTPRAVLENIE(NOMERAVTOBUSA,NOMERREISA,DATAIVREMIA,CEN' +
        'ABILETA)'
      'values(:NOMERAVTOBUSA,:NOMERREISA,:DATAIVREMIA,:CENABILETA);')
    RefreshSQL.Strings = (
      'select * from otpravlenie '
      'where (NOMERREISA=:NOMERREISA) and (DATAIVREMIA=:DATAIVREMIA);')
    SelectSQL.Strings = (
      
        'select * from otpravlenie where (DATAIVREMIA between :d1 and :d2' +
        ') and(DATAIVREMIA>:d3) '
      'order by DATAIVREMIA, NOMERREISA;')
    ModifySQL.Strings = (
      'update OTPRAVLENIE set '
      'NOMERAVTOBUSA=:NOMERAVTOBUSA,'
      'NOMERREISA=:NOMERREISA,'
      'DATAIVREMIA=:DATAIVREMIA,'
      'CENABILETA=:CENABILETA'
      'where (IDENTIFICATOR=:old_IDENTIFICATOR);')
    Left = 240
    Top = 112
    object IBDataSet4NOMERAVTOBUSA: TIBStringField
      FieldName = 'NOMERAVTOBUSA'
      Origin = 'OTPRAVLENIE.NOMERAVTOBUSA'
      Required = True
      Size = 10
    end
    object IBDataSet4NOMERREISA: TIBStringField
      FieldName = 'NOMERREISA'
      Origin = 'OTPRAVLENIE.NOMERREISA'
      Required = True
    end
    object IBDataSet4DATAIVREMIA: TDateTimeField
      FieldName = 'DATAIVREMIA'
      Origin = 'OTPRAVLENIE.DATAIVREMIA'
      Required = True
    end
    object IBDataSet4IDENTIFICATOR: TIntegerField
      FieldName = 'IDENTIFICATOR'
      Origin = 'OTPRAVLENIE.IDENTIFICATOR'
    end
    object IBDataSet4CENABILETA: TIBBCDField
      FieldName = 'CENABILETA'
      Origin = 'OTPRAVLENIE.CENABILETA'
      Required = True
      Precision = 9
      Size = 2
    end
    object IBDataSet4nomav: TStringField
      FieldKind = fkLookup
      FieldName = 'nomav'
      LookupDataSet = IBDataSet11
      LookupKeyFields = 'NOMERAVTOBUSA'
      LookupResultField = 'NOMERAVTOBUSA'
      KeyFields = 'NOMERAVTOBUSA'
      Origin = 'OTPRAVLENIE.NOMERAVTOBUSA'
      Required = True
      Lookup = True
    end
    object IBDataSet4nomreisa: TStringField
      FieldKind = fkLookup
      FieldName = 'nomreisa'
      LookupDataSet = IBDataSet1
      LookupKeyFields = 'NOMERREISA'
      LookupResultField = 'NOMERREISA'
      KeyFields = 'NOMERREISA'
      Origin = 'OTPRAVLENIE.NOMERREISA'
      Lookup = True
    end
  end
  object DataSource4: TDataSource
    DataSet = IBDataSet4
    Left = 240
    Top = 184
  end
  object DataSource5: TDataSource
    DataSet = IBDataSet5
    Left = 304
    Top = 184
  end
  object IBDataSet6: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    ForcedRefresh = True
    AfterPost = IBDataSet6AfterPost
    OnNewRecord = IBDataSet6NewRecord
    DeleteSQL.Strings = (
      'delete from VREMIADEISTVIA'
      
        'where (IDENTIFICATORRASPISANIA=:old_IDENTIFICATORRASPISANIA) and' +
        ' (NACHALO=:old_NACHALO);')
    InsertSQL.Strings = (
      
        'insert into VREMIADEISTVIA(IDENTIFICATORRASPISANIA,NACHALO,KONEC' +
        ')'
      'values(:IDENTIFICATORRASPISANIA,:NACHALO,:KONEC);'
      '')
    RefreshSQL.Strings = (
      'SELECT  *   from VREMIADEISTVIA'
      
        'where (IDENTIFICATORRASPISANIA=:IDENTIFICATORRASPISANIA)and (NAC' +
        'HALO=:NACHALO);'
      '')
    SelectSQL.Strings = (
      
        'select * from VREMIADEISTVIA where IDENTIFICATORRASPISANIA=:IDEN' +
        'TIFICATORRASPISANIA;')
    ModifySQL.Strings = (
      'update VREMIADEISTVIA set '
      'NACHALO=:NACHALO,'
      'KONEC=:KONEC'
      
        'where (IDENTIFICATORRASPISANIA=:old_IDENTIFICATORRASPISANIA) and' +
        ' (NACHALO=:old_NACHALO);'
      '')
    Active = True
    DataSource = DataSource3
    Left = 368
    Top = 112
    object IBDataSet6IDENTIFICATORRASPISANIA: TIntegerField
      FieldName = 'IDENTIFICATORRASPISANIA'
      Origin = 'VREMIADEISTVIA.IDENTIFICATORRASPISANIA'
      Visible = False
    end
    object IBDataSet6NACHALO: TDateField
      FieldName = 'NACHALO'
      Origin = 'VREMIADEISTVIA.NACHALO'
      Required = True
    end
    object IBDataSet6KONEC: TDateField
      FieldName = 'KONEC'
      Origin = 'VREMIADEISTVIA.KONEC'
      Required = True
    end
  end
  object IBDataSet7: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    ForcedRefresh = True
    AfterPost = IBDataSet7AfterPost
    OnNewRecord = IBDataSet7NewRecord
    DeleteSQL.Strings = (
      'delete from VREMIARASPISANIA'
      
        'where (IDENTIFICATORRASPISANIA=:old_IDENTIFICATORRASPISANIA) and' +
        ' (NOMERDNIA=:old_NOMERDNIA) and (VREMIA=:old_VREMIA);')
    InsertSQL.Strings = (
      
        'insert into VREMIARASPISANIA(IDENTIFICATORRASPISANIA,NOMERDNIA,V' +
        'REMIA)'
      'values(:IDENTIFICATORRASPISANIA,:NOMERDNIA,:VREMIA);')
    RefreshSQL.Strings = (
      'select * from VREMIARASPISANIA '
      
        'where (IDENTIFICATORRASPISANIA=:IDENTIFICATORRASPISANIA) and (NO' +
        'MERDNIA=:NOMERDNIA) and (VREMIA=:VREMIA);')
    SelectSQL.Strings = (
      
        'select * from VREMIARASPISANIA  where IDENTIFICATORRASPISANIA=:I' +
        'DENTIFICATORRASPISANIA;')
    ModifySQL.Strings = (
      'update VREMIARASPISANIA set '
      'NOMERDNIA=:NOMERDNIA,'
      'VREMIA=:VREMIA'
      
        'where (IDENTIFICATORRASPISANIA=:old_IDENTIFICATORRASPISANIA) and' +
        ' (NOMERDNIA=:old_NOMERDNIA) and (VREMIA=:old_VREMIA);')
    Active = True
    DataSource = DataSource3
    Left = 432
    Top = 112
    object IBDataSet7VREMIA: TTimeField
      FieldName = 'VREMIA'
      Origin = 'VREMIARASPISANIA.VREMIA'
      Required = True
    end
    object IBDataSet7NOMERDNIA: TSmallintField
      FieldName = 'NOMERDNIA'
      Origin = 'VREMIARASPISANIA.NOMERDNIA'
      Required = True
    end
    object IBDataSet7IDENTIFICATORRASPISANIA: TIntegerField
      FieldName = 'IDENTIFICATORRASPISANIA'
      Origin = 'VREMIARASPISANIA.IDENTIFICATORRASPISANIA'
      Required = True
      Visible = False
    end
  end
  object DataSource6: TDataSource
    DataSet = IBDataSet6
    Left = 368
    Top = 184
  end
  object DataSource7: TDataSource
    DataSet = IBDataSet7
    Left = 432
    Top = 184
  end
  object DataSource8: TDataSource
    DataSet = IBDataSet8
    Left = 40
    Top = 320
  end
  object IBDataSet8: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    ForcedRefresh = True
    AfterPost = IBDataSet8AfterPost
    DeleteSQL.Strings = (
      'delete from lgota'
      'where tip=:old_tip;')
    InsertSQL.Strings = (
      'insert into lgota(tip,proc)'
      'values(:tip,:proc);')
    SelectSQL.Strings = (
      'select * from  LGOTA'
      'order by tip;')
    ModifySQL.Strings = (
      'update lgota set '
      'tip=:tip,'
      'proc=:proc'
      'where (tip=:old_tip) ;')
    Active = True
    Left = 40
    Top = 256
  end
  object IBDataSet9: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    ForcedRefresh = True
    AfterPost = IBDataSet9AfterPost
    DeleteSQL.Strings = (
      'delete from mesto'
      'where NASELENNIIPUNKT=:old_NASELENNIIPUNKT;')
    InsertSQL.Strings = (
      'insert into mesto values(:NASELENNIIPUNKT);')
    RefreshSQL.Strings = (
      'select *  from MESTO'
      'where NASELENNIIPUNKT=:NASELENNIIPUNKT;')
    SelectSQL.Strings = (
      'select *  from MESTO'
      'order by NASELENNIIPUNKT;')
    ModifySQL.Strings = (
      'update mesto set '
      'NASELENNIIPUNKT=:NASELENNIIPUNKT'
      'where (NASELENNIIPUNKT=:old_NASELENNIIPUNKT) ;')
    Active = True
    Left = 112
    Top = 256
  end
  object IBDataSet10: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    ForcedRefresh = True
    AfterPost = IBDataSet10AfterPost
    DeleteSQL.Strings = (
      'delete from period'
      'where Tip=:old_tip;')
    InsertSQL.Strings = (
      'insert into period values(:TIP);')
    RefreshSQL.Strings = (
      'select * from period where (TIP=:TIP);')
    SelectSQL.Strings = (
      'select * from PERIOD'
      'order by tip;')
    ModifySQL.Strings = (
      'update period set '
      'tip=:tip'
      'where (tip=:old_tip) ;')
    Active = True
    Left = 176
    Top = 256
  end
  object IBDataSet11: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    ForcedRefresh = True
    AfterPost = IBDataSet11AfterPost
    DeleteSQL.Strings = (
      'delete from avtobus '
      'where (NOMERAVTOBUSA=:old_NOMERAVTOBUSA);')
    InsertSQL.Strings = (
      
        'insert into AVTOBUS values(:RASHODBENSINA,:KOLICHESTVOMEST,:NOME' +
        'RAVTOBUSA);')
    SelectSQL.Strings = (
      'select *  from AVTOBUS'
      'order by NOMERAVTOBUSA;')
    ModifySQL.Strings = (
      'update avtobus set '
      'RASHODBENSINA=:RASHODBENSINA,'
      'KOLICHESTVOMEST=:KOLICHESTVOMEST,'
      'NOMERAVTOBUSA=:NOMERAVTOBUSA'
      'where (NOMERAVTOBUSA=:old_NOMERAVTOBUSA) ;')
    Active = True
    Left = 240
    Top = 256
  end
  object DataSource9: TDataSource
    DataSet = IBDataSet9
    Left = 112
    Top = 320
  end
  object DataSource10: TDataSource
    DataSet = IBDataSet10
    Left = 176
    Top = 320
  end
  object DataSource11: TDataSource
    DataSet = IBDataSet11
    Left = 240
    Top = 320
  end
  object DataSource12: TDataSource
    DataSet = IBQuery1
    Left = 312
    Top = 320
  end
  object DataSource13: TDataSource
    DataSet = IBQuery2
    Left = 368
    Top = 320
  end
  object IBSQL1: TIBSQL
    Database = IBDatabase1
    SQL.Strings = (
      'select max(NOMERMESTA)  from PRODAZHA where IDENTIFICATOR=:id;')
    Transaction = IBTransaction1
    Left = 504
    Top = 112
  end
  object IBSQL2: TIBSQL
    Database = IBDatabase1
    SQL.Strings = (
      'select KOLICHESTVOMEST from AVTOBUS where NOMERAVTOBUSA=:nom'#39)
    Transaction = IBTransaction1
    Left = 560
    Top = 112
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      
        'select tip, (count(tip)) as c , (sum(CENABILETA)) as s from PROD' +
        'AZHA a where (DATAIVREMIA between :t1 and :t2) group by tip'
      'order by tip;')
    Left = 312
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 't1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 't2'
        ParamType = ptUnknown
      end>
  end
  object IBQuery2: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'select b.NOMERREISA, count(a.nomermesta)*100.00/'
      
        ' (select sum(c.kolichestvomest) from avtobus c inner join otprav' +
        'lenie d on (c.nomeravtobusa=d.nomeravtobusa) where (b.NOMERREISA' +
        '=d.NOMERREISA) and '
      '(d.DATAIVREMIA between :t1 and :t2)) as procent'
      
        'from prodazha a inner join otpravlenie b on a.identificator=b.id' +
        'entificator '
      'and (b.DATAIVREMIA between :t1 and :t2)'
      'group by b.nomerreisa'
      'order by b.nomerreisa;')
    Left = 368
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 't1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 't2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 't1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 't2'
        ParamType = ptUnknown
      end>
  end
  object IBSQL3: TIBSQL
    Database = IBDatabase1
    SQL.Strings = (
      'select KOLICHESTVOMEST  from AVTOBUS where NOMERAVTOBUSA=:nom;')
    Transaction = IBTransaction1
    Left = 504
    Top = 184
  end
  object IBSQL4: TIBSQL
    Database = IBDatabase1
    SQL.Strings = (
      
        'select IDENTIFICATOR  from OTPRAVLENIE where DATAIVREMIA=:d and ' +
        'NOMERREISA=:n;')
    Transaction = IBTransaction1
    Left = 560
    Top = 184
  end
  object IBSQL5: TIBSQL
    Database = IBDatabase1
    SQL.Strings = (
      
        'select a.CENABILETA, a.DATAIVREMIA, a.NOMERMESTA, a.IDENTIFICATO' +
        'R,(b.NASELENNIIPUNKT) as nachalo,(c.NASELENNIIPUNKT) as konec,a.' +
        'TIP'
      'from  PRODAZHA a '
      'join MARSHRUT b on a.NACHALOPUTI=b.IDENTIFY'
      'join MARSHRUT c on a.KONECPUTI=c.IDENTIFY'
      'where (IDENTIFICATOR=:IDENTIFICATOR);')
    Transaction = IBTransaction1
    Left = 504
    Top = 256
  end
  object IBQuery3: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    Active = True
    SQL.Strings = (
      
        'select IDENTIFY, NASELENNIIPUNKT  from MARSHRUT where NOMERREISA' +
        '=:n;')
    Left = 40
    Top = 400
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'n'
        ParamType = ptUnknown
      end>
  end
  object IBDataSet5: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    AfterPost = IBDataSet12AfterPost
    OnNewRecord = IBDataSet12NewRecord
    InsertSQL.Strings = (
      
        'insert into PRODAZHA(CENABILETA,DATAIVREMIA,NOMERMESTA,IDENTIFIC' +
        'ATOR,nachaloputi,konecputi,'
      'TIP) '
      'values(:CENABILETA,:DATAIVREMIA,:NOMERMESTA,:IDENTIFICATOR,'
      ':nachaloputi,:konecputi,'
      ':TIP);'
      '')
    RefreshSQL.Strings = (
      'select '
      'CENABILETA,'
      'DATAIVREMIA,'
      'NOMERMESTA,'
      'IDENTIFICATOR,'
      'NACHALOPUTI,'
      'KONECPUTI,'
      'TIP'
      'from prodazha'
      
        'where (IDENTIFICATOR=:IDENTIFICATOR) and (NOMERMESTA=:NOMERMESTA' +
        ');'
      ''
      '')
    SelectSQL.Strings = (
      
        'select a.CENABILETA, a.DATAIVREMIA, a.NOMERMESTA, a.IDENTIFICATO' +
        'R,a.NACHALOPUTI,a.KONECPUTI,a.TIP'
      'from  PRODAZHA a '
      'where (IDENTIFICATOR=:IDENTIFICATOR) '
      'order by NOMERMESTA;')
    ModifySQL.Strings = (
      'update PRODAZHA set '
      'CENABILETA=:CENABILETA,'
      'DATAIVREMIA=:DATAIVREMIA,'
      'NOMERMESTA=:NOMERMESTA,'
      'IDENTIFICATOR=:IDENTIFICATOR,'
      'NACHALOPUTI=:nachaloputi,'
      'KONECPUTI=:konecputi,'
      'TIP=:TIP'
      
        'where (IDENTIFICATOR=:old_IDENTIFICATOR) and (NOMERMESTA=:old_NO' +
        'MERMESTA);'
      ''
      ''
      '')
    DataSource = DataSource4
    Left = 304
    Top = 112
    object IBDataSet5IDENTIFICATOR: TIntegerField
      FieldName = 'IDENTIFICATOR'
      Origin = '"PRODAZHA"."IDENTIFICATOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBDataSet5CENABILETA: TIBBCDField
      FieldName = 'CENABILETA'
      Origin = '"PRODAZHA"."CENABILETA"'
      Precision = 7
      Size = 2
    end
    object IBDataSet5DATAIVREMIA: TDateTimeField
      FieldName = 'DATAIVREMIA'
      Origin = '"PRODAZHA"."DATAIVREMIA"'
      Required = True
    end
    object IBDataSet5NOMERMESTA: TSmallintField
      FieldName = 'NOMERMESTA'
      Origin = '"PRODAZHA"."NOMERMESTA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBDataSet5NACHALOPUTI: TIntegerField
      FieldName = 'NACHALOPUTI'
      Origin = '"PRODAZHA"."NACHALOPUTI"'
      Required = True
    end
    object IBDataSet5KONECPUTI: TIntegerField
      FieldName = 'KONECPUTI'
      Origin = '"PRODAZHA"."KONECPUTI"'
      Required = True
    end
    object IBDataSet5TIP: TIBStringField
      FieldName = 'TIP'
      Origin = '"PRODAZHA"."TIP"'
      Required = True
      Size = 75
    end
    object IBDataSet5nach: TStringField
      FieldKind = fkLookup
      FieldName = 'nach'
      LookupDataSet = IBQuery3
      LookupKeyFields = 'IDENTIFY'
      LookupResultField = 'NASELENNIIPUNKT'
      KeyFields = 'NACHALOPUTI'
      Size = 80
      Lookup = True
    end
    object IBDataSet5kon: TStringField
      FieldKind = fkLookup
      FieldName = 'kon'
      LookupDataSet = IBQuery3
      LookupKeyFields = 'IDENTIFY'
      LookupResultField = 'NASELENNIIPUNKT'
      KeyFields = 'KONECPUTI'
      Size = 80
      Lookup = True
    end
    object IBDataSet5tipi: TIBStringField
      FieldKind = fkLookup
      FieldName = 'tipi'
      LookupDataSet = IBDataSet8
      LookupKeyFields = 'TIP'
      LookupResultField = 'TIP'
      KeyFields = 'TIP'
      Lookup = True
    end
  end
end
