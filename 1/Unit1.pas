unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ComCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    StringGrid1: TStringGrid;
    Button2: TButton;
    Edit2: TEdit;
    TabSheet3: TTabSheet;
    Edit3: TEdit;
    Edit4: TEdit;
    Button3: TButton;
    TabSheet4: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Button4: TButton;
    TabSheet5: TTabSheet;
    Edit10: TEdit;
    Label10: TLabel;
    Button5: TButton;
    Label9: TLabel;
    Edit9: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
sum:integer;
begin
  if not(datamodule2.IBTransaction1.InTransaction) then datamodule2.IBTransaction1.StartTransaction;
  sum:=0;
  datamodule2.IBSQL1.ExecQuery();
  while not(datamodule2.IBSQL1.Eof) do
  begin
    sum:=sum+datamodule2.IBSQL1.Fields[0].AsInteger;
    datamodule2.IBSQL1.Next;
  end;
  edit1.Text:=inttostr(sum);
  datamodule2.IBSQL1.Close;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
i,j:integer;
begin
  if not(datamodule2.IBTransaction1.InTransaction) then datamodule2.IBTransaction1.StartTransaction;
  for i:=1 to 4 do
    for j:=1 to 4 do
      stringgrid1.Cells[i,j]:='';
  i:=1;
  datamodule2.IBSQL2.Params[0].AsString :=edit2.Text;
  stringgrid1.Cells[1,0]:='Номер места';
  stringgrid1.Cells[2,0]:='Дата покупки';
  stringgrid1.Cells[3,0]:='Цена билета';
  stringgrid1.Cells[4,0]:='Тип билета';

  datamodule2.IBSQL2.ExecQuery();
  while not(datamodule2.IBSQL2.Eof) do
  begin
  stringgrid1.RowCount:=i+1;
    for j:=1 to 4 do
      stringgrid1.Cells[j,i]:=datamodule2.IBSQL2.Fields[j-1].Asstring;
    datamodule2.IBSQL2.Next;
    inc(i);
  end;
  datamodule2.IBSQL2.Close;
  datamodule2.IBTransaction1.Commit;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if not(datamodule2.IBTransaction1.InTransaction) then datamodule2.IBTransaction1.StartTransaction;
  datamodule2.IBSQL3.Params[0].AsString :=edit3.Text;
  datamodule2.IBSQL3.Params[1].Asstring :=edit4.Text;
  datamodule2.IBSQL3.ExecQuery();
  datamodule2.IBSQL3.Close;
  datamodule2.ibtransaction1.commit;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if not(datamodule2.IBTransaction1.InTransaction) then datamodule2.IBTransaction1.StartTransaction;
  datamodule2.IBSQL4.Params[0].AsString :=edit5.Text;
  datamodule2.IBSQL4.Params[1].Asstring :=edit6.Text;
  datamodule2.IBSQL4.Params[2].Asstring :=edit7.Text;
  datamodule2.IBSQL4.Params[3].Asstring :=edit8.Text;
  datamodule2.IBSQL4.ExecQuery();
  datamodule2.IBSQL4.Close;
  if not(datamodule2.IBTransaction1.InTransaction) then datamodule2.IBTransaction1.StartTransaction;
  datamodule2.IBSQL6.Params[0].AsString :=edit5.Text;
  datamodule2.IBSQL6.Params[1].Asstring :=edit6.Text;
  datamodule2.IBSQL6.ExecQuery();
  edit9.Text:=datamodule2.IBSQL6.Fields[0].Asstring;
  datamodule2.IBSQL6.Close;
  datamodule2.ibtransaction1.commit;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if not(datamodule2.IBTransaction1.InTransaction) then datamodule2.IBTransaction1.StartTransaction;
  datamodule2.IBSQL5.Params[0].AsString :=edit10.Text;
  datamodule2.IBSQL5.ExecQuery();
  datamodule2.IBSQL5.Close;
  datamodule2.ibtransaction1.commit;
end;

end.
