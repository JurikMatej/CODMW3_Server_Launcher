unit KalafarUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Menus, ActnList, ExtCtrls;

const
  SName = 'Sname.txt';

type

  { TForm1 }

  TForm1 = class(TForm)
    Label1: TLabel;
    MSel_CBox: TComboBox;
    TBalChBox: TCheckBox;
    HModeChBox: TCheckBox;
    MTime_CBox: TComboBox;
    RTime_CBox: TComboBox;
    MPlayer_CBox: TComboBox;
    SLimit_CBox: TComboBox;
    GM_CBox: TComboBox;
    PWordEdit: TEdit;
    ExitBTN: TButton;
    Form2BTN: TButton;
    PWordLabel: TLabel;
    MaxPLabel: TLabel;
    AutoBalLabel: TLabel;
    HardcoreLabel: TLabel;
    LaunchBTN: TButton;
    MChoseLabel: TLabel;
    SNameEdit: TEdit;
    SPWordEdit: TEdit;
    Image1: TImage;
    SNameLabel: TLabel;
    SPwordLabel: TLabel;
    GMLabel: TLabel;
    MScoreLabel: TLabel;
    MTimeLabel: TLabel;
    MapS_Text: TStaticText;
    TRespawnLabel: TLabel;
    procedure ExitBTNClick(Sender: TObject);
    procedure Form2BTNClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GM_CBoxDropDown(Sender: TObject);
    procedure LaunchBTNClick(Sender: TObject);
    procedure MPlayer_CBoxChange(Sender: TObject);
    procedure MPlayer_CBoxDropDown(Sender: TObject);
    procedure MTime_CBoxDropDown(Sender: TObject);
    procedure RTime_CBoxDropDown(Sender: TObject);
    procedure SLimit_CBoxDropDown(Sender: TObject);
    procedure SNameEditChange(Sender: TObject);
    procedure SPWordEditChange(Sender: TObject);
    procedure TBalanceChBoxChange(Sender: TObject);

  private

  public

  end;

var
  Form1: TForm1;
  ServerCopy:Text;
  PreSName, SPWord, GM, SLimit, MTime, RTime, PMax, ABal, HMode:string;
  Line:integer;
  {"For" usage}
  i,j,k:integer;

implementation

uses
  KalafarUnit2;

{$R *.lfm}





{ TForm1 }



    {Saving EditBox content to variables}
    procedure TForm1.SNameEditChange(Sender: TObject);
    begin
    PreSName:=SNameEdit.Text;
    end;
    procedure TForm1.SPWordEditChange(Sender: TObject);
    begin
    SPWord:=SPWordEdit.Text;
    end;











procedure TForm1.ExitBTNClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.Form2BTNClick(Sender: TObject);
begin
  Form1.Hide;


  Form2.Show;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin


with Image1 do
  begin
    Parent  := self;
    Picture.LoadFromFile('Fallen.jpg');
    Stretch := true;
    /// other properties like width, height etc.
  end;
end;

{Getting Text for commands}

  Procedure GetSName;
    begin
    try
      AssignFile(ServerCopy,'E:\Call of Duty Modern Warfare 3 Lan\admin\server1.txt');
    except
      ShowMessage('404: Server File not found');
    end;
    try
      Rewrite(ServerCopy);
      Write (ServerCopy,'seta sv_hostname "');
      Write (ServerCopy,PreSName);
      Write (ServerCopy,'"');
      Writeln(Servercopy,'');
      Writeln(Servercopy,'');
      Flush (ServerCopy);
    except
      on E:Exception do
      ShowMessage('Error 106: Failed to create "Sname.txt" file');
      end;
    CloseFile(ServerCopy);
    end;

  Procedure GetSPWord;
  begin
    try
      AssignFile(ServerCopy,'E:\Call of Duty Modern Warfare 3 Lan\admin\server1.txt');
    except
      ShowMessage('404: Server File not found');
    end;

    try
      Append(ServerCopy);
      Write (ServerCopy,'seta g_password "');
      Write (ServerCopy,SPWord);
      write (ServerCopy,'"');
      writeln(ServerCopy,'');
      writeln(ServerCopy,'');
      Flush (ServerCopy);
    except
      on E:Exception do
      ShowMessage('Error 106: Failed to create "SPWord.txt" file');
      end;
    CloseFile(ServerCopy);

  end;

  Procedure GetTBalance;
  begin
  If ((TBalChBox.Checked)= True)
  then
    begin
    try
      AssignFile(ServerCopy,'E:\Call of Duty Modern Warfare 3 Lan\admin\server1.txt');
    except
      ShowMessage('404: Server File not found');
    end;

    try
      Append(ServerCopy);
      Write (ServerCopy,'seta scr_teambalance 1');
      Write (ServerCopy,SPWord);
      write (ServerCopy,'"');
      writeln(ServerCopy,'');
      writeln(ServerCopy,'');
      Flush (ServerCopy);
    except
      on E:Exception do
      ShowMessage('Error 106: Failed to create "SPWord.txt" file');
      end;
    CloseFile(ServerCopy);
    end

  else
    try
      AssignFile(ServerCopy,'E:\Call of Duty Modern Warfare 3 Lan\admin\server1.txt');
    except
      ShowMessage('404: Server File not found');
    end;

    try
      Append(ServerCopy);
      Write (ServerCopy,'seta scr_teambalance 0');
      writeln(ServerCopy,'');
      writeln(ServerCopy,'');
      Flush (ServerCopy);
    except
      on E:Exception do
      ShowMessage('Error 106: Failed to create "SPWord.txt" file');
      end;
    CloseFile(ServerCopy);
  end;



procedure TForm1.GM_CBoxDropDown(Sender: TObject);
begin
  GM_CBox.Items.Clear;
  GM_CBox.Items.Add('Team Deathmatch');
  GM_CBox.Items.Add('Free For All');
  GM_CBox.Items.Add('Gun Game');
  GM_CBox.Items.Add('Infected');
end;

{Launch}
procedure TForm1.LaunchBTNClick(Sender: TObject);
begin

{Run condition}
if (PWordEdit.Text)='samaj' then
  begin


  {Write commands into a file}
  GetSName;
  GetSPWord;


  GetTBalance;


  ShowMessage('Server Running (not rly still xd)');
  end
else
  ShowMessage ('Wrong Password!');
end;

procedure TForm1.MPlayer_CBoxChange(Sender: TObject);
begin

end;

procedure TForm1.MPlayer_CBoxDropDown(Sender: TObject);
begin
  MPlayer_CBox.Items.Clear;
  MPlayer_CBox.Items.Add('18');
  MPlayer_CBox.Items.Add('16');
  MPlayer_CBox.Items.Add('14');
  MPlayer_CBox.Items.Add('12');
  MPlayer_CBox.Items.Add('10');
  MPlayer_CBox.Items.Add('08');
  MPlayer_CBox.Items.Add('06');
end;

procedure TForm1.MTime_CBoxDropDown(Sender: TObject);
begin
  MTime_CBox.Items.Clear;
  Mtime_CBox.Items.Add('15:00');
  Mtime_CBox.Items.Add('10:00');
  Mtime_CBox.Items.Add('05:00');
  Mtime_CBox.Items.Add('02:30');
end;

procedure TForm1.RTime_CBoxDropDown(Sender: TObject);
begin
  RTime_CBox.Items.Clear;
  RTime_CBox.Items.Add('10');
  RTime_CBox.Items.Add('05');
  RTime_CBox.Items.Add('02');
  RTime_CBox.Items.Add('00');
end;


procedure TForm1.SLimit_CBoxDropDown(Sender: TObject);
begin
  SLimit_CBox.Items.Clear;
  SLimit_CBox.Items.Add('7500');
  SLimit_CBox.Items.Add('5000');
  SLimit_CBox.Items.Add('2500');

end;




end.

