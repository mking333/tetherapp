unit HeaderFooterFormwithNavigation;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  System.DateUtils, System.INIFiles, System.Sensors, System.Actions,
  FMX.Types, FMX.Controls, FMX.Graphics, FMX.Forms, FMX.Dialogs, FMX.TabControl,
  FMX.ActnList, FMX.StdCtrls, FMX.MobilePreview, FMX.Edit,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  REST.Utils, REST.Types, REST.Json, DATA.DBXJSON,
  FMX.Layouts, FMX.Memo,
  FMX.WebBrowser, FMX.ListBox, FMX.ListView.Types, FMX.ListView, FMX.Objects,
  System.IOUtils, System.JSON, System.StrUtils,
  XSBuiltins, FMX.DateTimeCtrls, System.Sensors.Components,
  IdGlobal, FMX.StdActns, FMX.MediaLibrary.Actions, FMX.TMSWebGMapsCommon,
  FMX.TMSWebGMapsGeocoding, FMX.TMSWebGMapsWebBrowser, FMX.TMSWebGMaps, FMX.TMSWebGMapsMarkers;

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
    JoinRequest: TRESTRequest;
    JoinResponse: TRESTResponse;
    TabTrip: TTabItem;
    TopToolBar4: TToolBar;
    Label8: TLabel;
    LocationSensor1: TLocationSensor;
    TabMap: TTabItem;
    ToolBar1: TToolBar;
    Label12: TLabel;
    btnCheckIn: TSpeedButton;
    Timer1: TTimer;
    CheckinRequest: TRESTRequest;
    CheckinResponse: TRESTResponse;
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
    QuitRequest: TRESTRequest;
    QuitResponse: TRESTResponse;
    btnNewTrip: TSpeedButton;
    Panel7: TPanel;
    Panel8: TPanel;
    btnSignUp: TButton;
    Panel9: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Line1: TLine;
    edtSignIn: TEdit;
    edtPassword: TEdit;
    TabSignUp: TTabItem;
    webSignUp: TWebBrowser;
    TabNewTrip: TTabItem;
    ToolBar3: TToolBar;
    Label19: TLabel;
    ToolBar4: TToolBar;
    Label20: TLabel;
    Panel11: TPanel;
    Destination: TLabel;
    Location: TLabel;
    edtTripName: TEdit;
    edtTripCity: TEdit;
    Panel12: TPanel;
    btnNewTripDetails: TButton;
    btnBackToJoin: TSpeedButton;
    btnBackToJoin2: TSpeedButton;
    btnBackToJoin3: TSpeedButton;
    SignInRequest: TRESTRequest;
    SignInResponse: TRESTResponse;
    NewTripRequest: TRESTRequest;
    NewTripResponse: TRESTResponse;
    Label26: TLabel;
    edtTripLocation: TEdit;
    TabNewTripDetails: TTabItem;
    ToolBar6: TToolBar;
    Label27: TLabel;
    btnBackToNewTrip: TSpeedButton;
    Panel16: TPanel;
    mmoTripNotes: TMemo;
    Label28: TLabel;
    tmeTripDepart: TTimeEdit;
    dteTripDepart: TDateEdit;
    dteTripArrive: TDateEdit;
    tmeTripArrive: TTimeEdit;
    Label29: TLabel;
    dteTripLeave: TDateEdit;
    tmeTripLeave: TTimeEdit;
    Label30: TLabel;
    Panel17: TPanel;
    btnNewTripCreate: TButton;
    Panel10: TPanel;
    cpSignInError: TCalloutPanel;
    Label24: TLabel;
    Label25: TLabel;
    btnSaveSignIn: TButton;
    NewTripPartRequest: TRESTRequest;
    NewTripPartResponse: TRESTResponse;
    cpNewTripError: TCalloutPanel;
    Label31: TLabel;
    Label32: TLabel;
    Label21: TLabel;
    edtName: TEdit;
    Action1: TAction;
    ShowShareSheetAction1: TShowShareSheetAction;
    TabNewTripShare: TTabItem;
    mmoShareInfo: TMemo;
    ToolBar5: TToolBar;
    Label22: TLabel;
    Panel13: TPanel;
    SpeedButton1: TSpeedButton;
    cpLocationNotFound: TCalloutPanel;
    Label23: TLabel;
    Label33: TLabel;
    btnJoinNewTrip: TSpeedButton;
    SpeedButton3: TSpeedButton;
    geoNewTrip: TTMSFMXWebGMapsGeocoding;
    mapTrip: TTMSFMXWebGMaps;
    MapRequest: TRESTRequest;
    MapResponse: TRESTResponse;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure JoinTrip(Sender: TObject);
    procedure JoinRequestAfterExecute(Sender: TCustomRESTRequest);
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
    procedure CheckinRequestAfterExecute(Sender: TCustomRESTRequest);
    procedure MappingRequestAfterExecute(Sender: TCustomRESTRequest);
    procedure btnBackTripClick(Sender: TObject);
    procedure btnCheckInClick(Sender: TObject);
    procedure btnBackCheckClick(Sender: TObject);
    procedure btnMapClick(Sender: TObject);
    procedure btnSettingsClick(Sender: TObject);
    procedure btnSettingsDoneClick(Sender: TObject);
    procedure btnQuitClick(Sender: TObject);
    procedure RESTClient1HTTPProtocolError(Sender: TCustomRESTClient);
    procedure CheckinRequestHTTPProtocolError(Sender: TCustomRESTRequest);
    procedure MappingRequestHTTPProtocolError(Sender: TCustomRESTRequest);
    procedure JoinRequestHTTPProtocolError(Sender: TCustomRESTRequest);
    procedure lbParticipantsItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure swLocationUpdatesClick(Sender: TObject);
    procedure StartUpdating(Sender: TObject);
    procedure StopUpdating(Sender: TObject);
    procedure btnNewTripClick(Sender: TObject);
    procedure btnSignUpClick(Sender: TObject);
    procedure btnSaveSignInClick(Sender: TObject);
    procedure btnCreateTripClick(Sender: TObject);
    procedure btnNewTripDetailsClick(Sender: TObject);
    procedure btnBackToNewClick(Sender: TObject);
    procedure btnBackToJoinClick(Sender: TObject);
    procedure btnBackToJoin2Click(Sender: TObject);
    procedure btnBackToJoin3Click(Sender: TObject);
    procedure SignInRequestAfterExecute(Sender: TCustomRESTRequest);
    procedure btnNewTripCreateClick(Sender: TObject);
    procedure NewTripRequestAfterExecute(Sender: TCustomRESTRequest);
    procedure NewTripPartRequestAfterExecute(Sender: TCustomRESTRequest);
    procedure btnJoinNewTripClick(Sender: TObject);
  private
    { Private declarations }
    StartTime: TDate;
    TripToken: string;
    currentLat: string;
    currentLong: string;
    CheckingIn: boolean;
    MappingIn: boolean;

    UserPin: string;

    SignInUserId: integer;
    SignInEmail: string;
    SignInName: string;
    SignInToken: string;

    TripLatitude: string;
    TripLongitude: string;
    TripFoundLatLong: boolean;

    NewTripId: integer;
    NewTripName: string;
    NewTripToken: string;
    NewTripPin: string;
  public
    { Public declarations }
  end;

const
  APIBASEURL = 'http://192.168.2.201';
{
  APIBASEURL = 'http://www.triptether.com';
}

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

  if (edtTripID.Text = '') or (edtTripPIN.Text = '') or (edtEMail.Text = '') then
  begin
      cpJoinError.Visible := True;
      edtTripID.TextPrompt := 'Enter id from email.';
      edtTripPIN.TextPrompt := 'Enter PIN from email: 1234567';
      edtEMail.TextPrompt := 'Enter your email address: name@host.com';
  end
  else
  begin
    if edtName.Text = '' then
      edtName.Text := edtEMail.Text;

    ini := TIniFile.Create(TPath.Combine(TPath.GetDocumentsPath, 'tether.ini'));
    ini.WriteString('login', 'trip', edtTripID.Text);
    ini.WriteString('login', 'pin', edtTripPIN.Text);
    ini.WriteString('login', 'email', edtEMail.Text);
    ini.WriteString('login', 'name', edtName.Text);
    ini.Free;

    //LocationSensor1.Active := True;
    JoinRequest.Resource := 'apis/[id]/join.json';
    JoinRequest.Resource := JoinRequest.Resource.Replace('[id]', edtTripID.Text);
    JoinRequest.Params.ParameterByName('email').Value := edtEMail.Text;
    JoinRequest.Params.ParameterByName('pin').Value := edtTripPIN.Text;
    JoinRequest.Params.ParameterByName('name').Value := edtName.Text;
    JoinRequest.Execute;
  end;
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
begin
  currentLat := FloatToStrF(NewLocation.Latitude, ffGeneral, 10, 6);
  currentLong := FloatToStrF(NewLocation.Longitude, ffGeneral, 10, 6);

  if swLocationUpdates.IsChecked = True then
  begin
    CheckIn(self, '');
    //if TabControl1.ActiveTab = TabMap then
    //  Mapping(self);
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

  edtTripID.Text := ini.ReadString('login', 'trip', '');
  edtTripPin.Text := ini.ReadString('login', 'pin', '');
  edtEMail.Text := ini.ReadString('login', 'email', 'my@email.com');
  edtName.Text := ini.ReadString('login', 'name', 'My Name');

  edtSignIn.Text := ini.ReadString('signin', 'email', 'my@email.com');
  edtPassword.Text := ini.ReadString('signin', 'pw', '');

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

  TabControl1.SetActiveTabWithTransition(TabJoin, TTabTransition.None, TTabTransitionDirection.Normal);
  cpNetworkError.Visible := True;
end;

procedure THeaderFooterwithNavigation.SignInRequestAfterExecute(
  Sender: TCustomRESTRequest);
var
  Response: TJSONObject;
  User: TJSONObject;
  Result: string;
begin
  if assigned(SignInResponse.JSONValue) then
  begin
    Response := SignInResponse.JsonValue as TJSONObject;
    User := Response.Get('user').JsonValue as TJSONObject;
    Result := User.Get('result').JsonValue.ToString.Replace('"', '');
    if Result <> 'success' then
    begin
      cpSignInError.Visible := True;
    end
    else
    begin
      cpSignInError.Visible := False;

      SignInUserId := StrToInt(User.Get('user_id').JsonValue.ToString);
      SignInName := User.Get('name').JsonValue.ToString.Replace('"', '');
      SignInEmail := User.Get('email').JsonValue.ToString.Replace('"', '');
      SignInToken := User.Get('token').JsonValue.ToString.Replace('"', '');

      TabControl1.SetActiveTabWithTransition(TabNewTrip, TTabTransition.Slide);
    end;
  end;
end;

procedure THeaderFooterwithNavigation.JoinRequestAfterExecute(
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
  LocalDate: TDateTime;
  DepartingDate: string;
  ArrivingDate: string;
  LeavingDate: string;
  StartingDate: string;
begin
  if assigned(JoinResponse.JSONValue) then
  begin

  Response := JoinResponse.JsonValue as TJSONObject;
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
    UserPin := Participant.Get('pin').JsonValue.ToString.Replace('"', '');

    TripToken := Token.ToString.Replace('"', '');
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

    TabControl1.SetActiveTabWithTransition(TabTrip, TTabTransition.Slide);

    //for i := 0 to Participants.Size - 1 do
    //begin
    //  Participant := Participants.Get(i) as TJSONObject;
    //  ParticipantName := Participant.Get('name').JsonValue;

    //  mmoParticipants.Lines.Add(ParticipantName.ToString.Replace('"', ''));
    //end;

    CheckIn(self, 'Joined Trip');
    //Mapping(self);

    StartUpdating(self);
    StartTime := Now;
  end;

  end;
end;

procedure THeaderFooterwithNavigation.JoinRequestHTTPProtocolError(
  Sender: TCustomRESTRequest);
begin
  StopUpdating(self);

  TabControl1.SetActiveTabWithTransition(TabJoin, TTabTransition.None, TTabTransitionDirection.Normal);
  cpNetworkError.Visible := True;
end;

procedure THeaderFooterwithNavigation.CheckinRequestAfterExecute(
  Sender: TCustomRESTRequest);
var
  Response: TJSONObject;
  Trip: TJSONObject;
  Name: string;
  Notes: string;
  DestLat: Double;
  DestLong: Double;
  Leader: string;
  Result: TJSONValue;
  Participant: TJSONObject;
  ParticipantName: string;
  ParticipantStatus: string;
  ParticipantLat: Double;
  ParticipantLong: Double;
  ParticipantCheckIn: string;
  ParticipantJoin: string;
  ParticipantQuit: string;
  Participants: TJSONArray;
  LocalDate: TDateTime;
  CheckInDate: string;
  i: integer;
  PartListItem: TListBoxItem;
begin
  if assigned(CheckinResponse.JSONValue) then
  begin
    Response := CheckinResponse.JsonValue as TJSONObject;
    Trip := Response.Get('trip').JsonValue as TJSONObject;
    Name := Trip.Get('name').JsonValue.ToString.Replace('"', '');
    Notes := Trip.Get('notes').JsonValue.ToString.Replace('"', '');
    DestLat := StrToFloat(Trip.Get('dest_lat').JsonValue.ToString);
    DestLong := StrToFloat(Trip.Get('dest_long').JsonValue.ToString);
    Result := Trip.Get('result').JsonValue;

    Participant := Trip.Get('participant').JsonValue as TJSONObject;
    ParticipantName := Participant.Get('name').JsonValue.ToString.Replace('"', '');
    ParticipantLat := StrToFloat(Participant.Get('curr_lat').JsonValue.ToString);
    ParticipantLong := StrToFloat(Participant.Get('curr_long').JsonValue.ToString);
    ParticipantCheckIn := Participant.Get('checkin').JsonValue.ToString.Replace('"', '');
    Leader := Participant.Get('leader').JsonValue.ToString.Replace('"', '');

    Participants := Trip.Get('participants').JsonValue as TJSONArray;
    lbParticipants.Items.Clear;
    mapTrip.Markers.Clear;

    mapTrip.Markers.Add(DestLat, DestLong, Name, 'http://www.triptether.com/images/flag_dest.png', true, true, true, true, false, 0);
    mapTrip.MapPanTo(DestLat, DestLong);

    mapTrip.Markers.Add(ParticipantLat, ParticipantLong, ParticipantName, 'http://www.triptether.com/images/flag_dest.png', true, true, true, true, false, 0);

    for i := 0 to Participants.Count - 1 do
    begin
      Participant := Participants.Items[i] as TJSONObject;
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

procedure THeaderFooterwithNavigation.CheckinRequestHTTPProtocolError(
  Sender: TCustomRESTRequest);
begin
  StopUpdating(self);

  TabControl1.SetActiveTabWithTransition(TabJoin, TTabTransition.None, TTabTransitionDirection.Normal);
  cpNetworkError.Visible := True;
end;

procedure THeaderFooterwithNavigation.MappingRequestAfterExecute(
  Sender: TCustomRESTRequest);
var
  Response: TJSONObject;
  Trip: TJSONObject;
  Name: TJSONValue;
  Notes: string;
  Leader: string;
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
begin
  if assigned(CheckinResponse.JSONValue) then
  begin

  Response := CheckinResponse.JsonValue as TJSONObject;
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
  for i := 0 to Participants.Count - 1 do
  begin
    Participant := Participants.Items[i] as TJSONObject;
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
  end;

  end;
end;

procedure THeaderFooterwithNavigation.MappingRequestHTTPProtocolError(
  Sender: TCustomRESTRequest);
begin
  StopUpdating(self);

  TabControl1.SetActiveTabWithTransition(TabJoin, TTabTransition.None, TTabTransitionDirection.Normal);
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
  TabControl1.SetActiveTabWithTransition(TabCheck, TTabTransition.Slide, TTabTransitionDirection.Normal);
end;

procedure THeaderFooterwithNavigation.btnCreateTripClick(Sender: TObject);
var
  PartListItem: TListBoxItem;
  isLeader: integer;
begin
  NewTripPartRequest.Resource := 'apis/[id]/add_part.json';
  NewTripPartRequest.Resource := NewTripPartRequest.Resource.Replace('[id]', IntToStr(NewTripID));
  NewTripPartRequest.Params.ParameterByName('token').Value := NewTripToken;

  NewTripPartRequest.Params.ParameterByName('name').Value := AnsiLeftStr(PartListItem.ItemData.Text, isLeader);
  NewTripPartRequest.Params.ParameterByName('leader').Value := 'no';
  NewTripPartRequest.Params.ParameterByName('email').Value := PartListItem.ItemData.Detail;
  NewTripPartRequest.Execute;

  TabControl1.SetActiveTabWithTransition(TabJoin, TTabTransition.Slide, TTabTransitionDirection.Normal);
end;

procedure THeaderFooterwithNavigation.btnBackCheckClick(Sender: TObject);
begin
  mapTrip.Visible := false;
  TabControl1.SetActiveTabWithTransition(TabCheck, TTabTransition.Slide, TTabTransitionDirection.Reversed);
end;

procedure THeaderFooterwithNavigation.btnTripClick(Sender: TObject);
begin
  mapTrip.Visible := false;
  TabControl1.SetActiveTabWithTransition(TabTrip, TTabTransition.Slide, TTabTransitionDirection.Normal);
end;

procedure THeaderFooterwithNavigation.btnSignUpClick(Sender: TObject);
var
  URLString: string;
begin
  URLString := 'http://www.triptether.com/users/sign_up';
  webSignUp.Navigate(URLString);
  TabControl1.SetActiveTabWithTransition(TabSignUp, TTabTransition.Slide, TTabTransitionDirection.Normal);
end;

procedure THeaderFooterwithNavigation.btnQuitClick(Sender: TObject);
begin
  StopUpdating(self);
  CheckIn(self, 'Quit Trip');

  TabControl1.SetActiveTabWithTransition(TabJoin, TTabTransition.None, TTabTransitionDirection.Normal);

  QuitRequest.Resource := 'apis/[id]/quit.json';
  QuitRequest.Resource := QuitRequest.Resource.Replace('[id]', edtTripID.Text);
  QuitRequest.Params.ParameterByName('email').Value := edtEMail.Text;
  QuitRequest.Params.ParameterByName('pin').Value := UserPin;
  QuitRequest.Params.ParameterByName('token').Value := TripToken;
  QuitRequest.Execute;
end;

procedure THeaderFooterwithNavigation.btnMapClick(Sender: TObject);
begin
  TabControl1.SetActiveTabWithTransition(TabMap, TTabTransition.Slide, TTabTransitionDirection.Normal);
  mapTrip.Visible := true;
  //Mapping(self);
end;

procedure THeaderFooterwithNavigation.btnNewTripClick(Sender: TObject);
begin
{
  if (edtSignIn.Text.Length > 0) and (edtPassword.Text.Length > 0) then
    TabControl1.SetActiveTabWithTransition(TabNewTrip, TTabTransition.Slide)
  else
}
    TabControl1.SetActiveTabWithTransition(TabSignIn, TTabTransition.Slide);
end;

procedure THeaderFooterwithNavigation.btnNewTripDetailsClick(Sender: TObject);
begin
  if (edtTripLocation.Text = '') or (edtTripCity.Text = '') then
  begin
    cpLocationNotFound.Visible := True;
    edtTripLocation.TextPrompt := 'Enter an address.';
    edtTripCity.TextPrompt := 'Enter city name.';
  end
  else
  begin
    if edtTripName.Text = '' then
      edtTripName.Text := edtTripLocation.Text;

    geoNewTrip.Address := edtTripLocation.Text + ', ' + edtTripCity.Text;
    if geoNewTrip.LaunchGeocoding = erOk then
    begin
      TripLatitude := FloatToStr(geoNewTrip.ResultLatitude);
      TripLongitude := FloatToStr(geoNewTrip.ResultLongitude);
      TripFoundLatLong := true;
      cpLocationNotFound.Visible := false;

      TabControl1.SetActiveTabWithTransition(TabNewTripDetails, TTabTransition.Slide, TTabTransitionDirection.Normal);
    end
    else begin
      TripFoundLatLong := false;
      edtTripLocation.Text := 'Address not Found!';
      cpLocationNotFound.Visible := true;
    end;
  end;
end;

procedure THeaderFooterwithNavigation.btnNewTripCreateClick(Sender: TObject);
var
  Departing: TDateTime;
  Arriving: TDateTime;
  Leaving: TDateTime;
begin
  NewTripRequest.Resource := 'apis/[id]/new_trip.json';
  NewTripRequest.Resource := NewTripRequest.Resource.Replace('[id]', IntToStr(SignInUserID));
  NewTripRequest.Params.ParameterByName('email').Value := SignInEmail;
  NewTripRequest.Params.ParameterByName('token').Value := SignInToken;
  NewTripRequest.Params.ParameterByName('name').Value := edtTripName.Text;
  NewTripRequest.Params.ParameterByName('location').Value := edtTripLocation.Text + ' ' + edtTripCity.Text;
  NewTripRequest.Params.ParameterByName('notes').Value := mmoTripNotes.Text;
  NewTripRequest.Params.ParameterByName('lat').Value := TripLatitude;
  NewTripRequest.Params.ParameterByName('long').Value := TripLongitude;

  Departing := dteTripDepart.DateTime;
  ReplaceTime(Departing, tmeTripDepart.DateTime);
  Arriving := dteTripArrive.DateTime;
  ReplaceTime(Arriving, tmeTripArrive.DateTime);
  Leaving := dteTripLeave.DateTime;
  ReplaceTime(Leaving, tmeTripLeave.DateTime);

  NewTripRequest.Params.ParameterByName('depart').Value := LocalDateTimeToGMT(Departing, False);
  NewTripRequest.Params.ParameterByName('arrive').Value := LocalDateTimeToGMT(Arriving, False);
  NewTripRequest.Params.ParameterByName('leave').Value := LocalDateTimeToGMT(Leaving, False);
  NewTripRequest.Execute;
end;

procedure THeaderFooterwithNavigation.btnBackToJoin2Click(Sender: TObject);
begin
  TabControl1.SetActiveTabWithTransition(TabJoin, TTabTransition.Slide, TTabTransitionDirection.Reversed);
end;

procedure THeaderFooterwithNavigation.btnBackToJoin3Click(Sender: TObject);
begin
  TabControl1.SetActiveTabWithTransition(TabSignIn, TTabTransition.Slide, TTabTransitionDirection.Reversed);
end;

procedure THeaderFooterwithNavigation.btnBackToJoinClick(Sender: TObject);
begin
  TabControl1.SetActiveTabWithTransition(TabJoin, TTabTransition.Slide, TTabTransitionDirection.Reversed);
end;

procedure THeaderFooterwithNavigation.btnBackToNewClick(Sender: TObject);
begin
  TabControl1.SetActiveTabWithTransition(TabNewTrip, TTabTransition.Slide, TTabTransitionDirection.Reversed);
end;

procedure THeaderFooterwithNavigation.btnBackTripClick(Sender: TObject);
begin
  TabControl1.SetActiveTabWithTransition(TabTrip, TTabTransition.Slide, TTabTransitionDirection.Reversed);
end;

procedure THeaderFooterwithNavigation.swLocationUpdatesClick(Sender: TObject);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(TPath.Combine(TPath.GetDocumentsPath, 'tether.ini'));
  ini.WriteBool('settings', 'updates', swLocationUpdates.IsChecked);
  ini.Free;
end;

procedure THeaderFooterwithNavigation.btnSaveSignInClick(Sender: TObject);
var
  ini: TIniFile;
begin
  if (edtSignIn.Text = '') or (edtPassword.Text = '') then
  begin
    cpSignInError.Visible := True;
    edtSignIn.TextPrompt := 'TripTether login email.';
    edtPassword.TextPrompt := 'TripTether password.';
  end
  else
  begin
    ini := TIniFile.Create(TPath.Combine(TPath.GetDocumentsPath, 'tether.ini'));
    ini.WriteString('signin', 'email', edtSignIn.Text);
    ini.WriteString('signin', 'pw', edtPassword.Text);
    ini.Free;

    SignInRequest.Params.ParameterByName('email').Value := edtSignIn.Text;
    SignInRequest.Params.ParameterByName('pw').Value := edtPassword.Text;
    SignInRequest.Execute;
  end;
end;

procedure THeaderFooterwithNavigation.btnSendClick(Sender: TObject);
begin
  CheckIn(self, edtStatus.Text);
end;

procedure THeaderFooterwithNavigation.Timer1Timer(Sender: TObject);
var
  minute_diff: integer;
begin
  minute_diff := MinutesBetween(Now, StartTime);
  if (spCheckIn.Value = 1) or (minute_diff mod Trunc(spCheckIn.Value) = 0) then
    CheckIn(self, edtStatus.Text);

  //if (TabControl1.ActiveTab = TabMap) and ((spMapping.Value = 1) or (minute_diff mod Trunc(spMapping.Value) = 0)) then
  //  Mapping(self);
end;

procedure THeaderFooterwithNavigation.btnJoinClick(Sender: TObject);
begin
  TabControl1.SetActiveTabWithTransition(TabJoin, TTabTransition.Slide);
end;

procedure THeaderFooterwithNavigation.btnJoinNewTripClick(Sender: TObject);
begin
  edtEmail.Text := SignInEmail;
  edtName.Text := SignInName;
  edtTripID.Text := IntToStr(NewTripId);
  edtTripPin.Text := NewTripPin;

  JoinTrip(self);
end;

procedure THeaderFooterwithNavigation.btnSettingsClick(Sender: TObject);
begin
  TabControl1.SetActiveTabWithTransition(TabSettings, TTabTransition.None, TTabTransitionDirection.Normal);
end;

procedure THeaderFooterwithNavigation.btnSettingsDoneClick(Sender: TObject);
begin
  TabControl1.SetActiveTabWithTransition(TabJoin, TTabTransition.None, TTabTransitionDirection.Normal);
end;

procedure THeaderFooterwithNavigation.CheckIn(Sender: TObject; Status: string);
begin
  if not CheckingIn then
  begin
    CheckingIn := True;

    CheckinRequest.Resource := 'apis/[id]/checkin.json';
    CheckinRequest.Resource := CheckinRequest.Resource.Replace('[id]', edtTripID.Text);
    CheckinRequest.Params.ParameterByName('email').Value := edtEMail.Text;
    CheckinRequest.Params.ParameterByName('pin').Value := UserPin;
    CheckinRequest.Params.ParameterByName('token').Value := TripToken;
    CheckinRequest.Params.ParameterByName('lat').Value := currentLat;
    CheckinRequest.Params.ParameterByName('long').Value := currentLong;
    CheckinRequest.Params.ParameterByName('status').Value := Status;
    CheckinRequest.Execute;

    CheckingIn := False;
  end;
end;

procedure THeaderFooterwithNavigation.Mapping(Sender: TObject);
begin
  if not MappingIn then
  begin
    MappingIn := True;

    MapRequest.Resource := 'apis/[id]/mapping.json';
    MapRequest.Resource := MapRequest.Resource.Replace('[id]', edtTripID.Text);
    MapRequest.Params.ParameterByName('email').Value := edtEMail.Text;
    MapRequest.Params.ParameterByName('pin').Value := UserPin;
    MapRequest.Params.ParameterByName('token').Value := TripToken;
    MapRequest.Execute;

    MappingIn := False;
  end;
end;

procedure THeaderFooterwithNavigation.NewTripPartRequestAfterExecute(
  Sender: TCustomRESTRequest);
var
  Response: TJSONObject;
  Participant: TJSONObject;
  Result: string;
begin
  if assigned(NewTripPartResponse.JSONValue) then
  begin
    Response := NewTripPartResponse.JsonValue as TJSONObject;
    Participant := Response.Get('participant').JsonValue as TJSONObject;
    Result := Participant.Get('result').JsonValue.ToString.Replace('"', '');
    if Result <> 'success' then
    begin
      cpNewtripError.Visible := True;
    end
    else
    begin
      cpNewTripError.Visible := False;
    end;
  end;
end;

procedure THeaderFooterwithNavigation.NewTripRequestAfterExecute(
  Sender: TCustomRESTRequest);
var
  Response: TJSONObject;
  Trip: TJSONObject;
  Result: string;
begin
  if assigned(NewTripResponse.JSONValue) then
  begin
    Response := NewTripResponse.JsonValue as TJSONObject;
    Trip := Response.Get('trip').JsonValue as TJSONObject;
    Result := Trip.Get('result').JsonValue.ToString.Replace('"', '');
    if Result <> 'success' then
    begin
      cpNewTripError.Visible := True;
      NewTripId := 0;
    end
    else
    begin
      cpNewTripError.Visible := False;

      NewTripId := StrToInt(Trip.Get('trip_id').JsonValue.ToString);
      NewTripName := Trip.Get('name').JsonValue.ToString.Replace('"', '');
      NewTripToken := Trip.Get('token').JsonValue.ToString.Replace('"', '');
      NewTripPin := Trip.Get('pin').JsonValue.ToString.Replace('"', '');

      NewTripPartRequest.Resource := 'apis/[id]/add_part.json';
      NewTripPartRequest.Resource := NewTripPartRequest.Resource.Replace('[id]', IntToStr(NewTripID));
      NewTripPartRequest.Params.ParameterByName('token').Value := NewTripToken;

      NewTripPartRequest.Params.ParameterByName('name').Value := SignInName;
      NewTripPartRequest.Params.ParameterByName('leader').Value := 'yes';
      NewTripPartRequest.Params.ParameterByName('email').Value := SignInEmail;
      NewTripPartRequest.Execute;
    end;
  end;

  mmoShareInfo.Lines.Add('Hello, you have been invited on a trip by ' + SignInName);
  mmoShareInfo.Lines.Add('');
  mmoShareInfo.Lines.Add('Use the TripTether app with these settings to join the trip:');
  mmoShareInfo.Lines.Add('   Trip ID: ' + IntToStr(NewTripID));
  mmoShareInfo.Lines.Add('   PIN: ' + NewTripPin);
  mmoShareInfo.Lines.Add('');
  ShowShareSheetAction1.TextMessage := mmoShareInfo.Text;

  TabControl1.SetActiveTabWithTransition(TabNewTripShare, TTabTransition.Slide, TTabTransitionDirection.Normal);
end;

procedure THeaderFooterwithNavigation.MapName(Sender: TObject; Name: string);
var
  URLString: string;
begin
  TabControl1.SetActiveTabWithTransition(TabMap, TTabTransition.Slide, TTabTransitionDirection.Normal);
  URLString := Format(APIBASEURL + '/apis/%s/mapping?email=%s&pin=%s&token=%s&rand=%s&name=%s', [edtTripID.Text, edtEMail.Text, UserPin, TripToken, IntToStr(Random(30000)), Name]);
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
