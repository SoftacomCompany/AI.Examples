object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'AI'
  ClientHeight = 753
  ClientWidth = 1081
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Segoe UI'
  Font.Style = []
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 120
  TextHeight = 20
  object Splitter1: TSplitter
    Left = 0
    Top = 588
    Width = 1081
    Height = 3
    Cursor = crVSplit
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    ExplicitWidth = 1131
  end
  object Label5: TLabel
    Left = 510
    Top = 53
    Width = 188
    Height = 20
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Text Recognition Script Path:'
  end
  object pcPageControl: TPageControl
    Left = 0
    Top = 0
    Width = 1081
    Height = 588
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ActivePage = tsFaceRecognition
    Align = alClient
    TabOrder = 0
    object tsVirtualEnvironment: TTabSheet
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = '1. Python Environment'
      object pVirtualEnvironment: TPanel
        Left = 0
        Top = 0
        Width = 1073
        Height = 553
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object lVirtualEnvironment: TLabel
          Left = 10
          Top = 20
          Width = 303
          Height = 20
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Python or Anaconda Virtual Environment Path:'
        end
        object eVirtualEnvironment: TEdit
          Left = 10
          Top = 55
          Width = 451
          Height = 28
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          TabOrder = 0
          Text = 'C:\anaconda3\'
        end
        object btnSelectVirtualAnvironment: TBitBtn
          Left = 471
          Top = 54
          Width = 40
          Height = 39
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = '...'
          TabOrder = 1
          OnClick = btnSelectVirtualAnvironmentClick
        end
        object btnLoadPython: TButton
          Left = 10
          Top = 135
          Width = 181
          Height = 39
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Load Python'
          TabOrder = 2
          OnClick = btnLoadPythonClick
        end
      end
    end
    object tsPython1: TTabSheet
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = '2. Python && OpenCV'
      ImageIndex = 1
      object pPythonOpenCV: TPanel
        Left = 0
        Top = 0
        Width = 1073
        Height = 553
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          1073
          553)
        object Label1: TLabel
          Left = 10
          Top = 20
          Width = 131
          Height = 20
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'OpenCV Script Path:'
        end
        object lblPythonOpenCVEditor: TLabel
          Left = 10
          Top = 109
          Width = 129
          Height = 20
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Python Script Code:'
        end
        object Label2: TLabel
          Left = 635
          Top = 109
          Width = 150
          Height = 20
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Anchors = [akTop, akRight]
          Caption = 'Delphi Variables Trace:'
          ExplicitLeft = 683
        end
        object eOpenCVScript: TEdit
          Left = 10
          Top = 55
          Width = 621
          Height = 28
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          TabOrder = 0
          Text = 'C:\Work\EKON25\Python\opencv-tutorial-master\RecognizeCards.py'
        end
        object btnOpenCVScript: TBitBtn
          Left = 641
          Top = 53
          Width = 40
          Height = 38
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = '...'
          TabOrder = 1
          OnClick = btnOpenCVScriptClick
        end
        object btnRunPythonScript: TButton
          Left = 10
          Top = 509
          Width = 181
          Height = 39
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Anchors = [akLeft, akBottom]
          Caption = 'Run Python Script'
          TabOrder = 2
          OnClick = btnRunPythonScriptClick
        end
        object mPythonOpenCV: TSynEdit
          Left = 10
          Top = 150
          Width = 596
          Height = 349
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Anchors = [akLeft, akTop, akRight, akBottom]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -26
          Font.Name = 'Consolas'
          Font.Style = []
          Font.Quality = fqClearTypeNatural
          TabOrder = 3
          UseCodeFolding = False
          BookMarkOptions.LeftMargin = 4
          BookMarkOptions.Xoffset = 19
          Gutter.Font.Charset = DEFAULT_CHARSET
          Gutter.Font.Color = clWindowText
          Gutter.Font.Height = -20
          Gutter.Font.Name = 'Consolas'
          Gutter.Font.Style = []
          Gutter.LeftOffset = 25
          Gutter.RightOffset = 4
          Gutter.RightMargin = 4
          Gutter.ShowLineNumbers = True
          Gutter.Width = 48
          Highlighter = SynPythonSyn1
          Lines.Strings = (
            'import sys')
        end
        object btnSaveScriptOpenCV: TBitBtn
          Left = 201
          Top = 509
          Width = 180
          Height = 39
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Anchors = [akLeft, akBottom]
          Caption = 'Save Script to File'
          Enabled = False
          TabOrder = 4
          OnClick = btnSaveScriptOpenCVClick
        end
        object lbDelphiOpenCVResult: TListBox
          Left = 635
          Top = 150
          Width = 421
          Height = 151
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Anchors = [akTop, akRight]
          ItemHeight = 20
          TabOrder = 5
        end
        object btnCheckDelphiOpenCVResult: TButton
          Left = 635
          Top = 311
          Width = 231
          Height = 39
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Anchors = [akTop, akRight]
          Caption = 'Check Delphi Variables'
          TabOrder = 6
          OnClick = btnCheckDelphiOpenCVResultClick
        end
      end
    end
    object tsPythonRecognizeText: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '3. Python && Tensorflow && Keras && OpenCV'
      ImageIndex = 2
      object pPythonRecognizeText: TPanel
        Left = 0
        Top = 0
        Width = 1073
        Height = 553
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          1073
          553)
        object Label3: TLabel
          Left = 10
          Top = 20
          Width = 188
          Height = 20
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Text Recognition Script Path:'
        end
        object Label4: TLabel
          Left = 10
          Top = 109
          Width = 129
          Height = 20
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Python Script Code:'
        end
        object Label6: TLabel
          Left = 535
          Top = 26
          Width = 184
          Height = 20
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Image for Recognition Path:'
        end
        object eTextRecognitionScriptPath: TEdit
          Left = 10
          Top = 55
          Width = 401
          Height = 28
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          TabOrder = 0
          Text = 'd:\Work\EKON25\Python\opencv-keras\opencv_keras.py'
        end
        object btnOpenTextRecognitionScript: TBitBtn
          Left = 421
          Top = 50
          Width = 40
          Height = 39
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = '...'
          TabOrder = 1
          OnClick = btnOpenTextRecognitionScriptClick
        end
        object mKerasTextRecognize: TSynEdit
          Left = 10
          Top = 150
          Width = 1047
          Height = 349
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Anchors = [akLeft, akTop, akRight, akBottom]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -26
          Font.Name = 'Consolas'
          Font.Style = []
          Font.Quality = fqClearTypeNatural
          TabOrder = 2
          UseCodeFolding = False
          BookMarkOptions.LeftMargin = 4
          BookMarkOptions.Xoffset = 19
          Gutter.Font.Charset = DEFAULT_CHARSET
          Gutter.Font.Color = clWindowText
          Gutter.Font.Height = -20
          Gutter.Font.Name = 'Consolas'
          Gutter.Font.Style = []
          Gutter.LeftOffset = 25
          Gutter.RightOffset = 4
          Gutter.RightMargin = 4
          Gutter.ShowLineNumbers = True
          Gutter.Width = 48
          Highlighter = SynPythonSyn1
          Lines.Strings = (
            'import sys')
        end
        object btnRecognizeText: TButton
          Left = 10
          Top = 511
          Width = 181
          Height = 38
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Anchors = [akLeft, akBottom]
          Caption = 'Recognize Text'
          TabOrder = 3
          OnClick = btnRecognizeTextClick
        end
        object eRecognizedText: TEdit
          Left = 201
          Top = 516
          Width = 402
          Height = 28
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Anchors = [akLeft, akBottom]
          TabOrder = 4
        end
        object eImageForRecognitionPath: TEdit
          Left = 535
          Top = 55
          Width = 401
          Height = 28
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          TabOrder = 5
          Text = 'd:\Work\EKON25\Images\ekon25.png'
        end
        object btnOpenImageForRecognition: TBitBtn
          Left = 946
          Top = 50
          Width = 40
          Height = 39
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = '...'
          TabOrder = 6
          OnClick = btnOpenImageForRecognitionClick
        end
      end
    end
    object tsDelphiOpenCV: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '4. Delphi && OpenCV'
      ImageIndex = 3
      object pDelphiOpenCV: TPanel
        Left = 0
        Top = 0
        Width = 1073
        Height = 553
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object btnDelphiOpenCVFindContours: TButton
          Left = 0
          Top = 11
          Width = 181
          Height = 39
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Find Contours'
          TabOrder = 0
          OnClick = btnDelphiOpenCVFindContoursClick
        end
      end
    end
    object tsFaceRecognition: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '5. Face Recognition'
      ImageIndex = 4
      object pFaceRecognition: TPanel
        Left = 0
        Top = 0
        Width = 1073
        Height = 553
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          1073
          553)
        object Label7: TLabel
          Left = 10
          Top = 20
          Width = 190
          Height = 20
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Face Recognition Script Path:'
        end
        object Label8: TLabel
          Left = 535
          Top = 21
          Width = 217
          Height = 20
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Image for Face Recognition Path:'
        end
        object Label9: TLabel
          Left = 10
          Top = 109
          Width = 129
          Height = 20
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Python Script Code:'
        end
        object imgFaceRecognition: TImage
          Left = 242
          Top = 150
          Width = 813
          Height = 542
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akTop, akRight]
          Stretch = True
        end
        object eFaceRecognitionScriptPath: TEdit
          Left = 10
          Top = 55
          Width = 401
          Height = 28
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          TabOrder = 0
          Text = 'C:\Work\EKON25\Python\face-recognition\face_recognition.py'
        end
        object btnOpenFaceRecognitionScript: TBitBtn
          Left = 421
          Top = 50
          Width = 40
          Height = 39
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = '...'
          TabOrder = 1
          OnClick = btnOpenFaceRecognitionScriptClick
        end
        object eFaceRecognitionImagePath: TEdit
          Left = 535
          Top = 55
          Width = 401
          Height = 28
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          TabOrder = 2
          Text = 'C:\Work\EKON25\Images\people1.jpg'
        end
        object btnOPenFaceRecognitionImage: TBitBtn
          Left = 946
          Top = 50
          Width = 40
          Height = 39
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = '...'
          TabOrder = 3
          OnClick = btnOPenFaceRecognitionImageClick
        end
        object mFaceRecognitionScript: TSynEdit
          Left = 10
          Top = 150
          Width = 223
          Height = 349
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Anchors = [akLeft, akTop, akRight, akBottom]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -26
          Font.Name = 'Consolas'
          Font.Style = []
          Font.Quality = fqClearTypeNatural
          TabOrder = 4
          UseCodeFolding = False
          BookMarkOptions.LeftMargin = 4
          BookMarkOptions.Xoffset = 19
          Gutter.Font.Charset = DEFAULT_CHARSET
          Gutter.Font.Color = clWindowText
          Gutter.Font.Height = -20
          Gutter.Font.Name = 'Consolas'
          Gutter.Font.Style = []
          Gutter.LeftOffset = 25
          Gutter.RightOffset = 4
          Gutter.RightMargin = 4
          Gutter.ShowLineNumbers = True
          Gutter.Width = 48
          Highlighter = SynPythonSyn1
          Lines.Strings = (
            'import sys')
        end
        object btnRecognizeFaces: TButton
          Left = 10
          Top = 507
          Width = 181
          Height = 38
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Anchors = [akLeft, akBottom]
          Caption = 'Recognize Faces'
          TabOrder = 5
          OnClick = btnRecognizeFacesClick
        end
      end
    end
  end
  object pcAppConsoles: TPageControl
    Left = 0
    Top = 591
    Width = 1081
    Height = 162
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ActivePage = tsPythonConsole
    Align = alBottom
    TabOrder = 1
    object tsAppConsole: TTabSheet
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'App Console'
      object pConsole: TPanel
        Left = 0
        Top = 0
        Width = 1073
        Height = 127
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object lbAppConsole: TListBox
          Left = 0
          Top = 0
          Width = 1073
          Height = 127
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alClient
          ItemHeight = 20
          TabOrder = 0
        end
      end
    end
    object tsPythonConsole: TTabSheet
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Python Console'
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1073
        Height = 127
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object mPythonConsole: TMemo
          Left = 0
          Top = 0
          Width = 1073
          Height = 127
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alClient
          ScrollBars = ssBoth
          TabOrder = 0
        end
      end
    end
  end
  object fodSlectFolderDialog: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = [fdoPickFolders]
    Left = 644
    Top = 55
  end
  object PythonEngine1: TPythonEngine
    AutoLoad = False
    DllName = 'python38.dll'
    DllPath = 'C:\anaconda3\'
    APIVersion = 1013
    RegVersion = '3.8'
    UseLastKnownVersion = False
    VenvPythonExe = 'C:\anaconda3\python.exe'
    InitScript.Strings = (
      'import sys'
      'print ("Python Dll: ", sys.version)'
      'print (sys.copyright)'
      'print')
    IO = PythonGUIInputOutput1
    Left = 648
    Top = 176
  end
  object PythonGUIInputOutput1: TPythonGUIInputOutput
    UnicodeIO = True
    RawOutput = False
    Output = mPythonConsole
    Left = 648
    Top = 248
  end
  object fodFileOpenDialog: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 644
    Top = 119
  end
  object SynPythonSyn1: TSynPythonSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    Left = 812
    Top = 167
  end
  object pdvAmountOfFoundCards: TPythonDelphiVar
    Engine = PythonEngine1
    Module = '__main__'
    VarName = 'amountoffoundcards'
    Left = 644
    Top = 319
  end
  object pdvCardContours: TPythonDelphiVar
    Engine = PythonEngine1
    Module = '__main__'
    VarName = 'card_contours'
    Left = 644
    Top = 391
  end
  object pmOpenCV: TPythonModule
    Engine = PythonEngine1
    OnInitialization = pmOpenCVInitialization
    ModuleName = 'opencv_demo_Delphi_module'
    Errors = <>
    Left = 780
    Top = 319
  end
  object pdvKerasImageRecognitionImagePath: TPythonDelphiVar
    Engine = PythonEngine1
    Module = '__main__'
    VarName = 'image_path'
    OnGetData = pdvKerasImageRecognitionImagePathGetData
    Left = 332
    Top = 378
  end
  object pdvKerasRecognizedText: TPythonDelphiVar
    Engine = PythonEngine1
    Module = '__main__'
    VarName = 'keras_recognized_text'
    Left = 334
    Top = 319
  end
  object pdvFaceRecognitionImagePath: TPythonDelphiVar
    Engine = PythonEngine1
    Module = '__main__'
    VarName = 'face_recognition_image_path'
    Left = 948
    Top = 319
  end
  object pdvRecognizedFaces: TPythonDelphiVar
    Engine = PythonEngine1
    Module = '__main__'
    VarName = 'recognized_images'
    Left = 948
    Top = 391
  end
end
