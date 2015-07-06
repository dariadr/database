unit Unit2;

interface

uses
  SysUtils, Classes, IBSQL, IBDatabase, DB, DBLogDLg, IBCustomDataSet,
  IBTable, IBUpdateSQL, IBQuery, IBStoredProc;

type
  TDataModule2 = class(TDataModule)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBDataSet1: TIBDataSet;
    DataSource1: TDataSource;
    IBDataSet2: TIBDataSet;
    DataSource2: TDataSource;
    IBDataSet3: TIBDataSet;
    DataSource3: TDataSource;
    IBDataSet1CENABILETA: TIBBCDField;
    IBDataSet1NOMERREISA: TIBStringField;
    IBDataSet2KLUCH: TSmallintField;
    IBDataSet2NOMERREISA: TIBStringField;
    IBDataSet2DLINAPUTI: TSmallintField;
    IBDataSet2NASELENNIIPUNKT: TIBStringField;
    IBDataSet2IDENTIFY: TIntegerField;
    IBDataSet3NOMERREISA: TIBStringField;
    IBDataSet4: TIBDataSet;
    DataSource4: TDataSource;
    DataSource5: TDataSource;
    IBDataSet6: TIBDataSet;
    IBDataSet7: TIBDataSet;
    DataSource6: TDataSource;
    DataSource7: TDataSource;
    IBDataSet3IDENTIFICATORRASPISANIA: TIntegerField;
    IBDataSet6IDENTIFICATORRASPISANIA: TIntegerField;
    IBDataSet6NACHALO: TDateField;
    IBDataSet6KONEC: TDateField;
    IBDataSet7VREMIA: TTimeField;
    IBDataSet7NOMERDNIA: TSmallintField;
    IBDataSet7IDENTIFICATORRASPISANIA: TIntegerField;
    IBDataSet4NOMERAVTOBUSA: TIBStringField;
    IBDataSet4NOMERREISA: TIBStringField;
    IBDataSet4DATAIVREMIA: TDateTimeField;
    IBDataSet4IDENTIFICATOR: TIntegerField;
    IBDataSet4CENABILETA: TIBBCDField;
    DataSource8: TDataSource;
    IBDataSet8: TIBDataSet;
    IBDataSet9: TIBDataSet;
    IBDataSet10: TIBDataSet;
    IBDataSet11: TIBDataSet;
    DataSource9: TDataSource;
    DataSource10: TDataSource;
    DataSource11: TDataSource;
    DataSource12: TDataSource;
    DataSource13: TDataSource;
    IBSQL1: TIBSQL;
    IBSQL2: TIBSQL;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    IBDataSet2naspunkt: TStringField;
    IBDataSet3tipi: TIBStringField;
    IBDataSet4nomav: TStringField;
    IBDataSet4nomreisa: TStringField;
    IBSQL3: TIBSQL;
    IBSQL4: TIBSQL;
    IBSQL5: TIBSQL;
    IBDataSet3TIP: TIBStringField;
    IBQuery3: TIBQuery;
    IBDataSet5: TIBDataSet;
    IBDataSet5CENABILETA: TIBBCDField;
    IBDataSet5DATAIVREMIA: TDateTimeField;
    IBDataSet5NOMERMESTA: TSmallintField;
    IBDataSet5IDENTIFICATOR: TIntegerField;
    IBDataSet5NACHALOPUTI: TIntegerField;
    IBDataSet5KONECPUTI: TIntegerField;
    IBDataSet5TIP: TIBStringField;
    IBDataSet5nach: TStringField;
    IBDataSet5kon: TStringField;
    IBDataSet5tipi: TIBStringField;
    procedure IBDataSet2NewRecord(DataSet: TDataSet);
    procedure IBDataSet3NewRecord(DataSet: TDataSet);
    procedure IBDataSet6NewRecord(DataSet: TDataSet);
    procedure IBDataSet7NewRecord(DataSet: TDataSet);
    procedure IBDataSet5NewRecord(DataSet: TDataSet);
    procedure IBDataSet1AfterPost(DataSet: TDataSet);
    procedure IBDataSet2AfterPost(DataSet: TDataSet);
    procedure IBDataSet3AfterPost(DataSet: TDataSet);
    procedure IBDataSet4AfterPost(DataSet: TDataSet);
    procedure IBDataSet5AfterPost(DataSet: TDataSet);
    procedure IBDataSet6AfterPost(DataSet: TDataSet);
    procedure IBDataSet7AfterPost(DataSet: TDataSet);
    procedure IBDataSet8AfterPost(DataSet: TDataSet);
    procedure IBDataSet9AfterPost(DataSet: TDataSet);
    procedure IBDataSet10AfterPost(DataSet: TDataSet);
    procedure IBDataSet11AfterPost(DataSet: TDataSet);
    procedure IBDataSet4AfterScroll(DataSet: TDataSet);
    procedure IBDataSet4BeforeScroll(DataSet: TDataSet);
    procedure IBDataSet12AfterPost(DataSet: TDataSet);
    procedure IBDataSet12NewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;
  d1, d2 : integer;

implementation

uses Unit1;

{$R *.dfm}


procedure TDataModule2.IBDataSet2NewRecord(DataSet: TDataSet);
begin
  ibdataset2.Fields[1].Value:=ibdataset1.Fields[1].Value;
end;

procedure TDataModule2.IBDataSet3NewRecord(DataSet: TDataSet);
begin
  ibdataset3.Fields[0].Value:=ibdataset1.Fields[1].Value;
end;

procedure TDataModule2.IBDataSet6NewRecord(DataSet: TDataSet);
begin
  ibdataset6.Fields[0].Value:=ibdataset3.Fields[2].Value;
end;

procedure TDataModule2.IBDataSet7NewRecord(DataSet: TDataSet);
begin
  ibdataset7.Fields[2].Value:=ibdataset3.Fields[2].Value;
end;

procedure TDataModule2.IBDataSet5NewRecord(DataSet: TDataSet);
var
  n,m:integer;
begin
  ibdataset5.Fields[2].Value:=now;
  ibdataset5.Fields[0].Value:=ibdataset4.Fields[3].Value;
  IBSQL1.Params[0].AsInteger:=ibdataset4.Fields[3].Value;
  IBSQL2.Params[0].AsString:=ibdataset4.Fields[0].Value;
  n:=1000000000;
  IBSQL1.ExecQuery;
  if not((IBSQL1.Eof) and (IBSQL1.Bof)) then
    n:=IBSQL1.Fields[0].AsInteger;
  IBSQL1.Close;
  IBSQL2.ExecQuery;
    m:=IBSQL2.Fields[0].AsInteger;
  IBSQL2.Close;
  if n=1000000000 then
    ibdataset5.Fields[3].Value:=1
  else
    if m>n then
      ibdataset5.Fields[3].Value:=n+1;
end;

procedure TDataModule2.IBDataSet1AfterPost(DataSet: TDataSet);
begin
  DataModule2.IBTransaction1.CommitRetaining;
end;

procedure TDataModule2.IBDataSet2AfterPost(DataSet: TDataSet);
begin
  DataModule2.IBTransaction1.CommitRetaining;
end;

procedure TDataModule2.IBDataSet3AfterPost(DataSet: TDataSet);
begin
  DataModule2.IBTransaction1.CommitRetaining;
end;

procedure TDataModule2.IBDataSet4AfterPost(DataSet: TDataSet);
begin
  DataModule2.IBTransaction1.CommitRetaining;
end;

procedure TDataModule2.IBDataSet5AfterPost(DataSet: TDataSet);
begin
  DataModule2.IBTransaction1.CommitRetaining;
end;

procedure TDataModule2.IBDataSet6AfterPost(DataSet: TDataSet);
begin
  DataModule2.IBTransaction1.CommitRetaining;
end;

procedure TDataModule2.IBDataSet7AfterPost(DataSet: TDataSet);
begin
  DataModule2.IBTransaction1.CommitRetaining;
end;

procedure TDataModule2.IBDataSet8AfterPost(DataSet: TDataSet);
begin
  DataModule2.IBTransaction1.CommitRetaining;
end;

procedure TDataModule2.IBDataSet9AfterPost(DataSet: TDataSet);
begin
  DataModule2.IBTransaction1.CommitRetaining;
end;

procedure TDataModule2.IBDataSet10AfterPost(DataSet: TDataSet);
begin
  DataModule2.IBTransaction1.CommitRetaining;
end;

procedure TDataModule2.IBDataSet11AfterPost(DataSet: TDataSet);
begin
  DataModule2.IBTransaction1.CommitRetaining;
end;

procedure TDataModule2.IBDataSet4AfterScroll(DataSet: TDataSet);
begin
  datamodule2.IBQuery3.Close;
  if datamodule2.IBDataSet4.Fields[1].AsString<>'' then
    datamodule2.IBQuery3.Params[0].AsString:=datamodule2.IBDataSet4.Fields[1].Asstring;
  datamodule2.IBQuery3.Open;
  DataModule2.IBDataSet5.Open;
end;

procedure TDataModule2.IBDataSet4BeforeScroll(DataSet: TDataSet);
begin
  DataModule2.IBDataSet5.Close;
end;

procedure TDataModule2.IBDataSet12AfterPost(DataSet: TDataSet);
begin
  DataModule2.IBTransaction1.CommitRetaining;
end;

procedure TDataModule2.IBDataSet12NewRecord(DataSet: TDataSet);
var
  n,m:integer;
begin
  ibdataset5.Fields[2].Value:=now;
  ibdataset5.Fields[0].Value:=ibdataset4.Fields[3].Value;
  IBSQL1.Params[0].AsInteger:=ibdataset4.Fields[3].Value;
  IBSQL2.Params[0].AsString:=ibdataset4.Fields[0].Value;
  n:=1000000000;
  IBSQL1.ExecQuery;
  if not((IBSQL1.Eof) and (IBSQL1.Bof)) then
    n:=IBSQL1.Fields[0].AsInteger;
  IBSQL1.Close;
  IBSQL2.ExecQuery;
    m:=IBSQL2.Fields[0].AsInteger;
  IBSQL2.Close;
  if n=1000000000 then
    ibdataset5.Fields[3].Value:=1
  else
    if m>n then
      ibdataset5.Fields[3].Value:=n+1;
end;

end.
