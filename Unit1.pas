unit Unit1;

interface

uses
	Winapi.Windows,
	Winapi.Messages,
	System.SysUtils,
	System.Variants,
	System.Classes,
	Vcl.Graphics,
	Vcl.Controls,
	Vcl.Forms,
	Vcl.Dialogs,
	Vcl.StdCtrls,
	Vcl.ExtCtrls,
	System.Threading;

type
	TForm1 = class(TForm)
		Button_SemTask : TButton;
		Label_ResultadoFinal : TLabel;
		Label_Primeiro : TLabel;
		Label_Segundo : TLabel;
		Label_Terceiro : TLabel;
		Timer1 : TTimer;
		Button_ComTask : TButton;
		procedure Button_SemTaskClick(Sender : TObject);
		procedure Button_ComTaskClick(Sender : TObject);
		procedure Timer1Timer(Sender : TObject);
		private
			a1             : IFuture<string>;
			b2             : IFuture<string>;
			c3             : IFuture<string>;
			inicioProcesso : Cardinal;

			primeiro : string;
			segundo  : string;
			terceiro : String;
			procedure executarSemTask();
			procedure executarComTask();
		public
			{ Public declarations }
	end;

var
	Form1 : TForm1;

implementation


{$R *.dfm}


procedure TForm1.Button_ComTaskClick(Sender : TObject);
begin
	executarComTask;
end;

procedure TForm1.Button_SemTaskClick(Sender : TObject);
begin
	executarSemTask;
end;

procedure TForm1.executarComTask;
begin
	if not Timer1.Enabled then
	begin
		Timer1.Enabled := True;
	end;
	inicioProcesso := GetTickCount;

	a1 := TTask.Future<string>(
			function : String
		begin
			Sleep(3000);
			Result := Random(500).ToString;
		end);
	b2 := TTask.Future<string>(
		function : String
		begin
			Sleep(3000);
			Result := Random(500).ToString;
		end);

	c3 := TTask.Future<string>(
		function : String
		begin
			Sleep(3000);
			Result := Random(500).ToString;
		end);

end;

procedure TForm1.executarSemTask;
var
	periodo :Cardinal;
begin
	periodo := GetTickCount;
	Sleep(3000);
	primeiro := Random(500).ToString;

	Sleep(3000);
	segundo := Random(500).ToString;

	Sleep(3000);
	terceiro := Random(500).ToString;

	periodo := GetTickCount - periodo;

	Label_ResultadoFinal.Caption := 'Tempo gasto: ' + IntToStr(Round(periodo / MSecsPerSec)) +
		'segundos -> ' + primeiro + ' | ' + segundo + ' | ' + terceiro;
	Label_Primeiro.Caption := '1º resultado:' + primeiro;
	Label_Segundo.Caption  := '2º resultado:' + segundo;
	Label_Terceiro.Caption := '3º resultado:' + terceiro;

end;

procedure TForm1.Timer1Timer(Sender : TObject);
begin
	if a1.Status = TTaskStatus.Completed then
		Label_Primeiro.Caption := '1º resultado:' + primeiro;

	if b2.Status = TTaskStatus.Completed then
		Label_Segundo.Caption := '2º resultado:' + segundo;

	if c3.Status = TTaskStatus.Completed then
		Label_Terceiro.Caption := '3º resultado:' + terceiro;

	if (c3.Status = TTaskStatus.Completed) and
		(b2.Status = TTaskStatus.Completed) and
		(a1.Status = TTaskStatus.Completed) then
	begin
	  inicioProcesso := GetTickCount - inicioProcesso;
		Label_ResultadoFinal.Caption := 'Tempo gasto: ' +
    	IntToStr(Round(inicioProcesso / MSecsPerSec)) +
			'segundos -> ' + primeiro + ' | ' + segundo + ' | ' + terceiro;
		Timer1.Enabled := False;
	end;

end;

end.
