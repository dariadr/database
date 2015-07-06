unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ComCtrls, DBGrids, Unit2;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Button1: TButton;
    Memo1: TMemo;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Button2: TButton;
    Label3: TLabel;
    Edit3: TEdit;
    Button3: TButton;
    Label4: TLabel;
    Edit4: TEdit;
    TabSheet4: TTabSheet;
    Label5: TLabel;
    Edit5: TEdit;
    Button4: TButton;
    Label6: TLabel;
    Edit6: TEdit;
    Label7: TLabel;
    Edit7: TEdit;
    TabSheet5: TTabSheet;
    Edit8: TEdit;
    Edit9: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Button5: TButton;
    TabSheet6: TTabSheet;
    Label10: TLabel;
    Edit10: TEdit;
    Label11: TLabel;
    Edit11: TEdit;
    Label12: TLabel;
    Edit12: TEdit;
    Label13: TLabel;
    Edit13: TEdit;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  datamodule2.IBTable1.open;
  while not(datamodule2.IBTable1.Eof) do
  begin
    memo1.Lines.Add(datamodule2.IBTable1['NASELENNIIPUNKT']);
    datamodule2.IBTable1.Next;
  end;
  datamodule2.IBTable1.Close;
end;



procedure TForm1.Button2Click(Sender: TObject);
begin
  datamodule2.IBTable2.Open;
  datamodule2.IBTable2.Filter:='NASELENNIIPUNKT='''+edit1.Text+'''';
  while not(datamodule2.IBTable2.Eof) do
    datamodule2.IBTable2.Next;
  edit2.Text:=inttostr(datamodule2.IBTable2.RecordCount);
  datamodule2.IBTable2.Close;

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  datamodule2.IBTable3.Open;
  while not(datamodule2.IBTable3.Eof) do
  begin
    if datamodule2.IBTable3['IDENTIFICATOR']=edit3.Text then
    begin
      datamodule2.IBTable3.Edit;
      datamodule2.IBTable3['CENABILETA']:=edit4.text;
      datamodule2.IBTable3.Post;
      break;
    end;
    datamodule2.IBTable3.Next;
  end;
  datamodule2.IBTable3.Close;
  datamodule2.ibtransaction1.commit;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  datamodule2.IBTable4.Open;
  datamodule2.IBTable4.Append;
  datamodule2.IBTable4.Fields[0].AsString:=edit6.Text;
  datamodule2.IBTable4.Fields[2].AsInteger:=strtoint(edit5.Text);
  datamodule2.IBTable4.Post;
  datamodule2.IBTable4.Refresh;
  if datamodule2.IBTable4.Locate('NOMERREISA;TIP',vararrayof([edit5.Text,edit6.Text]),[]) then
    edit7.Text:=datamodule2.IBTable4.Fields[1].AsString
  else
    edit7.Text:='Запись не найдена';
  datamodule2.IBTable4.Close;
  datamodule2.ibtransaction1.commitretaining;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  datamodule2.IBTable5.Open;
  datamodule2.IBTable5.Locate('nomerreisa;naselenniipunkt',vararrayof([edit8.Text,edit9.Text]),[]);
  datamodule2.IBTable5.Delete;
  datamodule2.IBTable5.Close;
  datamodule2.ibtransaction1.commit;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  datamodule2.IBTable6.Filter:='nomermesta='+edit11.Text+' and identificator='+edit10.Text+'';
  datamodule2.IBTable6.Open;
  datamodule2.IBTable6.FindFirst;
  datamodule2.IBTable6.Edit;
  datamodule2.IBTable6['CENABILETA']:=edit12.Text;
  datamodule2.IBTable6['KONECPUTI']:=edit13.Text;
  datamodule2.IBTable6.Post;
  datamodule2.IBTable6.Close;
  datamodule2.ibtransaction1.commitretaining;
end;

end.
