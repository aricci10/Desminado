%%
function mainApp
%Main file for the control application.
%%AESTHETIC CONSTRUCTION
%-------------------------------------------------------------------------%
%Dimension declaring for correct size adjustments.
dims = get(0,'ScreenSize');

%Some global variables that will be edited as the GUI works.
%The antenna centers stored in a single matrix,
global antennaPosMatrix;                                                   
antennaPosMatrix = [0 0 0 0];
%The display message of the console.
global consola;
consola = '';
%Matrix containing the current position of the scanner.
global posMatrix;
posMatrix = [];
%Value correspondieng to the radiation center Z coordinate.
global radiationCenterValue;
%Array containing the three angles that describe the antenna array
%orientation.
global arrayOrientation;

%Creating the main figure that builds up the application.
mainFigure = figure('MenuBar','none','ToolBar','none','Name','Scanner Control',...
    'Position',dims,'Color','Black');

%Creating the two main panels that make up the application, one being
%Settings and the other being Feedback.

%SETTINGS PANEL
%-------------------------------------------------------------------------
settingPosition = [0.01 0.16 .2 0.8];
settingsPanel = uipanel('Title','Settings','BackgroundColor','Black',...
    'Position',settingPosition,'HighlightColor','White',...
    'ForegroundColor','White');

%ANTENNA CENTERS
%-------------------------------------------------------------------------
%Antenna1 Center Position display.
antenna1PanelPos = [0.02 0.88 0.05 0.05];
antenna1 = uipanel('Title','Antenna 1','BackgroundColor','Black',...
    'Position',antenna1PanelPos,'ForegroundColor','White');
handles.antenna1Disp = uicontrol('Style','text','String','','parent',antenna1,...
    'BackgroundColor','White','ForegroundColor','Black',...
    'HorizontalAlignment','center','Position',[5 10 35 17],'Tag','antenna1Disp');
handles.antenna1DispY = uicontrol('Style','text','String','','parent',antenna1,...
    'BackgroundColor','White','ForegroundColor','Black',...
    'HorizontalAlignment','center','Position',[50 10 35 17],'Tag','antenna1DispY');

%Antenna 2 Center Position display.
antenna2PanelPos = [0.08 0.88 0.05 0.05];
antenna2 = uipanel('Title','Antenna 2','BackgroundColor','Black',...
    'Position',antenna2PanelPos,'ForegroundColor','White');
handles.antenna2Disp = uicontrol('Style','text','String','','parent',antenna2,...
    'BackgroundColor','White','ForegroundColor','Black',...
    'HorizontalAlignment','center','Position',[5 10 35 17],'Tag','antenna2Disp');
handles.antenna2DispY = uicontrol('Style','text','String','','parent',antenna2,...
    'BackgroundColor','White','ForegroundColor','Black',...
    'HorizontalAlignment','center','Position',[50 10 35 17],'Tag','antenna2DispY');

%Antenna 3 center position display.
antenna3PanelPos = [0.14 0.88 0.05 0.05];
antenna3 = uipanel('Title','Antenna 3','BackgroundColor','Black',...
    'Position',antenna3PanelPos,'ForegroundColor','White');
handles.antenna3Disp = uicontrol('Style','text','String','','parent',antenna3,...
    'BackgroundColor','White','ForegroundColor','Black',...
    'HorizontalAlignment','center','Position',[5 10 35 17],'Tag','antenna3Disp');
handles.antenna3DispY = uicontrol('Style','text','String','','parent',antenna3,...
    'BackgroundColor','White','ForegroundColor','Black',...
    'HorizontalAlignment','center','Position',[50 10 35 17],'Tag','antenna3DispY');

%Antenna 4 center position display.
antenna4PanelPos = [0.02 0.82 0.05 0.05];
antenna4 = uipanel('Title','Antenna 4','BackgroundColor','Black',...
    'Position',antenna4PanelPos,'ForegroundColor','White');
handles.antenna4Disp = uicontrol('Style','text','String','','parent',antenna4,...
    'BackgroundColor','White','ForegroundColor','Black',...
    'HorizontalAlignment','center','Position',[5 10 35 17],'Tag','antenna4Disp');
handles.antenna4DispY = uicontrol('Style','text','String','','parent',antenna4,...
    'BackgroundColor','White','ForegroundColor','Black',...
    'HorizontalAlignment','center','Position',[50 10 35 17],'Tag','antenna4DispY');

%Antenna 5 center position display.
antenna5PanelPos = [0.08 0.82 0.05 0.05];
antenna5 = uipanel('Title','Antenna 5','BackgroundColor','Black',...
    'Position',antenna5PanelPos,'ForegroundColor','White');
handles.antenna5Disp = uicontrol('Style','text','String','','parent',antenna5,...
    'BackgroundColor','White','ForegroundColor','Black',...
    'HorizontalAlignment','center','Position',[5 10 35 17],'Tag','antenna5Disp');
handles.antenna5DispY = uicontrol('Style','text','String','','parent',antenna5,...
    'BackgroundColor','White','ForegroundColor','Black',...
    'HorizontalAlignment','center','Position',[50 10 35 17],'Tag','antenna5DispY');

%Antenna 6 center position display.
antenna6PanelPos = [0.14 0.82 0.05 0.05];
antenna6 = uipanel('Title','Antenna 6','BackgroundColor','Black',...
    'Position',antenna6PanelPos,'ForegroundColor','White');
handles.antenna6Disp = uicontrol('Style','text','String','','parent',antenna6,...
    'BackgroundColor','White','ForegroundColor','Black',...
    'HorizontalAlignment','center','Position',[5 10 35 17],'Tag','antenna6Disp');
handles.antenna6DispY = uicontrol('Style','text','String','','parent',antenna6,...
    'BackgroundColor','White','ForegroundColor','Black',...
    'HorizontalAlignment','center','Position',[50 10 35 17],'Tag','antenna6DispY');

%RADIATION CENTER AND ANGLES OF ARRAY
%-------------------------------------------------------------------------
radiationCenterPanelPos = [0.07 0.75 .07 .053];
radiationCenter = uipanel('Title','Radiation Center','BackgroundColor','Black',...
    'Position',radiationCenterPanelPos,'ForegroundColor','White');
handles.radCenterDisp = uicontrol('Style','text','String','','parent',radiationCenter,...
    'BackgroundColor','White','ForegroundColor','Black',...
    'HorizontalAlignment','center','Position',[35 15 50 17],'Tag','radCenterDisp');

angleArrayPos = [0.065 0.68 .08 .05];
angleArrayPanel = uipanel('Title','Array Orientation','BackgroundColor','Black',...
    'Position',angleArrayPos,'ForegroundColor','White');
handles.orientDisp = uicontrol('Style','text','String','','parent',angleArrayPanel,...
    'BackgroundColor','White','ForegroundColor','Black',...
    'HorizontalAlignment','center','Position',[10 10 35 17],'Tag','orientDisp1');
handles.orientDisp2 = uicontrol('Style','text','String','','parent',angleArrayPanel,...
    'BackgroundColor','White','ForegroundColor','Black',...
    'HorizontalAlignment','center','Position',[55 10 35 17],'Tag','orientDisp2');
handles.orientDisp3 = uicontrol('Style','text','String','','parent',angleArrayPanel,...
    'BackgroundColor','White','ForegroundColor','Black',...
    'HorizontalAlignment','center','Position',[100 10 35 17],'Tag','orientDisp3');

%USER SETTINGS
%Panel containing information on the user, date and description of the
%measurement being done.
userInfoPanelPos = [0.02 0.4 0.17 0.25];
userInfoPanel = uipanel('Title','User Information','BackgroundColor','Black',...
    'Position',userInfoPanelPos,'ForegroundColor','White');

%Sub-Panel for displaying the user name.
userNamePanel = uipanel('Title','User Name','BackgroundColor','Black',...
    'Position',[0.025 0.58 0.05 0.05],'ForegroundColor','White');
userName = uicontrol(mainFigure,'Style','text','String','','parent',userNamePanel,...
    'HorizontalAlignment','center','Position',[10 10 70 17],...
    'BackgroundColor','White','ForegroundColor','Black','Tag','userName');

%Sub-Panel for displaying the measurement date.
datePanel = uipanel('Title','Date','BackgroundColor','Black',...
    'Position',[0.1 0.58 0.05 0.05],'ForegroundColor','White');
handles.date = uicontrol('Style','text','String','','parent',datePanel,...
    'HorizontalAlignment','center','Position',[10 10 70 17],...
    'BackgroundColor','White','ForegroundColor','Black','Tag','date');

%Sub-Panel for displaying the measurement description.
descriptionPos = [0.025 0.42 0.15 0.15];
descriptionPanel = uipanel('Title','Description','BackgroundColor','Black',...
    'Position', descriptionPos,'ForegroundColor','White');
handles.description = uicontrol('Style','text','String','','BackgroundColor','White',...
    'ForegroundColor','Black','parent',descriptionPanel,...
    'Position',[10 10 255 130],'Tag','description');

%TRAJECTORY SETTINGS
%Panel containing a display for all the parameters that define the
%currently used trajectory.
trajectoryPanelPos = [0.05 0.19 0.1 0.2];
trajectoryPanel = uipanel('Title','Trajectory Settings',...
    'BackgroundColor','Black','ForegroundColor','White',...
    'Position',trajectoryPanelPos);

%Sub-panels containing the display for all the trajectory parameters.
widthPanel = uipanel('Title','Width','BackgroundColor','Black',...
    'ForegroundColor','White','Parent',trajectoryPanel,...
    'Position',[0.025 0.8 0.34 0.2]);
handles.widthDisp = uicontrol('Style','text','String','','BackgroundColor','White',...
    'Position',[6 6 50 15],'Parent',widthPanel,'Tag','widthDisp');

heightPanel = uipanel('Title','Height','BackgroundColor','Black',...
    'Position',[0.025 0.59 0.34 0.2],'Parent',trajectoryPanel,'ForegroundColor','White');
handles.heightDisp = uicontrol('Style','text','String','','BackgroundColor','White',...
    'ForegroundColor','Black','Parent',heightPanel,'Position',[6 6 50 15],'Tag','heightDisp');

NxPanel = uipanel('Title','Nx','BackgroundColor','Black',...
    'Position',[0.025 0.37 0.34 0.2],'Parent',trajectoryPanel,'ForegroundColor','White');
handles.widthStepDisp = uicontrol('Style','text','String','','BackgroundColor','White',...
    'ForegroundColor','Black','Parent',NxPanel,'Position',[6 6 50 15],'Tag','widthStepDisp');

NyPanel = uipanel('Title','Ny','BackgroundColor','Black',...
    'Position',[0.025 0.15 0.34 0.2],'Parent',trajectoryPanel,'ForegroundColor','White');
handles.heightStepDisp = uicontrol('Style','text','String','','BackgroundColor','White',...
    'ForegroundColor','Black','Parent',NyPanel,'Position',[6 6 50 15],'Tag','heightStepDisp');

speedPanel = uipanel('Title','Speed','BackgroundColor','Black',...
    'Position',[0.5 0.8 0.34 0.2],'Parent',trajectoryPanel,...
    'ForegroundColor','White');
handles.speedDisp = uicontrol('Style','text','String','','BackgroundColor','White',...
    'ForegroundColor','Black','Parent',speedPanel,'Position',[6 6 50 15],'Tag','speedDisp');

xStepPanel = uipanel('Title','X Step/mm','BackgroundColor','Black',...
    'Position',[0.45 0.59 0.5 0.2],'Parent',trajectoryPanel,'ForegroundColor','White');
handles.xStepDisp = uicontrol('Style','text','String','','BackgroundColor','White',...
    'ForegroundColor','Black','Parent',xStepPanel,'Position',[13 6 50 15],'Tag','xStepDisp');

yStepPanel = uipanel('Title','Y Step/mm','BackgroundColor','Black',...
    'Position',[0.45 0.35 0.5 0.2],'Parent',trajectoryPanel,'ForegroundColor','White');
handles.yStepDisp = uicontrol('Style','text','String','','BackgroundColor','White',...
    'ForegroundColor','Black','Parent',yStepPanel,'Position',[13 6 50 15],'Tag','yStepDisp');
%SETTINGS FUNCTIONS
%Construction of all the functions that allow the SETTINGS panel to display
%the different data used by the user in the motion of the scanner.

%MENU BARS
%Construction of the menu bars and elements available in them for the user
%to set up the scanner movement.

%USER SETTINGS MENU CONSTRUCTION
%Construction of the different options in the USER SETTINGS menu.
userSettingsMenu = uimenu(mainFigure,'Label','User Settings');
setSetings = uimenu(userSettingsMenu,'Label','Set Settings',...
    'Callback',@createUserSettings);
saveSettings = uimenu(userSettingsMenu,'Label','Save Settings',...
    'Callback',@saveuserSettings);

%ANTENNA SETTINGS MENU CONSTRUCTION
%Construction of the different options in ANTENNA SETTINGS menu.
antennaSettingsMenu = uimenu(mainFigure,'Label','Antenna Settings');
antennaCenters = uimenu(antennaSettingsMenu,'Label','Antenna Centers');

%Creating the 6 antenna centers parameters.
antenna1Center = uimenu(antennaCenters,'Label','Antenna 1',...
    'Callback',@setAntenna1Center);
antenna2Center = uimenu(antennaCenters,'Label','Antenna 2',...
    'Callback',@setAntenna2Center);
antenna3Center = uimenu(antennaCenters,'Label','Antenna 3',...
    'Callback',@setAntenna3Center);
antenna4Center = uimenu(antennaCenters,'Label','Antenna 4',...
    'Callback',@setAntenna4Center);
antenna5Center = uimenu(antennaCenters,'Label','Antenna 5',...
    'Callback',@setAntenna5Center);
antenna6Center = uimenu(antennaCenters,'Label','Antenna 6',...
    'Callback',@setAntenna6Center);
guidata(mainFigure,handles);

%Setting up the functions that allows the menu to get user inputs for the
%antenna centers in the scanner.
    function setAntenna1Center(hObject,handles)
        %Function in charge of displaying the antenna 1 position for the
        %user to see.
        centerX = findobj('Tag','antenna1Disp');
        centerY = findobj('Tag','antenna1DispY');
        info = inputdlg({'X Position','Y Position'},'Antenna 1 Position');
        set(centerX,'String',info{1});
        set(centerY,'String',info{2});
        xPos = str2num(info{1});
        yPos = str2num(info{2});
        antennaPosMatrix = vertcat(antennaPosMatrix,[1 xPos yPos 0]);
    end

    function setAntenna2Center(hObject,handles)
        %Function in charge of displaying the antenna 2 centers for the
        %user to see.
        centerX = findobj('Tag','antenna2Disp');
        centerY = findobj('Tag','antenna2DispY');
        info = inputdlg({'X Position','Y Position'},'Antenna 2 Position');
        set(centerX,'String',info{1});
        set(centerY,'String',info{2});
        xPos = str2num(info{1});
        yPos = str2num(info{2});
        antennaPosMatrix = vertcat(antennaPosMatrix,[2 xPos yPos 0]);
    end

    function setAntenna3Center(hObject,handles)
        %Function in charge of displaying the antenna 3 centers for the
        %user to see.
        centerX = findobj('Tag','antenna3Disp');
        centerY = findobj('Tag','antenna3DispY');
        info = inputdlg({'X Position','Y Position'},'Antenna 3 Position');
        set(centerX,'String',info{1});
        set(centerY,'String',info{2});
        xPos = str2num(info{1});
        yPos = str2num(info{2});
        antennaPosMatrix = vertcat(antennaPosMatrix,[3 xPos yPos 0]);
    end

    function setAntenna4Center(hObject,handles)
        %Function in charge of displaying the antenna 4 centers for the
        %user to see.
        centerX = findobj('Tag','antenna4Disp');
        centerY = findobj('Tag','antenna4DispY');
        info = inputdlg({'X Position','Y Position'},'Antenna 4 Position');
        set(centerX,'String',info{1});
        set(centerY,'String',info{2});
        xPos = str2num(info{1});
        yPos = str2num(info{2});
        antennaPosMatrix = vertcat(antennaPosMatris,[4 xPos yPos 0]);
    end

    function setAntenna5Center(hObject,handles)
        %Function in charge of displaying the antenna 5 centers for the
        %user to see.
        centerX = findobj('Tag','antenna5Disp');
        centerY = findobj('Tag','antenna5DispY');
        info = inputdlg({'X Position','Y Position'},'Antenna 5 Position');
        set(centerX,'String',info{1});
        set(centerY,'String',info{2});
        xPos = str2num(info{1});
        yPos = str2num(info{2});
        antennaPosMatrix = vertcat(antennaPosMatrix,[5 xPos yPos 0]);
    end

    function setAntenna6Center(hObject,handles)
        %Function in charge of displaying the antenna 6 centers for the
        %user to see.
        centerX = findobj('Tag','antenna6Disp');
        centerY = findobj('Tag','antenna6DispY');
        info = inputdlg({'X Position','Y Position'},'Antenna 6 Position');
        set(centerX,'String',info{1});
        set(centerY,'String',info{2});
        xPos = str2num(info{1});
        yPos = str2num(info{2});
        antennaPosMatrix = vertcat(antennaPosMatrix,[6 xPos yPos 0]);
    end

%Creating the radiation center and orientation user input options in the
%main uimenu. This process includes both the GUI elements and its callback
%functions.
radCenter = uimenu(antennaSettingsMenu,'Label','Radiation Center',...
    'Callback',@dispRadCenter);
angleoOrient = uimenu(antennaSettingsMenu,'Label','Array Orientation',...
    'Callback',@dispArrayOrient);

    function dispRadCenter(hObject,handles)
        %Function in charge of displaying the radiation center given by the
        %user in the main GUI:
        info = inputdlg({'Z Position'},'Radiation Center');
        radCenterDisplay = findobj('Tag','radCenterDisp');
        set(radCenterDisplay,'String',info{1});
        center = str2num(info{1});
        radiationCenterValue = center;
    end

    function dispArrayOrient(hObject,handles)
        %Function in charge of displaying the user input corresponding to
        %the antenna array angular orientation.
        info = inputdlg({'Yaw','Roll','Pitch'},'Array Orientation');
        angle1 = findobj('Tag','orientDisp1');
        angle2 = findobj('Tag','orientDisp2');
        angle3 = findobj('Tag','orientDisp3');
        set(angle1,'String',info{1});
        set(angle2,'String',info{2});
        set(angle3,'String',info{3});
        yawAngle = str2num(info{1});
        rollAngle = str2num(info{2});
        pitchAngle = str2num(info{3});
        arrayOrientation = [yawAngle rollAngle pitchAngle];
    end

%TRAJECTORY SETTINGS
%Everything related to the user's definition of the parameters for the
%predetermined movement trajectory.
trajectSettings = uimenu(mainFigure,'Label','Trajectory Settings');
geometrySettingsMenu = uimenu(trajectSettings,'Label','Geometric Parameters',...
    'Callback',@geometrySettings);

    function geometrySettings(hObject,handles)
        info = inputdlg({'Width','Height','Width Step','Height Step','Speed'},'Geometric Parameters');
        param1 = str2num(info{1});
        param2 = str2num(info{2});
        param3 = str2num(info{3});
        param4 = str2num(info{4});
        param5 = str2num(info{5});
        theWidth = findobj('Tag','widthDisp');
        theHeight = findobj('Tag','heightDisp');
        theWidthStep = findobj('Tag','widthStepDisp');
        theHeightStep = findobj('Tag','heightStepDisp');
        theSpeed = findobj('Tag','speedDisp');
        set(theWidth,'String',info{1});
        set(theHeight,'String',info{2});
        set(theWidthStep,'String',info{3});
        set(theHeightStep,'String',info{4});
        set(theSpeed,'String',info{5});
        %codigo = parametros(param1,param2,param3,param4,param5);
        %uploadLine(codigo);
    end

    function stepSettings(hObject,handles)
        %Function in charge of setting the movement parameters for the
        %desired trajectory.
        info = inputdlg({'X Step/mm','Y Step/mm'},'Step Parameter');
    end

end