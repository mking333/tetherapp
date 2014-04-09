﻿unit HeaderFooterFormwithNavigation;

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
  System.IOUtils,
  XSBuiltins;

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
    btnCheckIn: TSpeedButton;
    Timer1: TTimer;
    RESTRequest2: TRESTRequest;
    RESTResponse2: TRESTResponse;
    ChangeTabAction6: TChangeTabAction;
    btnBackCheck: TSpeedButton;
    btnQuit: TSpeedButton;
    ChangeTabAction3: TChangeTabAction;
    Panel5: TPanel;
    Label13: TLabel;
    Panel2: TPanel;
    mmoNotes: TMemo;
    TabCheck: TTabItem;
    ToolBar2: TToolBar;
    Label15: TLabel;
    btnBackTrip: TSpeedButton;
    ChangeTabAction7: TChangeTabAction;
    ChangeTabAction8: TChangeTabAction;
    Panel4: TPanel;
    btnSend: TSpeedButton;
    Panel6: TPanel;
    edtStatus: TEdit;
    lbParticipants: TListBox;
    spCheckIn: TSpinBox;
    Label14: TLabel;
    spMapping: TSpinBox;
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
    btnMap: TSpeedButton;
    btnTrip: TSpeedButton;
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
    cpNetworkError: TCalloutPanel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    swLocationUpdates: TSwitch;
    RESTRequest3: TRESTRequest;
    RESTResponse3: TRESTResponse;
    btnNewTrip: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure JoinTrip(Sender: TObject);
    procedure RESTRequest1AfterExecute(Sender: TCustomRESTRequest);
    procedure Timer1Timer(Sender: TObject);
    procedure CheckIn(Sender: TObject; Status: string);
    procedure Mapping(Sender: TObject);
    procedure MapName(Sender: TObject; Name: string);
    procedure LocationSensor1LocationChanged(Sender: TObject; const OldLocation,
      NewLocation: TLocationCoord2D);
    procedure btnTripClick(Sender: TObject);
    procedure btnJoinClick(Sender: TObject);
    procedure spCheckInChange(Sender: TObject);
    procedure spMappingChange(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure RESTRequest2AfterExecute(Sender: TCustomRESTRequest);
    procedure btnBackTripClick(Sender: TObject);
    procedure btnCheckInClick(Sender: TObject);
    procedure btnBackCheckClick(Sender: TObject);
    procedure btnMapClick(Sender: TObject);
    procedure btnSettingsClick(Sender: TObject);
    procedure btnSettingsDoneClick(Sender: TObject);
    procedure btnQuitClick(Sender: TObject);
    procedure RESTClient1HTTPProtocolError(Sender: TCustomRESTClient);
    procedure RESTRequest2HTTPProtocolError(Sender: TCustomRESTRequest);
    procedure RESTRequest1HTTPProtocolError(Sender: TCustomRESTRequest);
    procedure lbParticipantsItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure swLocationUpdatesClick(Sender: TObject);
    procedure StartUpdating(Sender: TObject);
    procedure StopUpdating(Sender: TObject);
    procedure btnNewTripClick(Sender: TObject);
  private
    { Private declarations }
    startTime: TDate;
    tripToken: string;
    currentLat: string;
    currentLong: string;
    checkingIn: boolean;
  public
    { Public declarations }
  end;

const
  APIBASEURL = 'http://192.168.2.201';
  {APIBASEURL = 'http://www.triptether.com';}

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

  //LocationSensor1.Active := True;
  RestRequest1.Resource := 'apis/[id]/join.json';
  RestRequest1.Resource := RestRequest1.Resource.Replace('[id]', edtTripID.Text);
  RestRequest1.Params.ParameterByName('email').Value := edtEMail.Text;
  RestRequest1.Params.ParameterByName('pin').Value := edtTripPIN.Text;
  RestRequest1.Execute;
end;

procedure THeaderFooterwithNavigation.lbParticipantsItemClick(
  const Sender: TCustomListBox; const Item: TListBoxItem);
var
  ParticipantName: string;
  ColonPos: integer;
  SelectName: string;
begin
  ParticipantName := Item.ItemData.Text;
  ColonPos := Pos(':', ParticipantName);
  if ColonPos = 0 then
    SelectName := ParticipantName
  else
    SelectName := ParticipantName.Substring(0, ColonPos - 1);

  MapName(self, SelectName);
end;


procedure THeaderFooterwithNavigation.LocationSensor1LocationChanged(
  Sender: TObject; const OldLocation, NewLocation: TLocationCoord2D);
var
  URLString: string;
begin
  currentLat := FloatToStrF(NewLocation.Latitude, ffGeneral, 10, 6);
  currentLong := FloatToStrF(NewLocation.Longitude, ffGeneral, 10, 6);

  if swLocationUpdates.IsChecked = True then
  begin
    CheckIn(self, '');
    if TabControl1.ActiveTab = TabMap then
      Mapping(self);
  end;
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

  RestClient1.BaseURL := APIBASEURL;

  ini := TIniFile.Create(TPath.Combine(TPath.GetDocumentsPath, 'tether.ini'));
  swLocationUpdates.IsChecked := ini.ReadBool('settings', 'updates', True);
  spCheckIn.Value := ini.ReadInteger('settings', 'checkin', 5);
  spMapping.Value := ini.ReadInteger('settings', 'mapping', 2);

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
  StopUpdating(self);

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
  Arrive: string;
  Leave: string;
  Start: string;
  Leader: string;
  Token: TJSONValue;
  Result: string;
  Participant: TJSONObject;
  ParticipantName: TJSONValue;
  i: integer;
  LocalDate: TDateTime;
  DepartingDate: string;
  ArrivingDate: string;
  LeavingDate: string;
  StartingDate: string;
begin
  if assigned(RESTResponse1.JSONValue) then
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
    Arrive := Trip.Get('arrive').JsonValue.ToString.Replace('"', '');
    Leave := Trip.Get('leave').JsonValue.ToString.Replace('"', '');
    Start := Trip.Get('start').JsonValue.ToString.Replace('"', '');
    Token := Trip.Get('token').JsonValue;
    Participant := Trip.Get('participant').JsonValue as TJSONObject;
    ParticipantName := Participant.Get('name').JsonValue;
    Leader := Participant.Get('leader').JsonValue.ToString.Replace('"', '');

    tripToken := Token.ToString.Replace('"', '');
    lblName.Text := Name.ToString.Replace('"', '');

    if Depart <> '' then
    begin
      LocalDate := TTimeZone.Local.ToLocalTime(XMLTimeToDateTime(Depart, True));
      DepartingDate := FormatDateTime('ddddd t', LocalDate);
      lblDeparting.Text := DepartingDate;
    end;
    if Arrive <> '' then
    begin
      LocalDate := TTimeZone.Local.ToLocalTime(XMLTimeToDateTime(Arrive, True));
      ArrivingDate := FormatDateTime('ddddd t', LocalDate);
      lblArriving.Text := ArrivingDate;
    end;
    if Leave <> '' then
    begin
      LocalDate := TTimeZone.Local.ToLocalTime(XMLTimeToDateTime(Leave, True));
      LeavingDate := FormatDateTime('ddddd t', LocalDate);
      lblLeaving.Text := LeavingDate;
    end;
    if Start = '' then
      lblStarted.Text := 'The trip has not yet started.'
    else
    begin
      LocalDate := TTimeZone.Local.ToLocalTime(XMLTimeToDateTime(Start, True));
      StartingDate := FormatDateTime('ddddd t', LocalDate);
      lblStarted.Text := StartingDate;
    end;

    if Leader = 'yes' then
      lblLeader.Text := 'You are the leader.'
    else
    begin
      if Start = '' then
        lblLeader.Text := 'Trip will begin when the leader joins.'
      else
        lblLeader.Text := '';
    end;

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

    StartUpdating(self);
    startTime := Now;
  end;

  end;
end;

procedure THeaderFooterwithNavigation.RESTRequest1HTTPProtocolError(
  Sender: TCustomRESTRequest);
begin
  StopUpdating(self);

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
  ParticipantJoin: string;
  ParticipantQuit: string;
  Participants: TJSONArray;
  LocalDate: TDateTime;
  CheckInDate: string;
  i: integer;
  PartListItem: TListBoxItem;
begin
  if assigned(RESTResponse2.JSONValue) then
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
    ParticipantJoin := Participant.Get('join').JsonValue.ToString.Replace('"', '');
    ParticipantQuit := Participant.Get('quit').JsonValue.ToString.Replace('"', '');
    ParticipantCheckIn := Participant.Get('checkin').JsonValue.ToString.Replace('"', '');
    if ParticipantCheckIn <> '' then
    begin
      LocalDate := TTimeZone.Local.ToLocalTime(XMLTimeToDateTime(ParticipantCheckIn, True));
      CheckInDate := FormatDateTime('ddddd t', LocalDate);
    end
    else
    begin
      CheckInDate := ''
    end;

    PartListItem := TListBoxItem.Create(lbParticipants);
    PartListItem.Text := ParticipantName + ': ' + ParticipantStatus;
    PartListItem.ItemData.Accessory := TListBoxItemData.TAccessory.aMore;
    PartListItem.ItemData.Detail := CheckInDate;
    if ParticipantJoin = '' then
      PartListItem.ItemData.Detail := 'Has not yet joined the trip.';
    if ParticipantQuit <> '' then
      PartListItem.ItemData.Detail := 'Has quit the trip.';
    PartListItem.ItemData.Text := ParticipantName + ': ' + ParticipantStatus;

    lbParticipants.AddObject(PartListItem);
  end;

  end;
end;

procedure THeaderFooterwithNavigation.RESTRequest2HTTPProtocolError(
  Sender: TCustomRESTRequest);
begin
  StopUpdating(self);

  TabControl1.SetActiveTabWithTransition(TabJoin, TTabTransition.ttNone, TTabTransitionDirection.tdNormal);
  cpNetworkError.Visible := True;
end;

procedure THeaderFooterwithNavigation.spCheckInChange(Sender: TObject);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(TPath.Combine(TPath.GetDocumentsPath, 'tether.ini'));
  ini.WriteInteger('settings', 'checkin', Trunc(spCheckIn.Value));
  ini.Free;
end;

procedure THeaderFooterwithNavigation.spMappingChange(Sender: TObject);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(TPath.Combine(TPath.GetDocumentsPath, 'tether.ini'));
  ini.WriteInteger('settings', 'mapping', Trunc(spMapping.Value));
  ini.Free;
end;

procedure THeaderFooterwithNavigation.btnCheckInClick(Sender: TObject);
begin
  CheckIn(self, '');
  TabControl1.SetActiveTabWithTransition(TabCheck, TTabTransition.ttSlide, TTabTransitionDirection.tdNormal);
end;

procedure THeaderFooterwithNavigation.btnBackCheckClick(Sender: TObject);
begin
  TabControl1.SetActiveTabWithTransition(TabCheck, TTabTransition.ttSlide, TTabTransitionDirection.tdReversed);
end;

procedure THeaderFooterwithNavigation.btnTripClick(Sender: TObject);
begin
  TabControl1.SetActiveTabWithTransition(TabTrip, TTabTransition.ttSlide, TTabTransitionDirection.tdNormal);
end;

procedure THeaderFooterwithNavigation.btnQuitClick(Sender: TObject);
begin
  StopUpdating(self);
  CheckIn(self, 'Quit Trip');

  TabControl1.SetActiveTabWithTransition(TabJoin, TTabTransition.ttNone, TTabTransitionDirection.tdNormal);

  RestRequest3.Resource := 'apis/[id]/quit.json';
  RestRequest3.Resource := RestRequest3.Resource.Replace('[id]', edtTripID.Text);
  RestRequest3.Params.ParameterByName('email').Value := edtEMail.Text;
  RestRequest3.Params.ParameterByName('pin').Value := edtTripPIN.Text;
  RestRequest3.Params.ParameterByName('token').Value := tripToken;
  RestRequest3.Execute;
end;

procedure THeaderFooterwithNavigation.btnMapClick(Sender: TObject);
begin
  Mapping(self);
  TabControl1.SetActiveTabWithTransition(TabMap, TTabTransition.ttSlide, TTabTransitionDirection.tdNormal);
end;

procedure THeaderFooterwithNavigation.btnNewTripClick(Sender: TObject);
begin
  TabControl1.SetActiveTabWithTransition(TabSignIn, TTabTransition.ttNone);
end;

procedure THeaderFooterwithNavigation.btnBackTripClick(Sender: TObject);
begin
  TabControl1.SetActiveTabWithTransition(TabTrip, TTabTransition.ttSlide, TTabTransitionDirection.tdReversed);
end;

procedure THeaderFooterwithNavigation.swLocationUpdatesClick(Sender: TObject);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(TPath.Combine(TPath.GetDocumentsPath, 'tether.ini'));
  ini.WriteBool('settings', 'updates', swLocationUpdates.IsChecked);
  ini.Free;
end;

procedure THeaderFooterwithNavigation.btnSendClick(Sender: TObject);
begin
  CheckIn(self, edtStatus.Text);
end;

procedure THeaderFooterwithNavigation.Timer1Timer(Sender: TObject);
var
  minute_diff: integer;
begin
  minute_diff := MinutesBetween(Now, startTime);
  if (spCheckIn.Value = 1) or (minute_diff mod Trunc(spCheckIn.Value) = 0) then
    CheckIn(self, edtStatus.Text);

  if (TabControl1.ActiveTab = TabMap) and ((spMapping.Value = 1) or (minute_diff mod Trunc(spMapping.Value) = 0)) then
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
  if not CheckingIn then
  begin
    CheckingIn := True;

    RestRequest2.Resource := 'apis/[id]/checkin.json';
    RestRequest2.Resource := RestRequest2.Resource.Replace('[id]', edtTripID.Text);
    RestRequest2.Params.ParameterByName('email').Value := edtEMail.Text;
    RestRequest2.Params.ParameterByName('pin').Value := edtTripPIN.Text;
    RestRequest2.Params.ParameterByName('token').Value := tripToken;
    RestRequest2.Params.ParameterByName('lat').Value := currentLat;
    RestRequest2.Params.ParameterByName('long').Value := currentLong;
    RestRequest2.Params.ParameterByName('status').Value := Status;
    RestRequest2.Execute;

    checkingIn := False;
  end;
end;

procedure THeaderFooterwithNavigation.Mapping(Sender: TObject);
var
  URLString: string;
begin
  URLString := Format(APIBASEURL + '/apis/%s/mapping?email=%s&pin=%s&token=%s&rand=%s', [edtTripID.Text, edtEMail.Text, edtTripPIN.Text, tripToken, IntToStr(Random(30000))]);
  WebBrowser1.Navigate(URLString);
end;

procedure THeaderFooterwithNavigation.MapName(Sender: TObject; Name: string);
var
  URLString: string;
begin
  URLString := Format(APIBASEURL + '/apis/%s/mapping?email=%s&pin=%s&token=%s&rand=%s&name=%s', [edtTripID.Text, edtEMail.Text, edtTripPIN.Text, tripToken, IntToStr(Random(30000)), Name]);
  WebBrowser1.Navigate(URLString);
  TabControl1.SetActiveTabWithTransition(TabMap, TTabTransition.ttSlide, TTabTransitionDirection.tdNormal);
end;

procedure THeaderFooterwithNavigation.StartUpdating(Sender: TObject);
begin
  Timer1.Enabled := True;
  LocationSensor1.Active := True;
end;
procedure THeaderFooterwithNavigation.StopUpdating(Sender: TObject);
begin
  Timer1.Enabled := False;
  LocationSensor1.Active := False;
end;

end.
