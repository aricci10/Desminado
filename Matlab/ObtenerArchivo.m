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

% Last Modified by GUIDE v2.5 31-Oct-2015 23:51:37

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
function ObtenerArchivo_OpeningFcn(hObject, eventdata, handles, varargin)
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
global basicSettings; %Create the basic settings matrix.


% --- Outputs from this function are returned to the command line.
function varargout = ObtenerArchivo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in Cargar.
function Cargar_Callback(hObject, eventdata, handles)
% hObject    handle to Cargar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Filename Path]=uigetfile({'*.txt'},'Abrir archivo');
if isequal(Filename,0)
    return
else
    winopen(strcat(Path,Filename));
end


% --- Executes on button press in Info.
function Info_Callback(hObject, eventdata, handles)
% hObject    handle to Info (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('Este programa permite cargar un archivo .g para ser enviado, enviar comandos manualmente o seleccionar una de las trayectorias predeterminadas.','Información'); %Info de las trayectorias.

% --- Executes on selection change in Predet.
function Predet_Callback(hObject, eventdata, handles)
% hObject    handle to Predet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Predet contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Predet
fun = get(hObject,'Value');
    switch fun
        case 1
            a = imread('A.png');
            imshow(a);
            x=inputdlg({'Ancho','Altura','Step de Ancho','Step de Altura','Velocidad'},'Parámetros');
            %x será una celda de dos elementos.
            params=cell2mat(x);
            %params es un arreglo con estos valores.
            codigo = parametros(params(1),params(2),params(3),params(4),params(5));
            %codigo es un arreglo de strings.
            uploadLine(codigo); %Calling the uploader script.
        case 2
            b = imread('B.jpg');
            imshow(b);
        case 3
            c = imread('C.png');
            imshow(c);
                
    end
guidata(hObject,handles);
% --- Executes during object creation, after setting all properties.
function Predet_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Predet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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

% --- Executes on button press in Info1.
function Info1_Callback(hObject, eventdata, handles)
% hObject    handle to Info1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('Esta trayectoria realiza un barrido dado por la geometría mostrada en la figura. Para construirlo, el usuario debe dar los parámetros requeridos.','Trayectoria 1');
%Info de la trayectoria 1.

% --- Executes on button press in Info2.
function Info2_Callback(hObject, eventdata, handles)
% hObject    handle to Info2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Info3.
function Info3_Callback(hObject, eventdata, handles)
% hObject    handle to Info3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkbox1
global chuleadoX;
if(get(hObject,'Value')== get(hObject,'Max'))
    chuleadoX=1;
else
    chuleadoX=0;
end
% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkbox2
global chuleadoY;
if(get(hObject,'Value')==get(hObject,'Max'))
    chuleadoY = 1;
else
    chuleadoY=0;
end

% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3
global chuleadoZ;
if(get(hObject,'Value')==get(hObject,'Max'))
    chuleadoZ=1;
else
    chuleadoZ=0;
end
    


function Diameter_Callback(hObject, eventdata, handles)
% hObject    handle to Diameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Diameter as text
%        str2double(get(hObject,'String')) returns contents of Diameter as a double
Val=get(hObject,'String');
NewVal=str2double(Val);
handles.Diameter=NewVal;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function Diameter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Diameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Pasos.
function Pasos_Callback(hObject, eventdata, handles)
% hObject    handle to Pasos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Pasos contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Pasos
%Obtener el valor
global Step;
fun=get(hObject,'Value')
    switch fun
        case 1
           Step = 1;
        case 2
            Step = 1/2;
        case 3
            Step = 1/4;
        case 4
            Step = 1/8;
        case 5
            Step = 1/16;
        case 6
            Step = 1/32;
    end
    guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Pasos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pasos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Port_Callback(hObject, eventdata, handles)
% hObject    handle to Port (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Port as text
%        str2double(get(hObject,'String')) returns contents of Port as a double
Val = get(hObject,'String'); %Obtener la entrada del puerto
handles.Port=Val;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function Port_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Port (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Calcular.
function Calcular_Callback(hObject, eventdata, handles)
% hObject    handle to Calcular (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
global Step; %Importar variables globales.
global chuleadoX;
global chuleadoY;
global chuleadoZ;
global s;
global consola;
%if((chuleadoX == 1) && (chuleadoY == 1) && (chuleadoZ == 1))
%    errordlg('Se debe seleccionar solo una coordenada para modificar.','Error de Parámetros');
%end
%if((chuleadoX == 1) && (chuleadoY ==1) && (chuleadoZ == 0))
%    errordlg('Se debe seleccionar solo una coordenada para modificar.','Error de Parámetros');
%end
%if((chuleadoX == 0) && (chuleadoY ==1) && (chuleadoZ == 1))
%    errordlg('Se debe seleccionar solo una coordenada para modificar.','Error de Parámetros');
%end
%if((chuleadoX == 1) && (chuleadoY ==0) && (chuleadoZ == 1))
%    errordlg('Se debe seleccionar solo una coordenada para modificar.','Error de Parámetros');
%end
if((chuleadoX == 0) && (chuleadoY ==0) && (chuleadoZ == 0))
    errordlg('Se debe seleccionar una coordenada para modificar.','Error de Parámetros');
end
if(chuleadoX == 1)%Condiciones de los checkbox.
%Se calcula el step por mm y se muestra, para luego enviarlo al CNC.
    calculo = (200*(1/(Step))/(pi*handles.Diameter));
    set(handles.PasosX,'String',calculo);
    fprintf(s,strcat('$100=',num2str(calculo)));
    lectura=fscanf(s,'%s'); %Leer el feedback
    consola = strvcat(consola,strcat('>>>','$100=',num2str(calculo)),lectura);
    set(handles.Resultado,'String',consola);
end
if(chuleadoY==1)
    calculo = (200*(1/(Step))/(pi*handles.Diameter));
    set(handles.PasosY,'String',calculo);
    fprintf(s,strcat('$101=',num2str(calculo)));
    lectura=fscanf(s,'%s'); %Leer el feedback.
    consola = strvcat(consola,strcat('>>>','$101=',num2str(calculo)),lectura);
    set(handles.Resultado,'String',consola);
end
if(chuleadoZ==1)
    calculo=(200*(1/(Step))/(pi*handles.Diameter)); %Realizar el cálculo.
    set(handles.PasosZ,'String',calculo); %Mostrar el resultado.
    fprintf(s,strcat('$102=',num2str(calculo))); %Mandar código al puerto.
    lectura=fscanf(s,'%s'); %Leer el serial en formato string.
    consola = strvcat(consola,strcat('>>>','$102=',num2str(calculo)),lectura);
    set(handles.Resultado,'String',consola);
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


% --- Executes on button press in Connect.
function Connect_Callback(hObject, eventdata, handles)
% hObject    handle to Connect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s;
puerto=handles.Port;
s=serial(puerto,'BaudRate',115200); %Declarar puerto serial y su BAUDRATE
fopen(s); %Abrirlo permanentemente.


% --- Executes on button press in Disconnect.
function Disconnect_Callback(hObject, eventdata, handles)
% hObject    handle to Disconnect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s;
fclose(s); %Cerra el puerto por seguridad
delete(s); %Borrar serial de la memoria de la palicación

% --- Executes on button press in feedbackButton.
function feedbackButton_Callback(hObject, eventdata, handles)
% hObject    handle to feedbackButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%texto='';%La variable que da el feedback
global consola;
global s;
limite = 5; %Tiempo en segundos durante el cual se realiza la lectura.
contador = 0; %Contadora.
while(contador < limite)
    lectura=fscanf(s,'%s'); %Leer el serial en formato string.
    consola = strvcat(consola,lectura); %Añadir a variable de consola.
    set(handles.Resultado,'String',consola); %Mostrar en consola de interfaz.
    contador = contador +1;
    pause(1); %El descanso.
end



function delayTime_Callback(hObject, eventdata, handles)
% hObject    handle to delayTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of delayTime as text
%        str2double(get(hObject,'String')) returns contents of delayTime as a double
Val = get(hObject,'String'); %Save the user's selected delay time.
handles.delayTime=Val;
guidata(hObject,handles);
global delayTimeValue; %Waiting time.
delayTimeValue = handles.delayTime; %Updating the global variable.

% --- Executes during object creation, after setting all properties.
function delayTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to delayTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in saveButton.
function saveButton_Callback(hObject, eventdata, handles)
% hObject    handle to saveButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global posMatrix; %Import the global position matrix.
save('positions.mat',posMatrix); %Save in .m the position matrix.


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


% --- Executes on button press in userInfo.
function userInfo_Callback(hObject, eventdata, handles)
% hObject    handle to userInfo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
info=inputdlg({'Date','User Name','Measurement Description'},'User Information'); %User's information.
uisave('info'); %Prompt the user to save the mat file of his/her info.

% --- Executes on button press in antennaInfo.
function antennaInfo_Callback(hObject, eventdata, handles)
% hObject    handle to antennaInfo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
