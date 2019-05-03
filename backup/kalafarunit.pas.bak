unit KalafarUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Menus, ActnList, ExtCtrls, process, Crt;


type

  { TForm1 }

  TForm1 = class(TForm)
    MaxHP_CB: TComboBox;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Label1: TLabel;
    Crossout0: TLabel;
    Crossout1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MSel_CBox: TComboBox;
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
    TBalTB: TToggleBox;
    HModeTB: TToggleBox;
    FUavTB: TToggleBox;
    TRespawnLabel: TLabel;
    procedure ExitBTNClick(Sender: TObject);
    procedure Form2BTNClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FUavTBChange(Sender: TObject);
    procedure GM_CBoxChange(Sender: TObject);
    procedure GM_CBoxSelect(Sender: TObject);
    procedure LaunchBTNClick(Sender: TObject);
    procedure MPlayer_CBoxSelect(Sender: TObject);
    procedure MSel_CBoxSelect(Sender: TObject);
    procedure MTime_CBoxSelect(Sender: TObject);
    procedure RTime_CBoxSelect(Sender: TObject);
    procedure SLimit_CBoxSelect(Sender: TObject);
    procedure SNameEditChange(Sender: TObject);
    procedure SPWordEditChange(Sender: TObject);
    procedure TBalTBChange(Sender: TObject);
    procedure HModeTBChange(Sender: TObject);

  private

  public

  end;

var
  Form1: TForm1;
  RunServer, RunTekno:TProcess;
  sl:TStringList;
  ServerCopy, MapCopy,Settings,TempSettings:Text;
  PreSName, SPWord, Gametype, SLimit, MTime, RTime, PMax, MaxHP, ABal, HMode, FUav, Map, FFire, ThirdP, PAllow,HSOnly, StartRotate:string;
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

procedure TForm1.TBalTBChange(Sender: TObject);
begin
if Form1.TBalTB.Checked then
  Form1.TBalTB.Caption:='Disable'
else
  Form1.TBalTB.Caption:='Enable';
end;




procedure TForm1.HModeTBChange(Sender: TObject);
begin
  if Form1.HModeTB.Checked then
    Form1.HModeTB.Caption:='Disable'
else
    Form1.HModeTB.Caption:='Enable';
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

  MSel_CBox.ItemIndex:=0;
  GM_CBox.ItemIndex:=0;
  MPlayer_CBox.ItemIndex:=0;
  PMax:='16';
  Form1.MaxHP_CB.ItemIndex:=1;
  SLimit_CBox.ItemIndex:=0;
  SLimit:='7500';
  MTime_CBox.ItemIndex:=0;
  MTime:='15';
  RTime_CBox.ItemIndex:=0;
  RTime:='0';
  Gametype:='TDMCustom';
  HMode:='0';
  FUav:='0';
  FFire:='0';
  ThirdP:='0';
  PAllow:='1';
  HSOnly:='0';
  Form1.TBalTB.Enabled:=True;
  Form1.TBalTB.Visible:=True;
  Form1.Crossout1.Visible:=False;

  Form1.SLimit_CBox.Enabled:=True;
  Form1.SLimit_CBox.Visible:=True;
  Form1.Crossout0.Visible:=False;
  Map:='mp_alpha';
  PreSName:='CoD MW3 Server';

  PAllow:='1';


try
with Image4 do
  begin
    Parent  := self;
    Picture.LoadFromFile('Imgs\Frame3.png');
    Stretch := true;
    /// other properties like width, height etc.
  end;

except
  ShowMessage ('F1.Img4 not found');
end;



try
with Image1 do
  begin
    Parent  := self;
    Picture.LoadFromFile('Imgs\Lockdown.jpg');
    Stretch := true;
    /// other properties like width, height etc.
  end;
MapS_Text.Caption:='Lockdown';

except
  ShowMessage ('F1.Img1 not found');
end;

try
with Image2 do
begin
  Parent  := self;
  Picture.LoadFromFile('Imgs\SAS.png');
  Stretch := true;
  /// other properties like width, height etc.
end;

Except ShowMessage ('F1.Img2 not found');
end;

try
with Image3 do
begin
  Parent  := self;
  Picture.LoadFromFile('Imgs\CODMW3.png');
  Stretch := true;
  /// other properties like width, height etc.
end;

Except ShowMessage ('F1.Img3 not found');
end;


end;




procedure TForm1.FUavTBChange(Sender: TObject);
begin
  if Form1.FUavTB.Checked then
    FUavTB.Caption:='Disable'
  else
    Form1.FUavTB.Caption:='Enable';
end;

procedure TForm1.GM_CBoxChange(Sender: TObject);
begin
  case GM_CBox.ItemIndex of
  0: begin
                Form2.CheckBox1.Visible:=True;
                Form2.Label5.Visible:=False;

                Form1.TBalTB.Visible:=True;
                Form1.Crossout1.Visible:=False;

                Form1.SLimit_CBox.ItemIndex:=0;
                Form1.SLimit_CBox.Enabled:=True;
                Form1.SLimit_CBox.Visible:=True;
                Form1.Crossout0.Visible:=False;


               end;

  1: begin
                Form2.CheckBox1.Checked:=False;
                Form2.CheckBox1.Visible:=False;
                Form2.Label5.Visible:=True;

                Form1.TBalTB.Checked:=False;
                Form1.TBalTB.Visible:=False;
                Form1.Crossout1.Visible:=True;

                Form1.SLimit_CBox.ItemIndex:=0;
                Form1.SLimit_CBox.Enabled:=True;
                Form1.SLimit_CBox.Visible:=True;
                Form1.Crossout0.Visible:=False;


               end;

  2:  begin
                Form2.CheckBox1.Checked:=False;

                Form1.TBalTB.Checked:=False;
                Form1.TBalTB.Visible:=False;
                Form1.Crossout1.Visible:=True;

                Form1.SLimit_CBox.ItemIndex:=0;
                Form1.SLimit_CBox.Enabled:=False;
                Form1.SLimit_CBox.Visible:=False;
                Form1.Crossout0.Visible:=True;


                Form2.CheckBox1.Visible:=False;
                Form2.Label5.Visible:=True;
               end;

  3:  Begin
                Form1.TBalTB.Checked:=False;
                Form1.TBalTB.Visible:=False;
                Form1.Crossout1.Visible:=True;

                Form1.SLimit_CBox.ItemIndex:=0;
                Form1.SLimit_CBox.Enabled:=False;
                Form1.SLimit_CBox.Visible:=False;
                Form1.Crossout0.Visible:=True;

                Form2.CheckBox1.Visible:=True;
                Form2.Label5.Visible:=False;
               End;
  end;
end;

{Getting Text for commands}

  Procedure GetNetworkProps;
  begin
  try
      AssignFile(ServerCopy,'admin\server.cfg');
    except
      ShowMessage('404: Server File not found');
    end;

      try
        Rewrite(ServerCopy);
        Write (ServerCopy,'+set sv_config "filename" (default "server.cfg")');
        writeln(ServerCopy,'');
        Write (ServerCopy,'+set dedicated 1');
        writeln(ServerCopy,'');
        Write (ServerCopy,'+set net_queryPort 27014');
        writeln(ServerCopy,'');
        Write (ServerCopy,'+set net_port 27015');
        writeln(ServerCopy,'');
        Write (ServerCopy,'+set net_authPort 8766');
        writeln(ServerCopy,'');
        Write (ServerCopy,'+set net_masterServerPort 27016');
        writeln(ServerCopy,'');
        Flush(ServerCopy);

      except
        ShowMessage ('Network properties failed to append');
      end;
    CloseFile(ServerCopy);
  end;


  Procedure GetSName;
    begin
    try
      AssignFile(ServerCopy,'admin\server.cfg');
    except
      ShowMessage('404: Server File not found');
    end;
    try
      Append(ServerCopy);
      Write (ServerCopy,'seta sv_hostname "');
      Write (ServerCopy,PreSName);
      Write (ServerCopy,'"');
      Writeln(Servercopy,'');
      Writeln(Servercopy,'');
      Flush (ServerCopy);
    except
      on E:Exception do
      ShowMessage('Error 106: Failed to get server name');
      end;
    CloseFile(ServerCopy);
    end;

  Procedure GetSPWord;
  begin
    try
      AssignFile(ServerCopy,'admin\server.cfg');
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
      ShowMessage('Error 106: Failed to get server password');
      end;
    CloseFile(ServerCopy);

  end;


  procedure TForm1.GM_CBoxSelect(Sender: TObject);
  begin
  case GM_CBox.ItemIndex of
    0: Gametype:='TDMCustom';
    1: Gametype:='FFACustom';
    2: Gametype:='GGCustom';
    3: Gametype:='INFCustom';

    end;
  end;

  procedure GetMapAndGametype;
  begin
    try
      AssignFile(MapCopy,'admin\default.dspl');
    except
      ShowMessage('404: Server File not found');
    end;

    try
      Rewrite (MapCopy);
      Write (MapCopy,Map);
      write(MapCopy,',');
      Write (MapCopy,Gametype);
      write (MapCopy,',1');

      writeln(MapCopy,'');
      Flush (MapCopy);
    except
      on E:Exception do
      ShowMessage('Error 106: Failed to find the default.dspl file');
      end;
    CloseFile(MapCopy);
  end;

  Procedure WriteToTemp;
  begin

  case Gametype of
    'TDMCustom': begin

               try
                AssignFile(Settings,'admin\TDMCustom.dsr');
                AssignFile(TempSettings,'admin\Temp.txt');
                Rewrite (TempSettings);
                writeln (TempSettings,'//TDM');
                CloseFile (TempSettings);

                CopyFile('admin\TDMCustom.dsr','admin\Temp.txt');

               except
                ShowMessage('404: Settings File not found');
               end;
             end;
    'FFACustom': begin

               try
                AssignFile(Settings,'admin\FFACustom.dsr');
                AssignFile(TempSettings,'admin\Temp.txt');
                Rewrite (TempSettings);

                Write (TempSettings,'//FFA');
                CloseFile (TempSettings);
                CopyFile('admin\FFACustom.dsr','admin\Temp.txt');

               except
                ShowMessage('404: Settings File not found');
               end;

             end;
    'GGCustom': begin

               try
                AssignFile(Settings,'admin\GGCustom.dsr');
                AssignFile(TempSettings,'admin\Temp.txt');
                Rewrite (TempSettings);

                Write (TempSettings,'//GG');
                CloseFile (TempSettings);
                CopyFile('admin\GGCustom.dsr','admin\Temp.txt');

               except
                ShowMessage('404: Settings File not found');
               end;

             end;
    'INFCustom': begin

               try
                AssignFile(Settings,'admin\INFCustom.dsr');
                AssignFile(TempSettings,'admin\Temp.txt');
                Rewrite (TempSettings);

                Write (TempSettings,'//INF');
                CloseFile(TempSettings);
                CopyFile('admin\INFCustom.dsr','admin\Temp.txt');

               except
                ShowMessage('404: Settings File not found');
               end;
             end;

  end;
        try
                 AssignFile(TempSettings,'admin\Temp.txt');
                 Append (TempSettings);
                 writeln (TempSettings,'');
                 writeln(TempSettings,'');

                 write (TempSettings,'gameOpt commonOption.timeLimit "');
                 write (TempSettings,MTime);
                 write (TempSettings,'" ');
                 writeln(TempSettings,'');

                 write (TempSettings,'gameOpt commonOption.scoreLimit "');
                 write (TempSettings,SLimit);
                 write (TempSettings,'" ');
                 writeln(TempSettings,'');

                 write (TempSettings,'gameOpt commonOption.respawnDelay "');
                 write (TempSettings,RTime);
                 write (TempSettings,'" ');
                 writeln(TempSettings,'');

                 write (TempSettings,'gameOpt commonOption.maxHealth "');
                 write (TempSettings,MaxHP);
                 write (TempSettings,'"');
                 writeln(TempSettings,'');

                 write (TempSettings,'gameOpt commonOption.hardcoreModeOn "');
                 write (TempSettings,HMode);
                 write (Tempsettings,'"');
                 writeln(TempSettings,'');

                 write (TempSettings,'gameOpt commonOption.headshotsOnly "');
                 write (TempSettings,HSOnly);
                 write (Tempsettings,'"');
                 writeln(TempSettings,'');

                 write (TempSettings,'gameOpt commonOption.friendlyFire "');
                 write (TempSettings,FFire);
                 write (Tempsettings,'"');
                 writeln(TempSettings,'');

                 write (TempSettings,'gameOpt commonOption.forceThirdPersonView "');
                 write (TempSettings,ThirdP);
                 write (Tempsettings,'"');
                 writeln(TempSettings,'');

                 write (TempSettings,'gameOpt commonOption.allowPerks "');
                 write (TempSettings,PAllow);
                 write (Tempsettings,'"');
                 writeln(TempSettings,'');

                 write (TempSettings,'gameOpt commonOption.radarAlwaysOn "');
                 write (TempSettings,FUav);
                 write (Tempsettings,'"');
                 writeln(TempSettings,'');

                 write (TempSettings,'gameOpt commonOption.allowKillstreaks "1"');

                 writeln(TempSettings,'');
                 CloseFile(TempSettings);

        except
          ShowMessage('Unable to add aditional properties to TempServer');
        end;

  end;

  Procedure CopyFromTemp;
  begin
    case Gametype of

    'TDMCustom': begin

                 try
                  CopyFile('admin\Temp.txt','admin\TDMCustom.dsr');
                 except
                  ShowMessage('404: Settings File not found');
                 end;


    end;
    'FFACustom': begin


                 try
                  CopyFile('admin\Temp.txt','admin\FFACustom.dsr');
                 except
                  ShowMessage('404: Settings File not found');
                 end;



    end;
    'GGCustom': begin

                 try
                  CopyFile('admin\Temp.txt','admin\GGCustom.dsr');
                 except
                  ShowMessage('404: Settings File not found');
                 end;



    end;
    'INFCustom': begin

                 try
                  CopyFile('admin\Temp.txt','admin\INFCustom.dsr');
                 except
                  ShowMessage('404: Settings File not found');
                 end;

    end;
  end;
end;


  Procedure GetTBalance;
  begin
   if Form1.TBalTB.Checked then
    begin
    Form1.TBalTB.Caption:='Disable';
    try
      AssignFile(ServerCopy,'admin\server.cfg');
    except
      ShowMessage('404: Server File not found');
    end;

    try
      Append(ServerCopy);
      Write (ServerCopy,'seta scr_teambalance 1');
      writeln(ServerCopy,'');
      writeln(ServerCopy,'');
      Flush (ServerCopy);
      CloseFile(ServerCopy);
    except
      on E:Exception do
      ShowMessage('Error 106: Failed to create "server.cfg" file - ABalance');
      end


    end

   else
    begin
    Form1.TBalTB.Caption:='Enable';
    try
      AssignFile(ServerCopy,'admin\server.cfg');
    except
      ShowMessage('404: Server File not found');
    end;

    try
      Append(ServerCopy);
      Write (ServerCopy,'seta scr_teambalance 0');
      writeln(ServerCopy,'');
      writeln(ServerCopy,'');
      Flush (ServerCopy);
      CloseFile(ServerCopy);
    except
      on E:Exception do
      ShowMessage('Error 106: Failed to create "Server.cfg" file - ABalance');
      end;

    end;

  end;

  procedure GetPMax;
  begin
  try
      AssignFile(ServerCopy,'admin\server.cfg');
    except
      ShowMessage('404: Server File not found');
    end;

    try
      Append(ServerCopy);
      Write (ServerCopy,'seta sv_maxclients ');
      Write (ServerCopy,PMax);
      writeln(ServerCopy,'');
      writeln(ServerCopy,'');
      Flush (ServerCopy);
    except
      on E:Exception do
      ShowMessage('Error 106: Failed to create "SPWord.txt" file');
      end;
    CloseFile(ServerCopy);

  end;

 Procedure GetHMode;
 begin
 if Form1.HModeTB.Checked
   then
     HMode:='1'
   else
     HMode:='0';
   end;

 Procedure GetFFire;
 begin
   If Form2.CheckBox1.Checked=true
     then
       FFire:='1'
     else
       FFire:='0';
 end;

 Procedure GetThirdP;
 begin
   if Form2.CheckBox2.Checked=true
     then
      ThirdP:='1'
     else
      ThirdP:='0';
 end;

 Procedure GetPAllow;
 begin
   if Form2.CheckBox3.Checked=true
     then
      PAllow:='1'
     else
      PAllow:='0';
 end;

 Procedure GetFUav;
 begin
   If Form1.FUavTB.Checked=true
     then
      FUav:='1'
     else
      FUav:='0';
 end;

 Procedure GetMaxHP;
 begin
   Case Form1.MaxHP_CB.ItemIndex of
    0: MaxHP:='200';

    1: MaxHP:='100';

    2: MaxHP:='50';

    3: MaxHP:='30';

   end;
 end;

 Procedure GetHSOnly;
 begin
   If Form2.OnlyHSChBox.Checked=true
     then
      HSOnly:='1'
     else
      HSOnly:='0';
 end;



  {static commands at the end of process}
  procedure GetRemainingCmds;
  begin
  try
      AssignFile(ServerCopy,'admin\server.cfg');
    except
      ShowMessage('404: Server File not found');
    end;

    try
      Append(ServerCopy);
      Write (ServerCopy,'seta sv_maprotation "default"');
      writeln(ServerCopy,'');
      Write (ServerCopy,'seta sv_privateClients 0');
      writeln(ServerCopy,'');
      Write (ServerCopy,'seta sv_privatePassword ""');
      writeln(ServerCopy,'');
      Write (ServerCopy,'seta rcon_password "citron"');
      writeln(ServerCopy,'');
      Write (ServerCopy,'seta sv_voice 2');
      writeln(ServerCopy,'');
      Write (ServerCopy,'seta g_allowVote 1');
      writeln(ServerCopy,'');
      Write (ServerCopy,'seta g_deadChat 0');
      writeln(ServerCopy,'');
      Write (ServerCopy,'seta g_inactivity 120');
      writeln(ServerCopy,'');
      Write (ServerCopy,'seta sv_kickBanTime 300');
      writeln(ServerCopy,'');
      Write (ServerCopy,'seta sv_floodProtect 1');
      writeln(ServerCopy,'');
      Flush (ServerCopy);
    except
      on E:Exception do
      ShowMessage('Error 106: Failed to append static commands');
      end;
    CloseFile(ServerCopy);

  end;



 Procedure StartServer;
 begin
   RunServer:=TProcess.Create(nil);
   RunServer.CommandLine :='RunServer.bat';
   RunServer.Execute;
   RunServer.Free;
 end;

 Procedure StartTekno;
 begin
   Form1.Hide;
   RunTekno:=TProcess.Create(nil);
   RunTekno.CommandLine :='TeknoMW3.exe';
   RunTekno.Options:= [poWaitOnExit];

   RunTekno.Execute;

   RunTekno.Free;
   Delay(1000);
   Form1.Show;

 end;


{Launch}
procedure TForm1.LaunchBTNClick(Sender: TObject);
begin

{Run condition}
if (PWordEdit.Text)='samaj' then
  begin


  {Write commands into a file}

  {.cfg}
  GetNetworkProps;
  GetSName;
  GetSPWord;
  GetPMax;
  GetTBalance;

  {.dspl}
  GetMapAndGametype;

  {.dsr}
  GetMaxHP;
  GetHMode;
  GetFUav;
  GetFFire;
  GetThirdP;
  GetPAllow;
  GetHSOnly;
  WriteToTemp;
  CopyFromTemp;







  GetRemainingCmds;

  {Run actual server}
  StartServer;
  Delay (1000);
  StartTekno;

  end
else
  ShowMessage ('Wrong Password!');
end;


procedure TForm1.MPlayer_CBoxSelect(Sender: TObject);
begin
  Case MPlayer_CBox.ItemIndex of
    0: PMax:=('16');
    1: PMax:=('14');
    2: PMax:=('12');
    3: PMax:=('10');
    4: PMax:=('8');
    5: PMax:=('6');

  end;
end;

{On map change: change picture and description}
procedure TForm1.MSel_CBoxSelect(Sender: TObject);
begin
  case MSel_CBox.ItemIndex of
    0:begin
        Map:='mp_alpha';

        with Image1 do
        begin
        try
          Parent  := self;
          Picture.LoadFromFile('Imgs\Lockdown.jpg');
          Stretch := true;
        except
          ShowMessage('Failed to load map image!');
        end;
        end;
        MapS_Text.Caption:='Lockdown';
    end;
    1: Begin
      Map:='mp_bootleg';
      with Image1 do
        begin
        try
          Parent  := self;
          Picture.LoadFromFile('Imgs\Bootleg.png');
          Stretch := true;
        except
          ShowMessage('Failed to load map image!');

        end;
        end;
        MapS_Text.Caption:='Bootleg';
    end;
    2: Begin
      Map:='mp_bravo';
      with Image1 do
        begin
        try
          Parent  := self;
          Picture.LoadFromFile('Imgs\Mission.png');
          Stretch := true;
        except
          ShowMessage('Failed to load map image!');
        end;
        end;
        MapS_Text.Caption:='Mission';
    end;
    3: Begin
       Map:='mp_carbon';
       with Image1 do
        begin
        try
          Parent  := self;
          Picture.LoadFromFile('Imgs\Carbon.jpg');
          Stretch := true;
        except
          ShowMessage('Failed to load map image!');
        end;
        end;
        MapS_Text.Caption:='Carbon';
    end;
    4: begin
      Map:='mp_dome';
      with Image1 do
        begin
        Try
          Parent  := self;
          Picture.LoadFromFile('Imgs\Dome.jpg');
          Stretch := true;
        except
          ShowMessage('Failed to load map image!');
        end;
        end;
        MapS_Text.Caption:='Dome';
    end;
    5: begin
      Map:='mp_exchange';
      with Image1 do
        begin
        try
          Parent  := self;
          Picture.LoadFromFile('Imgs\Downturn.png');
          Stretch := true;
        except
          ShowMessage('Failed to load map image!');
          end;
        end;
        MapS_Text.Caption:='Downturn';
    end;
    6: begin
      Map:='mp_hardhat';
      with Image1 do
        begin
        try
          Parent  := self;
          Picture.LoadFromFile('Imgs\Hardhat.png');
          Stretch := true;
        except
          ShowMessage('Failed to load map image!');
          end;
        end;
        MapS_Text.Caption:='Hardhat';
    end;
    7: begin
      Map:='mp_interchange';
      with Image1 do
        begin
        try
          Parent  := self;
          Picture.LoadFromFile('Imgs\Interchange.png');
          Stretch := true;
        except
          ShowMessage('Failed to load map image!');
          end;
        end;
        MapS_Text.Caption:='Interchange';
    end;
    8: begin
      Map:='mp_lambeth';
      with Image1 do
        begin
        try
          Parent  := self;
          Picture.LoadFromFile('Imgs\Fallen.png');
          Stretch := true;
        except
          ShowMessage('Failed to load map image!');
          end;
        end;
        MapS_Text.Caption:='Fallen';
    end;
    9: begin
      Map:='mp_mogadishu';
      with Image1 do
        begin
        try
          Parent  := self;
          Picture.LoadFromFile('Imgs\Bakaara.png');
          Stretch := true;
        except
          ShowMessage('Failed to load map image!');
          end;
        end;
        MapS_Text.Caption:='Bakaara';
    end;
    10: begin
      Map:='mp_paris';
      with Image1 do
        begin
        try
          Parent  := self;
          Picture.LoadFromFile('Imgs\Resistance.png');
          Stretch := true;
        except
          ShowMessage('Failed to load map image!');
          end;
        end;
        MapS_Text.Caption:='Resistance';
    end;
    11: begin
      Map:='mp_plaza2';
      with Image1 do
        begin
        try
          Parent  := self;
          Picture.LoadFromFile('Imgs\Arkaden.png');
          Stretch := true;
        except
          ShowMessage('Failed to load map image!');
          end;
        end;
        MapS_Text.Caption:='Arkaden';
    end;
    12: begin
      Map:='mp_radar';
      with Image1 do
        begin
        try
          Parent  := self;
          Picture.LoadFromFile('Imgs\Outpost.png');
          Stretch := true;
        except
          ShowMessage('Failed to load map image!');
          end;
        end;
        MapS_Text.Caption:='Outpost';
    end;
    13: begin
      Map:='mp_seatown';
      with Image1 do
        begin
        try
          Parent  := self;
          Picture.LoadFromFile('Imgs\Seatown.png');
          Stretch := true;
        except
          ShowMessage('Failed to load map image!');
          end;
        end;
        MapS_Text.Caption:='Seatown';
    end;
    14: begin
      Map:='mp_underground';
      with Image1 do
        begin
        try
          Parent  := self;
          Picture.LoadFromFile('Imgs\Underground.png');
          Stretch := true;
        except
          ShowMessage('Failed to load map image!');
          end;
        end;
        MapS_Text.Caption:='Underground';
    end;
    15: begin
      Map:='mp_village';
      with Image1 do
        begin
        try
          Parent  := self;
          Picture.LoadFromFile('Imgs\Village.png');
          Stretch := true;
        except
          ShowMessage('Failed to load map image!');
          end;
        end;
      MapS_Text.Caption:='Village';
        end;

    end;

end;



procedure TForm1.MTime_CBoxSelect(Sender: TObject);
begin
Case MTime_CBox.ItemIndex of
    0: Mtime:=('15');
    1: Mtime:=('10');
    2: Mtime:=('5');
    3: Mtime:=('2');

end;

end;


procedure TForm1.RTime_CBoxSelect(Sender: TObject);
begin
Case RTime_CBox.ItemIndex of
    0: Rtime:=('0');
    1: Rtime:=('5');
    2: Rtime:=('7.5');
    3: Rtime:=('10');

end;

end;



procedure TForm1.SLimit_CBoxSelect(Sender: TObject);
begin
    Case SLimit_CBox.ItemIndex of
    0: SLimit:=('7500');
    1: SLimit:=('5000');
    2: SLimit:=('3000');
    3: SLimit:=('1500');
end;

end;



end.

