function varargout = metrix(varargin)
% METRIX MATLAB code for metrix.fig
%      METRIX, by itself, creates a new METRIX or raises the existing
%      singleton*.
%
%      H = METRIX returns the handle to a new METRIX or the handle to
%      the existing singleton*.
%
%      METRIX('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in METRIX.M with the given input arguments.
%
%      METRIX('Property','Value',...) creates a new METRIX or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before metrix_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to metrix_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help metrix

% Last Modified by GUIDE v2.5 14-Mar-2015 21:38:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @metrix_OpeningFcn, ...
                   'gui_OutputFcn',  @metrix_OutputFcn, ...
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


% --- Executes just before metrix is made visible.
function metrix_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to metrix (see VARARGIN)

% Choose default command line output for metrix
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes metrix wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = metrix_OutputFcn(hObject, eventdata, handles) 
   set(gcf,'WindowButtonMotionFcn','');
   global origin theta;
   origin=[0 0 0.5];
   theta=-45;
   drawMetrix;
   randomstepList;
   global stepList;
   for i=1:10
       a = stepList(i,1);
       b = stepList(i,2);
       if a == 1
           for j = 1:b
               rotate1;
               pause(0.1);
           end
       elseif a == 2
           for j = 1:b
               rotate2;
               pause(0.1);
           end
       elseif a == 3
           for j = 1:b
               rotate3;
               pause(0.1);
           end
       elseif a == 4
           for j = 1:b
               rotate4;
               pause(0.1);
           end
       elseif a == 5
           for j = 1:b
               rotate5;
               pause(0.1);
           end
       else
           for j = 1:b
               rotate6;
               pause(0.1);
           end
       end
   end
%    rotate3;
%    pause(0.5);
%    rotate5;
%    pause(0.1);
%    rotate4;
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
           

% Get default command line output from handles structure
varargout{1} = handles.output;

function drawMetrix
    global h H direct origin theta;
    [y,fs,bits]=wavread('music.wav');
    x=[-0.5 +0.5 +0.5 -0.5 -0.5 -0.5;
       +0.5 +0.5 -0.5 -0.5 +0.5 +0.5; 
       +0.5 +0.5 -0.5 -0.5 +0.5 +0.5;
       -0.5 +0.5 +0.5 -0.5 -0.5 -0.5]; 
    y=[-0.5 -0.5 +0.5 -0.5 -0.5 -0.5;
       -0.5 +0.5 +0.5 +0.5 -0.5 -0.5;
       -0.5 +0.5 +0.5 +0.5 +0.5 +0.5;
       -0.5 -0.5 +0.5 -0.5 +0.5 +0.5]; 
    z=[0 0 0 0 0 1;
       0 0 0 0 0 1;
       1 1 1 1 0 1;
       1 1 1 1 0 1];
    Orgcell1=[1 0 1    0  1 1 ];
    Orgcell2=[0 0 0.46 1  1 1];
    Orgcell3=[0 1 0    0  0 1 ];
    Org1(:,1)=Orgcell1;
    Org2(:,1)=Orgcell2;
    Org3(:,1)=Orgcell3;

    x1=ones(size(x))+x;
    y1=ones(size(x))+y;
    x2=-1*ones(size(x))+x;
    y2=-1*ones(size(x))+y;
    z1=ones(size(z))+z;
    z2=-1*ones(size(z))+z;
    Org(1,:,:)=[Org1 Org2 Org3 ];
    Org(2,:,:)=[Org1 Org2 Org3 ];
    Org(3,:,:)=[Org1 Org2 Org3 ];
    Org(4,:,:)=[Org1 Org2 Org3 ];
    black=zeros(4,6,3);
    w=ones(4,6,3);
    hold on;

    h(1,1)=patch(x2,y1,z1, Org);
    h(1,2)=patch(x,y1,z1, Org);
    h(1,3)=patch(x1,y1,z1, Org);
    h(1,4)=patch(x2,y,z1, Org);
    h(1,5)=patch(x,y,z1, Org);
    h(1,6)=patch(x1,y,z1, Org);
    h(1,7)=patch(x2,y2,z1, Org);
    h(1,8)=patch(x,y2,z1, Org);
    h(1,9)=patch(x1,y2,z1, Org);

    h(2,1)=patch(x2,y1,z, Org);
    h(2,2)=patch(x,y1,z, Org);
    h(2,3)=patch(x1,y1,z, Org);
    h(2,4)=patch(x2,y,z, Org);
    h(2,5)=patch(x,y,z, Org);
    h(2,6)=patch(x1,y,z, Org);
    h(2,7)=patch(x2,y2,z, Org);
    h(2,8)=patch(x,y2,z, Org);
    h(2,9)=patch(x1,y2,z, Org);

    h(3,1)=patch(x2,y1,z2, Org);
    h(3,2)=patch(x,y1,z2, Org);
    h(3,3)=patch(x1,y1,z2, Org);
    h(3,4)=patch(x2,y,z2, Org);
    h(3,5)=patch(x,y,z2, Org);
    h(3,6)=patch(x1,y,z2, Org);
    h(3,7)=patch(x2,y2,z2, Org);
    h(3,8)=patch(x,y2,z2, Org);
    h(3,9)=patch(x1,y2,z2, Org);
    
    axis tight;
    axis equal off;
    view([-45,45]);

    direct1=[0 1 0];
    H1=[h(1,7)  h(1,8)  h(1,9);
        h(2,7)  h(2,8)  h(2,9);         %H1为红色面zz
        h(3,7)  h(3,8)  h(3,9)];

    direct2=[0 0 1];
    H2=[h(3,1)  h(3,2)  h(3,3);         %H2为黄色面
        h(3,4)  h(3,5)  h(3,6);
        h(3,7)  h(3,8)  h(3,9)];

    direct3=[0 0 1];
    H3=[h(1,1)  h(1,2)  h(1,3);          %H3为白色面
        h(1,4)  h(1,5)  h(1,6);
        h(1,7)  h(1,8)  h(1,9)];

    direct4=[1 0 0];
    H4=[h(1,3)  h(1,6)  h(1,9);
        h(2,3)  h(2,6)  h(2,9);          %H4为蓝色面
        h(3,3)  h(3,6)  h(3,9)];

    direct5=[1 0 0];
    H5=[h(1,1)  h(1,4)  h(1,7);
        h(2,1)  h(2,4)  h(2,7);          %H5为绿色面
        h(3,1)  h(3,4)  h(3,7)];

    direct6=[0 1 0];
    H6=[ h(1,1)  h(1,2)  h(1,3);
        h(2,1)  h(2,2)  h(2,3);          %H6为橙色面
        h(3,1)  h(3,2)  h(3,3)];

    H={H1,H2,H3,H4,H5,H6};
    
    direct={direct1, direct2, direct3, direct4, direct5, direct6};   

% --- Executes on key press with focus on figure1 and none of its controls.
function figure1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
set(gcf,'KeyPressFcn','');
global stepList;
[y,fs,bits]=wavread('music.wav');

switch get(gcf,'CurrentCharacter')
    case 28
        [a,b]=view;
        view([a+5,b]);
    case 29
        [a,b]=view;
        view([a-5,b]);
    case 30
        [a,b]=view;
        if b + 5 > 90
            view([a,b]);
        else
            view([a,b+5]);
        end
    case 31
        [a,b]=view;
        if b - 5 <= -90
            view([a,b]);
        else
            view([a,b-5]);
        end
    case 'w'
        rotate1;
        stepList = [stepList;1, 1];
    case 'x'
        rotate2;
        stepList = [stepList;2, 1];
    case 'a'
        rotate3;
        stepList = [stepList;3, 1];
    case 'd'
        rotate4;
        stepList = [stepList;4, 1];
    case 'e'
        rotate5;
        stepList = [stepList;5, 1];
    case 'z'
        rotate6;
        stepList = [stepList;6, 1];
    otherwise
end

set(gcf,'KeyPressFcn',@figure1_KeyPressFcn);


function rotate1
     [y,fs,bits]=wavread('music.wav');
     wavplay(y,fs);
    global H h direct origin theta;
    rotate(H{3}(:),direct{3},theta,origin);
    pause(0.1);
    rotate(H{3}(:),direct{3},theta,origin);
    temp=h(1,1);
    h(1,1)=h(1,7);
    h(1,7)=h(1,9);
    h(1,9)=h(1,3);
    h(1,3)=temp;
    temp=h(1,2);
    h(1,2)=h(1,4);
    h(1,4)=h(1,8);
    h(1,8)=h(1,6);
    h(1,6)=temp;
    H1=[h(1,7)  h(1,8)  h(1,9);
        h(2,7)  h(2,8)  h(2,9);
        h(3,7)  h(3,8)  h(3,9)];
    H2=[h(3,1)  h(3,2)  h(3,3);
        h(3,4)  h(3,5)  h(3,6);
        h(3,7)  h(3,8)  h(3,9)];
    H3=[h(1,1)  h(1,2)  h(1,3);
        h(1,4)  h(1,5)  h(1,6);
        h(1,7)  h(1,8)  h(1,9)];
    H4=[h(1,3)  h(1,6)  h(1,9);
        h(2,3)  h(2,6)  h(2,9);
        h(3,3)  h(3,6)  h(3,9)];
    H5=[h(1,1)  h(1,4)  h(1,7);
        h(2,1)  h(2,4)  h(2,7); 
        h(3,1)  h(3,4)  h(3,7)];
    H6=[h(1,1)  h(1,2)  h(1,3);
        h(2,1)  h(2,2)  h(2,3);
        h(3,1)  h(3,2)  h(3,3)];
    H={H1,H2,H3,H4,H5,H6};

function rotate2
     [y,fs,bits]=wavread('music.wav');
     wavplay(y,fs);
    global H h direct origin theta;
    rotate(H{2}(:),direct{2},theta,origin);
    pause(0.1);
    rotate(H{2}(:),direct{2},theta,origin);
    temp=h(3,1);
    h(3,1)=h(3,7);
    h(3,7)=h(3,9);
    h(3,9)=h(3,3);
    h(3,3)=temp;
    temp=h(3,2);
    h(3,2)=h(3,4);
    h(3,4)=h(3,8);
    h(3,8)=h(3,6);
    h(3,6)=temp;
        H1=[h(1,7)  h(1,8)  h(1,9);
        h(2,7)  h(2,8)  h(2,9);
        h(3,7)  h(3,8)  h(3,9)];
    H2=[h(3,1)  h(3,2)  h(3,3);
        h(3,4)  h(3,5)  h(3,6);
        h(3,7)  h(3,8)  h(3,9)];
    H3=[h(1,1)  h(1,2)  h(1,3);
        h(1,4)  h(1,5)  h(1,6);
        h(1,7)  h(1,8)  h(1,9)];
    H4=[h(1,3)  h(1,6)  h(1,9);
        h(2,3)  h(2,6)  h(2,9);
        h(3,3)  h(3,6)  h(3,9)];
    H5=[h(1,1)  h(1,4)  h(1,7);
        h(2,1)  h(2,4)  h(2,7); 
        h(3,1)  h(3,4)  h(3,7)];
    H6=[h(1,1)  h(1,2)  h(1,3);
        h(2,1)  h(2,2)  h(2,3);
        h(3,1)  h(3,2)  h(3,3)];
    H={H1,H2,H3,H4,H5,H6};
    
function rotate3
     [y,fs,bits]=wavread('music.wav');
     wavplay(y,fs);
    global H h direct origin theta;
    rotate(H{6}(:),direct{6},-theta,origin);
    pause(0.1);
    rotate(H{6}(:),direct{6},-theta,origin);
    temp=h(1,1);
    h(1,1)=h(3,1);
    h(3,1)=h(3,3);
    h(3,3)=h(1,3);
    h(1,3)=temp;
    temp=h(1,2);
    h(1,2)=h(2,1);
    h(2,1)=h(3,2);
    h(3,2)=h(2,3);
    h(2,3)=temp;
        H1=[h(1,7)  h(1,8)  h(1,9);
        h(2,7)  h(2,8)  h(2,9);
        h(3,7)  h(3,8)  h(3,9)];
    H2=[h(3,1)  h(3,2)  h(3,3);
        h(3,4)  h(3,5)  h(3,6);
        h(3,7)  h(3,8)  h(3,9)];
    H3=[h(1,1)  h(1,2)  h(1,3);
        h(1,4)  h(1,5)  h(1,6);
        h(1,7)  h(1,8)  h(1,9)];
    H4=[h(1,3)  h(1,6)  h(1,9);
        h(2,3)  h(2,6)  h(2,9);
        h(3,3)  h(3,6)  h(3,9)];
    H5=[h(1,1)  h(1,4)  h(1,7);
        h(2,1)  h(2,4)  h(2,7); 
        h(3,1)  h(3,4)  h(3,7)];
    H6=[h(1,1)  h(1,2)  h(1,3);
        h(2,1)  h(2,2)  h(2,3);
        h(3,1)  h(3,2)  h(3,3)];
    H={H1,H2,H3,H4,H5,H6};
    
function rotate4
     [y,fs,bits]=wavread('music.wav');
     wavplay(y,fs);
    global H h direct origin theta;
    rotate(H{1}(:),direct{1},-theta,origin);
    pause(0.1);
    rotate(H{1}(:),direct{1},-theta,origin);
    temp=h(1,7);
    h(1,7)=h(3,7);
    h(3,7)=h(3,9);
    h(3,9)=h(1,9);
    h(1,9)=temp;
    temp=h(1,8);
    h(1,8)=h(2,7);
    h(2,7)=h(3,8);
    h(3,8)=h(2,9);
    h(2,9)=temp;
        H1=[h(1,7)  h(1,8)  h(1,9);
        h(2,7)  h(2,8)  h(2,9);
        h(3,7)  h(3,8)  h(3,9)];
    H2=[h(3,1)  h(3,2)  h(3,3);
        h(3,4)  h(3,5)  h(3,6);
        h(3,7)  h(3,8)  h(3,9)];
    H3=[h(1,1)  h(1,2)  h(1,3);
        h(1,4)  h(1,5)  h(1,6);
        h(1,7)  h(1,8)  h(1,9)];
    H4=[h(1,3)  h(1,6)  h(1,9);
        h(2,3)  h(2,6)  h(2,9);
        h(3,3)  h(3,6)  h(3,9)];
    H5=[h(1,1)  h(1,4)  h(1,7);
        h(2,1)  h(2,4)  h(2,7); 
        h(3,1)  h(3,4)  h(3,7)];
    H6=[h(1,1)  h(1,2)  h(1,3);
        h(2,1)  h(2,2)  h(2,3);
        h(3,1)  h(3,2)  h(3,3)];
    H={H1,H2,H3,H4,H5,H6};
    
function rotate5
     [y,fs,bits]=wavread('music.wav');
     wavplay(y,fs);
    global H h direct origin theta;
    rotate(H{4}(:),direct{4},-theta,origin);
    pause(0.1);
    rotate(H{4}(:),direct{4},-theta,origin);
    temp=h(1,3);
    h(1,3)=h(3,3);
    h(3,3)=h(3,9);
    h(3,9)=h(1,9);
    h(1,9)=temp;
    temp=h(1,6);
    h(1,6)=h(2,3);
    h(2,3)=h(3,6);
    h(3,6)=h(2,9);
    h(2,9)=temp;
        H1=[h(1,7)  h(1,8)  h(1,9);
        h(2,7)  h(2,8)  h(2,9);
        h(3,7)  h(3,8)  h(3,9)];
    H2=[h(3,1)  h(3,2)  h(3,3);
        h(3,4)  h(3,5)  h(3,6);
        h(3,7)  h(3,8)  h(3,9)];
    H3=[h(1,1)  h(1,2)  h(1,3);
        h(1,4)  h(1,5)  h(1,6);
        h(1,7)  h(1,8)  h(1,9)];
    H4=[h(1,3)  h(1,6)  h(1,9);
        h(2,3)  h(2,6)  h(2,9);
        h(3,3)  h(3,6)  h(3,9)];
    H5=[h(1,1)  h(1,4)  h(1,7);
        h(2,1)  h(2,4)  h(2,7); 
        h(3,1)  h(3,4)  h(3,7)];
    H6=[h(1,1)  h(1,2)  h(1,3);
        h(2,1)  h(2,2)  h(2,3);
        h(3,1)  h(3,2)  h(3,3)];
    H={H1,H2,H3,H4,H5,H6};
    
 function rotate6
     [y,fs,bits]=wavread('music.wav');
     wavplay(y,fs);
    global H h direct origin theta;
    rotate(H{5}(:),direct{5},-theta,origin);
    pause(0.1);
    rotate(H{5}(:),direct{5},-theta,origin);
    temp=h(1,1);
    h(1,1)=h(3,1);
    h(3,1)=h(3,7);
    h(3,7)=h(1,7);
    h(1,7)=temp;
    temp=h(1,4);
    h(1,4)=h(2,1);
    h(2,1)=h(3,4);
    h(3,4)=h(2,7);
    h(2,7)=temp;
    H1=[h(1,7)  h(1,8)  h(1,9);
        h(2,7)  h(2,8)  h(2,9);
        h(3,7)  h(3,8)  h(3,9)];
    H2=[h(3,1)  h(3,2)  h(3,3);
        h(3,4)  h(3,5)  h(3,6);
        h(3,7)  h(3,8)  h(3,9)];
    H3=[h(1,1)  h(1,2)  h(1,3);
        h(1,4)  h(1,5)  h(1,6);
        h(1,7)  h(1,8)  h(1,9)];
    H4=[h(1,3)  h(1,6)  h(1,9);
        h(2,3)  h(2,6)  h(2,9);
        h(3,3)  h(3,6)  h(3,9)];
    H5=[h(1,1)  h(1,4)  h(1,7);
        h(2,1)  h(2,4)  h(2,7); 
        h(3,1)  h(3,4)  h(3,7)];
    H6=[h(1,1)  h(1,2)  h(1,3);
        h(2,1)  h(2,2)  h(2,3);
        h(3,1)  h(3,2)  h(3,3)];
    H={H1,H2,H3,H4,H5,H6};
    
function randomstepList
    global stepList;
    stepList=[randi(6), randi(2)];
    for i = 1:9
        stepList = [stepList;randi(6), randi(2)];
    end
    
    
    
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    set(hObject,'Enable','off');
    cla;
    drawMetrix;
    randomstepList;
    global stepList;
   for i=1:10
       a = stepList(i,1);
       b = stepList(i,2);
       if a == 1
           for j = 1:b
               rotate1;
               pause(0.1);
           end
       elseif a == 2
           for j = 1:b
               rotate2;
               pause(0.1);
           end
       elseif a == 3
           for j = 1:b
               rotate3;
               pause(0.1);
           end
       elseif a == 4
           for j = 1:b
               rotate4;
               pause(0.1);
           end
       elseif a == 5
           for j = 1:b
               rotate5;
               pause(0.1);
           end
       else
           for j = 1:b
               rotate6;
               pause(0.1);
           end
       end
   end
   axes(handles.axes1);
   set(hObject,'Enable','on');
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject,'Enable','off');
global stepList;
length = size(stepList, 1);
% fprintf('%d\n',length);
for i=length:-1:1
       a = stepList(i,1);
       b = 4-stepList(i,2);
%        fprintf('%d\n',a);
       if a == 1
           for j = 1:b
               rotate1;
               pause(0.1);
           end
       elseif a == 2
           for j = 1:b
               rotate2;
               pause(0.1);
           end
       elseif a == 3
           for j = 1:b
               rotate3;
               pause(0.1);
           end
       elseif a == 4
           for j = 1:b
               rotate4;
               pause(0.1);
           end
       elseif a == 5
           for j = 1:b
               rotate5;
               pause(0.1);
           end
       else
           for j = 1:b
               rotate6;
               pause(0.1);
           end
       end
   end
set(hObject,'Enable','on');
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
button=questdlg('是否确认关闭','关闭确认','是','否','是');
if strcmp(button,'是')
    delete(hObject);
    close(gcf);
else
    return;
end

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton3.
function pushbutton3_ButtonDownFcn(hObject, eventdata, handles)

% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton1.
function pushbutton1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function SetMouseFcn
    set(gcf,'WindowButtonDownFcn',@figure1_WindowButtonDownFcn);
%     set(gcf,'WindowButtonUpFcn',@figure1_WindowButtonUpFcn);
%     set(gcf,'WindowButtonMotionFcn',@figure1_WindowButtonMotionFcn);
% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%这是鼠标的按键响应
%初始进入时鼠标是箭头，按下邮件后切换模式。
%十字形箭头是移动魔方模式
%箭头是单击选择旋转模式
global point1 point2;
if strcmp(get(gcbf,'SelectionType'),'alt') %判断是否点了右键
    if strcmp(get(gcf,'Pointer'),'arrow')
        set(gcf,'Pointer','fleur');
    else
        set(gcf,'Pointer','arrow');
    end
end
if strcmp(get(gcf,'Pointer'),'fleur')
    if strcmp(get(gcbf,'SelectionType'),'normal')%判断点了右键
        point1 = get(hObject,'CurrentPoint');
        set(gcf,'WindowButtonMotionFcn',@figure1_WindowButtonMotionFcn);
        set(gcf,'WindowButtonUpFcn',@figure1_WindowButtonUpFcn);
    end
end

% --- Executes on mouse motion over figure - except title and menu.
function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global point1 point2;
point2 = get(hObject,'CurrentPoint');
[a,b] = view;
fprintf('\n a = %f, b = %f',a,b);
if b+point1(2)/10-point2(2)/10 <= 90 && b+point1(2)/10-point2(2)/10 > -89
    view([a+point1(1)/10-point2(1)/10,b+point1(2)/10-point2(2)/10]);
else
    view([a,b]);
end

% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonUpFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% set(gcf,'WindowButtonMotionFcn','');

% if b+point1(2)-point2(2) < -90
%     view([a+point1(1)-point2(1),-89]);;
% else
%     view([a+point1(1)-point2(1),b+point1(2)-point2(2)]);
% end
set(gcf,'WindowButtonMotionFcn','');
