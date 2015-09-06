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

% Last Modified by GUIDE v2.5 05-Sep-2015 16:13:21

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
%       See ISPC and COMPUTER.
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
input = handles.Comandos; %Importar arreglo de Char.
fileID = fopen('Comandos.bin','w'); %Crear archivo binario.
fwrite(fileID,input); %Escribir en archivo binario.
fclose(fileID); %Cerrar la edición.
lectura=fopen('Comandos.bin'); %Abrir de nuevo para lectura.
resultado=num2str(transpose(fread(lectura))); %Volverlo entendible.
set(handles.Resultado, 'String', resultado); %Mostrar lo enviado
fclose(lectura);%Acabar lectura.
s=serial('com1'); %Declarar puerto COM1
fopen(s); %Abrir puerto COM1
fwrite(s,imput); %Enviar código ya en binario a COM1.
fclose(s); %Cerrar el serial.
