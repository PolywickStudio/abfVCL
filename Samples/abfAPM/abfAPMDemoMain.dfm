�
 TFRMAPMDEMOMAIN 0�#  TPF0TfrmAPMDemoMainfrmAPMDemoMainLeftvTop^BorderIconsbiSystemMenu
biMinimize BorderStylebsSingleCaptionabfAPM DemoClientHeightuClientWidthxFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 	PopupMenupmMainPositionpoScreenCenterShowHint	OnCreate
FormCreateOnShowFormShowPixelsPerInch`
TextHeight 	TGroupBoxgrpSchedulerLeftBTopWidth0HeightlCaptionTabfAPMSchedulerFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTabOrder TLabellbSchedulerInfoLeft,TopWidth� Height� AutoSizeCaptionY  TabfAPMScheduler is a non-visual component that allows easily create APM oriented timers and schedulers, has two independent timers to control a suspending and resuming of the system. Also you can specify the APM events that will occur every day, week, month etc. Very useful in diagnostic, auto sleep/wake-up, and "long time working" programs. Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontWordWrap	  TImageimgSchedulerTagLeft
TopWidthHeightHintabfAPMSchedulerAutoSize	Picture.Data
B  TBitmap6  BM6      v   (               �                ���  �� � �   � ��   �  �        �   ��   � ��� ��� ���         ��������������`p����������������������������������w{w{���������w�w��{�������w�׻�{�������ݻ�	������������w	����������w{�|�����ݰ����w�������зwww{7{������}s� �}�������3 p 7�������7  w7�������3  7�������s��}�������w;7{������{wws33ww|������qwwwq|������q��|��������������������{��w�����������w{��������������������������������������������������������������              �OnClickComponentIconClick  TPanelpnSchedulerLeftTop� Width%Height� 
BevelOuterbvNoneFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTabOrder 	TGroupBox	grpWakeUpLeftTopdWidthHeight\TabOrder TLabellbWakeUpDateLeft
TopWidthHeightCaptionDateFocusControledWakeUpDate  TLabellbWakeUpTimeLeft� TopWidthHeightCaptionTimeFocusControledWakeUpTime  TEditedWakeUpDateTagLeft
Top Width� Height	MaxLength
TabOrder OnChangeedDateTimeChange  TEditedWakeUpTimeTagLeft� Top Width� Height	MaxLengthTabOrderOnChangeedDateTimeChange  	TComboBoxcmbWakeUpModeTagLeft
Top<Width� HeightStylecsDropDownList
ItemHeightItems.StringsOne time	Every day
Every week TabOrderOnChangecmbModeChange   	TGroupBox
grpSuspendLeftTopWidthHeight\TabOrder TLabellbSuspendDateLeft
TopWidthHeightCaptionDateFocusControledSuspendDate  TLabellbSuspendTimeLeft� TopWidthHeightCaptionTimeFocusControledSuspendTime  	TCheckBox	chbForcedLeft� Top@Width9HeightCaptionForcedTabOrder  TEditedSuspendDateTagLeft
Top Width� Height	MaxLength
TabOrder OnChangeedDateTimeChange  TEditedSuspendTimeTagLeft� Top Width� Height	MaxLengthTabOrderOnChangeedDateTimeChange  	TComboBoxcmbSuspendModeTagLeft
Top<Width� HeightStylecsDropDownList
ItemHeightItems.StringsOne time	Every day
Every week TabOrderOnChangecmbModeChange   	TCheckBoxchbSuspendEnabledTagLeftTopWidthvHeightCaptionSuspend enabledTabOrder OnClickchbGroupEnabledClick  	TCheckBoxchbWakeUpEnabledTagLeftTopdWidthvHeightCaptionWake up enabledTabOrderOnClickchbGroupEnabledClick   	TCheckBoxchbSchedulerLeftTop� WidthDHeightCaptionEnabledFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTabOrder    	TGroupBox
grpManagerLeftTopWidth1HeightlCaptionTabfAPMManagerFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTabOrder  TImage
imgManagerTagLeft
TopWidthHeightHintabfAPMManagerAutoSize	Picture.Data
B  TBitmap6  BM6      v   (               �                ���  �� � �   � ��   �  �        �   ��   � ��� ��� ���         ��������������pp�������������������������������������������������w{w{���������w�w��|�������w�׻�|�������ݻ�	������������w	����������w��������ݰ���׻�������зwww{��������{л�{���������л�{���������л�{����������{����������:�{���������г{��������{�� {������������ۻ�������������������������������������������������������������������������������������������������������              �OnClickComponentIconClick  TLabellbManagerInfoLeft,TopWidth� Height� AutoSizeCaption"  TabfAPMManager is a non-visual component that controls the system power behaviors. Contains information about power supply, battery lifetime and other APM information. Allows suspending and resuming of the system or blocking of these features. Provides easy access to the APM functionality.Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontWordWrap	  TPanel	pnManagerLeftTop� Width&Height� 
BevelOuterbvNoneFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTabOrder TLabellbACLineStatusLeftTopWidthOHeightCaptionAC line status:  TLabellbACLineStatusResultLeft� TopWidth4HeightCaptionUnknown  TLabellbBatteryFlagLeftTopWidth?HeightCaptionBattery flag:  TLabellbBatteryFlagResultLeft� TopWidth4HeightCaptionUnknown  TLabellbBatteryLifePercentLeftTop:WidthgHeightCaptionBattery life percent:  TLabellbBatteryLifePercentResultLeft� Top:Width4HeightCaptionUnknown  TLabellbBatteryFullLifeTimeLeftTop(WidthiHeightCaptionBattery full life time:  TLabellbBatteryFullLifeTimeResultLeft� Top(Width4HeightCaptionUnknown  TLabellbBatteryLifeTimeLeftTopLWidthVHeightCaptionBattery life time:  TLabellbBatteryLifeTimeResultLeft� TopLWidth4HeightCaptionUnknown  	TGroupBoxgrpManagerBlockingModesLeftTopbWidthHeight\Caption Blocking modes TabOrder  	TCheckBoxchbSystemActivityLeft
TopWidthxHeightCaptionSystem activityTabOrder OnClickchbBlockingModeClick  	TCheckBoxchbDisplayActivityLeft
Top*WidthxHeightCaptionDisplay activityTabOrderOnClickchbBlockingModeClick  	TCheckBoxchbUserPresentLeft
TopBWidthxHeightCaptionUser presentTabOrderOnClickchbBlockingModeClick    	TCheckBox
chbManagerLeftTop� WidthDHeightCaptionEnabledFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTabOrder    
TImageListilstMainDrawingStyledsTransparentLeftTopBitmap
�  6     BM6      6   (                                                                                                                               {{{             ���  ��  {{                             {{{ {{{ {{{     ��� ���  ��  {{ ���  ��             {{{ {{{ {{{ ��� ��� {{{          {{  {{ ���  ��  {{  {{         {{{ ��� ��� ��� ��� {{{ {{{              {{  {{                 {{{ ��� ���     ���     ���                                 {{{ {{{ ���     ���     ���     ���     {{{                 {{{ {{{     ���                                                 {{{     ���         {{{     ��� ��� ��� {{{                     {{{                 {{{     ��� ��� ��� {{{                     {{{                 {{{     ��� ��� ��� {{{                     {{{                 {{{      ��   �  ��  {{                     {{{                 {{{       �   {   {  {{                     {{{                 {{{     ���   �  ��  {{                                         {{{ {{{             {{{                                                 {{{ {{{ {{{                         BM~       >   (               @                     ��� �#  �   �   �@  �  �G  ��     J  Z  Z  Z  Z  Z  ��  ~?    
TPopupMenupmMainOnPopuppmMainPopupLeftTop 	TMenuItem	miRestoreCaption&RestoreDefault	OnClickmiRestoreClick  	TMenuItemmi1Caption-  	TMenuItemmiAboutCaption	&About...OnClick
AboutClick  	TMenuItemmi2Caption-  	TMenuItemmiEnabledManagerCaptionEnabled managerChecked	OnClickEnabledManagerClick  	TMenuItemmiEnabledSchedulerCaptionEnabled schedulerChecked	OnClickEnabledSchedulerClick  	TMenuItemmi3Caption-  	TMenuItemmiCloseCaption&CloseShortCuts�  OnClick
CloseClick   TabfTrayIconTrayIconHintabfAPM Demo	ImageListilstMainMinimizeToTray		PopupMenupmMainLeft:Top  TabfAPMSchedulerabfAPMSchedulerLeftNTop  TabfAPMManagerabfAPMManagerBlockingModes OnPowerStatusChangeabfAPMManagerPowerStatusChangeLeftTop   