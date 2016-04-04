function varargout = SanchitaTest(varargin)
% SANCHITATEST MATLAB code for SanchitaTest.fig
%      SANCHITATEST, by itself, creates a new SANCHITATEST or raises the existing
%      singleton*.
%
%      H = SANCHITATEST returns the handle to a new SANCHITATEST or the handle to
%      the existing singleton*.
%
%      SANCHITATEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SANCHITATEST.M with the given input arguments.
%
%      SANCHITATEST('Property','Value',...) creates a new SANCHITATEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SanchitaTest_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SanchitaTest_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SanchitaTest

% Last Modified by GUIDE v2.5 13-Jun-2015 21:40:24

% Begin initialization code - DO NOT EDIT
% global message;
% global message_ascii;
% global key;
% global key_ascii;
% global cipher;
% global unicode;
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SanchitaTest_OpeningFcn, ...
                   'gui_OutputFcn',  @SanchitaTest_OutputFcn, ...
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


% --- Executes just before SanchitaTest is made visible.
function SanchitaTest_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SanchitaTest (see VARARGIN)
set(handles.editMessage, 'String', '');
set(handles.editKey, 'String', '');
set(handles.editCipher, 'String', '');
set(handles.editASCII, 'String', '');
% Choose default command line output for SanchitaTest
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SanchitaTest wait for user response (see UIRESUME)
% uiwait(handles.sender);


% --- Outputs from this function are returned to the command line.
function varargout = SanchitaTest_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function editMessage_Callback(hObject, eventdata, handles)
% hObject    handle to editMessage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editMessage as text
%        str2double(get(hObject,'String')) returns contents of editMessage as a double


% --- Executes during object creation, after setting all properties.
function editMessage_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editMessage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pButtonCipher.
function pButtonCipher_Callback(hObject, eventdata, handles)
% hObject    handle to pButtonCipher (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
message=get(handles.editMessage, 'String');
message=upper(message);
message_length=length(message);
message_ascii=double(message);
key=get(handles.editKey, 'String');
key=lower(key);
key_ascii=double(key);
myFibonacci=fibonacci(message_length);
cipher=double(zeros(1, message_length));
unicode=double(zeros(1, message_length));
%unicode_final=char(zeros(1, message_length));
for i=1:message_length
    cipher(i)=key_ascii+myFibonacci(i)-1;
    if cipher(i)>122
        cipher(i)=cipher(i)-122+96;
    end
    unicode(i)=3*cipher(i)+message_ascii(i);
    %unicode_final(i)=char(unicode(i));
end
assignin('base', 'unicode', unicode);
s=char(unicode);

% save('final.mat', 'unicode', 's');
set(handles.editCipher, 'String', char(cipher));
set(handles.editASCII, 'String', unicode);
set(handles.editFinalUnicode, 'String', s);

% uni_final=char(unicode);





function editKey_Callback(hObject, eventdata, handles)
% hObject    handle to editKey (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editKey as text
%        str2double(get(hObject,'String')) returns contents of editKey as a double


% --- Executes during object creation, after setting all properties.
function editKey_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editKey (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editCipher_Callback(hObject, eventdata, handles)
% hObject    handle to editCipher (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editCipher as text
%        str2double(get(hObject,'String')) returns contents of editCipher as a double


% --- Executes during object creation, after setting all properties.
function editCipher_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editCipher (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pButtonASCII.
function pButtonASCII_Callback(hObject, eventdata, handles)
% hObject    handle to pButtonASCII (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function editASCII_Callback(hObject, eventdata, handles)
% hObject    handle to editASCII (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editASCII as text
%        str2double(get(hObject,'String')) returns contents of editASCII as a double


% --- Executes during object creation, after setting all properties.
function editASCII_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editASCII (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pButtonSend.
function pButtonSend_Callback(hObject, eventdata, handles)
% hObject    handle to pButtonSend (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
unicode=evalin('base', 'unicode');
save 'final.mat' unicode ;
ReceiverGUI;



function editFinalUnicode_Callback(hObject, eventdata, handles)
% hObject    handle to editFinalUnicode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editFinalUnicode as text
%        str2double(get(hObject,'String')) returns contents of editFinalUnicode as a double


% --- Executes during object creation, after setting all properties.
function editFinalUnicode_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editFinalUnicode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
