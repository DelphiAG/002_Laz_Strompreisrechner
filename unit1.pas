unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Spin,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    ResultLabel: TLabel;
    PowerEdit: TFloatSpinEdit;
    TimeEdit: TFloatSpinEdit;
    EnergyPriceEdit: TFloatSpinEdit;
    procedure ValueChanged(Sender: TObject);
  private
    function CalcEnergy(P : real; t : real):real;
    function CalcPrice(E : real; Price : real):real;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.ValueChanged(Sender: TObject);
var Energy,Price : real;
begin
  Energy := CalcEnergy(Poweredit.Value,TimeEdit.Value);
  Price := CalcPrice(Energy,EnergyPriceEdit.Value);
  ResultLabel.Caption:= 'Du verbrauchst '
                        + FloattoStrF(Energy,ffFixed,8,2)
                        + 'Wh und das kostet dich '
                        + FloattoStrF(Price,ffFixed,8,2)
                        + '€!!';
end;

function TForm1.CalcEnergy(P: real; t: real): real;
begin
  result := P * t ;
end;

function TForm1.CalcPrice(E: real; Price: real): real;
begin
  result := E * Price;
end;

end.

