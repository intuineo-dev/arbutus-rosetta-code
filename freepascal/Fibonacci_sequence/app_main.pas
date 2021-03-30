unit app_main;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Spin,
 ExtCtrls, BCButton;

type

 { TForm1 }

 TForm1 = class(TForm)
  BtnRun: TBCButton;
  LabelFrom: TLabel;
  LabelIterations: TLabel;
  LabelTo: TLabel;
  MemoResult: TMemo;
  PanelFromTo: TPanel;
  PanelExecute: TPanel;
  SpinEditFrom: TSpinEdit;
  SpinEditTo: TSpinEdit;
  SpinEditIterations: TSpinEdit;
  procedure BtnRunClick(Sender: TObject);
 private
  FStartTime: Int64;
 public
 end;

var
 Form1: TForm1;

implementation

{$R *.lfm}

function FibonacciI(N: Word): UInt64;
var
  Last, New: UInt64;
  I: Word;
begin
  if N < 2 then
    Result := N else
    begin
      Last := 0;
      Result := 1;
      for I := 2 to N do
        begin
          New := Last + Result;
          Last := Result;
          Result := New;
        end;
    end;
end;

procedure TForm1.BtnRunClick(Sender: TObject);
var
  i, j: Integer;
begin
  MemoResult.Clear;
  FStartTime:= GetTickCount64;
  MemoResult.Append('>> Start');
  MemoResult.Lines.BeginUpdate;
  for i := 1 to SpinEditIterations.Value do
    begin
      MemoResult.Append('Run: ' + IntToStr(i));
      for j := SpinEditFrom.Value to SpinEditTo.Value
        do MemoResult.Append(IntToStr(FibonacciI(j)));
    end;
  MemoResult.Lines[0] := MemoResult.Lines[0] + ' >> Elapsed: ' + FloatToStrF((GetTickCount64 -  FStartTime) / 1000, ffNumber, 8, 4) + ' seconds';
  MemoResult.Lines.EndUpdate;
end;


end.

