function varargout = project_gui(varargin)
% PROJECT_GUI MATLAB code for project_gui.fig
%      PROJECT_GUI, by itself, creates a new PROJECT_GUI or raises the existing
%      singleton*.
%
%      H = PROJECT_GUI returns the handle to a new PROJECT_GUI or the handle to
%      the existing singleton*.
%
%      PROJECT_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT_GUI.M with the given input arguments.
%
%      PROJECT_GUI('Property','Value',...) creates a new PROJECT_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before project_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to project_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help project_gui

% Last Modified by GUIDE v2.5 21-Nov-2018 13:54:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @project_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @project_gui_OutputFcn, ...
                   'gui_LayoutFcn',  @project_gui_LayoutFcn, ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
end
% End initialization code - DO NOT EDIT


% --- Executes just before project_gui is made visible.
function project_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to project_gui (see VARARGIN)

% Choose default command line output for project_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
end

% UIWAIT makes project_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = project_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end


% --- Executes on button press in b_enter.
function b_enter_Callback(hObject, eventdata, handles)
% hObject    handle to b_close (see GCBO)
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
        if num8 ==1
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
end
if num3 == 1
    run('Histogram');
end
if num4 == 1
    run('Bar');
end
if num5 == 1
    run('Box');
end
if num6 == 1
    if num1 == 1    % running the proper pie chart depending on gui option
        if num7 == 1
            if num8 ==1
                saveas('Pie_3d_exploded.jpg');
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
    end
    if num3 == 1
        run('Histogram');
    end
    if num4 == 1
        run('Bar');
    end
    if num5 == 1
        run('Box');
    end
end
end
    



% --- Executes on button press in b_close.
function b_close_Callback(hObject, eventdata, handles)
% hObject    handle to b_close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all
end

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
end


% --- Executes on button press in c_export.
function c_export_Callback(hObject, eventdata, handles)
% hObject    handle to c_export (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
state = get(hObject,'Value');
hObject.UserData = state;
% Hint: get(hObject,'Value') returns toggle state of c_export
end

% --- Executes on button press in c_scatter.
function c_scatter_Callback(hObject, eventdata, handles)
% hObject    handle to c_scatter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
state = get(hObject,'Value');
hObject.UserData = state;
% Hint: get(hObject,'Value') returns toggle state of c_scatter
end

% --- Executes on button press in c_histogram.
function c_histogram_Callback(hObject, eventdata, handles)
% hObject    handle to c_histogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of c_histogram
state = get(hObject,'Value');
hObject.UserData = state;
end

% --- Executes on button press in c_bar.
function c_bar_Callback(hObject, eventdata, handles)
% hObject    handle to c_bar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of c_bar
state = get(hObject,'Value');
hObject.UserData = state;
end

% --- Executes on button press in c_box.
function c_box_Callback(hObject, eventdata, handles)
% hObject    handle to c_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of c_box
state = get(hObject,'Value');
hObject.UserData = state;
end

% --- Executes on button press in c_pie.
function c_pie_Callback(hObject, eventdata, handles)
% hObject    handle to c_pie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of c_pie
state = get(hObject,'Value');
hObject.UserData = state;
end

% --- Executes on button press in c_3d.
function c_3d_Callback(hObject, eventdata, handles)
% hObject    handle to c_3d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of c_3d
state = get(hObject,'Value');
hObject.UserData = state;
end

% --- Executes on button press in c_exploded.
function c_exploded_Callback(hObject, eventdata, handles)
% hObject    handle to c_exploded (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of c_exploded
state = get(hObject,'Value');
hObject.UserData = state;
end

% --- Creates and returns a handle to the GUI figure. 
function h1 = project_gui_LayoutFcn(policy)
% policy - create a new figure or use a singleton. 'new' or 'reuse'.

persistent hsingleton;
if strcmpi(policy, 'reuse') & ishandle(hsingleton)
    h1 = hsingleton;
    return;
end

appdata = [];
appdata.GUIDEOptions = struct(...
    'active_h', [], ...
    'taginfo', struct(...
    'figure', 2, ...
    'text', 2, ...
    'pushbutton', 6, ...
    'checkbox', 11, ...
    'uibuttongroup', 3, ...
    'radiobutton', 11), ...
    'override', 0, ...
    'release', [], ...
    'resize', 'none', ...
    'accessibility', 'callback', ...
    'mfile', 1, ...
    'callbacks', 1, ...
    'singleton', 1, ...
    'syscolorfig', 1, ...
    'blocking', 0, ...
    'lastSavedFile', 'C:\Users\Mitchell Kleckner\Documents\MATLAB\MatLab Project\project_gui.m', ...
    'lastFilename', 'C:\Users\Mitchell Kleckner\Documents\MATLAB\MatLab Project\project_gui.fig');
appdata.lastValidTag = 'figure1';
appdata.GUIDELayoutEditor = [];
appdata.initTags = struct(...
    'handle', [], ...
    'tag', 'figure1');

h1 = figure(...
'Units','characters',...
'Position',[135.8 71.977207977208 53.1818181818182 12.4074074074074],...
'Visible',get(0,'defaultfigureVisible'),...
'Color',get(0,'defaultfigureColor'),...
'IntegerHandle','off',...
'MenuBar','none',...
'Name','project_gui',...
'NumberTitle','off',...
'Tag','figure1',...
'Resize','off',...
'PaperPosition',get(0,'defaultfigurePaperPosition'),...
'ScreenPixelsPerInchMode','manual',...
'HandleVisibility','callback',...
'CreateFcn', {@local_CreateFcn, blanks(0), appdata} );

appdata = [];
appdata.lastValidTag = 'b_enter';

h2 = uicontrol(...
'Parent',h1,...
'FontUnits',get(0,'defaultuicontrolFontUnits'),...
'Units','characters',...
'String','Enter',...
'Style',get(0,'defaultuicontrolStyle'),...
'Position',[2.18181818181818 1.24786324786325 11.7272727272727 1.55555555555556],...
'Callback',@(hObject,eventdata)project_gui('b_enter_Callback',hObject,eventdata,guidata(hObject)),...
'Children',[],...
'Tag','b_enter',...
'CreateFcn', {@local_CreateFcn, blanks(0), appdata} );

appdata = [];
appdata.lastValidTag = 'b_close';

h3 = uicontrol(...
'Parent',h1,...
'FontUnits',get(0,'defaultuicontrolFontUnits'),...
'Units','characters',...
'String','Close',...
'Style',get(0,'defaultuicontrolStyle'),...
'Position',[20.3636363636364 1.24786324786325 11.7272727272727 1.55555555555556],...
'Callback',@(hObject,eventdata)project_gui('b_close_Callback',hObject,eventdata,guidata(hObject)),...
'Children',[],...
'CreateFcn', {@local_CreateFcn, blanks(0), appdata} ,...
'Tag','b_close');

appdata = [];
appdata.lastValidTag = 'b_reset';

h4 = uicontrol(...
'Parent',h1,...
'FontUnits',get(0,'defaultuicontrolFontUnits'),...
'Units','characters',...
'String','Reset',...
'Style',get(0,'defaultuicontrolStyle'),...
'Position',[38.5454545454545 1.24786324786325 11.7272727272727 1.55555555555556],...
'Callback',@(hObject,eventdata)project_gui('b_reset_Callback',hObject,eventdata,guidata(hObject)),...
'Children',[],...
'ButtonDownFcn',blanks(0),...
'CreateFcn', {@local_CreateFcn, blanks(0), appdata} ,...
'DeleteFcn',blanks(0),...
'Tag','b_reset',...
'KeyPressFcn',blanks(0));

appdata = [];
appdata.lastValidTag = 'c_export';

h5 = uicontrol(...
'Parent',h1,...
'FontUnits',get(0,'defaultuicontrolFontUnits'),...
'Units','characters',...
'String','Export to .jpg',...
'Style','checkbox',...
'Position',[38.5454545454545 2.80341880341881 18.2727272727273 1.44444444444444],...
'Callback',@(hObject,eventdata)project_gui('c_export_Callback',hObject,eventdata,guidata(hObject)),...
'Children',[],...
'CreateFcn', {@local_CreateFcn, blanks(0), appdata} ,...
'Tag','c_export');

appdata = [];
appdata.lastValidTag = 'c_scatter';

h6 = uicontrol(...
'Parent',h1,...
'FontUnits',get(0,'defaultuicontrolFontUnits'),...
'Units','characters',...
'String','Scatter Plot',...
'Style','checkbox',...
'Position',[38.5454545454545 10.2108262108262 14.8181818181818 1.44444444444444],...
'Callback',@(hObject,eventdata)project_gui('c_scatter_Callback',hObject,eventdata,guidata(hObject)),...
'Children',[],...
'ButtonDownFcn',blanks(0),...
'CreateFcn', {@local_CreateFcn, blanks(0), appdata} ,...
'DeleteFcn',blanks(0),...
'Tag','c_scatter',...
'KeyPressFcn',blanks(0));

appdata = [];
appdata.lastValidTag = 'c_histogram';

h7 = uicontrol(...
'Parent',h1,...
'FontUnits',get(0,'defaultuicontrolFontUnits'),...
'Units','characters',...
'String','Histogram',...
'Style','checkbox',...
'Position',[20.3636363636364 10.2108262108262 12.0909090909091 1.44444444444444],...
'Callback',@(hObject,eventdata)project_gui('c_histogram_Callback',hObject,eventdata,guidata(hObject)),...
'Children',[],...
'ButtonDownFcn',blanks(0),...
'CreateFcn', {@local_CreateFcn, blanks(0), appdata} ,...
'DeleteFcn',blanks(0),...
'Tag','c_histogram',...
'KeyPressFcn',blanks(0));

appdata = [];
appdata.lastValidTag = 'c_bar';

h8 = uicontrol(...
'Parent',h1,...
'FontUnits',get(0,'defaultuicontrolFontUnits'),...
'Units','characters',...
'String','Bar Graph',...
'Style','checkbox',...
'Position',[20.3636363636364 6.50712250712251 12.0909090909091 1.44444444444444],...
'Callback',@(hObject,eventdata)project_gui('c_bar_Callback',hObject,eventdata,guidata(hObject)),...
'Children',[],...
'ButtonDownFcn',blanks(0),...
'CreateFcn', {@local_CreateFcn, blanks(0), appdata} ,...
'DeleteFcn',blanks(0),...
'Tag','c_bar',...
'KeyPressFcn',blanks(0));

appdata = [];
appdata.lastValidTag = 'c_box';

h9 = uicontrol(...
'Parent',h1,...
'FontUnits',get(0,'defaultuicontrolFontUnits'),...
'Units','characters',...
'String','Box Plot',...
'Style','checkbox',...
'Position',[38.5454545454545 6.50712250712251 12.0909090909091 1.44444444444444],...
'Callback',@(hObject,eventdata)project_gui('c_box_Callback',hObject,eventdata,guidata(hObject)),...
'Children',[],...
'ButtonDownFcn',blanks(0),...
'CreateFcn', {@local_CreateFcn, blanks(0), appdata} ,...
'DeleteFcn',blanks(0),...
'Tag','c_box',...
'KeyPressFcn',blanks(0));

appdata = [];
appdata.lastValidTag = 'c_pie';

h10 = uicontrol(...
'Parent',h1,...
'FontUnits',get(0,'defaultuicontrolFontUnits'),...
'Units','characters',...
'String','Pie Chart',...
'Style','checkbox',...
'Position',[2.18181818181818 10.2108262108262 12.0909090909091 1.2962962962963],...
'Callback',@(hObject,eventdata)project_gui('c_pie_Callback',hObject,eventdata,guidata(hObject)),...
'Children',[],...
'Tag','c_pie',...
'CreateFcn', {@local_CreateFcn, blanks(0), appdata} );

appdata = [];
appdata.lastValidTag = 'c_3d';

h11 = uicontrol(...
'Parent',h1,...
'FontUnits',get(0,'defaultuicontrolFontUnits'),...
'Units','characters',...
'String','3D',...
'Style','checkbox',...
'Position',[6 8.66666666666667 12.0909090909091 1.2962962962963],...
'Callback',@(hObject,eventdata)project_gui('c_3d_Callback',hObject,eventdata,guidata(hObject)),...
'Children',[],...
'CreateFcn', {@local_CreateFcn, blanks(0), appdata} ,...
'Tag','c_3d');

appdata = [];
appdata.lastValidTag = 'c_exploded';

h12 = uicontrol(...
'Parent',h1,...
'FontUnits',get(0,'defaultuicontrolFontUnits'),...
'Units','characters',...
'String','Exploded',...
'Style','checkbox',...
'Position',[6 7.37037037037037 12.0909090909091 1.2962962962963],...
'Callback',@(hObject,eventdata)project_gui('c_exploded_Callback',hObject,eventdata,guidata(hObject)),...
'Children',[],...
'ButtonDownFcn',blanks(0),...
'CreateFcn', {@local_CreateFcn, blanks(0), appdata} ,...
'DeleteFcn',blanks(0),...
'Tag','c_exploded',...
'KeyPressFcn',blanks(0));


hsingleton = h1;
end

% --- Set application data first then calling the CreateFcn. 
function local_CreateFcn(hObject, eventdata, createfcn, appdata)

if ~isempty(appdata)
   names = fieldnames(appdata);
   for i=1:length(names)
       name = char(names(i));
       setappdata(hObject, name, getfield(appdata,name));
   end
end

if ~isempty(createfcn)
   if isa(createfcn,'function_handle')
       createfcn(hObject, eventdata);
   else
       eval(createfcn);
   end
end
end

% --- Handles default GUIDE GUI creation and callback dispatch
function varargout = gui_mainfcn(gui_State, varargin)

gui_StateFields =  {'gui_Name'
    'gui_Singleton'
    'gui_OpeningFcn'
    'gui_OutputFcn'
    'gui_LayoutFcn'
    'gui_Callback'};
gui_Mfile = '';
for i=1:length(gui_StateFields)
    if ~isfield(gui_State, gui_StateFields{i})
        error(message('MATLAB:guide:StateFieldNotFound', gui_StateFields{ i }, gui_Mfile));
    elseif isequal(gui_StateFields{i}, 'gui_Name')
        gui_Mfile = [gui_State.(gui_StateFields{i}), '.m'];
    end
end

numargin = length(varargin);

if numargin == 0
    % PROJECT_GUI
    % create the GUI only if we are not in the process of loading it
    % already
    gui_Create = true;
elseif local_isInvokeActiveXCallback(gui_State, varargin{:})
    % PROJECT_GUI(ACTIVEX,...)
    vin{1} = gui_State.gui_Name;
    vin{2} = [get(varargin{1}.Peer, 'Tag'), '_', varargin{end}];
    vin{3} = varargin{1};
    vin{4} = varargin{end-1};
    vin{5} = guidata(varargin{1}.Peer);
    feval(vin{:});
    return;
elseif local_isInvokeHGCallback(gui_State, varargin{:})
    % PROJECT_GUI('CALLBACK',hObject,eventData,handles,...)
    gui_Create = false;
else
    % PROJECT_GUI(...)
    % create the GUI and hand varargin to the openingfcn
    gui_Create = true;
end

if ~gui_Create
    % In design time, we need to mark all components possibly created in
    % the coming callback evaluation as non-serializable. This way, they
    % will not be brought into GUIDE and not be saved in the figure file
    % when running/saving the GUI from GUIDE.
    designEval = false;
    if (numargin>1 && ishghandle(varargin{2}))
        fig = varargin{2};
        while ~isempty(fig) && ~ishghandle(fig,'figure')
            fig = get(fig,'parent');
        end
        
        designEval = isappdata(0,'CreatingGUIDEFigure') || (isscalar(fig)&&isprop(fig,'GUIDEFigure'));
    end
        
    if designEval
        beforeChildren = findall(fig);
    end
    
    % evaluate the callback now
    varargin{1} = gui_State.gui_Callback;
    if nargout
        [varargout{1:nargout}] = feval(varargin{:});
    else       
        feval(varargin{:});
    end
    
    % Set serializable of objects created in the above callback to off in
    % design time. Need to check whether figure handle is still valid in
    % case the figure is deleted during the callback dispatching.
    if designEval && ishghandle(fig)
        set(setdiff(findall(fig),beforeChildren), 'Serializable','off');
    end
else
    if gui_State.gui_Singleton
        gui_SingletonOpt = 'reuse';
    else
        gui_SingletonOpt = 'new';
    end

    % Check user passing 'visible' P/V pair first so that its value can be
    % used by oepnfig to prevent flickering
    gui_Visible = 'auto';
    gui_VisibleInput = '';
    for index=1:2:length(varargin)
        if length(varargin) == index || ~ischar(varargin{index})
            break;
        end

        % Recognize 'visible' P/V pair
        len1 = min(length('visible'),length(varargin{index}));
        len2 = min(length('off'),length(varargin{index+1}));
        if ischar(varargin{index+1}) && strncmpi(varargin{index},'visible',len1) && len2 > 1
            if strncmpi(varargin{index+1},'off',len2)
                gui_Visible = 'invisible';
                gui_VisibleInput = 'off';
            elseif strncmpi(varargin{index+1},'on',len2)
                gui_Visible = 'visible';
                gui_VisibleInput = 'on';
            end
        end
    end
    
    % Open fig file with stored settings.  Note: This executes all component
    % specific CreateFunctions with an empty HANDLES structure.

    
    % Do feval on layout code in m-file if it exists
    gui_Exported = ~isempty(gui_State.gui_LayoutFcn);
    % this application data is used to indicate the running mode of a GUIDE
    % GUI to distinguish it from the design mode of the GUI in GUIDE. it is
    % only used by actxproxy at this time.   
    setappdata(0,genvarname(['OpenGuiWhenRunning_', gui_State.gui_Name]),1);
    if gui_Exported
        gui_hFigure = feval(gui_State.gui_LayoutFcn, gui_SingletonOpt);

        % make figure invisible here so that the visibility of figure is
        % consistent in OpeningFcn in the exported GUI case
        if isempty(gui_VisibleInput)
            gui_VisibleInput = get(gui_hFigure,'Visible');
        end
        set(gui_hFigure,'Visible','off')

        % openfig (called by local_openfig below) does this for guis without
        % the LayoutFcn. Be sure to do it here so guis show up on screen.
        movegui(gui_hFigure,'onscreen');
    else
        gui_hFigure = local_openfig(gui_State.gui_Name, gui_SingletonOpt, gui_Visible);
        % If the figure has InGUIInitialization it was not completely created
        % on the last pass.  Delete this handle and try again.
        if isappdata(gui_hFigure, 'InGUIInitialization')
            delete(gui_hFigure);
            gui_hFigure = local_openfig(gui_State.gui_Name, gui_SingletonOpt, gui_Visible);
        end
    end
    if isappdata(0, genvarname(['OpenGuiWhenRunning_', gui_State.gui_Name]))
        rmappdata(0,genvarname(['OpenGuiWhenRunning_', gui_State.gui_Name]));
    end

    % Set flag to indicate starting GUI initialization
    setappdata(gui_hFigure,'InGUIInitialization',1);

    % Fetch GUIDE Application options
    gui_Options = getappdata(gui_hFigure,'GUIDEOptions');
    % Singleton setting in the GUI MATLAB code file takes priority if different
    gui_Options.singleton = gui_State.gui_Singleton;

    if ~isappdata(gui_hFigure,'GUIOnScreen')
        % Adjust background color
        if gui_Options.syscolorfig
            set(gui_hFigure,'Color', get(0,'DefaultUicontrolBackgroundColor'));
        end

        % Generate HANDLES structure and store with GUIDATA. If there is
        % user set GUI data already, keep that also.
        data = guidata(gui_hFigure);
        handles = guihandles(gui_hFigure);
        if ~isempty(handles)
            if isempty(data)
                data = handles;
            else
                names = fieldnames(handles);
                for k=1:length(names)
                    data.(char(names(k)))=handles.(char(names(k)));
                end
            end
        end
        guidata(gui_hFigure, data);
    end

    % Apply input P/V pairs other than 'visible'
    for index=1:2:length(varargin)
        if length(varargin) == index || ~ischar(varargin{index})
            break;
        end

        len1 = min(length('visible'),length(varargin{index}));
        if ~strncmpi(varargin{index},'visible',len1)
            try set(gui_hFigure, varargin{index}, varargin{index+1}), catch break, end
        end
    end

    % If handle visibility is set to 'callback', turn it on until finished
    % with OpeningFcn
    gui_HandleVisibility = get(gui_hFigure,'HandleVisibility');
    if strcmp(gui_HandleVisibility, 'callback')
        set(gui_hFigure,'HandleVisibility', 'on');
    end

    feval(gui_State.gui_OpeningFcn, gui_hFigure, [], guidata(gui_hFigure), varargin{:});

    if isscalar(gui_hFigure) && ishghandle(gui_hFigure)
        % Handle the default callbacks of predefined toolbar tools in this
        % GUI, if any
        guidemfile('restoreToolbarToolPredefinedCallback',gui_hFigure); 
        
        % Update handle visibility
        set(gui_hFigure,'HandleVisibility', gui_HandleVisibility);

        % Call openfig again to pick up the saved visibility or apply the
        % one passed in from the P/V pairs
        if ~gui_Exported
            gui_hFigure = local_openfig(gui_State.gui_Name, 'reuse',gui_Visible);
        elseif ~isempty(gui_VisibleInput)
            set(gui_hFigure,'Visible',gui_VisibleInput);
        end
        if strcmpi(get(gui_hFigure, 'Visible'), 'on')
            figure(gui_hFigure);
            
            if gui_Options.singleton
                setappdata(gui_hFigure,'GUIOnScreen', 1);
            end
        end

        % Done with GUI initialization
        if isappdata(gui_hFigure,'InGUIInitialization')
            rmappdata(gui_hFigure,'InGUIInitialization');
        end

        % If handle visibility is set to 'callback', turn it on until
        % finished with OutputFcn
        gui_HandleVisibility = get(gui_hFigure,'HandleVisibility');
        if strcmp(gui_HandleVisibility, 'callback')
            set(gui_hFigure,'HandleVisibility', 'on');
        end
        gui_Handles = guidata(gui_hFigure);
    else
        gui_Handles = [];
    end

    if nargout
        [varargout{1:nargout}] = feval(gui_State.gui_OutputFcn, gui_hFigure, [], gui_Handles);
    else
        feval(gui_State.gui_OutputFcn, gui_hFigure, [], gui_Handles);
    end

    if isscalar(gui_hFigure) && ishghandle(gui_hFigure)
        set(gui_hFigure,'HandleVisibility', gui_HandleVisibility);
    end
end
end

function gui_hFigure = local_openfig(name, singleton, visible)

% openfig with three arguments was new from R13. Try to call that first, if
% failed, try the old openfig.
if nargin('openfig') == 2
    % OPENFIG did not accept 3rd input argument until R13,
    % toggle default figure visible to prevent the figure
    % from showing up too soon.
    gui_OldDefaultVisible = get(0,'defaultFigureVisible');
    set(0,'defaultFigureVisible','off');
    gui_hFigure = matlab.hg.internal.openfigLegacy(name, singleton);
    set(0,'defaultFigureVisible',gui_OldDefaultVisible);
else
    % Call version of openfig that accepts 'auto' option"
    gui_hFigure = matlab.hg.internal.openfigLegacy(name, singleton, visible);  
%     %workaround for CreateFcn not called to create ActiveX
%         peers=findobj(findall(allchild(gui_hFigure)),'type','uicontrol','style','text');    
%         for i=1:length(peers)
%             if isappdata(peers(i),'Control')
%                 actxproxy(peers(i));
%             end            
%         end
end
end

function result = local_isInvokeActiveXCallback(gui_State, varargin)

try
    result = ispc && iscom(varargin{1}) ...
             && isequal(varargin{1},gcbo);
catch
    result = false;
end
end

function result = local_isInvokeHGCallback(gui_State, varargin)

try
    fhandle = functions(gui_State.gui_Callback);
    result = ~isempty(findstr(gui_State.gui_Name,fhandle.file)) || ...
             (ischar(varargin{1}) ...
             && isequal(ishghandle(varargin{2}), 1) ...
             && (~isempty(strfind(varargin{1},[get(varargin{2}, 'Tag'), '_'])) || ...
                ~isempty(strfind(varargin{1}, '_CreateFcn'))) );
catch
    result = false;
end
end

