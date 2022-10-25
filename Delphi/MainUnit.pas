unit MainUnit;

{$DEFINE VM}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, PythonEngine, Vcl.PythonGUIInputOutput, PythonVersions, VarPyth,
  SynEditHighlighter, SynEditCodeFolding, SynHighlighterPython, jpeg,

{$IFNDEF VM}
  // Delphi-OpenCV.
  ocv.highgui_c,
  ocv.core_c,
  ocv.core.types_c,
  ocv.imgproc_c,
  ocv.imgproc.types_c,
{$ENDIF}

  // SynEdit for Python source code highlight.
  SynEdit;

type
  TfrmMain = class(TForm)
    pcPageControl: TPageControl;
    tsVirtualEnvironment: TTabSheet;
    tsPython1: TTabSheet;
    pVirtualEnvironment: TPanel;
    lVirtualEnvironment: TLabel;
    eVirtualEnvironment: TEdit;
    btnSelectVirtualAnvironment: TBitBtn;
    fodSlectFolderDialog: TFileOpenDialog;
    PythonEngine1: TPythonEngine;
    btnLoadPython: TButton;
    pcAppConsoles: TPageControl;
    Splitter1: TSplitter;
    tsAppConsole: TTabSheet;
    pConsole: TPanel;
    PythonGUIInputOutput1: TPythonGUIInputOutput;
    tsPythonConsole: TTabSheet;
    Panel1: TPanel;
    mPythonConsole: TMemo;
    lbAppConsole: TListBox;
    pPythonOpenCV: TPanel;
    Label1: TLabel;
    eOpenCVScript: TEdit;
    btnOpenCVScript: TBitBtn;
    btnRunPythonScript: TButton;
    fodFileOpenDialog: TFileOpenDialog;
    mPythonOpenCV: TSynEdit;
    SynPythonSyn1: TSynPythonSyn;
    btnSaveScriptOpenCV: TBitBtn;
    lblPythonOpenCVEditor: TLabel;
    lbDelphiOpenCVResult: TListBox;
    btnCheckDelphiOpenCVResult: TButton;
    pdvAmountOfFoundCards: TPythonDelphiVar;
    Label2: TLabel;
    pdvCardContours: TPythonDelphiVar;
    pmOpenCV: TPythonModule;
    tsPythonRecognizeText: TTabSheet;
    pPythonRecognizeText: TPanel;
    Label3: TLabel;
    eTextRecognitionScriptPath: TEdit;
    btnOpenTextRecognitionScript: TBitBtn;
    mKerasTextRecognize: TSynEdit;
    Label4: TLabel;
    Label5: TLabel;
    btnRecognizeText: TButton;
    Label6: TLabel;
    eRecognizedText: TEdit;
    pdvKerasImageRecognitionImagePath: TPythonDelphiVar;
    pdvKerasRecognizedText: TPythonDelphiVar;
    eImageForRecognitionPath: TEdit;
    btnOpenImageForRecognition: TBitBtn;
    tsDelphiOpenCV: TTabSheet;
    pDelphiOpenCV: TPanel;
    btnDelphiOpenCVFindContours: TButton;
    tsFaceRecognition: TTabSheet;
    pFaceRecognition: TPanel;
    Label7: TLabel;
    eFaceRecognitionScriptPath: TEdit;
    btnOpenFaceRecognitionScript: TBitBtn;
    Label8: TLabel;
    eFaceRecognitionImagePath: TEdit;
    btnOPenFaceRecognitionImage: TBitBtn;
    Label9: TLabel;
    mFaceRecognitionScript: TSynEdit;
    btnRecognizeFaces: TButton;
    imgFaceRecognition: TImage;
    pdvFaceRecognitionImagePath: TPythonDelphiVar;
    pdvRecognizedFaces: TPythonDelphiVar;
    procedure btnSelectVirtualAnvironmentClick(Sender: TObject);
    procedure btnLoadPythonClick(Sender: TObject);
    procedure btnOpenCVScriptClick(Sender: TObject);
    procedure btnRunPythonScriptClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSaveScriptOpenCVClick(Sender: TObject);
    procedure btnCheckDelphiOpenCVResultClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure pmOpenCVInitialization(Sender: TObject);
    procedure btnOpenTextRecognitionScriptClick(Sender: TObject);
    procedure btnOpenImageForRecognitionClick(Sender: TObject);
    procedure btnRecognizeTextClick(Sender: TObject);
    procedure pdvKerasImageRecognitionImagePathGetData(Sender: TObject;
      var Data: Variant);
    procedure btnDelphiOpenCVFindContoursClick(Sender: TObject);
    procedure btnOpenFaceRecognitionScriptClick(Sender: TObject);
    procedure btnOPenFaceRecognitionImageClick(Sender: TObject);
    procedure btnRecognizeFacesClick(Sender: TObject);
    procedure pbFaceRecognitionPaint(Sender: TObject);
  private
    { Private declarations }
    procedure AddHorizontalScrollBarForListBox(ListBox: TListBox);
  public
    { Public declarations }
    IsPythonLoaded: Boolean;
    procedure AppConsole(ConsoleMessage: String);

    // Python routines.
    procedure PythonTest;
  end;

  // For Python4Delphi
  function  get_array_from_Delphi_code( self, args : PPyObject ) : PPyObject; cdecl;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

// Python4Delphi routines

// Example from Python4Delphi demos.
function  get_array_from_Delphi_code( self, args : PPyObject ) : PPyObject; cdecl;
const
  x : double = 2.7172;
  y : double = 3.14159;
  z : double = 1.2e-12;
begin
  with GetPythonEngine do
    Result := Py_BuildValue('(iiddid)', 42, 815, x, y, 4711, z);
end;

procedure TfrmMain.AddHorizontalScrollBarForListBox(ListBox: TListBox);
var
  i, w, MaxWidth: Integer;
begin
  MaxWidth := 0;
  for i := 0 to ListBox.Items.Count - 1 do
    with ListBox do
    begin
      w := Canvas.TextWidth(Items[i]);
      if w > MaxWidth then
        MaxWidth := w;
    end;
  SendMessage(ListBox.Handle, LB_SETHORIZONTALEXTENT, MaxWidth + GetSystemMetrics(SM_CXFRAME), 0);
end;

procedure TfrmMain.AppConsole(ConsoleMessage: String);
begin
  lbAppConsole.Items.Add(ConsoleMessage);
  lbAppConsole.ItemIndex := lbAppConsole.Items.Count - 1;
end;

procedure TfrmMain.btnSaveScriptOpenCVClick(Sender: TObject);
begin
  if eOpenCVScript.Text <> '' then
    mPythonOpenCV.Lines.SaveToFile(eOpenCVScript.Text);
end;

procedure TfrmMain.btnSelectVirtualAnvironmentClick(Sender: TObject);
begin
  if FileExists(eVirtualEnvironment.Text) then
    fodSlectFolderDialog.DefaultFolder := ExtractFilePath(eVirtualEnvironment.Text);

  if fodSlectFolderDialog.Execute then
    eVirtualEnvironment.Text := fodSlectFolderDialog.FileName;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  IsPythonLoaded := false;
  pcPageControl.ActivePageIndex := 0;
  pcAppConsoles.ActivePageIndex := 0;

  //  Use MaskFPUExceptions(true) if you intend to use mathematical python package like numpy.
  MaskFPUExceptions(true);

  // My local Python and Anaconda local paths.
{$IFNDEF VM}
  eVirtualEnvironment.Text := 'C:\Users\User\AppData\Local\Programs\Python\Python36';
{$ELSE}
  eVirtualEnvironment.Text := 'C:\anaconda3\';
{$ENDIF}

  if FileExists(eOpenCVScript.Text) then
  begin
    mPythonOpenCV.Lines.LoadFromFile(eOpenCVScript.Text);
    btnSaveScriptOpenCV.Enabled := true;
  end;

  if FileExists(eTextRecognitionScriptPath.Text) then
    mKerasTextRecognize.Lines.LoadFromFile(eTextRecognitionScriptPath.Text);

  if FileExists(eFaceRecognitionScriptPath.Text) then
    mFaceRecognitionScript.Lines.LoadFromFile(eFaceRecognitionScriptPath.Text);

  if FileExists(eFaceRecognitionImagePath.Text) then
      imgFaceRecognition.Picture.LoadFromFile(eFaceRecognitionImagePath.Text);
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  pdvAmountOfFoundCards.Finalize;
  pdvCardContours.Finalize;
  pdvKerasRecognizedText.Finalize;
  pdvKerasImageRecognitionImagePath.Finalize;
end;

procedure TfrmMain.pbFaceRecognitionPaint(Sender: TObject);
begin
  {pbFaceRecognition.Canvas.Draw(0, 0, imgFaceRecognition);

  PaintBox1.Canvas.Brush.Style := bsClear;
  PaintBox1.Canvas.Pen.Color := clRed;
  PaintBox1.Canvas.Rectangle(PaintBox1.ClientRect);}
end;

procedure TfrmMain.pdvKerasImageRecognitionImagePathGetData(Sender: TObject;
  var Data: Variant);
begin
  Data := eImageForRecognitionPath.Text;
end;

procedure TfrmMain.pmOpenCVInitialization(Sender: TObject);
begin
  // In a module initialization, we just need to add our new methods.
  with Sender as TPythonModule do
    AddMethod('get_array_from_Delphi_code', get_array_from_Delphi_code, 'get_array_from_Delphi_code');
end;

procedure TfrmMain.btnCheckDelphiOpenCVResultClick(Sender: TObject);
begin
  lbDelphiOpenCVResult.Items.Clear;
  lbDelphiOpenCVResult.Items.Add('Value of Python amountoffoundcards: ' + pdvAmountOfFoundCards.ValueAsString);
  lbDelphiOpenCVResult.Items.Add('Value of card_contours array: ' + pdvCardContours.ValueAsString);

  AddHorizontalScrollBarForListBox(lbDelphiOpenCVResult);
end;

procedure TfrmMain.btnDelphiOpenCVFindContoursClick(Sender: TObject);
{$IFNDEF VM}
var
  CardsImage: pIplImage;
  ThresholdImage: pIplImage;
  CardsImageGray: pIplImage;
  ImageContours: pCvSeq;
  MemoryStorage: pCvMemStorage;
  color_ext, color_hole: TCvScalar;
  ContourRect: TCvRect;
  X1Y1Point, X2Y2Point: TCvPoint;
  RectColor: TCvScalar;
  i: Integer;
{$ENDIF}
begin
{$IFNDEF VM}
  // This example is based on the Delphi-OpenCV demo.

  CardsImage := nil;
  CardsImageGray := nil;
  ThresholdImage := nil;
  ImageContours := nil;
  MemoryStorage := nil;
  i := 1;

  try
    // Load image from file. We will search contours on this image.
    CardsImage := cvLoadImage('D:\Work\EKON25\Images\Cards.JPG', CV_LOAD_IMAGE_UNCHANGED);
    if Assigned(CardsImage) then
    begin
      // We will show images inside OpenCV forms/windows.
      cvNamedWindow('Source image', CV_WINDOW_AUTOSIZE);
      cvNamedWindow('Gray image', CV_WINDOW_AUTOSIZE);
      cvNamedWindow('Threshold image', CV_WINDOW_AUTOSIZE);
      cvNamedWindow('Contour image', CV_WINDOW_AUTOSIZE);
      // Show windows with initial image.
      cvShowImage('Source image', CardsImage);
      // Let's transform initial image to the BW image.
      CardsImageGray := cvCreateImage(cvSize(CardsImage^.width, CardsImage^.height),
        IPL_DEPTH_8U, 1);
      // Create Threshold image.
      ThresholdImage := cvCreateImage(cvSize(CardsImage^.width, CardsImage^.height), IPL_DEPTH_8U, 1);
      cvCvtColor(CardsImage, CardsImageGray, CV_BGR2GRAY);
      cvShowImage('Gray image', CardsImageGray);
      MemoryStorage := cvCreateMemStorage(0);
      cvThreshold(CardsImageGray, ThresholdImage, 215, 255, CV_THRESH_BINARY);
      cvShowImage('Threshold image', ThresholdImage);
      ImageContours := AllocMem(SizeOf(TCvSeq));
      cvClearMemStorage(MemoryStorage);

      cvFindContours(ThresholdImage, MemoryStorage, @ImageContours,
        SizeOf(TCvContour), CV_RETR_EXTERNAL, CV_CHAIN_APPROX_SIMPLE, cvPoint(0, 0));
      AppConsole('Total amount of found contours: ' + IntToStr(ImageContours^.total));

      color_ext := CV_RGB(100, 200, 0);
      color_hole := CV_RGB(200, 100, 0);

      // Setup selection color.
      RectColor.val[0] := 255;
      RectColor.val[1] := 255;
      RectColor.val[2] := 0;

      // Write to the app console information about the contours.
      while Assigned(ImageContours) do
      begin
        ContourRect := cvBoundingRect(ImageContours);
        if (ContourRect.width > 20) and (ContourRect.height > 30) then
        begin
          X1Y1Point.x := ContourRect.x;
          X1Y1Point.y := ContourRect.y;
          X2Y2Point.x := ContourRect.x + ContourRect.width;
          X2Y2Point.y := ContourRect.y + ContourRect.height;

          AppConsole(Format('Contour # %d found: x1 = %d, y1 = %d, x2 = %d, y2 = %d',
            [i, X1Y1Point.x, X1Y1Point.y, X2Y2Point.x, X2Y2Point.y]));

          cvRectangle(CardsImage, X1Y1Point, X2Y2Point, RectColor, 2);

          inc(i);
        end;
        ImageContours := ImageContours^.h_next;
      end;

      // Show the image with contours.
      cvShowImage('Contour image', CardsImage);
      cvWaitKey(0);
      cvReleaseImage(CardsImage);
      cvReleaseImage(CardsImageGray);
      cvReleaseImage(ThresholdImage);
      ImageContours := nil;
      MemoryStorage := nil;
      cvDestroyAllWindows;
    end;
  except
    on E: Exception do
      WriteLn(E.ClassName, ': ', E.Message);
  end;
{$ENDIF}
end;

procedure TfrmMain.btnLoadPythonClick(Sender: TObject);
var
  Version: TPythonVersion;
  PythonEngine: TPythonEngine;
begin
  try
    if PythonOK then
    begin
      AppConsole('Python engine already loaded ');
      Exit;
    end;

    if not DirectoryExists(eVirtualEnvironment.Text) then
    begin
      ShowMessage('Please, select correct Python virtual environment directory');
      Exit;
    end;

    {if GetRegisteredPythonVersion('3.6.13', Version) then
    begin
      AppConsole('Python version is: ' + Version.SysVersion);
    end else}
    if PythonVersionFromPath(eVirtualEnvironment.Text, Version) then
    begin
        AppConsole('Python version found: ' + Version.SysVersion + ', architecture = ' + Version.SysArchitecture);
        Version.AssignTo(PythonEngine1);
        PythonEngine1.SetPythonHome(eVirtualEnvironment.Text);
        PythonEngine1.SetPythonHome(PythonEngine1.DllPath);

        PythonEngine1.LoadDll;
        AppConsole('Python was successfully loaded');
        AppConsole('Perform Python test');
        PythonTest;
        IsPythonLoaded := true;
    end
    else
      AppConsole('System cannot detect Python version in the selected directory. Check 32- and 64-bit installations');
  except
    on E: Exception do
      AppConsole('Error: ' + E.Message);
  end;
end;

procedure TfrmMain.PythonTest;
begin
    PythonEngine1.ExecString('print(2+2)');
end;

procedure TfrmMain.btnOpenCVScriptClick(Sender: TObject);
begin
  if FileExists(eOpenCVScript.Text) then
    fodFileOpenDialog.DefaultFolder := ExtractFilePath(eOpenCVScript.Text);

  if fodFileOpenDialog.Execute then
  begin
    eOpenCVScript.Text := fodFileOpenDialog.FileName;
    mPythonOpenCV.Lines.LoadFromFile(fodFileOpenDialog.FileName);
    btnSaveScriptOpenCV.Enabled := true;
  end;
end;

procedure TfrmMain.btnOPenFaceRecognitionImageClick(Sender: TObject);
begin
  if FileExists(eFaceRecognitionImagePath.Text) then
    fodFileOpenDialog.DefaultFolder := ExtractFilePath(eFaceRecognitionImagePath.Text);

  if fodFileOpenDialog.Execute then
  begin
    eFaceRecognitionImagePath.Text := fodFileOpenDialog.FileName;
    imgFaceRecognition.Picture.LoadFromFile(eFaceRecognitionImagePath.Text);
   end;
end;

procedure TfrmMain.btnOpenFaceRecognitionScriptClick(Sender: TObject);
begin
  if FileExists(eFaceRecognitionScriptPath.Text) then
    fodFileOpenDialog.DefaultFolder := ExtractFilePath(eFaceRecognitionScriptPath.Text);

  if fodFileOpenDialog.Execute then
  begin
    eFaceRecognitionScriptPath.Text := fodFileOpenDialog.FileName;
    mFaceRecognitionScript.Lines.LoadFromFile(fodFileOpenDialog.FileName);
  end;
end;

procedure TfrmMain.btnOpenImageForRecognitionClick(Sender: TObject);
begin
  if FileExists(eImageForRecognitionPath.Text) then
    fodFileOpenDialog.DefaultFolder := ExtractFilePath(eImageForRecognitionPath.Text);

  if fodFileOpenDialog.Execute then
    eImageForRecognitionPath.Text := fodFileOpenDialog.FileName;
end;

procedure TfrmMain.btnOpenTextRecognitionScriptClick(Sender: TObject);
begin
  if FileExists(eTextRecognitionScriptPath.Text) then
    fodFileOpenDialog.DefaultFolder := ExtractFilePath(eTextRecognitionScriptPath.Text);

  if fodFileOpenDialog.Execute then
  begin
    eTextRecognitionScriptPath.Text := fodFileOpenDialog.FileName;
    mKerasTextRecognize.Lines.LoadFromFile(fodFileOpenDialog.FileName);
  end;
end;

procedure TfrmMain.btnRecognizeFacesClick(Sender: TObject);
var
  FaceImageCoordinates: array of array of Integer;
  i, j: Integer;
  jpg: TJpegImage;
  bmp: TBitmap;
begin
  if not IsPythonLoaded then
    btnLoadPython.Click;

  if not FileExists(eFaceRecognitionScriptPath.Text) then
  begin
    ShowMessage('Please, select correct Python script file path');
    Exit;
  end;

  try
    pdvFaceRecognitionImagePath.Value := eFaceRecognitionImagePath.Text;

    // Execute Python script.
    PythonEngine1.ExecStrings(mFaceRecognitionScript.Lines);

    if not VarIsNull(pdvRecognizedFaces.Value) then
    begin
      FaceImageCoordinates := pdvRecognizedFaces.Value;
      AppConsole('We found ' + IntToStr(Length(FaceImageCoordinates)) + ' faces');

      jpg := TJpegImage.Create;
      bmp := TBitmap.Create;

      try
        jpg.LoadFromFile(eFaceRecognitionImagePath.Text);
        bmp.Assign(jpg);

        bmp.Canvas.Brush.Style := TBrushStyle.bsClear;
        bmp.Canvas.Pen.Color := clLime;
        bmp.Canvas.Pen.Width := 10;

        i := VarArrayLowBound(pdvRecognizedFaces.Value, 1);
        j := VarArrayHighBound(pdvRecognizedFaces.Value, 1);

        while i <= j do
        begin
          bmp.Canvas.Rectangle(StrToInt(VarToStr(pdvRecognizedFaces.Value[i][1])),
            StrToInt(VarToStr(pdvRecognizedFaces.Value[i][0])),
            StrToInt(VarToStr(pdvRecognizedFaces.Value[i][3])),
            StrToInt(VarToStr(pdvRecognizedFaces.Value[i][2])));

          Inc(i);
        end;

        imgFaceRecognition.Picture.Assign(bmp);
      finally
        bmp.free;
        jpg.free;
      end;
    end;
  except
    on E: Exception do
      AppConsole('Error: ' + E.Message);
  end;
end;

procedure TfrmMain.btnRecognizeTextClick(Sender: TObject);
begin
  if not IsPythonLoaded then
    btnLoadPython.Click;

  if not FileExists(eTextRecognitionScriptPath.Text) then
  begin
    ShowMessage('Please, select correct Python script file path');
    Exit;
  end;

  try
    // Execute Python script.
    PythonEngine1.ExecStrings(mKerasTextRecognize.Lines);
  except
    on E: Exception do
      AppConsole('Error: ' + E.Message);
  end;

  eRecognizedText.Text := pdvKerasRecognizedText.ValueAsString;
end;

procedure TfrmMain.btnRunPythonScriptClick(Sender: TObject);
var
  Result : PPyObject;
  Script: TStringList;
begin
  if not IsPythonLoaded then
    btnLoadPython.Click;

  if not FileExists(eOpenCVScript.Text) then
  begin
    ShowMessage('Please, select correct Python script file path');
    Exit;
  end;

  try
    // Evaluate Python script.
    //Result := PythonEngine1.EvalStrings(mPythonOpenCV.Lines);
    {Script := TStringList.Create;
    try
      Script.Add('import sys');
      //Script.Add('print(2+2)');
      PythonEngine1.EvalStrings(Script);
    finally
      FreeAndNil(Script);
    end;

    if Assigned(Result) then
    begin
      AppConsole(Format('Eval: %s',[PythonEngine1.PyObjectAsString(Result)]));
      PythonEngine1.Py_DECREF(Result);
    end
    else
      AppConsole('Could not evaluate the script');}


    {var np := Import('numpy');
    var np_array : Variant := np.array(VarPythonCreate([1,2,3,4,5,6,7,8,9,10]));
    if np_array = Null then
      Exit;}

    // Execute Python script.
    PythonEngine1.ExecStrings(mPythonOpenCV.Lines);
  except
    on E: Exception do
      AppConsole('Error: ' + E.Message);
  end;
end;

initialization
  MaskFPUExceptions(True);
  ReportMemoryLeaksOnShutdown := False;

end.
