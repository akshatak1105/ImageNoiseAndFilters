function varargout = untitled2(varargin)
% UNTITLED2 MATLAB code for untitled2.fig
%      UNTITLED2, by itself, creates a new UNTITLED2 or raises the existing
%      singleton*.
%
%      H = UNTITLED2 returns the handle to a new UNTITLED2 or the handle to
%      the existing singleton*.
%
%      UNTITLED2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED2.M with the given input arguments.
%
%      UNTITLED2('Property','Value',...) creates a new UNTITLED2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled2

% Last Modified by GUIDE v2.5 24-Nov-2022 11:20:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled2_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled2_OutputFcn, ...
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


% --- Executes just before untitled2 is made visible.
function untitled2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled2 (see VARARGIN)

% Choose default command line output for untitled2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in load_image.
function load_image_Callback(hObject, eventdata, handles)
% hObject    handle to load_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=uigetfile('.jpg');
a=imread(a);
axes(handles.axes1);
imshow(a);
setappdata(0,'a',a)

% --- Executes on button press in rgb2gray.
function rgb2gray_Callback(hObject, eventdata, handles)
% hObject    handle to rgb2gray (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
agray=rgb2gray(a);
axes(handles.axes1);
imshow(agray);
setappdata(0,'agray',agray)

% --- Executes on button press in median_filter.
function median_filter_Callback(hObject, eventdata, handles)
% hObject    handle to median_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=getappdata(0,'img_noise');
filt_img=medfilt2(n);
axes(handles.axes2);
imshow(filt_img);
setappdata(0,'filt_img',filt_img);

% --- Executes on button press in gauss_filter.
function gauss_filter_Callback(hObject, eventdata, handles)
% hObject    handle to gauss_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=getappdata(0,'img_noise');
filt_img=imgaussfilt(n, 2)
axes(handles.axes2);
imshow(filt_img);
setappdata(0,'filt_img',filt_img);


% --- Executes on button press in adaptive_filter.
function adaptive_filter_Callback(hObject, eventdata, handles)
% hObject    handle to adaptive_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=getappdata(0,'img_noise');
filt_img=wiener2(n,[5 5]);
axes(handles.axes2);
imshow(filt_img);
setappdata(0,'filt_img',filt_img);


% --- Executes on button press in guided_filter.
function guided_filter_Callback(hObject, eventdata, handles)
% hObject    handle to guided_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=getappdata(0,'img_noise');
filt_img=imguidedfilter(n);
axes(handles.axes2);
imshow(filt_img);
setappdata(0,'filt_img',filt_img);


% --- Executes on button press in averag_filter.
function averag_filter_Callback(hObject, eventdata, handles)
% hObject    handle to averag_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=getappdata(0,'img_noise');
filt_img=filter2(fspecial('average',3),n)/255;
axes(handles.axes2);
imshow(filt_img);
setappdata(0,'filt_img',filt_img);

% --- Executes on button press in poisson_noise.
function poisson_noise_Callback(hObject, eventdata, handles)
% hObject    handle to poisson_noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'agray');
img_noise=imnoise(a,'poisson');
axes(handles.axes2);
imshow(img_noise);
setappdata(0,'img_noise',img_noise);


% --- Executes on button press in gaussian_noise.
function gaussian_noise_Callback(hObject, eventdata, handles)
% hObject    handle to gaussian_noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'agray');
img_noise=imnoise(a,'gaussian',0.1,0.01);
axes(handles.axes2);
imshow(img_noise);
setappdata(0,'img_noise',img_noise);


% --- Executes on button press in speckle_noise.
function speckle_noise_Callback(hObject, eventdata, handles)
% hObject    handle to speckle_noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'agray');
img_noise=imnoise(a,'speckle',0.05);
axes(handles.axes2);
imshow(img_noise);
setappdata(0,'img_noise',img_noise);

% --- Executes on button press in salt_pepper.
function salt_pepper_Callback(hObject, eventdata, handles)
% hObject    handle to salt_pepper (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'agray');
img_noise=imnoise(a,'salt & pepper',0.2);
axes(handles.axes2);
imshow(img_noise);
setappdata(0,'img_noise',img_noise);
