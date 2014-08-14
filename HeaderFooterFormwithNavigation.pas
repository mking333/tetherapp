unit HeaderFooterFormwithNavigation;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  System.DateUtils, System.INIFiles, System.Sensors, System.Actions,
  System.IOUtils, System.JSON, System.StrUtils,
  System.Sensors.Components,
  FMX.Types, FMX.Controls, FMX.Graphics, FMX.Forms, FMX.Dialogs, FMX.TabControl,
  FMX.ActnList, FMX.StdCtrls, FMX.MobilePreview, FMX.Edit,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  REST.Utils, REST.Types, REST.Json, DATA.DBXJSON,
  FMX.Layouts, FMX.ListBox, FMX.Memo, FMX.Gestures, FMX.StdActns, FMX.MediaLibrary.Actions,
  FMX.DateTimeCtrls, FMX.WebBrowser, FMX.Objects,
  XSBuiltins,
  IdGlobal,
  FMX.TMSWebGMapsCommon,
  FMX.TMSWebGMapsGeocoding, FMX.TMSWebGMapsWebBrowser, FMX.TMSWebGMaps, FMX.TMSWebGMapsMarkers,
  FMX.TMSWebGMapsCommonFunctions,
  FMX.TMSWebGMapsPolygons, FMX.TMSWebGMapsPolylines,
  FMX.TMSWebGMapsDirections, FMX.TMSWebGMapsReverseGeocoding, FMX.TMSWebGMapsWebUtil,
  FMX.Advertising, FMX.Ani, FMX.Colors;

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
    ListBox2: TListBox;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    lbiStartFinish: TListBoxItem;
    lblName: TLabel;
    lblDeparting: TLabel;
    lblArriving: TLabel;
    lblStarted: TLabel;
    ListBoxItem9: TListBoxItem;
    lblLeader: TLabel;
    btnMap: TSpeedButton;
    btnDirections: TSpeedButton;
    edtEMail: TEdit;
    edtTripID: TEdit;
    edtTripPIN: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnJoinTrip: TButton;
    btnSettings: TSpeedButton;
    Label3: TLabel;
    btnSettingsDone: TButton;
    cpJoinError: TCalloutPanel;
    Label7: TLabel;
    Label9: TLabel;
    QuitRequest: TRESTRequest;
    QuitResponse: TRESTResponse;
    btnNewTrip: TSpeedButton;
    btnSignUp: TButton;
    Label10: TLabel;
    Label11: TLabel;
    edtSignIn: TEdit;
    edtPassword: TEdit;
    TabSignUp: TTabItem;
    TabNewTrip: TTabItem;
    ToolBar3: TToolBar;
    Label19: TLabel;
    ToolBar4: TToolBar;
    Label20: TLabel;
    Destination: TLabel;
    Location: TLabel;
    edtTripName: TEdit;
    edtTripCity: TEdit;
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
    Label28: TLabel;
    tmeTripDepart: TTimeEdit;
    dteTripDepart: TDateEdit;
    dteTripArrive: TDateEdit;
    tmeTripArrive: TTimeEdit;
    Label29: TLabel;
    cpSignInError: TCalloutPanel;
    Label24: TLabel;
    Label25: TLabel;
    btnSaveSignIn: TButton;
    NewTripPartRequest: TRESTRequest;
    NewTripPartResponse: TRESTResponse;
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
    MapRequest: TRESTRequest;
    MapResponse: TRESTResponse;
    mapTrip: TTMSFMXWebGMaps;
    btnAddShare: TSpeedButton;
    edtEmailSetting: TEdit;
    Label34: TLabel;
    edtNameSetting: TEdit;
    Label35: TLabel;
    spBikes: TSpeedButton;
    spWeather: TSpeedButton;
    pnlMapOptions: TPanel;
    spTraffic: TSpeedButton;
    Panel14: TPanel;
    Action2: TAction;
    GestureManager1: TGestureManager;
    pnlDirections: TPanel;
    lbRoutes: TListBox;
    TabControl2: TTabControl;
    TabRoutes: TTabItem;
    TabLegs: TTabItem;
    lbLegs: TListBox;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    VertScrollBox1: TVertScrollBox;
    cpNetworkError: TCalloutPanel;
    Label16: TLabel;
    Label17: TLabel;
    VertScrollBox2: TVertScrollBox;
    VertScrollBox3: TVertScrollBox;
    Timer2: TTimer;
    BannerAd1: TBannerAd;
    ColorAnimation1: TColorAnimation;
    btnSignUp1: TButton;
    Label14: TLabel;
    Layout1: TLayout;
    Layout2: TLayout;
    Image1: TImage;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    VertScrollBox4: TVertScrollBox;
    VertScrollBox5: TVertScrollBox;
    Rectangle7: TRectangle;
    Label18: TLabel;
    TabNewTripNotes: TTabItem;
    Rectangle8: TRectangle;
    ToolBar7: TToolBar;
    Label36: TLabel;
    btnBackToTrip: TSpeedButton;
    VertScrollBox6: TVertScrollBox;
    mmoTripNotes: TMemo;
    btnNewTripDetails2: TButton;
    btnNewTripCreate: TButton;
    cpNewTripError: TCalloutPanel;
    Label31: TLabel;
    Label32: TLabel;
    Rectangle9: TRectangle;
    VertScrollBox7: TVertScrollBox;
    btnSignUpGo: TButton;
    cpSignUpError: TCalloutPanel;
    Label37: TLabel;
    lblSignUpError: TLabel;
    edtSignUpPW: TEdit;
    edtSignUpEMail: TEdit;
    Label39: TLabel;
    Label41: TLabel;
    edtSignUpConfirm: TEdit;
    Label42: TLabel;
    SignUpResponse: TRESTResponse;
    SignUpRequest: TRESTRequest;
    cpSignUpSuccess: TCalloutPanel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    spFollow: TSpeedButton;
    spPictures: TSpeedButton;
    spMapOptions: TSpeedButton;
    Rectangle10: TRectangle;
    Layout3: TLayout;
    Layout4: TLayout;
    spTags: TSpeedButton;
    spMe: TSpeedButton;
    spFlag: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure JoinTrip(Sender: TObject);
    procedure JoinRequestAfterExecute(Sender: TCustomRESTRequest);
    procedure Timer1Timer(Sender: TObject);
    procedure CheckIn(Sender: TObject; Status: string; StatusCount: integer);
    procedure Mapping(Sender: TObject);
    procedure MapName(Sender: TObject; SelectName: string; ZoomLevel: integer);
    procedure MapUpdate(Sender: TObject);
    procedure LocationSensor1LocationChanged(Sender: TObject; const OldLocation,
      NewLocation: TLocationCoord2D);
    procedure btnDirectionsClick(Sender: TObject);
    procedure btnJoinClick(Sender: TObject);
    procedure spCheckInChange(Sender: TObject);
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
    procedure StartUpdating(Sender: TObject);
    procedure StopUpdating(Sender: TObject);
    procedure btnNewTripClick(Sender: TObject);
    procedure btnSignUpClick(Sender: TObject);
    procedure btnSaveSignInClick(Sender: TObject);
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
    procedure btnAddShareClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure spTrafficClick(Sender: TObject);
    procedure spWeatherClick(Sender: TObject);
    procedure spBikesClick(Sender: TObject);
    procedure spPicturesClick(Sender: TObject);
    procedure edtNameSettingChange(Sender: TObject);
    procedure edtEmailSettingChange(Sender: TObject);
    procedure TabTripGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure TabCheckGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure CleanMap;
    procedure DisplayRoute;
    procedure DisplayRouteDetails;
    procedure lbRoutesItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure lbRoutesDblClick(Sender: TObject);
    procedure lbLegsDblClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure btnBackToTripClick(Sender: TObject);
    procedure btnNewTripDetails2Click(Sender: TObject);
    procedure btnSignUpGoClick(Sender: TObject);
    procedure SignUpRequestAfterExecute(Sender: TCustomRESTRequest);
    procedure spMapOptionsClick(Sender: TObject);
    procedure spTagsClick(Sender: TObject);
    procedure spFollowClick(Sender: TObject);
    procedure spFlagClick(Sender: TObject);
    procedure spMeClick(Sender: TObject);
  private
    { Private declarations }
    AutoZoomTrip: boolean;
    ParticipantsCount: integer;
    SaveStatus: string;
    SaveStatusCount: integer;

    StartTime: TDate;
    TripToken: string;
    CurrentLat: double;
    CurrentLong: double;
    CheckingIn: boolean;
    MappingIn: boolean;

    UserPin: string;

    SignInUserId: integer;
    SignInEmail: string;
    SignInName: string;
    SignInToken: string;

    TripLat: double;
    TripLong: double;
    TripFoundLatLong: boolean;

    NewTripId: integer;
    NewTripName: string;
    NewTripToken: string;
    NewTripPin: string;
  public
    { Public declarations }
  end;

const
//  APIBASEURL = 'http://192.168.2.201';
  APIBASEURL = 'https://www.triptether.com';

//var
//  HeaderFooterwithNavigation: THeaderFooterwithNavigation;

implementation


{$R *.fmx}

uses Launch;
procedure THeaderFooterwithNavigation.JoinTrip(Sender: TObject);
var
  ini: TIniFile;
begin
  cpNetworkError.Visible := False;
  cpJoinError.Visible := False;

  CleanMap;
  AutoZoomTrip := True;
  ParticipantsCount := 0;

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

    edtEMailSetting.Text := edtEMail.Text;
    edtNameSetting.Text := edtName.Text;

    ini := TIniFile.Create(System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath, 'tether.ini'));
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
    try
      JoinRequest.Execute
    except
      on E: Exception do begin
        cpNetworkError.Visible := True;
      end;
    end;
  end;
end;

procedure THeaderFooterwithNavigation.lbLegsDblClick(Sender: TObject);
begin
  TabControl2.SetActiveTabWithTransition(TabRoutes, TTabTransition.Slide, TTabTransitionDirection.Reversed);
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

  MapName(self, SelectName, 18);
end;

procedure THeaderFooterwithNavigation.lbRoutesDblClick(Sender: TObject);
begin
  TabControl2.SetActiveTabWithTransition(TabLegs, TTabTransition.Slide, TTabTransitionDirection.Normal);
end;

procedure THeaderFooterwithNavigation.lbRoutesItemClick(
  const Sender: TCustomListBox; const Item: TListBoxItem);
begin
  DisplayRoute;
  DisplayRouteDetails;
end;

procedure THeaderFooterwithNavigation.LocationSensor1LocationChanged(
  Sender: TObject; const OldLocation, NewLocation: TLocationCoord2D);
begin
  CurrentLat := NewLocation.Latitude; //(NewLocation.Latitude, ffGeneral, 10, 6);
  CurrentLong := NewLocation.Longitude; //FloatToStrF(NewLocation.Longitude, ffGeneral, 10, 6);
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
  mapTrip.APIKey := 'AIzaSyAzsMIUBfOpqymD1ND4W6XGipTuue9JCDA';

  ini := TIniFile.Create(System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath, 'tether.ini'));
  edtNameSetting.Text := ini.ReadString('login', 'name', '');
  edtEmailSetting.Text := ini.ReadString('login', 'email', '');
  spCheckIn.Value := ini.ReadInteger('settings', 'checkin', 5);

  edtTripID.Text := ini.ReadString('login', 'trip', '');
  edtTripPin.Text := ini.ReadString('login', 'pin', '');
  edtEMail.Text := ini.ReadString('login', 'email', '');
  edtName.Text := ini.ReadString('login', 'name', '');

  edtSignIn.Text := ini.ReadString('signin', 'email', '');
  edtPassword.Text := ini.ReadString('signin', 'pw', '');
  SignInName := ini.ReadString('signin', 'name', '');

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

procedure THeaderFooterwithNavigation.Image1Click(Sender: TObject);
begin
  frmLaunch.Show;
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
  cpSignUpSuccess.Visible := False;
  cpSignInError.Visible := False;

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
      //SignInName := User.Get('name').JsonValue.ToString.Replace('"', '');
      SignInEmail := User.Get('email').JsonValue.ToString.Replace('"', '');
      SignInToken := User.Get('token').JsonValue.ToString.Replace('"', '');

      TabControl1.SetActiveTabWithTransition(TabNewTrip, TTabTransition.Slide);
    end;
  end;
end;

procedure THeaderFooterwithNavigation.SignUpRequestAfterExecute(
  Sender: TCustomRESTRequest);
var
  Response: TJSONObject;
  User: TJSONObject;
  Result: string;
begin
  cpSignUpError.Visible := False;

  if assigned(SignUpResponse.JSONValue) then
  begin
    Response := SignUpResponse.JsonValue as TJSONObject;
    User := Response.Get('user').JsonValue as TJSONObject;
    Result := User.Get('result').JsonValue.ToString.Replace('"', '');
    if Result <> 'success' then
    begin
      lblSignUpError.Text := 'Check your sign up info and try again.';
      if Result = 'duplicate user' then
        lblSignUpError.Text := 'Email already used, try another.';
      if Result = 'password error' then
        lblSignUpError.Text := 'Password must be at least 8 characters.';

      cpSignUpError.Visible := True;
    end
    else
    begin
      cpSignUpError.Visible := False;

      SignInUserId := StrToInt(User.Get('user_id').JsonValue.ToString);
      //SignInName := User.Get('name').JsonValue.ToString.Replace('"', '');
      SignInEmail := User.Get('email').JsonValue.ToString.Replace('"', '');
      SignInToken := User.Get('token').JsonValue.ToString.Replace('"', '');

      edtSignIn.Text := SignInEmail;
      edtPassword.Text := '';

      TabControl1.SetActiveTabWithTransition(TabSignIn, TTabTransition.Slide);
      btnSignUp.Visible := False;
      btnSignUp1.Visible := False;
      Label14.Visible := False;
      cpSignInError.Visible := False;
      cpSignUpSuccess.Visible := True;
    end;
  end;
end;

procedure THeaderFooterwithNavigation.JoinRequestAfterExecute(
  Sender: TCustomRESTRequest);
var
  Response: TJSONObject;
  Trip: TJSONObject;
  Name: TJSONValue;
  UserName: string;
  Notes: string;
  Depart: string;
  Arrive: string;
  Start: string;
  Finish: string;
  Leader: string;
  Token: TJSONValue;
  Result: string;
  Participant: TJSONObject;
  ParticipantName: TJSONValue;
  LocalDate: TDateTime;
  DepartingDate: string;
  ArrivingDate: string;
  StartingDate: string;
  FinishingDate: string;
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
      UserName := Trip.Get('user').JsonValue.ToString.Replace('"', '');
      Notes := Trip.Get('notes').JsonValue.ToString.Replace('"', '');
      Depart := Trip.Get('depart').JsonValue.ToString.Replace('"', '');
      Arrive := Trip.Get('arrive').JsonValue.ToString.Replace('"', '');
      Start := Trip.Get('start').JsonValue.ToString.Replace('"', '');
      Finish := Trip.Get('finish').JsonValue.ToString.Replace('"', '');
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
      if Start = '' then
      begin
        lbiStartFinish.Text := 'Started';
        lblStarted.Text := 'Leader will start trip.';
        lblLeader.Text := UserName;
        btnCheckIn.Enabled := false;
      end
      else
      begin
        lbiStartFinish.Text := 'Started';
        LocalDate := TTimeZone.Local.ToLocalTime(XMLTimeToDateTime(Start, True));
        StartingDate := FormatDateTime('ddddd t', LocalDate);
        lblStarted.Text := StartingDate;
        lblLeader.Text := UserName;
        btnCheckIn.Enabled := true;
      end;
      if Finish <> '' then
      begin
        lbiStartFinish.Text := 'Finished';
        LocalDate := TTimeZone.Local.ToLocalTime(XMLTimeToDateTime(Finish, True));
        FinishingDate := FormatDateTime('ddddd t', LocalDate);
        lblStarted.Text := FinishingDate;
        lblLeader.Text := UserName;
        btnCheckIn.Enabled := false;
      end;

      if Leader = 'yes' then
        lblLeader.Text := 'You are the leader.';

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

      StartUpdating(self);
      StartTime := Now;

      //edtStatus.Text := 'Joined Trip';
      CheckIn(self, 'Joined Trip', 3);
      //Mapping(self);
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
  Leader: string;
  MyID: integer;
  Result: TJSONValue;
  Participant: TJSONObject;
  ParticipantID: integer;
  ParticipantName: string;
  ParticipantStatus: string;
  ParticipantLat: Double;
  ParticipantLong: Double;
  ParticipantCheckIn: string;
  ParticipantJoin: string;
  ParticipantQuit: string;
  ParticipantLocated: boolean;
  Participants: TJSONArray;
  LocalDate: TDateTime;
  CheckInDate: string;
  i: integer;
  PartListItem: TListBoxItem;
  Marker: TMarker;
  Bounds: TBounds;
begin
  if assigned(CheckinResponse.JSONValue) then
  begin
    Response := CheckinResponse.JsonValue as TJSONObject;
    Trip := Response.Get('trip').JsonValue as TJSONObject;
    Name := Trip.Get('name').JsonValue.ToString.Replace('"', '');
    Notes := Trip.Get('notes').JsonValue.ToString.Replace('"', '');
    TripLat := StrToFloat(Trip.Get('dest_lat').JsonValue.ToString);
    TripLong := StrToFloat(Trip.Get('dest_long').JsonValue.ToString);
    Result := Trip.Get('result').JsonValue;

    Participant := Trip.Get('participant').JsonValue as TJSONObject;
    ParticipantID := StrToInt(Participant.Get('participant_id').JsonValue.ToString);
    ParticipantName := Participant.Get('name').JsonValue.ToString.Replace('"', '');
    ParticipantLat := StrToFloat(Participant.Get('curr_lat').JsonValue.ToString);
    ParticipantLong := StrToFloat(Participant.Get('curr_long').JsonValue.ToString);
    ParticipantLocated := True;
    if (ParticipantLat = 0) or (ParticipantLong = 0) then
    begin
      ParticipantLat := TripLat;
      ParticipantLong := TripLong + 0.001;
      ParticipantLocated := False;
    end;
    ParticipantStatus := Participant.Get('status').JsonValue.ToString.Replace('"', '');
    ParticipantCheckIn := Participant.Get('checkin').JsonValue.ToString.Replace('"', '');
    Leader := Participant.Get('leader').JsonValue.ToString.Replace('"', '');

    MyID := ParticipantID;

    Participants := Trip.Get('participants').JsonValue as TJSONArray;
    lbParticipants.Items.Clear;

    mapTrip.DeleteAllMapMarker;

    Marker := mapTrip.Markers.Add;
    Marker.Latitude := TripLat;
    Marker.Longitude := TripLong;
    Marker.Draggable := false;
    Marker.Icon := 'http://www.triptether.com/images/flag_dest.png?t=1';
    if spTags.IsPressed then
    begin
      Marker.MapLabel.Text := '<b> ' + Name + ' </b>';
      Marker.MapLabel.Color := TAlphaColorRec.Red;
      Marker.MapLabel.BorderColor := TAlphaColorRec.Black;
      Marker.MapLabel.FontColor := TAlphaColorRec.White;
    end;
    mapTrip.CreateMapMarker(Marker);
    //mapTrip.Markers.Add(DestLat, DestLong, Name, 'http://www.triptether.com/images/flag_dest.png', true, true, true, true, false, 0);

    Bounds := TBounds.Create;
    Bounds.NorthEast.Latitude := TripLat;
    Bounds.NorthEast.Longitude := TripLong;
    Bounds.SouthWest.Latitude := TripLat;
    Bounds.SouthWest.Longitude := TripLong;

    Marker := mapTrip.Markers.Add;
    Marker.Latitude := ParticipantLat;
    Marker.Longitude := ParticipantLong;
    Marker.Draggable := false;
    if ParticipantLocated then
      Marker.Icon := 'http://www.triptether.com/images/participant.png?t=1'
    else
      Marker.Icon := 'http://www.triptether.com/images/participant6.png?t=1';
    if spTags.IsPressed then
    begin
      if (ParticipantStatus = '') or (ParticipantStatus = 'null') then
        Marker.MapLabel.Text := ParticipantName
      else
        Marker.MapLabel.Text := ParticipantName + ': ' + ParticipantStatus;
    end;
    mapTrip.CreateMapMarker(Marker);


    if ParticipantLat > TripLat then
      Bounds.NorthEast.Latitude := ParticipantLat;
    if ParticipantLat < TripLat then
      Bounds.SouthWest.Latitude := ParticipantLat;
    if ParticipantLong > TripLong then
      Bounds.NorthEast.Longitude := ParticipantLong;
    if ParticipantLong < TripLong then
      Bounds.SouthWest.Longitude := ParticipantLong;

    for i := 0 to Participants.Count - 1 do
    begin
      Participant := Participants.Items[i] as TJSONObject;
      ParticipantID := StrToInt(Participant.Get('participant_id').JsonValue.ToString);
      ParticipantName := Participant.Get('name').JsonValue.ToString.Replace('"', '');
      ParticipantLat := StrToFloat(Participant.Get('curr_lat').JsonValue.ToString);
      ParticipantLong := StrToFloat(Participant.Get('curr_long').JsonValue.ToString);
      ParticipantLocated := True;
      if (ParticipantLat = 0) or (ParticipantLong = 0) then
      begin
        ParticipantLat := TripLat;
        ParticipantLong := TripLong + 0.001;
        ParticipantLocated := False;
      end;
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
      if (ParticipantStatus = '') or (ParticipantStatus = 'null') then
        PartListItem.ItemData.Text := ParticipantName
      else
        PartListItem.ItemData.Text := ParticipantName + ': ' + ParticipantStatus;

      lbParticipants.AddObject(PartListItem);

      if (abs(ParticipantLat) > 0.1) and (abs(ParticipantLong) > 0.1) then
      begin
        if ParticipantID <> MyID then
        begin
          Marker := mapTrip.Markers.Add;
          Marker.Latitude := ParticipantLat;
          Marker.Longitude := ParticipantLong;
          Marker.Draggable := false;
          if ParticipantQuit = '' then
          begin
            if ParticipantLocated then
              Marker.Icon := 'http://www.triptether.com/images/participant3.png?t=1'
            else
              Marker.Icon := 'http://www.triptether.com/images/participant6.png?t=1';
          end
          else
            Marker.Icon := 'http://www.triptether.com/images/participantq.png?t=1';
          if spTags.IsPressed then
          begin
            if ParticipantStatus = '' then
              Marker.MapLabel.Text := ParticipantName
            else
              Marker.MapLabel.Text := ParticipantName + ': ' + ParticipantStatus;
          end;
          mapTrip.CreateMapMarker(Marker);
        end;

        if ParticipantLat > Bounds.NorthEast.Latitude then
          Bounds.NorthEast.Latitude := ParticipantLat;
        if ParticipantLat < Bounds.SouthWest.Latitude then
          Bounds.SouthWest.Latitude := ParticipantLat;
        if ParticipantLong > Bounds.NorthEast.Longitude then
          Bounds.NorthEast.Longitude := ParticipantLong;
        if ParticipantLong < Bounds.SouthWest.Longitude then
          Bounds.SouthWest.Longitude := ParticipantLong;
      end;
    end;

    if AutoZoomTrip or spFollow.IsPressed then
    begin
      if Participants.Count = 0 then
        mapTrip.MapPanTo(TripLat, TripLong)
      else
      begin
        //Bounds.NorthEast.Latitude := Bounds.NorthEast.Latitude + 0.002;
        //Bounds.NorthEast.Longitude := Bounds.NorthEast.Longitude + 0.002;
        //Bounds.SouthWest.Latitude := Bounds.SouthWest.Latitude - 0.002;
        //Bounds.SouthWest.Longitude := Bounds.SouthWest.Longitude - 0.002;
        mapTrip.MapZoomTo(Bounds);
      end;

      AutoZoomTrip := False;
    end;

    ParticipantsCount := Participants.Count;
  end;
end;

procedure THeaderFooterwithNavigation.CheckinRequestHTTPProtocolError(
  Sender: TCustomRESTRequest);
begin
  StopUpdating(self);

  TabControl1.SetActiveTabWithTransition(TabJoin, TTabTransition.None, TTabTransitionDirection.Normal);
  cpNetworkError.Visible := True;
end;

procedure THeaderFooterwithNavigation.edtEmailSettingChange(Sender: TObject);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath, 'tether.ini'));
  ini.WriteString('login', 'email', edtEmailSetting.Text);
  ini.Free;
end;

procedure THeaderFooterwithNavigation.edtNameSettingChange(Sender: TObject);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath, 'tether.ini'));
  ini.WriteString('login', 'name', edtNameSetting.Text);
  ini.WriteString('signin', 'name', edtNameSetting.Text);
  ini.Free;
end;

procedure THeaderFooterwithNavigation.MappingRequestAfterExecute(
  Sender: TCustomRESTRequest);
var
  Response: TJSONObject;
  Trip: TJSONObject;
  Name: string;
  Notes: string;
  DestLat: Double;
  DestLong: Double;
  Leader: string;
  SelectedName: string;
  MyID: integer;
  Result: TJSONValue;
  Participant: TJSONObject;
  ParticipantID: integer;
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
  Marker: TMarker;
  Bounds: TBounds;
begin
  if assigned(MapResponse.JSONValue) then
  begin
    Response := MapResponse.JsonValue as TJSONObject;
    Trip := Response.Get('trip').JsonValue as TJSONObject;
    Name := Trip.Get('name').JsonValue.ToString.Replace('"', '');
    Notes := Trip.Get('notes').JsonValue.ToString.Replace('"', '');
    DestLat := StrToFloat(Trip.Get('dest_lat').JsonValue.ToString);
    DestLong := StrToFloat(Trip.Get('dest_long').JsonValue.ToString);
    SelectedName := Trip.Get('selected').JsonValue.ToString.Replace('"', '');
    Result := Trip.Get('result').JsonValue;

    Participant := Trip.Get('participant').JsonValue as TJSONObject;
    ParticipantID := StrToInt(Participant.Get('participant_id').JsonValue.ToString);
    ParticipantName := Participant.Get('name').JsonValue.ToString.Replace('"', '');
    ParticipantStatus := Participant.Get('status').JsonValue.ToString.Replace('"', '');
    ParticipantCheckIn := Participant.Get('checkin').JsonValue.ToString.Replace('"', '');
    Leader := Participant.Get('leader').JsonValue.ToString.Replace('"', '');

    MyID := ParticipantID;

    Participants := Trip.Get('participants').JsonValue as TJSONArray;
    mapTrip.Markers.Clear;
    Bounds := TBounds.Create;

    if SelectedName = '' then
    begin
      Marker := mapTrip.Markers.Add;
      Marker.Latitude := DestLat;
      Marker.Longitude := DestLong;
      Marker.Draggable := false;
      Marker.Icon := 'http://www.triptether.com/images/flag_dest.png?t=1';
      if spTags.IsPressed then
      begin
        Marker.MapLabel.Text := '<b> ' + Name + ' </b>';
        Marker.MapLabel.Color := TAlphaColorRec.Red;
        Marker.MapLabel.BorderColor := TAlphaColorRec.Black;
        Marker.MapLabel.FontColor := TAlphaColorRec.White;
      end;
      mapTrip.CreateMapMarker(Marker);

      Bounds.NorthEast.Latitude := DestLat;
      Bounds.NorthEast.Longitude := DestLong;
      Bounds.SouthWest.Latitude := DestLat;
      Bounds.SouthWest.Longitude := DestLong;
    end;

    for i := 0 to Participants.Count - 1 do
    begin
      Participant := Participants.Items[i] as TJSONObject;
      ParticipantID := StrToInt(Participant.Get('participant_id').JsonValue.ToString);
      ParticipantName := Participant.Get('name').JsonValue.ToString.Replace('"', '');
      ParticipantLat := StrToFloat(Participant.Get('curr_lat').JsonValue.ToString);
      ParticipantLong := StrToFloat(Participant.Get('curr_long').JsonValue.ToString);
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

      if (ParticipantLat = 0) and (ParticipantLong = 0) then
        Continue;

      Marker := mapTrip.Markers.Add;
      Marker.Latitude := ParticipantLat;
      Marker.Longitude := ParticipantLong;
      Marker.Draggable := false;
      if ParticipantID = MyID then
        Marker.Icon := 'http://www.triptether.com/images/participant.png?t=1'
      else
      begin
        if ParticipantQuit = '' then
          Marker.Icon := 'http://www.triptether.com/images/participant3.png?t=1'
        else
          Marker.Icon := 'http://www.triptether.com/images/participantq.png?t=1';
      end;
      if spTags.IsPressed then
      begin
        if ParticipantStatus = '' then
          Marker.MapLabel.Text := ParticipantName
        else
          Marker.MapLabel.Text := ParticipantName + ': ' + ParticipantStatus;
      end;
      mapTrip.CreateMapMarker(Marker);

      if SelectedName = '' then
      begin
        if ParticipantLat > Bounds.NorthEast.Latitude then
          Bounds.NorthEast.Latitude := ParticipantLat;
        if ParticipantLat < Bounds.SouthWest.Latitude then
          Bounds.SouthWest.Latitude := ParticipantLat;
        if ParticipantLong > Bounds.NorthEast.Longitude then
          Bounds.NorthEast.Longitude := ParticipantLong;
        if ParticipantLong < Bounds.SouthWest.Longitude then
          Bounds.SouthWest.Longitude := ParticipantLong;
      end
      else
      begin
        Bounds.NorthEast.Latitude := ParticipantLat;
        Bounds.SouthWest.Latitude := ParticipantLat;
        Bounds.NorthEast.Longitude := ParticipantLong;
        Bounds.SouthWest.Longitude := ParticipantLong;
      end;
    end;

    if spFollow.IsPressed then
    begin
      if Participants.Count = 0 then
        mapTrip.MapPanTo(DestLat, DestLong)
      else
      begin
        //Bounds.NorthEast.Latitude := Bounds.NorthEast.Latitude + 0.002;
        //Bounds.NorthEast.Longitude := Bounds.NorthEast.Longitude + 0.002;
        //Bounds.SouthWest.Latitude := Bounds.SouthWest.Latitude - 0.002;
        //Bounds.SouthWest.Longitude := Bounds.SouthWest.Longitude - 0.002;
        mapTrip.MapZoomTo(Bounds);
      end;
    end;

    ParticipantsCount := Participants.Count;
  end;

  TabControl1.SetActiveTabWithTransition(TabMap, TTabTransition.Slide, TTabTransitionDirection.Normal);
  Panel14.Visible := True;
  mapTrip.Visible := True;
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
  ini := TIniFile.Create(System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath, 'tether.ini'));
  ini.WriteInteger('settings', 'checkin', Trunc(spCheckIn.Value));
  ini.Free;
end;

procedure THeaderFooterwithNavigation.spWeatherClick(Sender: TObject);
begin
  if mapTrip.MapOptions.ShowWeather then
  begin
    mapTrip.MapOptions.ShowWeather := False;
    mapTrip.MapOptions.ShowCloud := False;
  end
  else
  begin
    mapTrip.MapOptions.ShowWeather := True;
    mapTrip.MapOptions.ShowCloud := True;
  end;
end;


procedure THeaderFooterwithNavigation.SpeedButton2Click(Sender: TObject);
begin
  TabControl2.SetActiveTabWithTransition(TabLegs, TTabTransition.Slide, TTabTransitionDirection.Normal);
end;

procedure THeaderFooterwithNavigation.SpeedButton3Click(Sender: TObject);
begin
  TabControl1.SetActiveTabWithTransition(TabCheck, TTabTransition.Slide, TTabTransitionDirection.Reversed);
end;

procedure THeaderFooterwithNavigation.SpeedButton4Click(Sender: TObject);
begin
  TabControl2.SetActiveTabWithTransition(TabRoutes, TTabTransition.Slide, TTabTransitionDirection.Reversed);
end;

procedure THeaderFooterwithNavigation.spTagsClick(Sender: TObject);
begin
  MapUpdate(self);
end;

procedure THeaderFooterwithNavigation.spTrafficClick(Sender: TObject);
begin
  if mapTrip.MapOptions.ShowTraffic then
    mapTrip.MapOptions.ShowTraffic := False
  else
    mapTrip.MapOptions.ShowTraffic := True;
end;

procedure THeaderFooterwithNavigation.spFlagClick(Sender: TObject);
begin
  MapName(self, 'Flag', 18);
end;

procedure THeaderFooterwithNavigation.spFollowClick(Sender: TObject);
begin
  MapUpdate(self);
end;

procedure THeaderFooterwithNavigation.spMapOptionsClick(Sender: TObject);
begin
  if pnlMapOptions.Visible then
    pnlMapOptions.Visible := False
  else
  begin
    if pnlDirections.Visible then
      pnlDirections.Visible := False;
    pnlMapOptions.Visible := True;
  end;
end;

procedure THeaderFooterwithNavigation.spMeClick(Sender: TObject);
begin
  MapName(self, 'Me', 18);
end;

procedure THeaderFooterwithNavigation.spPicturesClick(Sender: TObject);
begin
  if mapTrip.MapOptions.ShowPanoramio then
    mapTrip.MapOptions.ShowPanoramio := False
  else
    mapTrip.MapOptions.ShowPanoramio := True;
end;

procedure THeaderFooterwithNavigation.spBikesClick(Sender: TObject);
begin
  if mapTrip.MapOptions.ShowBicycling then
    mapTrip.MapOptions.ShowBicycling := False
  else
    mapTrip.MapOptions.ShowBicycling := True;
end;

procedure THeaderFooterwithNavigation.btnAddShareClick(Sender: TObject);
begin
  mmoShareInfo.Lines.Clear;
  mmoShareInfo.Lines.Add('Hello, you have been invited on a trip by ' + edtName.Text);
  mmoShareInfo.Lines.Add('');
  mmoShareInfo.Lines.Add('The trip is going to: ' + lblName.Text);
  mmoShareInfo.Lines.Add('');
  mmoShareInfo.Lines.Add('Use the TripTether app with these settings to join the trip:');
  mmoShareInfo.Lines.Add('   Trip ID: ' + edtTripID.Text);
  mmoShareInfo.Lines.Add('   PIN: ' + edtTripPIN.Text);
  mmoShareInfo.Lines.Add('');
  ShowShareSheetAction1.Caption := 'TripTether!';
  ShowShareSheetAction1.TextMessage := mmoShareInfo.Text;

  btnJoinNewTrip.Visible := False;
  TabControl1.SetActiveTabWithTransition(TabNewTripShare, TTabTransition.Slide, TTabTransitionDirection.Normal);
end;

procedure THeaderFooterwithNavigation.btnCheckInClick(Sender: TObject);
begin
  CheckIn(self, 'Checked In', 1);
  TabControl1.SetActiveTabWithTransition(TabCheck, TTabTransition.Slide, TTabTransitionDirection.Normal);
end;

procedure THeaderFooterwithNavigation.btnBackCheckClick(Sender: TObject);
begin
  mapTrip.Visible := False;
  Panel14.Visible := False;
  TabControl1.SetActiveTabWithTransition(TabCheck, TTabTransition.Slide, TTabTransitionDirection.Reversed);
end;

procedure THeaderFooterwithNavigation.btnDirectionsClick(Sender: TObject);
var
  I, J: Integer;
  TotalDistance, TotalDuration: integer;
  //RouteListItem: TListBoxItem;
  Description: string;
  SaveSpot: Integer;
begin
  if lbRoutes.Items.Count > 0 then
    SaveSpot := lbRoutes.ItemIndex
  else
    SaveSpot := 0;

  if pnlDirections.Visible then
    pnlDirections.Visible := False
  else
  begin
    TabControl2.ActiveTab := TabRoutes;
    lbRoutes.Clear;
    pnlDirections.Visible := True;
    //if pnlMapOptions.Visible then
    //  pnlMapOptions.Visible := False;
  end;

  if pnlDirections.Visible then
  begin
    mapTrip.GetDirections(CurrentLat, CurrentLong, TripLat, TripLong, true, tmDriving, usMetric, lnDefault, true);

    if mapTrip.Directions.Count > 0 then
    begin
      lbRoutes.BeginUpdate;
      lbRoutes.Items.Clear;
      for I := 0 to mapTrip.Directions.Count - 1 do
      begin
        Description := mapTrip.Directions[I].Summary + ': ';

        if mapTrip.Directions[I].Legs.Count = 1 then
          Description := Description
          + mapTrip.Directions[I].Legs[0].DistanceText + ', '
          + mapTrip.Directions[I].Legs[0].DurationText
        else
        begin
          TotalDistance := 0;
          TotalDuration := 0;
          for J := 0 to mapTrip.Directions[I].Legs.Count - 1 do
          begin
            TotalDistance := TotalDistance + mapTrip.Directions[I].Legs[J].Distance;
            TotalDuration := TotalDuration + mapTrip.Directions[I].Legs[J].Duration;
          end;
          Description := Description +
            FormatFloat('0.00', TotalDistance / 1000) + ' km, '
            + FormatFloat('0.00', (TotalDuration / 60) / 60) + ' h'
        end;
        lbRoutes.Items.Add(Description);

        //RouteListItem := TListBoxItem.Create(lbRoutes);
        //RouteListItem.Text := Description;
        //RouteListItem.ItemData.Accessory := TListBoxItemData.TAccessory.aMore;
        //RouteListItem.ItemData.Text := Description;

        //lbRoutes.AddObject(RouteListItem);
      end;
      lbRoutes.EndUpdate;
      lbRoutes.ItemIndex := SaveSpot;;

      DisplayRoute;
      DisplayRouteDetails;
    end
    else
      ShowMessage('"From" or "To" location not found.');
  end;
end;

procedure THeaderFooterwithNavigation.CleanMap;
begin
  mapTrip.DeleteAllMapPolyline;
  mapTrip.DeleteAllMapPolygon;
  mapTrip.DeleteAllMapMarker;
end;

procedure THeaderFooterwithNavigation.DisplayRoute;
var
  Route: TRoute;
//  Marker: TMarker;
//  Circle: TMapPolygon;
//  Rect: TMapPolygon;
//  PolygonItem: TPolygonItem;
//  I, J: Integer;
begin
  mapTrip.DeleteAllMapPolyline;
  mapTrip.DeleteAllMapPolygon;

  Route := mapTrip.Directions[lbRoutes.ItemIndex];

  //Zoom to directions Bounds
  mapTrip.MapZoomTo(Route.Bounds);
  mapTrip.CreateMapPolyline(Route.Polyline);

  {
  if False then
  begin
    //Add Markers
    mapTrip.DeleteAllMapMarker;

    Marker := mapTrip.Markers.Add;
    Marker.Draggable := false;
    Marker.Latitude := Route.Legs[0].StartLocation.Latitude;
    Marker.Longitude := Route.Legs[0].StartLocation.Longitude;
    Marker.Icon := 'http://www.triptether.com/images/participant.png?t=1';
    Marker.Title := 'Current Location';
    Marker.MapLabel.Text := '<b>Current Location:</b> ' + Route.Legs[0].StartAddress;
    Marker.MapLabel.Color := TAlphaColorRec.Yellow;
    Marker.MapLabel.BorderColor := TAlphaColorRec.Black;
    Marker.MapLabel.FontColor := TAlphaColorRec.Black;
    Marker.MapLabel.Font.Size := 14;
    mapTrip.CreateMapMarker(Marker);

    Marker := mapTrip.Markers.Add;
    Marker.Draggable := false;
    Marker.Latitude := Route.Legs[0].EndLocation.Latitude;
    Marker.Longitude := Route.Legs[0].EndLocation.Longitude;
    Marker.Icon := 'http://www.triptether.com/images/flag_dest.png?t=1';
    Marker.Title := 'Destination';
    Marker.MapLabel.Text := '<b>Destination:</b> ' + Route.Legs[0].EndAddress;
    Marker.MapLabel.Color := TAlphaColorRec.Yellow;
    Marker.MapLabel.BorderColor := TAlphaColorRec.Black;
    Marker.MapLabel.FontColor := TAlphaColorRec.Black;
    Marker.MapLabel.Font.Size := 14;
    mapTrip.CreateMapMarker(Marker);
  end;
  }

  //Add Polygon Circles
  {
  if False then
  begin
    PolygonItem := mapTrip.Polygons.Add;
    Circle := PolygonItem.Polygon;
    Circle.PolygonType := ptCircle;
    Circle.BackgroundOpacity := 50;
    Circle.BorderWidth := 2;
    Circle.Radius := Integer(Route.Legs[0].Distance div 10);
    Circle.Center.Latitude := Route.Legs[0].StartLocation.Latitude;
    Circle.Center.Longitude := Route.Legs[0].StartLocation.Longitude;
    mapTrip.CreateMapPolygon(Circle);

    PolygonItem := mapTrip.Polygons.Add;
    Circle := PolygonItem.Polygon;
    Circle.PolygonType := ptCircle;
    Circle.BackgroundOpacity := 50;
    Circle.BorderWidth := 2;
    Circle.Radius := Integer(Route.Legs[0].Distance div 10);
    Circle.Center.Latitude := Route.Legs[0].EndLocation.Latitude;
    Circle.Center.Longitude := Route.Legs[0].EndLocation.Longitude;
    mapTrip.CreateMapPolygon(Circle);
  end;
  }
  //Add Polygon Rectangle
  {
  if False then
  begin
    PolygonItem := mapTrip.Polygons.Add;
    Rect := PolygonItem.Polygon;
    Rect.PolygonType := ptRectangle;
    Rect.BackgroundOpacity := 0;
    Rect.BorderWidth := 2;
//    Rect.BorderColor := clBlack;
    Rect.BorderOpacity := 100;
    Rect.Bounds.SouthWest.Latitude := Route.Bounds.SouthWest.Latitude;
    Rect.Bounds.SouthWest.Longitude := Route.Bounds.SouthWest.Longitude;
    Rect.Bounds.NorthEast.Latitude := Route.Bounds.NorthEast.Latitude;
    Rect.Bounds.NorthEast.Longitude := Route.Bounds.NorthEast.Longitude;
    mapTrip.CreateMapPolygon(Rect);
  end;
  }
end;

procedure THeaderFooterwithNavigation.DisplayRouteDetails;
var
  I, J: Integer;
begin
  lbLegs.BeginUpdate;
  lbLegs.Items.Clear;
  if lbRoutes.ItemIndex >= 0 then
  begin
    for J := 0 to mapTrip.Directions[lbRoutes.ItemIndex].Legs.Count - 1 do
    begin
      for I := 0 to mapTrip.Directions[lbRoutes.ItemIndex].Legs[J].Steps.Count - 1 do
      begin
        lbLegs.Items.Add(mapTrip.Directions[lbRoutes.ItemIndex].Legs[J].Steps[I].Instructions);
      end;
    end;
  end;
  lbLegs.EndUpdate;
end;

procedure THeaderFooterwithNavigation.btnSignUpClick(Sender: TObject);
begin
  TabControl1.SetActiveTabWithTransition(TabSignUp, TTabTransition.Slide, TTabTransitionDirection.Normal);
end;

procedure THeaderFooterwithNavigation.btnSignUpGoClick(Sender: TObject);
var
  ini: TIniFile;
begin
  if (edtSignUpEmail.Text = '') or (edtSignUpPW.Text.Length < 8) or (edtSignUpConfirm.Text.Length < 8) or (edtSignUpPW.Text <> edtSignUpConfirm.Text) then
  begin
    lblSignUpError.Text := 'Check your sign up info and try again.';
    if edtSignUpPW.Text.Length < 8 then
      lblSignUpError.Text := 'Password must at least 8 characters.';
    if edtSignUpPW.Text <> edtSignUpConfirm.Text then
      lblSignUpError.Text := 'Confirm PW should be same as password.';

    cpSignUpError.Visible := True;
    edtSignUpEmail.TextPrompt := 'Your email address.';
    edtSignUpPW.TextPrompt := 'Choose password.';
    edtSignUpConfirm.TextPrompt := 'Type password again.';
  end
  else
  begin
    SignInName := edtNameSetting.Text;

    ini := TIniFile.Create(System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath, 'tether.ini'));
    ini.WriteString('signin', 'email', edtSignUpEmail.Text);
    ini.WriteString('signin', 'pw', edtSignUpPW.Text);
    ini.WriteString('signin', 'name', SignInName);
    ini.Free;

    SignUpRequest.Params.ParameterByName('email').Value := edtSignUpEmail.Text;
    SignUpRequest.Params.ParameterByName('pw').Value := edtSignUpPW.Text;
    SignUpRequest.Params.ParameterByName('confirm').Value := edtSignUpConfirm.Text;
    SignUpRequest.Params.ParameterByName('name').Value := SignInName;
    try
      SignUpRequest.Execute;
    except
      on E: Exception do begin
        TabControl1.SetActiveTabWithTransition(TabJoin, TTabTransition.None, TTabTransitionDirection.Reversed);
        cpNetworkError.Visible := True;
      end;
    end;
  end;
end;

procedure THeaderFooterwithNavigation.btnQuitClick(Sender: TObject);
begin
  StopUpdating(self);
  //edtStatus.Text := 'Quit Trip';
  CheckIn(self, 'Quit Trip', 3);

  TabControl1.SetActiveTabWithTransition(TabJoin, TTabTransition.None, TTabTransitionDirection.Normal);

  QuitRequest.Resource := 'apis/[id]/quit.json';
  QuitRequest.Resource := QuitRequest.Resource.Replace('[id]', edtTripID.Text);
  QuitRequest.Params.ParameterByName('email').Value := edtEMail.Text;
  QuitRequest.Params.ParameterByName('pin').Value := UserPin;
  QuitRequest.Params.ParameterByName('token').Value := TripToken;
  try
    QuitRequest.Execute;
  except
    on E: Exception do begin
      TabControl1.SetActiveTabWithTransition(TabJoin, TTabTransition.None, TTabTransitionDirection.Reversed);
      cpNetworkError.Visible := True;
    end;
  end;
end;

procedure THeaderFooterwithNavigation.btnMapClick(Sender: TObject);
begin
  MapName(self, 'Auto', 12);
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

procedure THeaderFooterwithNavigation.btnNewTripDetails2Click(Sender: TObject);
begin
  mmoTripNotes.Lines.Clear;
  mmoTripNotes.Lines.Add('Trip to ' + edtTripName.Text + ' created by ' + edtNameSetting.Text);
  mmoTripNotes.Lines.Add('');
  mmoTripNotes.Lines.Add('Going to ' + edtTripLocation.Text + ', ' + edtTripCity.Text);
  mmoTripNotes.Lines.Add('Departing on ' + DateToStr(dteTripDepart.Date) + ' at ' + TimeToStr(tmeTripDepart.Time));

  TabControl1.SetActiveTabWithTransition(TabNewTripNotes, TTabTransition.Slide, TTabTransitionDirection.Normal);
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
      TripLat := geoNewTrip.ResultLatitude; //FloatToStr(geoNewTrip.ResultLatitude);
      TripLong := geoNewTrip.ResultLongitude; //(geoNewTrip.ResultLongitude);
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
begin
  NewTripRequest.Resource := 'apis/[id]/new_trip.json';
  NewTripRequest.Resource := NewTripRequest.Resource.Replace('[id]', IntToStr(SignInUserID));
  NewTripRequest.Params.ParameterByName('email').Value := SignInEmail;
  NewTripRequest.Params.ParameterByName('token').Value := SignInToken;
  NewTripRequest.Params.ParameterByName('name').Value := edtTripName.Text;
  NewTripRequest.Params.ParameterByName('location').Value := edtTripLocation.Text + ' ' + edtTripCity.Text;
  NewTripRequest.Params.ParameterByName('notes').Value := mmoTripNotes.Text;
  NewTripRequest.Params.ParameterByName('lat').Value := FloatToStr(TripLat);
  NewTripRequest.Params.ParameterByName('long').Value := FloatToStr(TripLong);

  Departing := dteTripDepart.DateTime;
  ReplaceTime(Departing, tmeTripDepart.DateTime);
  Arriving := dteTripArrive.DateTime;
  ReplaceTime(Arriving, tmeTripArrive.DateTime);

  NewTripRequest.Params.ParameterByName('depart').Value := LocalDateTimeToGMT(Departing, False);
  NewTripRequest.Params.ParameterByName('arrive').Value := LocalDateTimeToGMT(Arriving, False);
  try
    NewTripRequest.Execute;
  except
    on E: Exception do begin
      TabControl1.SetActiveTabWithTransition(TabJoin, TTabTransition.None, TTabTransitionDirection.Reversed);
      cpNetworkError.Visible := True;
    end;
  end;
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

procedure THeaderFooterwithNavigation.btnBackToTripClick(Sender: TObject);
begin
  TabControl1.SetActiveTabWithTransition(TabNewTripDetails, TTabTransition.Slide, TTabTransitionDirection.Reversed);
end;

procedure THeaderFooterwithNavigation.btnBackTripClick(Sender: TObject);
begin
  TabControl1.SetActiveTabWithTransition(TabTrip, TTabTransition.Slide, TTabTransitionDirection.Reversed);
end;

procedure THeaderFooterwithNavigation.btnSaveSignInClick(Sender: TObject);
var
  ini: TIniFile;
begin
  if (edtSignIn.Text = '') or (edtPassword.Text = '') then
  begin
    cpSignUpSuccess.Visible := False;
    cpSignInError.Visible := True;
    edtSignIn.TextPrompt := 'TripTether login email.';
    edtPassword.TextPrompt := 'TripTether password.';
  end
  else
  begin
    SignInName := edtNameSetting.Text;

    ini := TIniFile.Create(System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath, 'tether.ini'));
    ini.WriteString('signin', 'email', edtSignIn.Text);
    ini.WriteString('signin', 'pw', edtPassword.Text);
    ini.WriteString('signin', 'name', SignInName);
    ini.Free;

    SignInRequest.Params.ParameterByName('email').Value := edtSignIn.Text;
    SignInRequest.Params.ParameterByName('pw').Value := edtPassword.Text;
    SignInRequest.Params.ParameterByName('name').Value := SignInName;
    try
      SignInRequest.Execute;
    except
      on E: Exception do begin
        TabControl1.SetActiveTabWithTransition(TabJoin, TTabTransition.None, TTabTransitionDirection.Reversed);
        cpNetworkError.Visible := True;
      end;
    end;
  end;
end;

procedure THeaderFooterwithNavigation.btnSendClick(Sender: TObject);
begin
  CheckIn(self, edtStatus.Text, 12);
  edtStatus.Text := '';
end;

procedure THeaderFooterwithNavigation.TabCheckGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  if EventInfo.GestureID = sgiLeft then
    btnMapClick(self);

  if EventInfo.GestureID = sgiRight then
    btnBackTripClick(self);
end;

procedure THeaderFooterwithNavigation.TabTripGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  if EventInfo.GestureID = sgiLeft then
    btnCheckInClick(self);

  if EventInfo.GestureID = sgiRight then
    btnQuitClick(self);
end;

procedure THeaderFooterwithNavigation.Timer1Timer(Sender: TObject);
var
  minute_diff: integer;
begin
  minute_diff := MinutesBetween(Now, StartTime);
  if (spCheckIn.Value = 1) or (minute_diff mod Trunc(spCheckIn.Value) = 0) then
  begin
    CheckIn(self, '', 1);
    //edtStatus.Text := '';
  end;
end;

procedure THeaderFooterwithNavigation.Timer2Timer(Sender: TObject);
begin
  if TabControl1.ActiveTab = TabMap then
    MapUpdate(self);
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
  TabControl1.SetActiveTabWithTransition(TabSettings, TTabTransition.Slide, TTabTransitionDirection.Normal);
end;

procedure THeaderFooterwithNavigation.btnSettingsDoneClick(Sender: TObject);
begin
  edtName.Text := edtNameSetting.Text;
  edtEMail.Text := edtEMailSetting.Text;
  TabControl1.SetActiveTabWithTransition(TabJoin, TTabTransition.Slide, TTabTransitionDirection.Reversed);
end;

procedure THeaderFooterwithNavigation.CheckIn(Sender: TObject; Status: string; StatusCount: integer);
begin
  if Status = '' then
  begin
    if SaveStatusCount > 0 then
    begin
      Status := SaveStatus;
      SaveStatusCount := SaveStatusCount - 1;
    end
    else
    begin
      SaveStatus := '';
      SaveStatusCount := 0;
    end;
  end
  else
  begin
    SaveStatus := Status;
    SaveStatusCount := StatusCount;
  end;

  if not CheckingIn then
  begin
    CheckingIn := True;

    CheckinRequest.Resource := 'apis/[id]/checkin.json';
    CheckinRequest.Resource := CheckinRequest.Resource.Replace('[id]', edtTripID.Text);
    CheckinRequest.Params.ParameterByName('email').Value := edtEMail.Text;
    CheckinRequest.Params.ParameterByName('pin').Value := UserPin;
    CheckinRequest.Params.ParameterByName('token').Value := TripToken;
    CheckinRequest.Params.ParameterByName('lat').Value := FloatToStrF(CurrentLat, ffGeneral, 10, 6);
    CheckinRequest.Params.ParameterByName('long').Value := FloatToStrF(CurrentLong, ffGeneral, 10, 6);
    CheckinRequest.Params.ParameterByName('status').Value := Status;
    try
      CheckinRequest.Execute;
    except
      on E: Exception do begin
        TabControl1.SetActiveTabWithTransition(TabJoin, TTabTransition.None, TTabTransitionDirection.Reversed);
        cpNetworkError.Visible := True;
      end;
    end;

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
    try
      MapRequest.Execute;
    except
      on E: Exception do begin
        TabControl1.SetActiveTabWithTransition(TabJoin, TTabTransition.None, TTabTransitionDirection.Reversed);
        cpNetworkError.Visible := True;
      end;
    end;

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

  mmoShareInfo.Lines.Clear;
  mmoShareInfo.Lines.Add('Hello, you have been invited on a trip by ' + SignInName);
  mmoShareInfo.Lines.Add('');
  mmoShareInfo.Lines.Add('The trip is planned to go to: ' + edtTripName.Text);
  mmoShareInfo.Lines.Add('');
  mmoShareInfo.Lines.Add('Use the TripTether app with these settings to join the trip:');
  mmoShareInfo.Lines.Add('   Trip ID: ' + IntToStr(NewTripID));
  mmoShareInfo.Lines.Add('   PIN: ' + NewTripPin);
  mmoShareInfo.Lines.Add('');

  ShowShareSheetAction1.TextMessage := mmoShareInfo.Text;

  btnJoinNewTrip.Visible := True;
  TabControl1.SetActiveTabWithTransition(TabNewTripShare, TTabTransition.Slide, TTabTransitionDirection.Normal);
end;

procedure THeaderFooterwithNavigation.MapName(Sender: TObject; SelectName: string; ZoomLevel: integer);
var
  Response: TJSONObject;
  Trip: TJSONObject;
  Name: string;
  Notes: string;
  Leader: string;
  Result: TJSONValue;
  Participant: TJSONObject;
  ParticipantID: integer;
  ParticipantName: string;
  ParticipantStatus: string;
  ParticipantLat: Double;
  ParticipantLong: Double;
  ParticipantCheckIn: string;
  ParticipantJoin: string;
  ParticipantQuit: string;
  Participants: TJSONArray;
  i: integer;
  Bounds: TBounds;
  MapLat: Double;
  MapLong: Double;
begin
  if assigned(CheckinResponse.JSONValue) then
  begin
    Response := CheckinResponse.JsonValue as TJSONObject;
    Trip := Response.Get('trip').JsonValue as TJSONObject;
    Name := Trip.Get('name').JsonValue.ToString.Replace('"', '');
    Notes := Trip.Get('notes').JsonValue.ToString.Replace('"', '');
    TripLat := StrToFloat(Trip.Get('dest_lat').JsonValue.ToString);
    TripLong := StrToFloat(Trip.Get('dest_long').JsonValue.ToString);
    Result := Trip.Get('result').JsonValue;

    MapLat := TripLat;
    MapLong := TripLong;
    Bounds := TBounds.Create;
    Bounds.NorthEast.Latitude := TripLat;
    Bounds.NorthEast.Longitude := TripLong;
    Bounds.SouthWest.Latitude := TripLat;
    Bounds.SouthWest.Longitude := TripLong;

    if (SelectName = 'Flag') then
    begin
      MapLat := TripLat;
      MapLong := TripLong;
    end
    else
    begin
      Participant := Trip.Get('participant').JsonValue as TJSONObject;
      ParticipantID := StrToInt(Participant.Get('participant_id').JsonValue.ToString);
      ParticipantName := Participant.Get('name').JsonValue.ToString.Replace('"', '');
      ParticipantLat := StrToFloat(Participant.Get('curr_lat').JsonValue.ToString);
      ParticipantLong := StrToFloat(Participant.Get('curr_long').JsonValue.ToString);
      if (ParticipantLat = 0) or (ParticipantLong = 0) then
      begin
        ParticipantLat := TripLat;
        ParticipantLong := TripLong + 0.001;
      end;
      ParticipantStatus := Participant.Get('status').JsonValue.ToString.Replace('"', '');
      ParticipantCheckIn := Participant.Get('checkin').JsonValue.ToString.Replace('"', '');
      Leader := Participant.Get('leader').JsonValue.ToString.Replace('"', '');

      if (abs(ParticipantLat) > 0.1) and (abs(ParticipantLong) > 0.1) then
      begin
        if (SelectName = 'Me') or (SelectName = ParticipantName) then
        begin
          MapLat := ParticipantLat;
          MapLong := ParticipantLong;
        end;

        if ParticipantLat > TripLat then
          Bounds.NorthEast.Latitude := ParticipantLat;
        if ParticipantLat < TripLat then
          Bounds.SouthWest.Latitude := ParticipantLat;
        if ParticipantLong > TripLong then
          Bounds.NorthEast.Longitude := ParticipantLong;
        if ParticipantLong < TripLong then
          Bounds.SouthWest.Longitude := ParticipantLong;
      end;
    end;

    if (SelectName <> 'Flag') and (SelectName <> 'Me') then
    begin
      Participants := Trip.Get('participants').JsonValue as TJSONArray;
      for i := 0 to Participants.Count - 1 do
      begin
        Participant := Participants.Items[i] as TJSONObject;
        ParticipantID := StrToInt(Participant.Get('participant_id').JsonValue.ToString);
        ParticipantName := Participant.Get('name').JsonValue.ToString.Replace('"', '');
        ParticipantLat := StrToFloat(Participant.Get('curr_lat').JsonValue.ToString);
        ParticipantLong := StrToFloat(Participant.Get('curr_long').JsonValue.ToString);
        if (ParticipantLat = 0) or (ParticipantLong = 0) then
        begin
          ParticipantLat := TripLat;
          ParticipantLong := TripLong + 0.001;
        end;
        ParticipantStatus := Participant.Get('status').JsonValue.ToString.Replace('"', '');
        ParticipantJoin := Participant.Get('join').JsonValue.ToString.Replace('"', '');
        ParticipantQuit := Participant.Get('quit').JsonValue.ToString.Replace('"', '');
        ParticipantCheckIn := Participant.Get('checkin').JsonValue.ToString.Replace('"', '');

        if SelectName = ParticipantName then
        begin
          MapLat := ParticipantLat;
          MapLong := ParticipantLong;
        end;

        if ParticipantLat > Bounds.NorthEast.Latitude then
          Bounds.NorthEast.Latitude := ParticipantLat;
        if ParticipantLat < Bounds.SouthWest.Latitude then
          Bounds.SouthWest.Latitude := ParticipantLat;
        if ParticipantLong > Bounds.NorthEast.Longitude then
          Bounds.NorthEast.Longitude := ParticipantLong;
        if ParticipantLong < Bounds.SouthWest.Longitude then
          Bounds.SouthWest.Longitude := ParticipantLong;
      end;
    end;

    if SelectName = 'Auto' then
    begin
      spFollow.IsPressed := True;

      //Bounds.NorthEast.Latitude := Bounds.NorthEast.Latitude + 0.002;
      //Bounds.NorthEast.Longitude := Bounds.NorthEast.Longitude + 0.002;
      //Bounds.SouthWest.Latitude := Bounds.SouthWest.Latitude - 0.002;
      //Bounds.SouthWest.Longitude := Bounds.SouthWest.Longitude - 0.002;
      mapTrip.MapZoomTo(Bounds);
    end
    else
    begin
      spFollow.IsPressed := False;

      mapTrip.MapPanTo(MapLat, MapLong);
      mapTrip.MapOptions.ZoomMap := ZoomLevel;
    end;
  end;

  if TabControl1.ActiveTab <> TabMap then
  begin
    Panel14.Visible := True;
    mapTrip.Visible := True;
    TabControl1.SetActiveTabWithTransition(TabMap, TTabTransition.Slide, TTabTransitionDirection.Normal);
  end;
end;

procedure THeaderFooterwithNavigation.MapUpdate(Sender: TObject);
var
  Response: TJSONObject;
  Trip: TJSONObject;
  Name: string;
  Notes: string;
  Leader: string;
  MyID: integer;
  Result: TJSONValue;
  Participant: TJSONObject;
  ParticipantID: integer;
  ParticipantName: string;
  ParticipantStatus: string;
  ParticipantLat: Double;
  ParticipantLong: Double;
  ParticipantCheckIn: string;
  ParticipantJoin: string;
  ParticipantQuit: string;
  ParticipantLocated: boolean;
  Participants: TJSONArray;
  LocalDate: TDateTime;
  CheckInDate: string;
  i: integer;
  Marker: TMarker;
  Bounds: TBounds;
begin
  if assigned(CheckinResponse.JSONValue) then
  begin
    Response := CheckinResponse.JsonValue as TJSONObject;
    Trip := Response.Get('trip').JsonValue as TJSONObject;
    Name := Trip.Get('name').JsonValue.ToString.Replace('"', '');
    Notes := Trip.Get('notes').JsonValue.ToString.Replace('"', '');
    TripLat := StrToFloat(Trip.Get('dest_lat').JsonValue.ToString);
    TripLong := StrToFloat(Trip.Get('dest_long').JsonValue.ToString);
    Result := Trip.Get('result').JsonValue;

    Participant := Trip.Get('participant').JsonValue as TJSONObject;
    ParticipantID := StrToInt(Participant.Get('participant_id').JsonValue.ToString);
    ParticipantName := Participant.Get('name').JsonValue.ToString.Replace('"', '');
    ParticipantLat := StrToFloat(Participant.Get('curr_lat').JsonValue.ToString);
    ParticipantLong := StrToFloat(Participant.Get('curr_long').JsonValue.ToString);
    ParticipantLocated := True;
    if (ParticipantLat = 0) or (ParticipantLong = 0) then
    begin
      ParticipantLat := TripLat;
      ParticipantLong := TripLong + 0.001;
      ParticipantLocated := False;
    end;
    ParticipantStatus := Participant.Get('status').JsonValue.ToString.Replace('"', '');
    ParticipantCheckIn := Participant.Get('checkin').JsonValue.ToString.Replace('"', '');
    Leader := Participant.Get('leader').JsonValue.ToString.Replace('"', '');

    MyID := ParticipantID;

    Participants := Trip.Get('participants').JsonValue as TJSONArray;
    mapTrip.Markers.Clear;

    Marker := mapTrip.Markers.Add;
    Marker.Latitude := TripLat;
    Marker.Longitude := TripLong;
    Marker.Draggable := false;
    Marker.Icon := 'http://www.triptether.com/images/flag_dest.png?t=1';
    if spTags.IsPressed then
    begin
      Marker.MapLabel.Text := '<b> ' + Name + ' </b>';
      Marker.MapLabel.Color := TAlphaColorRec.Red;
      Marker.MapLabel.BorderColor := TAlphaColorRec.Black;
      Marker.MapLabel.FontColor := TAlphaColorRec.White;
    end;
    mapTrip.CreateMapMarker(Marker);

    Bounds := TBounds.Create;
    Bounds.NorthEast.Latitude := TripLat;
    Bounds.NorthEast.Longitude := TripLong;
    Bounds.SouthWest.Latitude := TripLat;
    Bounds.SouthWest.Longitude := TripLong;

    Marker := mapTrip.Markers.Add;
    Marker.Latitude := ParticipantLat;
    Marker.Longitude := ParticipantLong;
    Marker.Draggable := false;
    if ParticipantLocated then
      Marker.Icon := 'http://www.triptether.com/images/participant.png?t=1'
    else
      Marker.Icon := 'http://www.triptether.com/images/participant6.png?t=1';
    if spTags.IsPressed then
    begin
      if (ParticipantStatus = '') or (ParticipantStatus = 'null') then
        Marker.MapLabel.Text := ParticipantName
      else
        Marker.MapLabel.Text := ParticipantName + ': ' + ParticipantStatus;
    end;
    mapTrip.CreateMapMarker(Marker);

    if ParticipantLat > TripLat then
      Bounds.NorthEast.Latitude := ParticipantLat;
    if ParticipantLat < TripLat then
      Bounds.SouthWest.Latitude := ParticipantLat;
    if ParticipantLong > TripLong then
      Bounds.NorthEast.Longitude := ParticipantLong;
    if ParticipantLong < TripLong then
      Bounds.SouthWest.Longitude := ParticipantLong;

    for i := 0 to Participants.Count - 1 do
    begin
      Participant := Participants.Items[i] as TJSONObject;
      ParticipantID := StrToInt(Participant.Get('participant_id').JsonValue.ToString);
      ParticipantName := Participant.Get('name').JsonValue.ToString.Replace('"', '');
      ParticipantLat := StrToFloat(Participant.Get('curr_lat').JsonValue.ToString);
      ParticipantLong := StrToFloat(Participant.Get('curr_long').JsonValue.ToString);
      ParticipantLocated := True;
      if (ParticipantLat = 0) or (ParticipantLong = 0) then
      begin
        ParticipantLat := TripLat;
        ParticipantLong := TripLong + 0.001;
        ParticipantLocated := False;
      end;
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

      //if (ParticipantLat = 0) and (ParticipantLong = 0) then
      //  Continue;

      if ParticipantID <> MyID then
      begin
        Marker := mapTrip.Markers.Add;
        Marker.Latitude := ParticipantLat;
        Marker.Longitude := ParticipantLong;
        Marker.Draggable := false;
        if ParticipantQuit = '' then
        begin
          if ParticipantLocated then
            Marker.Icon := 'http://www.triptether.com/images/participant3.png?t=1'
          else
            Marker.Icon := 'http://www.triptether.com/images/participant6.png?t=1';
        end
        else
          Marker.Icon := 'http://www.triptether.com/images/participantq.png?t=1';
          if spTags.IsPressed then
          begin
            if (ParticipantStatus = '') or (ParticipantStatus = 'null') then
            Marker.MapLabel.Text := ParticipantName
          else
            Marker.MapLabel.Text := ParticipantName + ': ' + ParticipantStatus;
          end;
        mapTrip.CreateMapMarker(Marker);
      end;

      if ParticipantLat > Bounds.NorthEast.Latitude then
        Bounds.NorthEast.Latitude := ParticipantLat;
      if ParticipantLat < Bounds.SouthWest.Latitude then
        Bounds.SouthWest.Latitude := ParticipantLat;
      if ParticipantLong > Bounds.NorthEast.Longitude then
        Bounds.NorthEast.Longitude := ParticipantLong;
      if ParticipantLong < Bounds.SouthWest.Longitude then
        Bounds.SouthWest.Longitude := ParticipantLong;
    end;

    if spFollow.IsPressed then
    begin
      if Participants.Count = 0 then
        mapTrip.MapPanTo(TripLat, TripLong)
      else
      begin
        //Bounds.NorthEast.Latitude := Bounds.NorthEast.Latitude + 0.002;
        //Bounds.NorthEast.Longitude := Bounds.NorthEast.Longitude + 0.002;
        //Bounds.SouthWest.Latitude := Bounds.SouthWest.Latitude - 0.002;
        //Bounds.SouthWest.Longitude := Bounds.SouthWest.Longitude - 0.002;
        mapTrip.MapZoomTo(Bounds);
      end;
    end;

    ParticipantsCount := Participants.Count;
  end;
end;

procedure THeaderFooterwithNavigation.StartUpdating(Sender: TObject);
begin
  Timer1.Enabled := True;
  Timer2.Enabled := True;
  LocationSensor1.Active := True;
  //LocationSensor1.Sensor.Start;
end;

procedure THeaderFooterwithNavigation.StopUpdating(Sender: TObject);
begin
  Timer1.Enabled := False;
  Timer2.Enabled := False;
  LocationSensor1.Active := False;
  //LocationSensor1.Sensor.Stop;
end;

end.
