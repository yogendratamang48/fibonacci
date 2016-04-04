function varargout = ReceiverGUI(varargin)
% RECEIVERGUI MATLAB code for ReceiverGUI.fig
%      RECEIVERGUI, by itself, creates a new RECEIVERGUI or raises the existing
%      singleton*.
%
%      H = RECEIVERGUI returns the handle to a new RECEIVERGUI or the handle to
%      the existing singleton*.
%
%      RECEIVERGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RECEIVERGUI.M with the given input arguments.
%
%      RECEIVERGUI('Property','Value',...) creates a new RECEIVERGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ReceiverGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ReceiverGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ReceiverGUI

% Last Modified by GUIDE v2.5 14-Jun-2015 12:48:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ReceiverGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ReceiverGUI_OutputFcn, ...
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


% --- Executes just before ReceiverGUI is made visible.
function ReceiverGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ReceiverGUI (see VARARGIN)

% Choose default command line output for ReceiverGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ReceiverGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ReceiverGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function editReceive_Callback(hObject, eventdata, handles)
% hObject    handle to editReceive (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editReceive as text
%        str2double(get(hObject,'String')) returns contents of editReceive as a double


% --- Executes during object creation, after setting all properties.
function editReceive_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editReceive (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pButtonReceive.
function pButtonReceive_Callback(hObject, eventdata, handles)
% hObject    handle to pButtonReceive (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load final.mat;
set(handles.editReceive,'String', unicode);
clear all;


% --- Executes on button press in pButtonGenerateMessage.
function pButtonGenerateMessage_Callback(hObject, eventdata, handles)
% hObject    handle to pButtonGenerateMessage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
key=get(handles.edit4, 'String');
load('final.mat');
message_length=length(unicode);
key=lower(key);
key_ascii=double(key);
myFibonacci=fibonacci(message_length);
cipher=double(zeros(1, message_length));
message=double(zeros(1, message_length));
%unicode_final=char(zeros(1, message_length));
for i=1:message_length
    cipher(i)=key_ascii+myFibonacci(i)-1;
    if cipher(i)>122
        cipher(i)=cipher(i)-122+96;
    end
%     unicode(i)=3*cipher(i)+message_ascii(i);
    %unicode_final(i)=char(unicode(i));
end
assignin('base', 'cipher', cipher);
save('finalReceiver.mat', 'unicode', 'cipher');

for i=1:message_length
    message(i)=unicode(i)-3*cipher(i);
    %unicode_final(i)=char(unicode(i));
end
set(handles.editOutput, 'String', char(message));



function editOutput_Callback(hObject, eventdata, handles)
% hObject    handle to editOutput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editOutput as text
%        str2double(get(hObject,'String')) returns contents of editOutput as a double


% --- Executes during object creation, after setting all properties.
function editOutput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editOutput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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
