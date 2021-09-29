object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 370
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 25
  object Label_ResultadoFinal: TLabel
    Left = 40
    Top = 64
    Width = 145
    Height = 25
    Caption = 'Resultado final:'
  end
  object Label_Primeiro: TLabel
    Left = 288
    Top = 136
    Width = 121
    Height = 25
    Caption = '1'#186' resultado:'
  end
  object Label_Segundo: TLabel
    Left = 288
    Top = 184
    Width = 121
    Height = 25
    Caption = '2'#186' resultado:'
  end
  object Label_Terceiro: TLabel
    Left = 288
    Top = 240
    Width = 128
    Height = 25
    Caption = '3'#186' resultado: '
  end
  object Button_SemTask: TButton
    Left = 40
    Top = 136
    Width = 145
    Height = 73
    Caption = 'Tarefa sem task'
    TabOrder = 0
    WordWrap = True
    OnClick = Button_SemTaskClick
  end
  object Button_ComTask: TButton
    Left = 40
    Top = 232
    Width = 145
    Height = 73
    Caption = 'Tarefa com task'
    TabOrder = 1
    WordWrap = True
    OnClick = Button_ComTaskClick
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 528
    Top = 128
  end
end
