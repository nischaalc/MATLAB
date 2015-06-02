% Lab 4
clear all; close all; clc;

%% Create a square

% Simple square centered about (1,1) with side length of 2
x=[0 0 2 2];
y=[0 2 2 0];
square=[x;y];

% Open figure window and set axes
figure
hold on
grid on
axis square
axis([-1 3 -1 3]);
fill(square(1,:),square(2,:),'b')

% circle represents origin, triangle represents (1,1) (aka, the center of
% the original square)
plot(0,0,'co','markerfacecolor','c','markersize',30,'markeredgecolor','k')
plot(1,1,'m^','markerfacecolor','w','markersize',15)

%% Rotate object about orgin (0,0)

% Rotation parameters
theta=pi/6;
rotationMatrix=[cos(theta) -sin(theta)
                sin(theta)  cos(theta)];

% Assign new coordinates and then draw            
newSquare=rotationMatrix*square;

% Optional scaling would take place here
% newSquare=newSquare*.5

fill(newSquare(1,:),newSquare(2,:),'y')
plot(0,0,'co','markerfacecolor','c','markersize',30,'markeredgecolor','k')
plot(1,1,'m^','markerfacecolor','w','markersize',15)

%% Purpose of the rotMat

x=[-1 0 1 0];
y=[0 -1 0 1];
square=[x;y];

figure
hold on
grid on
axis square
axis([-1 3 -1 3]);
fill(square(1,:),square(2,:),'b')
plot(0,0,'co','markerfacecolor','c','markersize',30,'markeredgecolor','k')

theta=pi/4; %90 degrees
rotationMatrix=[cos(theta) -sin(theta)
                sin(theta)  cos(theta)];

% multiplication by rotationMatrix will rotate objects
newSquare = rotationMatrix*square;
fill(newSquare(1,:),newSquare(2,:),'y')
plot(0,0,'co','markerfacecolor','c','markersize',30,'markeredgecolor','k')

%% how it is in the lab
rotMat=rotationMatrix;
rotMatX=rotMat(1,:); % cos(theta) -sin(theta)
rotMatY=rotMat(2,:); % sin(theta)  cos(theta)

rotMatX*square; % returns ROTATED X COORDINATES
rotMatY*square; % returns ROTATED Y COORDINATES

% returns ROTATED X AND Y COORDINATES in the first and second row, respectively
rotMat*square; 

%% Rotate object about point (x, y)
%{
Brings objects' desired rotation point to orgin,
then rotates, and then translates it back to the
original point (or any other point you want)
%}

x=[0 0 2 2];
y=[0 2 2 0];
square=[x;y];

% Rotation parameteres
theta=pi/6;
rotationMatrix=[cos(theta) -sin(theta)
                sin(theta)  cos(theta)];

% Translation factors (in this case, rotation is about (1,1), hence...)
xTranslate=1;
yTranslate=1;
            
% Bring object back to center
newSquare(1,:)=square(1,:)-xTranslate; % x coordinates
newSquare(2,:)=square(2,:)-yTranslate; % y coordinates

% Rotate object        
newSquare=rotationMatrix*newSquare; %rotate

% Optional scaling would take place here
% newSquare=newSquare*.5

% and translate back
newSquare(1,:)=newSquare(1,:)+xTranslate; 
newSquare(2,:)=newSquare(2,:)+yTranslate; 

fill(newSquare(1,:),newSquare(2,:),'r')
plot(0,0,'co','markerfacecolor','c','markersize',30,'markeredgecolor','k')
plot(1,1,'m^','markerfacecolor','w','markersize',15)

%% Animation with rotating square

% Simple square centered about (1,1) with side length of 2

square=[0 0 2 2;
        0 2 2 0];

% Open figure window and set axes
figure
hold on
grid on
axis square
axis([-1 10 -1 10]);

% y(x) = x function
x = linspace(0,8,250);
y = x;

% make 3 rotations for # of data points in f(x)=x, aka y=x
theta=linspace(0,1080,length(x))*pi/180;

for i=1:length(theta)
% Translation factors to bring original shape to origin
xTranslate=1;
yTranslate=1;    
    
% Bring object back to center
newSquare(1,:)=square(1,:)-xTranslate; % x coordinates
newSquare(2,:)=square(2,:)-yTranslate; % y coordinates


% Changing rotation matrix
rotationMatrix=[cos(theta(i)) -sin(theta(i))
                sin(theta(i))  cos(theta(i))];

% Rotate object        
newSquare=rotationMatrix*newSquare; %rotate
% 
% % Optional scaling would take place here

% and translate back
fill(newSquare(1,:)+x(i)+xTranslate,newSquare(2,:)+y(i) +yTranslate,'r')
pause(0.005)

title([num2str(theta(i)/(2*pi)) ' completed rotations']);
end