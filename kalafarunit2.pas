unit KalafarUnit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Menus;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    OnlyHSChBox: TCheckBox;
    ComboBox1: TComboBox;
    FFireLabel: TLabel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Basnicky: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ThirdPLabel: TLabel;
    CPerksLabel: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private

  public

  end;

var
  Form2: TForm2;
  Sel:byte;

implementation

uses KalafarUnit;

{$R *.lfm}

{ TForm2 }



procedure TForm2.Button1Click(Sender: TObject);
begin
  Form2.Hide;


  Form1.Show;

end;

procedure TForm2.CheckBox1Change(Sender: TObject);
begin
end;

procedure TForm2.ComboBox1Select(Sender: TObject);
begin
  Sel:=Succ(Sel);
  If (Form2.Label4.Visible=True) and (Form2.ComboBox1.ItemIndex=0) then
    begin
      Form2.Label6.Visible:=True;
      If Sel>=3 then
        Form2.Label7.Visible:=True;
    end;

  Form2.Label4.Visible:=True;


end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Form2.CheckBox3.Checked:=True;
  PAllow:='1';

  Sel:=0;

  Form2.Label5.Visible:=False;
  Form2.Label6.Visible:=False;
  Form2.CheckBox1.Visible:=True;
  Form2.Label7.Visible:=False;



  try
  with Image1 do
     begin
       parent:= self;
       Picture.LoadFromFile('Imgs\MW3.png');
       Stretch:=True;
     end;
   Except
     ShowMessage ('F1.Img2 not found');
  end;
   end;


end.

