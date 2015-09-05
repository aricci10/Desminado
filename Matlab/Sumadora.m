function varargout = Sumadora(varargin)
% SUMADORA MATLAB code for Sumadora.fig
%      SUMADORA, by itself, creates a new SUMADORA or raises the existing
%      singleton*.
%
%      H = SUMADORA returns the handle to a new SUMADORA or the handle to
%      the existing singleton*.
%
%      SUMADORA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SUMADORA.M with the given input arguments.
%
%      SUMADORA('Property','Value',...) creates a new SUMADORA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Sumadora_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Sumadora_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Sumadora

% Last Modified by GUIDE v2.5 04-Sep-2015 21:56:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Sumadora_OpeningFcn, ...
                   'gui_OutputFcn',  @Sumadora_OutputFcn, ...
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


% --- Executes just before Sumadora is made visible.
function Sumadora_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Sumadora (see VARARGIN)
ah=axes('unit','normalized','position',[0 0 1 1]);
bg = imread('Universe.jpg');imagesc(bg);
set(ah,'handlevisibility','off','visible','off');
uistack(ah,'bottom');

% Choose default command line output for Sumadora
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Sumadora wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Sumadora_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles) %Qué hacer con la entrada 1.
Val=get(hObject, 'String'); %Guarda la entrada en una variable temporal.
NewVal=str2double(Val); %Convierte la variable de String a Double.
handles.edit1=NewVal; %Guarda el identificador
guidata(hObject,handles); %Guarda la info de la aplicación.


function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles) %Qué hacer con la entrada 2.
Val=get(hObject,'String'); %Guarda la entrada en una variable temporal.
NewVal=str2double(Val); %Convierte la variable a Double.
handles.edit2=NewVal; %Guarda el identificador.
guidata(hObject,handles); %Guarda info de la aplicación.


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Sumar.
function Sumar_Callback(hObject, eventdata, handles) %Qué hace el botón SUMAR.
A=handles.edit1; %Variable para la entrada 1.
B=handles.edit2; %Variable para la entrada 2.
suma=A+B; %El resultado de la suma.
set(handles.Respuesta,'String',suma); %Guardar identificador. Debe ser el TAG  correcto.
