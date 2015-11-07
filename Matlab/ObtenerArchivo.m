function varargout = ObtenerArchivo(varargin)
% OBTENERARCHIVO MATLAB code for ObtenerArchivo.fig
%      OBTENERARCHIVO, by itself, creates a new OBTENERARCHIVO or raises the existing
%      singleton*.
%
%      H = OBTENERARCHIVO returns the handle to a new OBTENERARCHIVO or the handle to
%      the existing singleton*.
%
%      OBTENERARCHIVO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OBTENERARCHIVO.M with the given input arguments.
%
%      OBTENERARCHIVO('Property','Value',...) creates a new OBTENERARCHIVO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ObtenerArchivo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ObtenerArchivo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ObtenerArchivo

% Last Modified by GUIDE v2.5 07-Nov-2015 15:42:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ObtenerArchivo_OpeningFcn, ...
                   'gui_OutputFcn',  @ObtenerArchivo_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before ObtenerArchivo is made visible.
function ObtenerArchivo_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ObtenerArchivo (see VARARGIN)

% Choose default command line output for ObtenerArchivo
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ObtenerArchivo wait for user response (see UIRESUME)
% uiwait(handles.figure1);
axis off;
global consola; %Create the console.
consola = ''; %Initialize it in blank.
global posMatriz; %Create the position matrix
posMatriz = [0 0]; %Initialize it in the origin.
global antennaPosMatrix;
antennaPosMatrix = [0 0 0 0];




% --- Outputs from this function are returned to the command line.
function varargout = ObtenerArchivo_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Info.
function Info_Callback(~, ~, handles)
% hObject    handle to Info (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('Este programa permite cargar un archivo .g para ser enviado, enviar comandos manualmente o seleccionar una de las trayectorias predeterminadas.','Información'); %Info de las trayectorias.

function Comandos_Callback(hObject, eventdata, handles)
% hObject    handle to Comandos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Comandos as text
%        str2double(get(hObject,'String')) returns contents of Comandos as a double
Val=get(hObject,'String'); %Recibir el comando
NewVal = char(Val); %Convertir a arraglo de Char
handles.Comandos=NewVal; %Guardadr
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function Comandos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Comandos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Enviar.
function Enviar_Callback(hObject, eventdata, handles)
% hObject    handle to Enviar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s;
global consola;
input = handles.Comandos; %Importar arreglo de Char.
fprintf(s,input); %Enviar a serial
lectura=fscanf(s,'%s'); %Leer el feedback
consola = strvcat(consola,strcat('>>',input),lectura);
set(handles.Resultado,'String',consola); %Mostrar lo enviado en consola
ready = false; %Stopping condition.
while(ready == false)
    statusData = askStatus(); %Get current status info.
    xPos = statusData(2);
    yPos = statusData(3);
    free = statusData(1);
    set(handles.PosX,'String',xPos); %Display current X position.
    set(handles.PosY,'String',yPos); %Display current Y position.
    set(handles.currentStatus,'String',free); %Display movement status.
    comp = strcmp(free,'Idle'); %Check if it is free already.
    get(handles.currentStatus,'BackgroundColor'); %Import the capacity of editing color.
    if(comp == false)
        set(handles.currentStatus,'BackgroundColor','red'); %Red background.
    end
    if(comp == true)
        ready = true;
        set(handles.currentStatus,'BackgroundColor','green'); %Green background.
        consola = strvcat(consola,'Movement finished!');
        set(handles.Resultado,'String',consola);
    end
    pause(0.25); %Waiting for the next iteration.
end

function Resultado_Callback(hObject, eventdata, handles)
% hObject    handle to Resultado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Resultado as text
%        str2double(get(hObject,'String')) returns contents of Resultado as a double


% --- Executes during object creation, after setting all properties.
function Resultado_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Resultado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function currentStatus_CreateFcn(hObject, eventdata, handles)
% hObject    handle to currentStatus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function PosX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PosX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function PosY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PosY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function PosZ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PosZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --------------------------------------------------------------------
function initialSettings_Callback(hObject, eventdata, handles)
% hObject    handle to initialSettings (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function userInfo_Callback(hObject, eventdata, handles)
% hObject    handle to userInfo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global userGlobalInfo;                                                     %Global variable of user information.
info=inputdlg({'Date','User Name','Measurement Description'},'User Information'); %User's information.
%data = cell2mat(info);
data=info;
userGlobalInfo = data;                                                     %Assigning the global variable with inputs.
date = data{1};
name = data{2};
description = data{3};
set(handles.userName,'String',name);                                       %Setting each data into the feedback static text.
set(handles.date,'String',date);
set(handles.description,'String',description);
uisave('info');                                                            %Prompt the user to save the mat file of his/her info.


% --------------------------------------------------------------------
function antennaInfo_Callback(hObject, eventdata, handles)
% hObject    handle to antennaInfo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function antennaCenters_Callback(hObject, eventdata, handles)
% hObject    handle to antennaCenters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function antenna1_Callback(hObject, eventdata, handles)
% hObject    handle to antenna1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global antennaPosMatrix; %The matrix containing antenna positions.
info = inputdlg({'X Position','Y Position'},'Antenna 1 Settings');         %User input for the antenna 1 position.
xPos = str2num(info{1});
yPos=str2num(info{2});
antenna1Pos = [1 xPos yPos 0];
antennaPosMatrix = vertcat(antennaPosMatrix,antenna1Pos);
set(handles.antenna1Disp,'String',info{1});                                %Display de position of antenna 1 in the array.
set(handles.antenna1DispY,'String',info{2});                               %Display de Y position of the natenna 1 in the array.

% --------------------------------------------------------------------
function antenna2_Callback(hObject, eventdata, handles)
% hObject    handle to antenna2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global antennaPosMatrix;                                                   %Import the antenna conf. matrix.
info = inputdlg({'X Position', 'Y Position'},'Antenna 2 Settings');        %User input
xPos = str2num(info{1});
yPos=str2num(info{2});
antenna2Pos = [2 xPos yPos 0];
antennaPosMatrix=vertcat(antennaPosMatrix,antenna2Pos);
set(handles.antenna2Disp,'String',info{1});                                %Display de X and Y positions of antenna 2 in the array.
set(handles.antenna2DispY,'String',info{2});

% --------------------------------------------------------------------
function antenna3_Callback(hObject, eventdata, handles)
% hObject    handle to antenna3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global antennaPosMatrix;
info=inputdlg({'X Position','Y Position'},'Antenna 3 Settings');
xPos=str2num(info{1});
yPos=str2num(info{2});
antenna3Pos = [3 xPos yPos 0];
antennaPosMatrix=vertcat(antennaPosMatrix,antenna3Pos);
set(handles.antenna3Disp,'String',info{1});                                %Display X and Y position of antenna 3 in the array.
set(handles.antenna3DispY,'String',info{2});


% --------------------------------------------------------------------
function antenna4_Callback(hObject, eventdata, handles)
% hObject    handle to antenna4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global antennaPosMatrix;
info=inputdlg({'X Position','Y Position'},'Antenna 4 Settings');
xPos=str2num(info{1});
yPos=str2num(info{2});
antenna4Pos = [4 xPos yPos 0];
antennaPosMatrix=vertcat(antennaPosMatrix,antenna4Pos);
set(handles.antenna4Disp,'String',info{1});                                %Display X and Y position of antenna 4 in the array.
set(handles.antenna4DispY,'String',info{2});

% --------------------------------------------------------------------
function antenna5_Callback(hObject, eventdata, handles)
% hObject    handle to antenna5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global antennaPosMatrix;
info=inputdlg({'X position','Y Position'},'Antenna 5 Settings');
xPos=str2num(info{1});
yPos=str2num(info{2});
antenna5Pos = [5 xPos yPos 0];
antennaPosMatrix=vertcat(antennaPosMatrix,antenna5Pos);
set(handles.antenna5Disp,'String',info{1});                                %Display X and Y position of antenna 5 in the array.
set(handles.antenna5DispY,'String',info{2});
% --------------------------------------------------------------------
function antenna6_Callback(hObject, eventdata, handles)
% hObject    handle to antenna6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global antennaPosMatrix;
info=inputdlg({'X Position','Y Position'},'Antenna 6 Settings');
xPos=str2num(info{1});
yPos=str2num(info{2});
antenna6Pos = [6 xPos yPos 0];
antennaPosMatrix=vertcat(antennaPosMatrix,antenna6Pos);
set(handles.antenna6Disp,'String',info{1});
set(handles.antenna6DipsY,'String',info{2});


% --------------------------------------------------------------------
function radiationCenter_Callback(hObject, eventdata, handles)
% hObject    handle to radiationCenter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global radiationCenter;
center = inputdlg('Radiation Center','Radiation Center Z Location');
radiationCenter = str2num(center{1});
set(handles.radCenterDisp,'String',center{1});


% --------------------------------------------------------------------
function orientation_Callback(hObject, eventdata, handles)
% hObject    handle to orientation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global antennaOrientation;
angles=inputdlg({'Yaw','Roll','Pitch'},'Array Orientation Angles');
yaw=str2num(angles{1});
roll=str2num(angles{2});
pitch=str2num(angles{3});
antennaOrientation = [yaw roll pitch];
set(handles.orientDisp,'String',angles{1});
set(handles.orientDisp2,'String',angles{2});
set(handles.orientDisp3,'String',angles{3});


% --------------------------------------------------------------------
function saveSettings_Callback(hObject, eventdata, handles)
% hObject    handle to saveSettings (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global antennaOrientation;
global radiationCenter;
global antennaPosMatrix;
antennaPosMatrix(1,:)=[];
uisave({'antennaOrientation','radiationCenter','antennaPosMatrix'});


% --------------------------------------------------------------------
function connections_Callback(hObject, eventdata, handles)
% hObject    handle to connections (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function saveConnections_Callback(hObject, eventdata, handles)
% hObject    handle to saveConnections (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.connectionTable,'Data');
%dataF = cell2mat(data);
uisave('data');


% --- Executes when entered data in editable cell(s) in connectionTable.
function connectionTable_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to connectionTable (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function loadConnections_Callback(hObject, eventdata, handles)
% hObject    handle to loadConnections (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global connectionInfo;
name = uigetfile;
variable = load('name');
nameF = fieldnames(variable);
variable=variable.(nameF{1});
connectionInfo = variable;


% --------------------------------------------------------------------
function loadSettings_Callback(hObject, eventdata, handles)
% hObject    handle to loadSettings (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global antennaInfoOrientation; %Matrix of orientation angles.
global antennaInfoCenters; %Matrix of radiation centers
global antennaInfoPos;
name = uigetfile;
variable=load('name');
nameF=fieldnames(variable);
variable1=variable.(nameF{1});
variable2=variable.(nameF{2});
variable3=variable.(nameF{3});
antennaInfoOrientation=variable1;
antennaInfoCenters=variable2;
antennaInfoPos = variable3;


% --- Executes during object creation, after setting all properties.
function userName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to userName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function date_CreateFcn(hObject, eventdata, handles)
% hObject    handle to date (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function description_CreateFcn(hObject, eventdata, handles)
% hObject    handle to description (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --------------------------------------------------------------------
function trajectSettings_Callback(hObject, eventdata, handles)
% hObject    handle to trajectSettings (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function delayTime_Callback(hObject, eventdata, handles)
% hObject    handle to delayTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global delayTimeValue;                                                     %Global variable of delay time.
info=inputdlg('Delay Time (s)','Delay Time Between Movements');            %The user input for delay time.
time = str2num(info{1});
delayTimeValue = time;                                                     %Setting value so other scriots can call it.

% --------------------------------------------------------------------
function newStepSize_Callback(hObject, eventdata, handles)
% hObject    handle to newStepSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Step;                                                               %Global variable for Step Size.
info=inputdlg('Availabke values (1,1/2,1/4,1/8,1/16)','Step Size');        %Informing available step size values.
data = str2num(info{1});
Step = data;                                                               %Setting the global variable value.


% --------------------------------------------------------------------
function portConnection_Callback(hObject, eventdata, handles)
% hObject    handle to portConnection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function newPort_Callback(hObject, eventdata, handles)
% hObject    handle to newPort (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Port;
info = inputdlg('Port','Serial Port');
Port = info{1};

% --------------------------------------------------------------------
function newConnect_Callback(hObject, eventdata, handles)
% hObject    handle to newConnect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s;
global consola;
global Port;
s=serial(Port,'BaudRate',115200); %Declarar puerto serial y su BAUDRATE
fopen(s); %Abrirlo permanentemente.
limite = 5; %Tiempo en segundos durante el cual se realiza la lectura.
contador = 0; %Contadora.
while(contador < limite)
    lectura=fscanf(s,'%s'); %Leer el serial en formato string.
    consola = strvcat(consola,lectura); %Añadir a variable de consola.
    set(handles.Resultado,'String',consola); %Mostrar en consola de interfaz.
    contador = contador +1;
    pause(1); %El descanso.
end

% --------------------------------------------------------------------
function newDisconnect_Callback(hObject, eventdata, handles)
% hObject    handle to newDisconnect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s;
fclose(s); %Cerra el puerto por seguridad
delete(s); %Borrar serial de la memoria de la aplicación


% --------------------------------------------------------------------
function distanceSetting_Callback(hObject, eventdata, handles)
% hObject    handle to distanceSetting (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Step;
global consola;
info = inputdlg({'X Direction','Y Direction'},'Distance Per Movement in Axes');
data1 = str2num(info{1});
data2 = str2num(info{2});

calculo1 = (200*(1/(Step))/(pi*data1));
set(handles.PasosX,'String',calculo1);
fprintf(s,strcat('$100=',num2str(calculo1)));
lectura1=fscanf(s,'%s'); %Leer el feedback

calculo2 = (200*(1/(Step))/(pi*data2));
set(handles.PasosY,'String',calculo2);
fprintf(s,strcat('$101=',num2str(calculo2)));
lectura2=fscanf(s,'%s'); %Leer el feedback.
consola = strvcat(consola,strcat('>>>','$100=',num2str(calculo1),strcat('>>>','$101=',num2str(calculo2))),lectura2);
set(handles.Resultado,'String',consola);


% --------------------------------------------------------------------
function geometryParams_Callback(hObject, eventdata, handles)
% hObject    handle to geometryParams (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
info = inputdlg({'Width','Height','Width Step','Height Step','Speed'},'Geometric Parameters');
param1 = str2num(info{1});
param2 = str2num(info{2});
param3 = str2num(info{3});
param4 = str2num(info{4});
param5 = str2num(info{5});
set(handles.widthDisp,'String',info{1});
set(handles.heightDisp,'String',info{2});
set(handles.widthStepDisp,'String',info{3});
set(handles.heightStepDisp,'String',info{4});
set(handles.speedDisp,'String',info{5});
codigo = parametros(param1,param2,param3,param4,param5);
uploadLine(codigo); %Calling the uploader script.


% --- Executes during object creation, after setting all properties.
function radCenterDisp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to radCenterDisp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
