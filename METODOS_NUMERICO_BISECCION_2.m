%% 
function varargout = METODOS_NUMERICO_BISECCION_2(varargin)
% METODOS_NUMERICO_BISECCION_2 MATLAB code for METODOS_NUMERICO_BISECCION_2.fig
%      METODOS_NUMERICO_BISECCION_2, by itself, creates a new METODOS_NUMERICO_BISECCION_2 or raises the existing
%      singleton*.
%
%      H = METODOS_NUMERICO_BISECCION_2 returns the handle to a new METODOS_NUMERICO_BISECCION_2 or the handle to
%      the existing singleton*.
%
%      METODOS_NUMERICO_BISECCION_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in METODOS_NUMERICO_BISECCION_2.M with the given input arguments.
%
%      METODOS_NUMERICO_BISECCION_2('Property','Value',...) creates a new METODOS_NUMERICO_BISECCION_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before METODOS_NUMERICO_BISECCION_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to METODOS_NUMERICO_BISECCION_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help METODOS_NUMERICO_BISECCION_2

% Last Modified by GUIDE v2.5 20-Sep-2023 22:40:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @METODOS_NUMERICO_BISECCION_2_OpeningFcn, ...
                   'gui_OutputFcn',  @METODOS_NUMERICO_BISECCION_2_OutputFcn, ...
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


% --- Executes just before METODOS_NUMERICO_BISECCION_2 is made visible.
function METODOS_NUMERICO_BISECCION_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to METODOS_NUMERICO_BISECCION_2 (see VARARGIN)

% Choose default command line output for METODOS_NUMERICO_BISECCION_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
movegui(gcf,'center')
% UIWAIT makes METODOS_NUMERICO_BISECCION_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = METODOS_NUMERICO_BISECCION_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
MENU


function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a_limiteinferior=str2double(get(handles.edit1,'String'))%%lee el punto del intervalo superior
b_limitesuperior=str2double(get(handles.edit2,'String'))%%lee el punto del intervalo inferior
iteracion_numero_maximas=str2double(get(handles.edit3,'String'));%lee el numero maximo de iteraciones
error_maximo_permitido=str2double(get(handles.error,'String'));%%lee el valor de tolerancia al que se quiere llegar
funcion=get(handles.edit4,'String');%%lee la funcion en formato string
f=inline(funcion);%%el comando inline transforma la cadena string en una funcion f(x)=
error1=100;%%comenzamos por un valor de error maximo 
for k=1:iteracion_numero_maximas %comienza un bucle de n iteraciones 
    c_punto_medio=(a_limiteinferior+b_limitesuperior)/2; %calcula un punto medio entre los puntos leidos a y b
    e_absoluto=abs((b_limitesuperior-a_limiteinferior)/2);%calcula el error 
    A_solucion(k,:)=[k a_limiteinferior f(a_limiteinferior) b_limitesuperior c_punto_medio f(c_punto_medio) e_absoluto];%%crea una matriz de K*6 elementos donde muestra el numero de iteraciones, los 
    %valores que toma a b y c asi como  la funcion evaluada en c
    %comprueba si hay cambio de signo en [a,c] o [c,b]
    if f(a_limiteinferior)*f(c_punto_medio)<0 %cambio de signoen la funcion evaluada en a * la funcion evaluada en c
        b_limitesuperior=c_punto_medio;
    elseif f(a_limiteinferior)*f(c_punto_medio)>0%cambio de signoen la funcion evaluada en a * la funcion evaluada en c
        
        a_limiteinferior=c_punto_medio;
    end
    
    if e_absoluto< error_maximo_permitido %se puede decir que si el error es menor a nuestro error o tolerancia que queremos el 
        %bucle se rompa 
        break;%el bucle for i=1:iteraciones se rompe si el error es el esprado
    end
end

set(handles.uitable1,'Data',A_solucion)%pone los valores da la matriz A en la tabla 
set(handles.text9,'String',num2str(c_punto_medio))%pone los valores de c en el cuadro de la respuesta
set(handles.text10,'String',num2str(f(c_punto_medio)))%pone los valores dela funcion evaluada en c en el cuadro de la respuesta de fc
set(handles.text11,'String',num2str(e_absoluto))%pone los valores del error en el cuadro de la respuesta de error


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function error_Callback(hObject, eventdata, handles)
% hObject    handle to error (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of error as text
%        str2double(get(hObject,'String')) returns contents of error as a double


% --- Executes during object creation, after setting all properties.
function error_CreateFcn(hObject, eventdata, handles)
% hObject    handle to error (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in grafica__.
function grafica___Callback(hObject, eventdata, handles)

  % Obtener el valor de c_punto_medio desde el cuadro de texto text9
    c_punto_medio = str2double(get(handles.text9, 'String'));
    
% Obtener la función ingresada por el usuario en text9
funcion = get(handles.text9, 'String'); % Cambia 'edit4' a 'text9' para obtener la función desde text9

    
    % Crear un vector de valores de x para la gráfica
    x = linspace(-5, 5, 100); % Ajusta el rango y la cantidad de puntos según tus necesidades
    
    % Evaluar la función en el vector x
    y = eval(funcion);
    
    % Crear la figura para la gráfica
    figure;
    
    % Graficar la función
 
    plot(x, y);
    
    
    % Graficar un punto en c_punto_medio
    plot(c_punto_medio, eval(funcion), 'ro', 'MarkerSize', 10); % Punto rojo en c_punto_medio
    
    grid on;
    
    % Etiquetas de los ejes
    xlabel('x');
    ylabel('f(x)');
    
    % Título de la gráfica
    title('Gráfica de la función ');
    
    % Puedes personalizar la apariencia del punto rojo y la gráfica según tus preferencias.
