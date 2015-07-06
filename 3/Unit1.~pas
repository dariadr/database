unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ComCtrls, DBGrids, Unit2;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button2: TButton;
    DBGrid2: TDBGrid;
    TabSheet3: TTabSheet;
    DBGrid3: TDBGrid;
    TabSheet4: TTabSheet;
    DBGrid4: TDBGrid;
    TabSheet5: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    Edit8: TEdit;
    Edit9: TEdit;
    Button5: TButton;
    Edit4: TEdit;
    Label4: TLabel;
    Edit5: TEdit;
    Label5: TLabel;
    Edit6: TEdit;
    Label6: TLabel;
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses DB;

{$R *.dfm}

procedure TForm1.Button4Click(Sender: TObject);
begin
 { datamodule2.IBTable4.Open;
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
  datamodule2.ibtransaction1.commitretaining;       }
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  datamodule2.IBQuery2.Active:=false;
  datamodule2.IBQuery2.Params[0].AsDateTime:=StrToDateTime(edit1.Text);
  datamodule2.IBQuery2.Params[1].AsDateTime:=StrToDateTime(edit2.Text);
  datamodule2.IBQuery2.Active:=true;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  datamodule2.IBStoredProc1.Params[1].AsString:=edit8.text;
  datamodule2.IBStoredProc1.Params[2].AsString:=edit9.text;
  datamodule2.IBStoredProc1.Params[3].AsDateTime:=StrToDateTime(edit4.text);
  datamodule2.IBStoredProc1.Params[4].AsFloat:=strtofloat(edit5.text);
  datamodule2.IBStoredProc1.ExecProc;
  edit6.Text:=datamodule2.IBStoredProc1.Params[0].AsString;

end;

end.
