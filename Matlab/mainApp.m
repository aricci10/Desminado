%%
%Main file for the control application.

%%AESTHETIC CONSTRUCTION
%-------------------------------------------------------------------------%
%Dimension declaring for correct size adjustments.
dims = get(0,'ScreenSize');

%Creating the main figure that builds up the application.
mainFigure = figure('MenuBar','none','ToolBar','none','Name','Scanner Control',...
    'Position',dims,'Color','Black');

%Creating the two main panels that make up the application, one being
%Settings and the other being Feedback.

%SETTINGS PANEL
%-------------------------------------------------------------------------
settingPosition = [0.01 0.05 .5 0.9];
settingsPanel = uipanel('Title','Settings','BackgroundColor','Black',...
    'Position',settingPosition,'HighlightColor','White',...
    'ForegroundColor','White');

%ANTENNA CENTERS
%-------------------------------------------------------------------------
%Antenna1 Center Position display.
antenna1PanelPos = [0.02 0.88 0.05 0.05];
antenna1 = uipanel('Title','Antenna 1','BackgroundColor','Black',...
    'Position',antenna1PanelPos,'ForegroundColor','White');
antenna1Disp = uicontrol('Style','text','String','','parent',antenna1,...
    'BackgroundColor','White','ForegroundColor','Black',...
    'HorizontalAlignment','center','Position',[5 10 35 17]);
antenna1DispY = uicontrol('Style','text','String','','parent',antenna1,...
    'BackgroundColor','White','ForegroundColor','Black',...
    'HorizontalAlignment','center','Position',[50 10 35 17]);

%Antenna 2 Center Position display.
antenna2PanelPos = [0.08 0.88 0.05 0.05];
antenna2 = uipanel('Title','Antenna 2','BackgroundColor','Black',...
    'Position',antenna2PanelPos,'ForegroundColor','White');
antenna2Disp = uicontrol('Style','text','String','','parent',antenna2,...
    'BackgroundColor','White','ForegroundColor','Black',...
    'HorizontalAlignment','center','Position',[5 10 35 17]);
antenna2DispY = uicontrol('Style','text','String','','parent',antenna2,...
    'BackgroundColor','White','ForegroundColor','Black',...
    'HorizontalAlignment','center','Position',[50 10 35 17]);

%Antenna 3 center position display.
antenna3PanelPos = [0.14 0.88 0.05 0.05];
antenna3 = uipanel('Title','Antenna 3','BackgroundColor','Black',...
    'Position',antenna3PanelPos,'ForegroundColor','White');
antenna3Disp = uicontrol('Style','text','String','','parent',antenna3,...
    'BackgroundColor','White','ForegroundColor','Black',...
    'HorizontalAlignment','center','Position',[5 10 35 17]);
antenna3DispY = uicontrol('Style','text','String','','parent',antenna3,...
    'BackgroundColor','White','ForegroundColor','Black',...
    'HorizontalAlignment','center','Position',[50 10 35 17]);

%Antenna 4 center position display.
antenna4PanelPos = [0.02 0.82 0.05 0.05];
antenna4 = uipanel('Title','Antenna 4','BackgroundColor','Black',...
    'Position',antenna4PanelPos,'ForegroundColor','White');
antenna4Disp = uicontrol('Style','text','String','','parent',antenna4,...
    'BackgroundColor','White','ForegroundColor','Black',...
    'HorizontalAlignment','center','Position',[5 10 35 17]);
antenna4DispY = uicontrol('Style','text','String','','parent',antenna4,...
    'BackgroundColor','White','ForegroundColor','Black',...
    'HorizontalAlignment','center','Position',[50 10 35 17]);

%Antenna 5 center position display.
antenna5PanelPos = [0.08 0.82 0.05 0.05];
antenna5 = uipanel('Title','Antenna 5','BackgroundColor','Black',...
    'Position',antenna5PanelPos,'ForegroundColor','White');
antenna5Disp = uicontrol('Style','text','String','','parent',antenna5,...
    'BackgroundColor','White','ForegroundColor','Black',...
    'HorizontalAlignment','center','Position',[5 10 35 17]);
antenna5DispY = uicontrol('Style','text','String','','parent',antenna5,...
    'BackgroundColor','White','ForegroundColor','Black',...
    'HorizontalAlignment','center','Position',[50 10 35 17]);

%Antenna 6 center position display.
antenna6PanelPos = [0.14 0.82 0.05 0.05];
antenna6 = uipanel('Title','Antenna 6','BackgroundColor','Black',...
    'Position',antenna6PanelPos,'ForegroundColor','White');
antenna6Disp = uicontrol('Style','text','String','','parent',antenna6,...
    'BackgroundColor','White','ForegroundColor','Black',...
    'HorizontalAlignment','center','Position',[5 10 35 17]);
antenna6DispY = uicontrol('Style','text','String','','parent',antenna6,...
    'BackgroundColor','White','ForegroundColor','Black',...
    'HorizontalAlignment','center','Position',[50 10 35 17]);

%RADIATION CENTER AND ANGLES OF ARRAY
%-------------------------------------------------------------------------
radiationCenterPanelPos = [0.07 0.75 .07 .053];
radiationCenter = uipanel('Title','Radiation Center','BackgroundColor','Black',...
    'Position',radiationCenterPanelPos,'ForegroundColor','White');
radCenterDisp = uicontrol('Style','text','String','','parent',radiationCenter,...
    'BackgroundColor','White','ForegroundColor','Black',...
    'HorizontalAlignment','center');

angleArrayPos = [0.065 0.68 .08 .05];
angleArrayPanel = uipanel('Title','Array Orientation','BackgroundColor','Black',...
    'Position',angleArrayPos,'ForegroundColor','White');
orientDisp = uicontrol('Style','text','String','','parent',angleArrayPanel,...
    'BackgroundColor','White','ForegroundColor','Black',...
    'HorizontalAlignment','center','Position',[10 10 35 17]);
orientDisp2 = uicontrol('Style','text','String','','parent',angleArrayPanel,...
    'BackgroundColor','White','ForegroundColor','Black',...
    'HorizontalAlignment','center','Position',[55 10 35 17]);
orientDisp3 = uicontrol('Style','text','String','','parent',angleArrayPanel,...
    'BackgroundColor','White','ForegroundColor','Black',...
    'HorizontalAlignment','center','Position',[100 10 35 17]);