unit HeaderFooterFormwithNavigation;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  System.DateUtils, System.INIFiles, System.Sensors, System.Actions,
  FMX.Types, FMX.Controls, FMX.Graphics, FMX.Forms, FMX.Dialogs, FMX.TabControl,
  FMX.ActnList, FMX.StdCtrls, FMX.MobilePreview, FMX.Edit,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  REST.Utils, REST.Types, REST.Json, DATA.DBXJSON,
  FMX.Layouts, FMX.Memo, FMX.Sensors,
  FMX.WebBrowser, FMX.ListBox, FMX.ListView.Types, FMX.ListView, FMX.Objects,
  System.IOUtils;

type
  THeaderFooterwithNavigation = class(TForm)
    TabControl1: TTabControl;
    TabJoin: TTabItem;
    TopToolBar1: TToolBar;
    ActionList1: TActionList;
    ChangeTabAction1: TChangeTabAction;
    ChangeTabAction2: TChangeTabAction;
    TabSignIn: TTabItem;
    TabSettings: TTabItem;
    TopToolBar3: TToolBar;
    Label1: TLabel;
    TopToolBar2: TToolBar;
    Label2: TLabel;
    ChangeTabAction4: TChangeTabAction;
    ChangeTabAction5: TChangeTabAction;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    TabTrip: TTabItem;
    TopToolBar4: TToolBar;
    Label8: TLabel;
    LocationSensor1: TLocationSensor;
    TabMap: TTabItem;
    ToolBar1: TToolBar;
    Label12: TLabel;
    WebBrowser1: TWebBrowser;
    SpeedButton1: TSpeedButton;
    Timer1: TTimer;
    RESTRequest2: TRESTRequest;
    RESTResponse2: TRESTResponse;
    ChangeTabAction6: TChangeTabAction;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    ChangeTabAction3: TChangeTabAction;
    Panel5: TPanel;
    Label13: TLabel;
    Panel2: TPanel;
    mmoNotes: TMemo;
    TabCheck: TTabItem;
    ToolBar2: TToolBar;
    Label15: TLabel;
    SpeedButton6: TSpeedButton;
    ChangeTabAction7: TChangeTabAction;
    ChangeTabAction8: TChangeTabAction;
    Panel4: TPanel;
    sbSend: TSpeedButton;
    Panel6: TPanel;
    edtStatus: TEdit;
    lbParticipants: TListBox;
    sbCheckIn: TSpinBox;
    Label14: TLabel;
    sbMapping: TSpinBox;
    ListBox2: TListBox;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    ListBoxItem7: TListBoxItem;
    ListBoxItem8: TListBoxItem;
    lblName: TLabel;
    lblDeparting: TLabel;
    lblArriving: TLabel;
    lblLeaving: TLabel;
    lblStarted: TLabel;
    ListBoxItem9: TListBoxItem;
    lblLeader: TLabel;
    SpeedButton5: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Panel1: TPanel;
    Panel3: TPanel;
    edtEMail: TEdit;
    edtTripID: TEdit;
    edtTripPIN: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnJoinTrip: TButton;
    btnSettings: TSpeedButton;
    Image1: TImage;
    Label3: TLabel;
    btnSettingsDone: TButton;
    cpJoinError: TCalloutPanel;
    Label7: TLabel;
    Label9: TLabel;
    CalloutPanel1: TCalloutPanel;
    Label10: TLabel;
    Label11: TLabel;
    cpNetworkError: TCalloutPanel;
    Label16: TLabel;
    Label17: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure JoinTrip(Sender: TObject);
    procedure RESTRequest1AfterExecute(Sender: TCustomRESTRequest);
    procedure Timer1Timer(Sender: TObject);
    procedure CheckIn(Sender: TObject; Status: string);
    procedure Mapping(Sender: TObject);
    procedure LocationSensor1LocationChanged(Sender: TObject; const OldLocation,
      NewLocation: TLocationCoord2D);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btnJoinClick(Sender: TObject);
    procedure sbCheckInChange(Sender: TObject);
    procedure sbMappingChange(Sender: TObject);
    procedure sbSendClick(Sender: TObject);
    procedure RESTRequest2AfterExecute(Sender: TCustomRESTRequest);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure btnSettingsClick(Sender: TObject);
    procedure btnSettingsDoneClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure RESTClient1HTTPProtocolError(Sender: TCustomRESTClient);
    procedure RESTRequest2HTTPProtocolError(Sender: TCustomRESTRequest);
    procedure RESTRequest1HTTPProtocolError(Sender: TCustomRESTRequest);
  private
    { Private declarations }
    startTime: TDate;
    tripToken: string;
    currentLat: string;
    currentLong: string;
  public
    { Public declarations }
  end;

var
  HeaderFooterwithNavigation: THeaderFooterwithNavigation;

implementation


{$R *.fmx}
procedure THeaderFooterwithNavigation.JoinTrip(Sender: TObject);
var
  ini: TIniFile;
begin
  cpNetworkError.Visible := False;
  cpJoinError.Visible := False;

  ini := TIniFile.Create(TPath.Combine(TPath.GetDocumentsPath, 'tether.ini'));
  ini.WriteString('login', 'email', edtEMail.Text);
  ini.WriteString('login', 'trip', edtTripID.Text);
  ini.WriteString('login', 'pin', edtTripPIN.Text);
  ini.Free;

  LocationSensor1.Active := True;

  RestRequest1.Params.ParameterByName('email').Value := edtEMail.Text;
  RestRequest1.Params.ParameterByName('pin').Value := edtTripPIN.Text;
  RestRequest1.Resource := 'apis/[id]/join.json';
  RestRequest1.Resource := RestRequest1.Resource.Replace('[id]', edtTripID.Text);
  RestRequest1.Execute;
end;

procedure THeaderFooterwithNavigation.LocationSensor1LocationChanged(
  Sender: TObject; const OldLocation, NewLocation: TLocationCoord2D);
var
  URLString: string;
begin
  currentLat := FloatToStrF(NewLocation.Latitude, ffGeneral, 8, 4);
  currentLong := FloatToStrF(NewLocation.Longitude, ffGeneral, 8, 4);

  //RestRequest2.Resource := RestRequest2.Resource.Replace('+id+', edtTripID.Text);
  //RestRequest2.Params.ParameterByName('email').Value := edtEMail.Text;
  //RestRequest2.Params.ParameterByName('pin').Value := edtTripPIN.Text;
  //RestRequest2.Params.ParameterByName('token').Value := tripToken;
  //RestRequest2.Params.ParameterByName('lat').Value := FloatToStrF(NewLocation.Latitude, ffGeneral, 8, 4);
  //RestRequest2.Params.ParameterByName('long').Value := FloatToStrF(NewLocation.Longitude, ffGeneral, 8, 4);
  //RestRequest2.Params.ParameterByName('status').Value := 'Sensor status';
  //RestRequest2.Execute;

  //CheckIn(self);
  //if TabControl1.ActiveTab = TabMap then
  //  Mapping(self);
end;

procedure THeaderFooterwithNavigation.FormCreate(Sender: TObject);
var
  ini: TIniFile;
begin
  { This defines the default active tab at runtime }
  TabControl1.ActiveTab := TabJoin;
{$IFDEF ANDROID}
  { This hides the toolbar back button on Android }
  {btnBack.Visible := False;}
{$ENDIF}

  ini := TIniFile.Create(TPath.Combine(TPath.GetDocumentsPath, 'tether.ini'));
  sbCheckIn.Value := ini.ReadInteger('settings', 'checkin', 5);
  sbMapping.Value := ini.ReadInteger('settings', 'mapping', 2);

  edtEMail.Text := ini.ReadString('login', 'email', '');
  edtTripID.Text := ini.ReadString('login', 'trip', '');
  edtTripPin.Text := ini.ReadString('login', 'pin', '');

  ini.Free;
end;

procedure THeaderFooterwithNavigation.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkHardwareBack then
  begin
    if TabControl1.ActiveTab = TabSignIn then
    begin
      ChangeTabAction1.Tab := TabJoin;
      ChangeTabAction1.ExecuteTarget(Self);
      ChangeTabAction1.Tab := TabSignIn;
      Key := 0;
    end;
  end;
end;

procedure THeaderFooterwithNavigation.RESTClient1HTTPProtocolError(
  Sender: TCustomRESTClient);
begin
  Timer1.Enabled := False;
  TabControl1.SetActiveTabWithTransition(TabJoin, TTabTransition.ttNone, TTabTransitionDirection.tdNormal);
  cpNetworkError.Visible := True;
end;

procedure THeaderFooterwithNavigation.RESTRequest1AfterExecute(
  Sender: TCustomRESTRequest);
var
  Response: TJSONObject;
  Trip: TJSONObject;
  Name: TJSONValue;
  Notes: string;
  Depart: string;
  Start: string;
  Leader: string;
  Token: TJSONValue;
  Result: string;
  Participant: TJSONObject;
  ParticipantName: TJSONValue;
  i: integer;
begin
  Response := RESTResponse1.JsonValue as TJSONObject;
  Trip := Response.Get('trip').JsonValue as TJSONObject;
  Result := Trip.Get('result').JsonValue.ToString.Replace('"', '');
  if Result <> 'success' then
  begin
    cpJoinError.Visible := True;
  end
  else
  begin
    cpJoinError.Visible := False;

    Name := Trip.Get('name').JsonValue;
    Notes := Trip.Get('notes').JsonValue.ToString.Replace('"', '');
    Depart := Trip.Get('depart').JsonValue.ToString.Replace('"', '');
    Start := Trip.Get('start').JsonValue.ToString.Replace('"', '');
    Token := Trip.Get('token').JsonValue;
    Participant := Trip.Get('participant').JsonValue as TJSONObject;
    ParticipantName := Participant.Get('name').JsonValue;
    Leader := Participant.Get('leader').JsonValue.ToString.Replace('"', '');

    tripToken := Token.ToString.Replace('"', '');
    lblName.Text := Name.ToString.Replace('"', '');
    lblDeparting.Text := Depart;
    if Start = '' then
      lblStarted.Text := 'The trip has not yet started.'
    else
      lblStarted.Text := 'The trip has started.';

    if Leader = 'yes' then
      lblLeader.Text := 'You are the leader.'
    else
      lblLeader.Text := '';

    if Notes.Length > 0 then
    begin
      mmoNotes.Text := Notes;
      mmoNotes.Visible := True;
    end
    else
    begin
      mmoNotes.Text := '';
      mmoNotes.Visible := False;
    end;

    TabControl1.SetActiveTabWithTransition(TabTrip, TTabTransition.ttSlide);

    //for i := 0 to Participants.Size - 1 do
    //begin
    //  Participant := Participants.Get(i) as TJSONObject;
    //  ParticipantName := Participant.Get('name').JsonValue;

    //  mmoParticipants.Lines.Add(ParticipantName.ToString.Replace('"', ''));
    //end;

    CheckIn(self, 'Joined Trip');
    Mapping(self);

    Timer1.Enabled := True;
    startTime := Now;
  end;
end;

procedure THeaderFooterwithNavigation.RESTRequest1HTTPProtocolError(
  Sender: TCustomRESTRequest);
begin
  Timer1.Enabled := False;
  TabControl1.SetActiveTabWithTransition(TabJoin, TTabTransition.ttNone, TTabTransitionDirection.tdNormal);
  cpNetworkError.Visible := True;
end;

procedure THeaderFooterwithNavigation.RESTRequest2AfterExecute(
  Sender: TCustomRESTRequest);
var
  Response: TJSONObject;
  Trip: TJSONObject;
  Name: TJSONValue;
  Notes: string;
  Depart: string;
  Start: string;
  Leader: string;
  Token: TJSONValue;
  Result: TJSONValue;
  Participant: TJSONObject;
  ParticipantName: string;
  ParticipantStatus: string;
  ParticipantCheckIn: string;
  Participants: TJSONArray;
  LocalDate: TDateTime;
  CheckInDate: string;
  i: integer;
  PartListItem: TListBoxItem;
begin
  Response := RESTResponse2.JsonValue as TJSONObject;
  Trip := Response.Get('trip').JsonValue as TJSONObject;
  Name := Trip.Get('name').JsonValue;
  Notes := Trip.Get('notes').JsonValue.ToString.Replace('"', '');
  Result := Trip.Get('result').JsonValue;
  Participant := Trip.Get('participant').JsonValue as TJSONObject;
  ParticipantName := Participant.Get('name').JsonValue.ToString.Replace('"', '');
  ParticipantCheckIn := Participant.Get('checkin').JsonValue.ToString.Replace('"', '');
  Leader := Participant.Get('leader').JsonValue.ToString.Replace('"', '');

  Participants := Trip.Get('participants').JsonValue as TJSONArray;
  lbParticipants.Items.Clear;
  for i := 0 to Participants.Size - 1 do
  begin
    Participant := Participants.Get(i) as TJSONObject;
    ParticipantName := Participant.Get('name').JsonValue.ToString.Replace('"', '');
    ParticipantStatus := Participant.Get('status').JsonValue.ToString.Replace('"', '');
    ParticipantCheckIn := Participant.Get('checkin').JsonValue.ToString.Replace('"', '');
    if ParticipantCheckIn <> '' then
    begin
      LocalDate := TTimeZone.Local.ToLocalTime(StrToDateTime(ParticipantCheckIn));
      CheckInDate := DateTimeToStr(LocalDate);
    end
    else
    begin
      CheckInDate := ''
    end;

    PartListItem := TListBoxItem.Create(lbParticipants);
    PartListItem.Text := ParticipantName + ': ' + ParticipantStatus;
    PartListItem.ItemData.Accessory := TListBoxItemData.TAccessory.aMore;
    PartListItem.ItemData.Detail := CheckInDate;

    lbParticipants.AddObject(PartListItem);
  end;
end;

procedure THeaderFooterwithNavigation.RESTRequest2HTTPProtocolError(
  Sender: TCustomRESTRequest);
begin
  Timer1.Enabled := False;
  TabControl1.SetActiveTabWithTransition(TabJoin, TTabTransition.ttNone, TTabTransitionDirection.tdNormal);
  cpNetworkError.Visible := True;
end;

procedure THeaderFooterwithNavigation.sbCheckInChange(Sender: TObject);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(TPath.Combine(TPath.GetDocumentsPath, 'tether.ini'));
  ini.WriteInteger('settings', 'checkin', Trunc(sbCheckIn.Value));
  ini.Free;
end;

procedure THeaderFooterwithNavigation.sbMappingChange(Sender: TObject);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(TPath.Combine(TPath.GetDocumentsPath, 'tether.ini'));
  ini.WriteInteger('settings', 'mapping', Trunc(sbMapping.Value));
  ini.Free;
end;

procedure THeaderFooterwithNavigation.SpeedButton1Click(Sender: TObject);
begin
  TabControl1.SetActiveTabWithTransition(TabCheck, TTabTransition.ttSlide, TTabTransitionDirection.tdNormal);
end;

procedure THeaderFooterwithNavigation.SpeedButton2Click(Sender: TObject);
begin
  TabControl1.SetActiveTabWithTransition(TabCheck, TTabTransition.ttSlide, TTabTransitionDirection.tdReversed);
end;

procedure THeaderFooterwithNavigation.SpeedButton3Click(Sender: TObject);
begin
  TabControl1.SetActiveTabWithTransition(TabTrip, TTabTransition.ttSlide, TTabTransitionDirection.tdNormal);
end;

procedure THeaderFooterwithNavigation.SpeedButton4Click(Sender: TObject);
begin
  CheckIn(self, 'Quit Trip');
  Timer1.Enabled := False;
  TabControl1.SetActiveTabWithTransition(TabJoin, TTabTransition.ttNone, TTabTransitionDirection.tdNormal);
end;

procedure THeaderFooterwithNavigation.SpeedButton5Click(Sender: TObject);
begin
  TabControl1.SetActiveTabWithTransition(TabMap, TTabTransition.ttSlide, TTabTransitionDirection.tdNormal);
end;

procedure THeaderFooterwithNavigation.SpeedButton6Click(Sender: TObject);
begin
  TabControl1.SetActiveTabWithTransition(TabTrip, TTabTransition.ttSlide, TTabTransitionDirection.tdReversed);
end;

procedure THeaderFooterwithNavigation.sbSendClick(Sender: TObject);
begin
  CheckIn(self, edtStatus.Text);
end;

procedure THeaderFooterwithNavigation.Timer1Timer(Sender: TObject);
var
  minute_diff: integer;
begin
  minute_diff := MinutesBetween(Now, startTime);
  if (sbCheckIn.Value = 1) or (minute_diff mod Trunc(sbCheckIn.Value) = 0) then
    CheckIn(self, edtStatus.Text);

  if (TabControl1.ActiveTab = TabMap) and ((sbMapping.Value = 1) or (minute_diff mod Trunc(sbMapping.Value) = 0)) then
    Mapping(self);
end;

procedure THeaderFooterwithNavigation.btnJoinClick(Sender: TObject);
begin
  TabControl1.SetActiveTabWithTransition(TabJoin, TTabTransition.ttSlide);
end;

procedure THeaderFooterwithNavigation.btnSettingsClick(Sender: TObject);
begin
  TabControl1.SetActiveTabWithTransition(TabSettings, TTabTransition.ttNone, TTabTransitionDirection.tdNormal);
end;

procedure THeaderFooterwithNavigation.btnSettingsDoneClick(Sender: TObject);
begin
  TabControl1.SetActiveTabWithTransition(TabJoin, TTabTransition.ttNone, TTabTransitionDirection.tdNormal);
end;

procedure THeaderFooterwithNavigation.CheckIn(Sender: TObject; Status: string);
begin
  RestRequest2.Resource := 'apis/[id]/checkin.json';
  RestRequest2.Resource := RestRequest2.Resource.Replace('[id]', edtTripID.Text);
  RestRequest2.Params.ParameterByName('email').Value := edtEMail.Text;
  RestRequest2.Params.ParameterByName('pin').Value := edtTripPIN.Text;
  RestRequest2.Params.ParameterByName('token').Value := tripToken;
  RestRequest2.Params.ParameterByName('lat').Value := currentLat;
  RestRequest2.Params.ParameterByName('long').Value := currentLong;
  RestRequest2.Params.ParameterByName('status').Value := Status;
  RestRequest2.Execute;
end;

procedure THeaderFooterwithNavigation.Mapping(Sender: TObject);
var
  URLString: string;
begin
  URLString := Format('http://192.168.2.201/apis/%s/mapping?email=%s&pin=%s&token=%s&rand=%s', [edtTripID.Text, edtEMail.Text, edtTripPIN.Text, tripToken, IntToStr(Random(30000))]);
  WebBrowser1.Navigate(URLString);
end;

end.
