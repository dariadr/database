unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ComCtrls, DBGrids, Unit2, comobj;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    Edit1: TEdit;
    Button2: TButton;
    DBGrid2: TDBGrid;
    TabSheet3: TTabSheet;
    DBGrid3: TDBGrid;
    TabSheet4: TTabSheet;
    DBGrid4: TDBGrid;
    TabSheet5: TTabSheet;
    DBGrid5: TDBGrid;
    DBGrid6: TDBGrid;
    DBGrid7: TDBGrid;
    DBGrid8: TDBGrid;
    Edit2: TEdit;
    DBGrid9: TDBGrid;
    DBGrid10: TDBGrid;
    DBGrid11: TDBGrid;
    Label3: TLabel;
    CheckBox1: TCheckBox;
    DBGrid12: TDBGrid;
    Button1: TButton;
    Edit3: TEdit;
    Edit7: TEdit;
    DBGrid13: TDBGrid;
    Edit4: TEdit;
    Edit5: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Button3: TButton;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Edit10: TEdit;
    Edit11: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    Button5: TButton;
    Button4: TButton;
    Button6: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses DB, IBSQL;

{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
begin
  datamodule2.IBDataSet4.Active:=false;
  if trim(edit1.Text)<>''
  then
    datamodule2.IBDataSet4.Params[0].AsDateTime:=StrToDateTime(edit1.Text)
  else
    datamodule2.IBDataSet4.Params[0].AsDateTime:=StrToDateTime('1.1.1000 0:00:00');
  if trim(edit2.Text)<>''
  then
    datamodule2.IBDataSet4.Params[1].AsDateTime:=StrToDateTime(edit2.Text)
  else
    datamodule2.IBDataSet4.Params[1].AsDateTime:=StrToDateTime('1.1.3000 0:00:00');
  if CheckBox1.Checked
  then
    datamodule2.IBDataSet4.Params[2].AsDateTime:=Now
  else
    datamodule2.IBDataSet4.Params[2].AsDateTime:=StrToDateTime('1.1.1000 0:00:00');
  datamodule2.IBDataSet4.Active:=true;

end;



procedure TForm1.Button1Click(Sender: TObject);
begin
  DataModule2.IBQuery1.Active:=false;
  if trim(edit3.Text)<>''
  then
    datamodule2.IBQuery1.Params[0].AsDateTime:=StrToDateTime(edit3.Text)
  else
    DataModule2.IBQuery1.Params[0].AsDateTime:=StrToDateTime('1.1.1000 0:00:00');
  if trim(edit3.Text)<>''
  then
    DataModule2.IBQuery1.Params[1].AsDateTime:=StrToDateTime(edit7.Text)
  else
    DataModule2.IBQuery1.Params[1].AsDateTime:=StrToDateTime('1.1.3000 0:00:00');
  DataModule2.IBQuery1.Active:=true;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  DataModule2.IBQuery2.Active:=false;
  if trim(edit4.Text)<>''
  then
    DataModule2.IBQuery2.Params[0].AsDateTime:=StrToDateTime(edit4.Text)
  else
    DataModule2.IBQuery2.Params[0].AsDateTime:=StrToDateTime('1.1.1000 0:00:00');
  if trim(edit5.Text)<>''
  then
    DataModule2.IBQuery2.Params[1].AsDateTime:=StrToDateTime(edit5.Text)
  else
    DataModule2.IBQuery2.Params[1].AsDateTime:=StrToDateTime('1.1.3000 0:00:00');
  DataModule2.IBQuery2.Active:=true;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if (edit10.Text<>'') and (edit11.Text<>'') then
 if datamodule2.IBDataSet4.Locate('DATAIVREMIA;nomerreisa',VarArrayOf([StrToDateTime(edit11.Text),edit10.text]),[locaseinsensitive,lopartialkey])
 then
   datamodule2.IBDataSet4.Locate('DATAIVREMIA;nomerreisa',VarArrayOf([StrToDateTime(edit11.Text),edit10.text]),[locaseinsensitive,lopartialkey])
 else
   showmessage('не найдена запись');
end;



procedure TForm1.Button4Click(Sender: TObject);
var
  app,doc,range,table:oleVariant;
  i,j,id:integer;
  s:string;
begin
  if not(DataModule2.IBTransaction1.Active) then DataModule2.IBTransaction1.StartTransaction;
  DataModule2.IBSQL3.Params[0].AsString:=DataModule2.IBDataSet4.Fields[0].AsString;
  DataModule2.IBSQL3.ExecQuery();
  if not(DataModule2.IBSQL3.Eof and DataModule2.IBSQL3.bof)
  then
    i:=DataModule2.IBSQL3.Fields[0].AsInteger
  else
  begin
    DataModule2.IBSQL3.Close;
    showmessage('автобуса с таким номером не существует');
    exit;
  end;
  DataModule2.IBSQL3.Close;
  DataModule2.IBSQL4.Params[0].AsDateTime:=DataModule2.IBDataSet4.Fields[2].AsDateTime;
  DataModule2.IBSQL4.Params[1].AsInteger:=DataModule2.IBDataSet4.Fields[1].AsInteger;
  DataModule2.IBSQL4.ExecQuery();
  if not(DataModule2.IBSQL4.Eof and DataModule2.IBSQL4.Bof)
  then
    id:=DataModule2.IBSQL4.Fields[0].AsInteger
  else
  begin
    DataModule2.IBSQL4.Close;
    showmessage('отправления с такими параметрами не существует');
    exit;
  end;
  DataModule2.IBSQL4.Close;
  app:=CreateOleObject('word.application');
  doc:=app.documents.add(GetCurrentDir+'\1.doc');
  App.Visible := True;
  range:=doc.range(0);
  doc.range(range.start).text:='номер рейса: '+DataModule2.IBDataSet4.Fields[1].AsString;
  range.paragraphs.add;
  range:=doc.range(range.start+length('номер рейса: '+DataModule2.IBDataSet4.Fields[1].AsString)+1);
  doc.range(range.start,range.end).text:='номер автобуса: '+DataModule2.IBDataSet4.Fields[0].AsString;
  range.paragraphs.add;
  range:=doc.range(range.start+length('номер автобуса: '+DataModule2.IBDataSet4.Fields[0].AsString)+1);
  doc.range(range.start,range.end).text:='дата отправления: '+DataModule2.IBDataSet4.Fields[2].AsString;
  range.paragraphs.add;
  range.paragraphs.add;
  range:=doc.range(range.start+length('дата отправления: '+DataModule2.IBDataSet4.Fields[2].AsString)+2);
  Table := Doc.Tables.Add(Range, i+1,6);
  table.Borders.Enable:=true;
  s:=Table.Cell(1, 1).Range.Text;
  Table.Cell(1, 1).Range.Text:='номер места';
  Table.Cell(1, 2).Range.Text:='начало пути';
  Table.Cell(1, 3).Range.Text:='конец пути';
  Table.Cell(1, 4).Range.Text:='дата и время';
  Table.Cell(1, 5).Range.Text:='цена билета';
  Table.Cell(1, 6).Range.Text:='тип льготы';
  for j:=1 to i do
    Table.Cell(j+1, 1).Range.Text:=inttostr(j);
  DataModule2.IBSQL5.Params[0].asinteger:=id;
  DataModule2.IBSQL5.ExecQuery();
  if not(DataModule2.IBSQL5.eof and DataModule2.IBSQL5.bof) then
    while not DataModule2.IBSQL5.eof do
    begin
      Table.Cell(DataModule2.IBSQL5.fields[2].asinteger+1, 2).Range.Text:=DataModule2.IBSQL5.fields[4].AsString;
      Table.Cell(DataModule2.IBSQL5.fields[2].asinteger+1, 3).Range.Text:=DataModule2.IBSQL5.fields[5].AsString;
      Table.Cell(DataModule2.IBSQL5.fields[2].asinteger+1, 4).Range.Text:=DataModule2.IBSQL5.fields[1].AsString;
      Table.Cell(DataModule2.IBSQL5.fields[2].asinteger+1, 5).Range.Text:=DataModule2.IBSQL5.fields[0].AsString;
      Table.Cell(DataModule2.IBSQL5.fields[2].asinteger+1, 6).Range.Text:=DataModule2.IBSQL5.fields[6].AsString;
      DataModule2.IBSQL5.Next;
    end;
  DataModule2.IBSQL5.close;
  for j:=1 to i do
  if Table.Cell(j+1,2).range.Text=s then
    Table.Cell(j+1,1).Range.Text:=inttostr(j)+' не продано';
  doc:=Unassigned;
  app:=Unassigned;

end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  datamodule2.ibquery1.active:=false;
  DataModule2.IBQuery1.SQL.clear;
  DataModule2.IBQuery1.SQL.Add('select tip, (count(tip)) as c , (sum(CENABILETA)) as s from PRODAZHA a where (DATAIVREMIA between :t1 and :t2) group by tip ');
  if RadioButton1.Checked then
  if CheckBox2.Checked and CheckBox3.Checked
  then
    DataModule2.IBQuery1.SQL.Add('order by tip,c;')
  else
     if CheckBox2.Checked and CheckBox4.Checked
     then
       DataModule2.IBQuery1.SQL.Add('order by tip,s;')
     else
       if CheckBox3.Checked and CheckBox4.Checked
       then
         DataModule2.IBQuery1.SQL.Add('order by c,s;')
       else
         begin
           if CheckBox2.Checked then DataModule2.IBQuery1.SQL.Add('order by tip;');
           if CheckBox3.Checked then DataModule2.IBQuery1.SQL.Add('order by c;');
           if CheckBox4.Checked then DataModule2.IBQuery1.SQL.add('order by s;');
         end;
  if RadioButton2.Checked then
  if CheckBox2.Checked and CheckBox3.Checked
  then
    DataModule2.IBQuery1.SQL.Add('order by tip DESC,c desc;')
  else
     if CheckBox2.Checked and CheckBox4.Checked
     then
       DataModule2.IBQuery1.SQL.Add('order by tip DESC,s DESC;')
     else
       if CheckBox3.Checked and CheckBox4.Checked
       then
         DataModule2.IBQuery1.SQL.Add('order by c DESC,s DESC;')
       else
         begin
           if CheckBox2.Checked then DataModule2.IBQuery1.SQL.Add('order by tip DESC;');
           if CheckBox3.Checked then DataModule2.IBQuery1.SQL.Add('order by c DESC;');
           if CheckBox4.Checked then DataModule2.IBQuery1.SQL.add('order by s DESC;');
         end;
  button1.click;
end;

end.
