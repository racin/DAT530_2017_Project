function varargout = player_GUI(varargin)

% PLAYER_GUI MATLAB code for player_GUI.fig
%      PLAYER_GUI, by itself, creates a new PLAYER_GUI or raises the existing
%      singleton*.
%
%      H = PLAYER_GUI returns the handle to a new PLAYER_GUI or the handle to
%      the existing singleton*.
%
%      PLAYER_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PLAYER_GUI.M with the given input arguments.
%
%      PLAYER_GUI('Property','Value',...) creates a new PLAYER_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before player_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to player_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help player_GUI

% Last Modified by GUIDE v2.5 29-Oct-2017 22:46:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @player_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @player_GUI_OutputFcn, ...
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


% --- Executes just before player_GUI is made visible.
function player_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to player_GUI (see VARARGIN)

% Choose default command line output for player_GUI
handles.output = hObject;
global global_info;
global_info.handles = handles;

% Define default states for all click buttons
global_info.DP_Turn_Btn = false;
global_info.DP_Move_Btn = false;

global_info.TP_1_Turn_Btn = false;
global_info.TP_1_Move_Btn = false;

global_info.FP_C_Move_Btn = false;
global_info.FP_D_Move_Btn = false;
global_info.FP_H_Move_Btn = false;
global_info.FP_S_Move_Btn = false;
global_info.Initial_Deal_Btn = false;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes player_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = player_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in DP_Turn_Btn.
function DP_Turn_Btn_Callback(hObject, eventdata, handles)
% hObject    handle to DP_Turn_Btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global global_info;
if global_info.DP_Turn_Btn == false,
    global_info.DP_Turn_Btn = true;
end

% --- Executes on button press in DP_Move_Btn.
function DP_Move_Btn_Callback(hObject, eventdata, handles)
% hObject    handle to DP_Move_Btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global global_info;
if global_info.DP_Move_Btn == false,
    global_info.DP_Move_Btn = true;
end

% --- Executes on button press in TP_1_Turn_Btn.
function TP_1_Turn_Btn_Callback(hObject, eventdata, handles)
% hObject    handle to TP_1_Turn_Btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global global_info;
if global_info.TP_1_Turn_Btn == false,
    global_info.TP_1_Turn_Btn = true;
end

% --- Executes on button press in TP_1_Move_Btn.
function TP_1_Move_Btn_Callback(hObject, eventdata, handles)
% hObject    handle to TP_1_Move_Btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global global_info;
if global_info.TP_1_Move_Btn == false,
    global_info.TP_1_Move_Btn = true;
end

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function DP_Move_Location_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DP_Move_Location (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in STOPSIM.
function STOPSIM_Callback(hObject, eventdata, handles)
% hObject    handle to STOPSIM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global global_info;
global_info.STOP_SIMULATION = 1;


% --- Executes on button press in FP_C_Move_Btn.
function FP_C_Move_Btn_Callback(hObject, eventdata, handles)
% hObject    handle to FP_C_Move_Btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global global_info;
if global_info.FP_C_Move_Btn == false,
    global_info.FP_C_Move_Btn = true;
end


function FP_C_Move_Location_Callback(hObject, eventdata, handles)
% hObject    handle to FP_C_Move_Location (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FP_C_Move_Location as text
%        str2double(get(hObject,'String')) returns contents of FP_C_Move_Location as a double


% --- Executes during object creation, after setting all properties.
function FP_C_Move_Location_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FP_C_Move_Location (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in FP_S_Move_Btn.
function FP_S_Move_Btn_Callback(hObject, eventdata, handles)
% hObject    handle to FP_S_Move_Btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global global_info;
if global_info.FP_S_Move_Btn == false,
    global_info.FP_S_Move_Btn = true;
end


function FP_S_Move_Location_Callback(hObject, eventdata, handles)
% hObject    handle to FP_S_Move_Location (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FP_S_Move_Location as text
%        str2double(get(hObject,'String')) returns contents of FP_S_Move_Location as a double


% --- Executes during object creation, after setting all properties.
function FP_S_Move_Location_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FP_S_Move_Location (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in FP_H_Move_Btn.
function FP_H_Move_Btn_Callback(hObject, eventdata, handles)
% hObject    handle to FP_H_Move_Btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global global_info;
if global_info.FP_H_Move_Btn == false,
    global_info.FP_H_Move_Btn = true;
end


function FP_H_Move_Location_Callback(hObject, eventdata, handles)
% hObject    handle to FP_H_Move_Location (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FP_H_Move_Location as text
%        str2double(get(hObject,'String')) returns contents of FP_H_Move_Location as a double


% --- Executes during object creation, after setting all properties.
function FP_H_Move_Location_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FP_H_Move_Location (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in FP_C_Move_Btn.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to FP_C_Move_Btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to FP_C_Move_Location (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FP_C_Move_Location as text
%        str2double(get(hObject,'String')) returns contents of FP_C_Move_Location as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FP_C_Move_Location (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in FP_D_Move_Btn.
function FP_D_Move_Btn_Callback(hObject, eventdata, handles)
% hObject    handle to FP_D_Move_Btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global global_info;
if global_info.FP_D_Move_Btn == false,
    global_info.FP_D_Move_Btn = true;
end



function TP_1_Move_Location_Callback(hObject, eventdata, handles)
% hObject    handle to TP_1_Move_Location (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TP_1_Move_Location as text
%        str2double(get(hObject,'String')) returns contents of TP_1_Move_Location as a double


% --- Executes during object creation, after setting all properties.
function TP_1_Move_Location_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TP_1_Move_Location (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TP_1_Move_Amount_Callback(hObject, eventdata, handles)
% hObject    handle to TP_1_Move_Amount (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TP_1_Move_Amount as text
%        str2double(get(hObject,'String')) returns contents of TP_1_Move_Amount as a double


% --- Executes during object creation, after setting all properties.
function TP_1_Move_Amount_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TP_1_Move_Amount (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in DEALCARDS.
function DEALCARDS_Callback(hObject, eventdata, handles)
% hObject    handle to DEALCARDS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
initialdealing();


% --- Executes on button press in TP_2_Turn_Btn.
function TP_2_Turn_Btn_Callback(hObject, eventdata, handles)
% hObject    handle to TP_2_Turn_Btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in TP_2_Move_Btn.
function TP_2_Move_Btn_Callback(hObject, eventdata, handles)
% hObject    handle to TP_2_Move_Btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
