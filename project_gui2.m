function varargout = project_gui2(varargin)
%PROJECT_GUI2 MATLAB code file for project_gui2.fig
%      PROJECT_GUI2, by itself, creates a new PROJECT_GUI2 or raises the existing
%      singleton*.
%
%      H = PROJECT_GUI2 returns the handle to a new PROJECT_GUI2 or the handle to
%      the existing singleton*.
%
%      PROJECT_GUI2('Property','Value',...) creates a new PROJECT_GUI2 using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to project_gui2_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      PROJECT_GUI2('CALLBACK') and PROJECT_GUI2('CALLBACK',hObject,...) call the
%      local function named CALLBACK in PROJECT_GUI2.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help project_gui2

% Last Modified by GUIDE v2.5 29-Nov-2018 20:21:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @project_gui2_OpeningFcn, ...
                   'gui_OutputFcn',  @project_gui2_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before project_gui2 is made visible.
function project_gui2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for project_gui2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes project_gui2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = project_gui2_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in b_enter.
function b_enter_Callback(hObject, eventdata, handles)
% hObject    handle to b_enter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n1_item = findobj('Tag','c_pie');
num1 = get(n1_item,'UserData');

n2_item = findobj('Tag','c_scatter');
num2 = get(n2_item,'UserData');

n3_item = findobj('Tag','c_histogram');
num3 = get(n3_item,'UserData');

n4_item = findobj('Tag','c_bar');
num4 = get(n4_item,'UserData');

n5_item = findobj('Tag','c_box');
num5 = get(n5_item,'UserData');

n6_item = findobj('Tag','c_export');
num6 = get(n6_item,'UserData');

n7_item = findobj('Tag','c_3d');
num7 = get(n7_item,'UserData');

n8_item = findobj('Tag','c_exploded');
num8 = get(n8_item,'UserData');

if num1 == 1    % running the proper pie chart depending on gui option
    if num7 == 1
        if num8 == 1
            run('Pie_3d_exploded');
        else
            run('Pie_3d');
        end
    else
        if num8 == 1
            run('Pie_2d_exploded');
        else
            run('Pie_2d');
        end
    end
end
if num2 == 1
    run('Scatter');
    if num6 == 1    
        saveas(ScatterPlot,'Scatter.jpg');
    end
end
if num3 == 1
    run('Histogram');
end
if num4 == 1
    run('Bar');
    if num6 == 1
        saveas(BarGraph,'Bar.jpg');
    end
end
if num5 == 1
    run('Box');
end

% --- Executes on button press in b_close.
function b_close_Callback(hObject, eventdata, handles)
% hObject    handle to b_close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all

% --- Executes on button press in b_reset.
function b_reset_Callback(hObject, eventdata, handles)
% hObject    handle to b_reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(project_gui, 'HandleVisibility', 'off');
close all;
set(project_gui, 'HandleVisibility', 'on');
n1_item = findobj('Tag','c_pie');
n2_item = findobj('Tag','c_scatter');
n3_item = findobj('Tag','c_histogram');
n4_item = findobj('Tag','c_bar');
n5_item = findobj('Tag','c_box');
n6_item = findobj('Tag','c_export');
n7_item = findobj('Tag','c_3d');
n8_item = findobj('Tag','c_exploded');
n1_item.Value = 0;
n2_item.Value = 0;
n3_item.Value = 0;
n4_item.Value = 0;
n5_item.Value = 0;
n6_item.Value = 0;
n7_item.Value = 0;
n8_item.Value = 0;
n1_item.UserData = 0;
n2_item.UserData = 0;
n3_item.UserData = 0;
n4_item.UserData = 0;
n5_item.UserData = 0;
n6_item.UserData = 0;
n7_item.UserData = 0;
n8_item.UserData = 0;


% --- Executes on button press in c_export.
function c_export_Callback(hObject, eventdata, handles)
% hObject    handle to c_export (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
state = get(hObject,'Value');
hObject.UserData = state;

% Hint: get(hObject,'Value') returns toggle state of c_export


% --- Executes on button press in c_scatter.
function c_scatter_Callback(hObject, eventdata, handles)
% hObject    handle to c_scatter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
state = get(hObject,'Value');
hObject.UserData = state;

% Hint: get(hObject,'Value') returns toggle state of c_scatter


% --- Executes on button press in c_histogram.
function c_histogram_Callback(hObject, eventdata, handles)
% hObject    handle to c_histogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
state = get(hObject,'Value');
hObject.UserData = state;

% Hint: get(hObject,'Value') returns toggle state of c_histogram


% --- Executes on button press in c_bar.
function c_bar_Callback(hObject, eventdata, handles)
% hObject    handle to c_bar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
state = get(hObject,'Value');
hObject.UserData = state;

% Hint: get(hObject,'Value') returns toggle state of c_bar


% --- Executes on button press in c_maps.
function c_maps_Callback(hObject, eventdata, handles)
% hObject    handle to c_maps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
state = get(hObject,'Value');
hObject.UserData = state;

% Hint: get(hObject,'Value') returns toggle state of c_maps


% --- Executes on button press in c_pie.
function c_pie_Callback(hObject, eventdata, handles)
% hObject    handle to c_pie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of c_pie


% --- Executes on button press in c_3d.
function c_3d_Callback(hObject, eventdata, handles)
% hObject    handle to c_3d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
state = get(hObject,'Value');
hObject.UserData = state;

% Hint: get(hObject,'Value') returns toggle state of c_3d


% --- Executes on button press in c_exploded.
function c_exploded_Callback(hObject, eventdata, handles)
% hObject    handle to c_exploded (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
state = get(hObject,'Value');
hObject.UserData = state;

% Hint: get(hObject,'Value') returns toggle state of c_exploded
