function varargout = player_GUI(varargin)
% Last Modified by GUIDE v2.5 07-Nov-2017 18:47:57

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
global_info.TP_2_Turn_Btn = false;
global_info.TP_2_Move_Btn = false;
global_info.TP_3_Turn_Btn = false;
global_info.TP_3_Move_Btn = false;
global_info.TP_4_Turn_Btn = false;
global_info.TP_4_Move_Btn = false;
global_info.TP_5_Turn_Btn = false;
global_info.TP_5_Move_Btn = false;
global_info.TP_6_Turn_Btn = false;
global_info.TP_6_Move_Btn = false;
global_info.TP_7_Turn_Btn = false;
global_info.TP_7_Move_Btn = false;

global_info.FP_C_Move_Btn = false;
global_info.FP_D_Move_Btn = false;
global_info.FP_H_Move_Btn = false;
global_info.FP_S_Move_Btn = false;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes player_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = player_GUI_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;

% --- Executes on button press in STOPSIM.
function STOPSIM_Callback(hObject, eventdata, handles)
global global_info;
global_info.STOP_SIMULATION = 1;

% --- Executes on button press in TOGGLEBOT.
function TOGGLEBOT_Callback(hObject, eventdata, handles)
global global_info;
global_info.BOT_ENABLED = ~global_info.BOT_ENABLED;

% --- Executes on button press in DP_Turn_Btn.
function DP_Turn_Btn_Callback(hObject, eventdata, handles)
global global_info;
if global_info.DP_Turn_Btn == false,
    global_info.DP_Turn_Btn = true;
end

% --- Executes on button press in DP_Move_Btn.
function DP_Move_Btn_Callback(hObject, eventdata, handles)
global global_info;
if global_info.DP_Move_Btn == false,
    global_info.DP_Move_Btn = true;
end

% --- Executes on button press in FP_C_Move_Btn.
function FP_C_Move_Btn_Callback(hObject, eventdata, handles)
global global_info;
if global_info.FP_C_Move_Btn == false,
    global_info.FP_C_Move_Btn = true;
end

% --- Executes on button press in FP_D_Move_Btn.
function FP_D_Move_Btn_Callback(hObject, eventdata, handles)
global global_info;
if global_info.FP_D_Move_Btn == false,
    global_info.FP_D_Move_Btn = true;
end

% --- Executes on button press in FP_H_Move_Btn.
function FP_H_Move_Btn_Callback(hObject, eventdata, handles)
global global_info;
if global_info.FP_H_Move_Btn == false,
    global_info.FP_H_Move_Btn = true;
end

% --- Executes on button press in FP_S_Move_Btn.
function FP_S_Move_Btn_Callback(hObject, eventdata, handles)
global global_info;
if global_info.FP_S_Move_Btn == false,
    global_info.FP_S_Move_Btn = true;
end

% --- Executes on button press in TP_1_Turn_Btn.
function TP_1_Turn_Btn_Callback(hObject, eventdata, handles)
global global_info;
if global_info.TP_1_Turn_Btn == false,
    global_info.TP_1_Turn_Btn = true;
end

% --- Executes on button press in TP_1_Move_Btn.
function TP_1_Move_Btn_Callback(hObject, eventdata, handles)
global global_info;
if global_info.TP_1_Move_Btn == false,
    global_info.TP_1_Move_Btn = true;
end

% --- Executes on button press in TP_2_Turn_Btn.
function TP_2_Turn_Btn_Callback(hObject, eventdata, handles)
global global_info;
if global_info.TP_2_Turn_Btn == false,
    global_info.TP_2_Turn_Btn = true;
end

% --- Executes on button press in TP_2_Move_Btn.
function TP_2_Move_Btn_Callback(hObject, eventdata, handles)
global global_info;
if global_info.TP_2_Move_Btn == false,
    global_info.TP_2_Move_Btn = true;
end

% --- Executes on button press in TP_3_Turn_Btn.
function TP_3_Turn_Btn_Callback(hObject, eventdata, handles)
global global_info;
if global_info.TP_3_Turn_Btn == false,
    global_info.TP_3_Turn_Btn = true;
end

% --- Executes on button press in TP_3_Move_Btn.
function TP_3_Move_Btn_Callback(hObject, eventdata, handles)
global global_info;
if global_info.TP_3_Move_Btn == false,
    global_info.TP_3_Move_Btn = true;
end

% --- Executes on button press in TP_4_Turn_Btn.
function TP_4_Turn_Btn_Callback(hObject, eventdata, handles)
global global_info;
if global_info.TP_4_Turn_Btn == false,
    global_info.TP_4_Turn_Btn = true;
end

% --- Executes on button press in TP_4_Move_Btn.
function TP_4_Move_Btn_Callback(hObject, eventdata, handles)
global global_info;
if global_info.TP_4_Move_Btn == false,
    global_info.TP_4_Move_Btn = true;
end

% --- Executes on button press in TP_5_Turn_Btn.
function TP_5_Turn_Btn_Callback(hObject, eventdata, handles)
global global_info;
if global_info.TP_5_Turn_Btn == false,
    global_info.TP_5_Turn_Btn = true;
end

% --- Executes on button press in TP_5_Move_Btn.
function TP_5_Move_Btn_Callback(hObject, eventdata, handles)
global global_info;
if global_info.TP_5_Move_Btn == false,
    global_info.TP_5_Move_Btn = true;
end

% --- Executes on button press in TP_6_Turn_Btn.
function TP_6_Turn_Btn_Callback(hObject, eventdata, handles)
global global_info;
if global_info.TP_6_Turn_Btn == false,
    global_info.TP_6_Turn_Btn = true;
end

% --- Executes on button press in TP_6_Move_Btn.
function TP_6_Move_Btn_Callback(hObject, eventdata, handles)
global global_info;
if global_info.TP_6_Move_Btn == false,
    global_info.TP_6_Move_Btn = true;
end

% --- Executes on button press in TP_7_Turn_Btn.
function TP_7_Turn_Btn_Callback(hObject, eventdata, handles)
global global_info;
if global_info.TP_7_Turn_Btn == false,
    global_info.TP_7_Turn_Btn = true;
end

% --- Executes on button press in TP_7_Move_Btn.
function TP_7_Move_Btn_Callback(hObject, eventdata, handles)
global global_info;
if global_info.TP_7_Move_Btn == false,
    global_info.TP_7_Move_Btn = true;
end
