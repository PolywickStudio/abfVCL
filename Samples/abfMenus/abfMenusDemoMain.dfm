ÿ
 TFRMMENUSDEMOMAIN 08  TPF0TfrmMenusDemoMainfrmMenusDemoMainLeftTop BorderIconsbiSystemMenu
biMinimize BorderStylebsSingleCaptionabfMenus DemoClientHeightuClientWidthx
Font.ColorclWindowTextFont.Heightô	Font.NameArial
Font.Style 	PopupMenupmMainPositionpoScreenCenterScaledShowHint	OnCreate
FormCreateOnResize
FormResizePixelsPerInch`
TextHeight 	TGroupBoxgrpItemLeftTopWidth1HeightlCaptionTabfSystemMenuItem
Font.ColorclWindowTextFont.Heightô	Font.NameArial
Font.StylefsBold 
ParentFontTabOrder  TImageimgItemTagLeft
TopWidthHeightHintabfSystemMenuItemAutoSize	Picture.Data
4  TBitmap(  BM(      f   (                             ÿÿÿ  ÿÿ ÿ ÿ   ÿ ÿÿ   ÿ  ÿ             ÀÀÀ  »»»»»»»»»»»»»»pp
ªªªªªªªªªªªª«»»
ªªªªªªªªªªªª«
ª
 ªªªªªªªªªªª«
ª
 ·wwwwwzªªªª«
 
 °     zªªªª«
 
 ° zªªªª«
 
 °     zª:ªª«
 
 ¸z3:ªª«
 
 ¸   3333ª«
 
 ¸z3:£ª«
 
 °     zª:£ª«
 
 ° zªª£ª«
 
 °     zªª£ª«
 
 »»»»»»zªª£ª«
 
 «
 
  «
 
  »»»»³»«
 
 wwwwww{«
 
     °     {«
 
ªªªªª° {«
 
©ªªª°     {«
ª
ªª»»»»»»z«
©
ªªªªªªªªª«

©ªªªªªªªªª«

©ªªªªªªªªªª«

ªªªªªªªªªªªª«
©              
ª  OnClickComponentIconClick  TLabel
lbItemInfoLeft,TopWidthÿ Height´ AutoSizeCaption¿  TabfSystemMenuItem is a non-visual component that adds a menu item into the system menu of any window, form or application. The menu item can be taken from any TMainManu or TPopupMenu components are present on the form. The component adds item to the form's system menu by default. Set the InsertToAppMenu property True to add a menu item to the system menu of the application. Use public Handle property to specify any other window by its handle.
Font.ColorclWindowTextFont.Heightô	Font.NameArial
Font.Style 
ParentFontWordWrap	  	TCheckBoxchbItemInsertedTagLeftTopHWidthdHeightCaptionInserted
Font.ColorclWindowTextFont.Heightô	Font.NameArial
Font.Style 
ParentFontTabOrderOnClickchbInsertedClick  TRadioGroupgrpItemTargetTagLeft
TopÂ WidthHeightrCaption	Insert to
Font.ColorclWindowTextFont.Heightô	Font.NameArial
Font.Style 	ItemIndex Items.StringsForm's system menuApplication's system menuSystem menu of 
ParentFontTabOrder OnClickgrpTargetClick  	TComboBoxcmbItemTargetTagLeft TopWidth Height
Font.ColorclWindowTextFont.Heightô	Font.NameArial
Font.Style 
ItemHeight
ParentFontTabOrderOnClickcmbTargetClickOnEntercmbTargetEnter   	TGroupBoxgrpInserterLeftBTopWidth0HeightlCaptionTabfSystemMenuInserter
Font.ColorclWindowTextFont.Heightô	Font.NameArial
Font.StylefsBold 
ParentFontTabOrder TLabellbInserterInfoLeft,TopWidthÿ Height´ AutoSizeCaption~  TabfSystemMenuInserter is a non-visual component that adds all items of some TPopupMenu component into the system menu of any window, form or application. The component adds items to the form's system menu by default. Set the InsertToAppMenu property True to add menu items to the system menu of the application. Use public Handle property to specify any other window by its handle.
Font.ColorclWindowTextFont.Heightô	Font.NameArial
Font.Style 
ParentFontWordWrap	  TImageimgInserterTagLeft
TopWidthHeightHintabfSystemMenuInserterAutoSize	Picture.Data
4  TBitmap(  BM(      f   (                             ÿÿÿ  ÿÿ ÿ ÿ   ÿ ÿÿ   ÿ  ÿ             ÀÀÀ  »»»»»»»»»»»»»»pp
ªªªªªªªªªªªª«»»
ªªªªªªªªªªªª«
ª
 ªªªªªªªªªªª«
ª
 ·wwwwwzªªªª«
 
 °     zªªªª«
 
 ° zªªªª«
 
 °     zª:ªª«
 
 ¸z3:ªª«
 
 ¸   3333ª«
 
 ¸z3:£ª«
 
 °     zª:£ª«
 
 ° zªª£ª«
 
 °     zªª£ª«
 
 »»»»»»»»»³»«
 
 ·wwwww{«
 
  °     {«
 
  ° {«
 
 °     {«
 
     ¸{«
 
ªªªªª¸    {«
 
©ªªª¸{«
ª
ªª°     {«
©
ªª° {«

©ªª°     {«

©ªªª»»»»»»z«

ªªªªªªªªªªªª«
©              
ª  OnClickComponentIconClick  TRadioGroupgrpInserterTargetTagLeft
TopÂ WidthHeightrCaption	Insert to
Font.ColorclWindowTextFont.Heightô	Font.NameArial
Font.Style 	ItemIndex Items.StringsForm's system menuApplication's system menuSystem menu of 
ParentFontTabOrder OnClickgrpTargetClick  	TCheckBoxchbInserterInsertedTagLeftTopHWidthdHeightCaptionInserted
Font.ColorclWindowTextFont.Heightô	Font.NameArial
Font.Style 
ParentFontState	cbCheckedTabOrderOnClickchbInsertedClick  	TComboBoxcmbInserterTargetTagLeft TopWidth Height
Font.ColorclWindowTextFont.Heightô	Font.NameArial
Font.Style 
ItemHeight
ParentFontTabOrderOnClickcmbTargetClickOnEntercmbTargetEnter   
TPopupMenupmMain 	TMenuItem
miAboutAppCaptionAbout...ShortCut OnClick
AboutClick  	TMenuItemmi1Caption-ShortCut   	TMenuItemmiExitCaptionCloseShortCuts  OnClick
CloseClick   
TPopupMenupmItemLeftØ Topd 	TMenuItemmiIt_NewItemCaptionNew menu itemShortCut OnClickMenuItemClick  	TMenuItemmiIt_1Caption-ShortCut    TabfSystemMenuItemabfSystemMenuItem1InsertedMenuItemmiIt_NewItemLeftô Topd  TabfSystemMenuItemabfSystemMenuItem2InsertedMenuItemmiIt_1PositionLeftTopd  
TPopupMenu
pmInserterLeftTopd 	TMenuItemmiIn_1Caption-ShortCut   	TMenuItem
miIn_AboutCaptionAbout application...ShortCut OnClick
AboutClick  	TMenuItemmiIn_WebCaptionwww.ABFsoftware.comShortCut OnClickWebClick  	TMenuItemmiIn_2Caption-ShortCut   	TMenuItemmiIn_SubCaptionSub menu exampleShortCut  	TMenuItem
miIn_Item1CaptionItem 1ShortCut OnClickMenuItemClick  	TMenuItem
miIn_Item2CaptionItem 2ShortCut OnClickMenuItemClick  	TMenuItem
miIn_Item3CaptionItem 3ShortCut OnClickMenuItemClick    TabfSystemMenuInserterabfSystemMenuInserter	PopupMenu
pmInserterPositionLeft2Topd   