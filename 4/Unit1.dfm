object Form1: TForm1
  Left = 120
  Top = 234
  Width = 1208
  Height = 745
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    1200
    711)
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 2161
    Height = 1149
    ActivePage = TabSheet3
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1088#1077#1081#1089#1099','#1084#1072#1088#1096#1088#1091#1090#1099','#1088#1072#1089#1087#1080#1089#1072#1085#1080#1103
      ParentShowHint = False
      ShowHint = False
      DesignSize = (
        2153
        1121)
      object Label8: TLabel
        Left = 40
        Top = 8
        Width = 50
        Height = 20
        Caption = ' '#1088#1077#1081#1089#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 344
        Top = 8
        Width = 220
        Height = 20
        Caption = #1084#1072#1088#1096#1088#1091#1090#1099' '#1074#1099#1073#1088#1072#1085#1085#1086#1075#1086' '#1088#1077#1081#1089#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 840
        Top = 8
        Width = 230
        Height = 20
        Caption = #1088#1072#1089#1087#1080#1089#1072#1085#1080#1103' '#1074#1099#1073#1088#1072#1085#1085#1086#1075#1086' '#1088#1077#1081#1089#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBGrid1: TDBGrid
        Left = 40
        Top = 32
        Width = 241
        Height = 644
        Anchors = [akLeft, akTop, akBottom]
        DataSource = DataModule2.DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NOMERREISA'
            Title.Alignment = taCenter
            Title.Caption = #1085#1086#1084#1077#1088' '#1088#1077#1081#1089#1072
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CENABILETA'
            Title.Alignment = taCenter
            Title.Caption = #1094#1077#1085#1072' '#1073#1080#1083#1077#1090#1072
            Width = 100
            Visible = True
          end>
      end
      object DBGrid5: TDBGrid
        Left = 352
        Top = 32
        Width = 481
        Height = 644
        Anchors = [akLeft, akTop, akBottom]
        DataSource = DataModule2.DataSource2
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'KLUCH'
            Title.Alignment = taCenter
            Title.Caption = #1085#1086#1084#1077#1088' '#1086#1089#1090#1072#1085#1086#1074#1082#1080
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMERREISA'
            Title.Alignment = taCenter
            Title.Caption = #1085#1086#1084#1077#1088' '#1088#1077#1081#1089#1072
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'DLINAPUTI'
            Title.Alignment = taCenter
            Title.Caption = #1076#1083#1080#1085#1072' '#1087#1091#1090#1080
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDENTIFY'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'naspunkt'
            Title.Caption = #1085#1072#1089#1077#1083#1105#1085#1085#1099#1081' '#1087#1091#1085#1082#1090#1072
            Width = 172
            Visible = True
          end>
      end
      object DBGrid6: TDBGrid
        Left = 840
        Top = 32
        Width = 337
        Height = 153
        Anchors = [akLeft, akTop, akRight]
        DataSource = DataModule2.DataSource3
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NOMERREISA'
            Title.Alignment = taCenter
            Title.Caption = #1085#1086#1084#1077#1088' '#1088#1077#1081#1089#1072
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'IDENTIFICATORRASPISANIA'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'tipi'
            Title.Caption = #1090#1080#1087#1099
            Visible = True
          end>
      end
      object DBGrid10: TDBGrid
        Left = 840
        Top = 192
        Width = 337
        Height = 153
        Anchors = [akLeft, akTop, akRight]
        DataSource = DataModule2.DataSource6
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'IDENTIFICATORRASPISANIA'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'NACHALO'
            Title.Alignment = taCenter
            Title.Caption = #1085#1072#1095#1072#1083#1100#1085#1086#1077' '#1074#1088#1077#1084#1103' '#1088#1072#1089#1087#1080#1089#1072#1085#1080#1103
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KONEC'
            Title.Alignment = taCenter
            Title.Caption = #1082#1086#1085#1077#1095#1085#1086#1077' '#1074#1088#1077#1084#1103' '#1088#1072#1089#1087#1080#1089#1072#1085#1080#1103
            Visible = True
          end>
      end
      object DBGrid11: TDBGrid
        Left = 840
        Top = 352
        Width = 337
        Height = 324
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = DataModule2.DataSource7
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NOMERDNIA'
            Title.Alignment = taCenter
            Title.Caption = #1085#1086#1084#1077#1088' '#1076#1085#1103
            Width = 167
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VREMIA'
            Title.Alignment = taCenter
            Title.Caption = #1074#1088#1077#1084#1103
            Width = 142
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDENTIFICATORRASPISANIA'
            Visible = False
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1086#1090#1087#1088#1072#1074#1083#1077#1085#1080#1103', '#1087#1088#1086#1076#1072#1078#1080' '#1073#1080#1083#1077#1090#1086#1074
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = False
      DesignSize = (
        2153
        1121)
      object Label2: TLabel
        Left = 24
        Top = 72
        Width = 150
        Height = 13
        Caption = #1082#1086#1085#1077#1095#1085#1086#1077' '#1074#1088#1077#1084#1103' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1080#1103
      end
      object Label3: TLabel
        Left = 24
        Top = 40
        Width = 156
        Height = 13
        Caption = #1085#1072#1095#1072#1083#1100#1085#1086#1077' '#1074#1088#1077#1084#1103' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1080#1103
      end
      object Label11: TLabel
        Left = 72
        Top = 112
        Width = 100
        Height = 20
        Caption = #1086#1090#1087#1088#1072#1074#1083#1077#1085#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 520
        Top = 112
        Width = 280
        Height = 20
        Caption = #1087#1088#1086#1076#1072#1078#1080' '#1085#1072' '#1074#1099#1073#1088#1072#1085#1085#1086#1077' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1080#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 112
        Top = 599
        Width = 65
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = #1085#1086#1084#1077#1088' '#1088#1077#1081#1089#1072
      end
      object Label20: TLabel
        Left = 112
        Top = 639
        Width = 91
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = #1076#1072#1090#1072' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1080#1103
      end
      object Edit1: TEdit
        Left = 192
        Top = 40
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object Button2: TButton
        Left = 344
        Top = 72
        Width = 75
        Height = 25
        Caption = #1074#1099#1087#1086#1083#1085#1080#1090#1100
        TabOrder = 1
        OnClick = Button2Click
      end
      object DBGrid2: TDBGrid
        Left = 40
        Top = 136
        Width = 441
        Height = 440
        Anchors = [akLeft, akTop, akBottom]
        DataSource = DataModule2.DataSource4
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'nomav'
            Title.Caption = #1085#1086#1084#1077#1088' '#1072#1074#1090#1086#1073#1091#1089#1072
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nomreisa'
            Title.Caption = #1085#1086#1084#1077#1088' '#1088#1077#1081#1089#1072
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAIVREMIA'
            Title.Alignment = taCenter
            Title.Caption = #1076#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103
            Width = 119
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDENTIFICATOR'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CENABILETA'
            Title.Alignment = taCenter
            Title.Caption = #1094#1077#1085#1072' '#1073#1080#1083#1077#1090#1072
            Width = 81
            Visible = True
          end>
      end
      object Edit2: TEdit
        Left = 192
        Top = 72
        Width = 121
        Height = 21
        TabOrder = 3
      end
      object DBGrid9: TDBGrid
        Left = 520
        Top = 136
        Width = 644
        Height = 440
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = DataModule2.DataSource5
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'IDENTIFICATOR'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CENABILETA'
            Title.Alignment = taCenter
            Title.Caption = #1094#1077#1085#1072' '#1073#1080#1083#1077#1090#1072
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAIVREMIA'
            Title.Alignment = taCenter
            Title.Caption = #1076#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103
            Width = 125
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMERMESTA'
            Title.Alignment = taCenter
            Title.Caption = #1085#1086#1084#1077#1088' '#1084#1077#1089#1090#1072
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tipi'
            Title.Caption = #1090#1080#1087' '#1083#1100#1075#1086#1090#1099
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nach'
            Title.Caption = #1085#1072#1095#1072#1083#1086' '#1087#1091#1090#1080
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'kon'
            Title.Caption = #1082#1086#1085#1077#1094' '#1087#1091#1090#1080
            Width = 86
            Visible = True
          end>
      end
      object CheckBox1: TCheckBox
        Left = 336
        Top = 40
        Width = 185
        Height = 17
        Caption = #1090#1086#1083#1100#1082#1086' '#1085#1077#1091#1096#1077#1076#1096#1080#1077' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1080#1103
        TabOrder = 5
      end
      object Edit10: TEdit
        Left = 216
        Top = 599
        Width = 121
        Height = 21
        Anchors = [akLeft, akBottom]
        TabOrder = 6
      end
      object Edit11: TEdit
        Left = 216
        Top = 631
        Width = 121
        Height = 21
        Anchors = [akLeft, akBottom]
        TabOrder = 7
      end
      object Button5: TButton
        Left = 368
        Top = 615
        Width = 75
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = #1087#1077#1088#1077#1093#1086#1076
        TabOrder = 8
        OnClick = Button5Click
      end
      object Button4: TButton
        Left = 1064
        Top = 623
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #1074#1077#1076#1086#1084#1086#1089#1090#1100
        TabOrder = 9
        OnClick = Button4Click
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1089#1087#1088#1072#1074#1086#1095#1085#1099#1077' '#1090#1072#1073#1083#1080#1094#1099
      ImageIndex = 2
      DesignSize = (
        2153
        1121)
      object Label13: TLabel
        Left = 32
        Top = 16
        Width = 55
        Height = 20
        Caption = #1083#1100#1075#1086#1090#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 296
        Top = 16
        Width = 149
        Height = 20
        Caption = #1085#1072#1089#1077#1083#1105#1085#1085#1099#1077' '#1087#1091#1085#1082#1090#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 584
        Top = 16
        Width = 119
        Height = 20
        Caption = #1090#1080#1087' '#1088#1072#1089#1087#1080#1089#1072#1085#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 880
        Top = 16
        Width = 71
        Height = 20
        Caption = #1072#1074#1090#1086#1073#1091#1089#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBGrid3: TDBGrid
        Left = 32
        Top = 40
        Width = 257
        Height = 516
        Anchors = [akLeft, akTop, akBottom]
        DataSource = DataModule2.DataSource8
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'TIP'
            Title.Alignment = taCenter
            Title.Caption = #1090#1080#1087' '#1083#1100#1075#1086#1090#1099
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PROC'
            Title.Alignment = taCenter
            Title.Caption = #1087#1088#1086#1094#1077#1085#1090' '#1086#1090' '#1089#1090#1086#1080#1084#1086#1089#1090#1080
            Width = 121
            Visible = True
          end>
      end
      object DBGrid7: TDBGrid
        Left = 296
        Top = 40
        Width = 241
        Height = 516
        Anchors = [akLeft, akTop, akBottom]
        DataSource = DataModule2.DataSource9
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NASELENNIIPUNKT'
            Title.Alignment = taCenter
            Title.Caption = #1085#1072#1089#1077#1083#1105#1085#1085#1099#1081' '#1087#1091#1085#1082#1090
            Width = 110
            Visible = True
          end>
      end
      object DBGrid8: TDBGrid
        Left = 584
        Top = 40
        Width = 225
        Height = 516
        Anchors = [akLeft, akTop, akBottom]
        DataSource = DataModule2.DataSource10
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'TIP'
            Title.Alignment = taCenter
            Title.Caption = #1090#1080#1087' '#1088#1072#1089#1087#1080#1089#1072#1085#1080#1103
            Width = 103
            Visible = True
          end>
      end
      object DBGrid12: TDBGrid
        Left = 848
        Top = 40
        Width = 338
        Height = 516
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = DataModule2.DataSource11
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NOMERAVTOBUSA'
            Title.Alignment = taCenter
            Title.Caption = #1085#1086#1084#1077#1088' '#1072#1074#1090#1086#1073#1091#1089#1072
            Width = 94
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RASHODBENSINA'
            Title.Alignment = taCenter
            Title.Caption = #1088#1072#1089#1093#1086#1076' '#1073#1077#1085#1079#1080#1085#1072
            Width = 91
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KOLICHESTVOMEST'
            Title.Alignment = taCenter
            Title.Caption = #1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1084#1077#1089#1090
            Width = 92
            Visible = True
          end>
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1089#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1087#1088#1086#1076#1072#1085#1085#1099#1093' '#1073#1080#1083#1077#1090#1086#1074
      ImageIndex = 3
      DesignSize = (
        2153
        1121)
      object Label17: TLabel
        Left = 64
        Top = 596
        Width = 156
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = #1085#1072#1095#1072#1083#1100#1085#1086#1077' '#1074#1088#1077#1084#1103' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1080#1103
      end
      object Label18: TLabel
        Left = 232
        Top = 596
        Width = 150
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = #1082#1086#1085#1077#1095#1085#1086#1077' '#1074#1088#1077#1084#1103' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1080#1103
      end
      object DBGrid4: TDBGrid
        Left = 24
        Top = 40
        Width = 1138
        Height = 541
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = DataModule2.DataSource12
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'TIP'
            Title.Alignment = taCenter
            Title.Caption = #1090#1080#1087' '#1073#1080#1083#1077#1090#1072
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'C'
            Title.Alignment = taCenter
            Title.Caption = #1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1087#1088#1086#1076#1072#1085#1085#1099#1093' '#1073#1080#1083#1077#1090#1086#1074
            Width = 167
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'S'
            Title.Alignment = taCenter
            Title.Caption = #1089#1091#1084#1084#1072' '#1076#1077#1085#1077#1075
            Width = 86
            Visible = True
          end>
      end
      object Button1: TButton
        Left = 184
        Top = 652
        Width = 75
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = #1088#1072#1089#1095#1105#1090
        TabOrder = 1
        OnClick = Button1Click
      end
      object Edit3: TEdit
        Left = 88
        Top = 620
        Width = 121
        Height = 21
        Anchors = [akLeft, akBottom]
        TabOrder = 2
      end
      object Edit7: TEdit
        Left = 232
        Top = 620
        Width = 121
        Height = 21
        Anchors = [akLeft, akBottom]
        TabOrder = 3
      end
      object Button6: TButton
        Left = 624
        Top = 624
        Width = 75
        Height = 25
        Caption = #1086#1073#1085#1086#1074#1080#1090#1100
        TabOrder = 4
        OnClick = Button6Click
      end
      object RadioButton1: TRadioButton
        Left = 880
        Top = 600
        Width = 113
        Height = 17
        Caption = #1087#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
        Checked = True
        TabOrder = 5
        TabStop = True
      end
      object RadioButton2: TRadioButton
        Left = 880
        Top = 632
        Width = 193
        Height = 17
        Caption = #1087#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
        TabOrder = 6
      end
      object CheckBox2: TCheckBox
        Left = 760
        Top = 600
        Width = 97
        Height = 17
        Caption = #1090#1080#1087' '#1073#1080#1083#1077#1090#1072
        TabOrder = 7
      end
      object CheckBox3: TCheckBox
        Left = 760
        Top = 624
        Width = 97
        Height = 17
        Caption = #1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1087#1088#1086#1076#1072#1085#1085#1099#1093' '#1073#1080#1083#1077#1090#1086#1074
        TabOrder = 8
      end
      object CheckBox4: TCheckBox
        Left = 760
        Top = 648
        Width = 97
        Height = 17
        Caption = #1089#1091#1084#1084#1072' '#1076#1077#1085#1077#1075
        TabOrder = 9
      end
    end
    object TabSheet5: TTabSheet
      Caption = #1087#1088#1086#1094#1077#1085#1090' '#1087#1088#1086#1076#1072#1085#1085#1099#1093' '#1073#1080#1083#1077#1090#1086#1074'  '#1085#1072' '#1088#1077#1081#1089#1099
      ImageIndex = 4
      DesignSize = (
        2153
        1121)
      object Label4: TLabel
        Left = 104
        Top = 587
        Width = 156
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = #1085#1072#1095#1072#1083#1100#1085#1086#1077' '#1074#1088#1077#1084#1103' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1080#1103
      end
      object Label5: TLabel
        Left = 104
        Top = 635
        Width = 150
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = #1082#1086#1085#1077#1095#1085#1086#1077' '#1074#1088#1077#1084#1103' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1080#1103
      end
      object DBGrid13: TDBGrid
        Left = 0
        Top = 40
        Width = 1161
        Height = 540
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = DataModule2.DataSource13
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NOMERREISA'
            Title.Alignment = taCenter
            Title.Caption = #1085#1086#1084#1077#1088' '#1088#1077#1081#1089#1072
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PROCENT'
            Title.Caption = #1087#1088#1086#1094#1077#1085#1090' '#1079#1072#1087#1086#1083#1085#1077#1085#1085#1086#1089#1090#1080' '#1072#1074#1090#1086#1073#1091#1089#1086#1074
            Width = 259
            Visible = True
          end>
      end
      object Edit4: TEdit
        Left = 120
        Top = 611
        Width = 121
        Height = 21
        Anchors = [akLeft, akBottom]
        TabOrder = 1
      end
      object Edit5: TEdit
        Left = 120
        Top = 659
        Width = 121
        Height = 21
        Anchors = [akLeft, akBottom]
        TabOrder = 2
      end
      object Button3: TButton
        Left = 336
        Top = 635
        Width = 75
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = #1074#1099#1095#1080#1089#1083#1080#1090#1100
        TabOrder = 3
        OnClick = Button3Click
      end
    end
  end
end
