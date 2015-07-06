unit Unit2;

interface

uses
  SysUtils, Classes, IBSQL, IBDatabase, DB, DBLogDLg, IBCustomDataSet,
  IBTable;

type
  TDataModule2 = class(TDataModule)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBTable1: TIBTable;
    IBTable2: TIBTable;
    IBTable3: TIBTable;
    IBTable5: TIBTable;
    IBTable6: TIBTable;
    IBTable4: TIBTable;
    IBTable4TIP: TIBStringField;
    IBTable4IDENTIFICATORRASPISANIA: TIntegerField;
    IBTable4NOMERREISA: TIBStringField;
    procedure IBTable6FilterRecord(DataSet: TDataSet; var Accept: Boolean);
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

procedure TDataModule2.IBTable6FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
   Accept := (DataSet['nomermesta'] = d1) and (DataSet['identificator']=d2);
end;

end.
