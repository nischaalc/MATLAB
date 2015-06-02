% Lab 3
close all; clear all; clc;

%% User Input
fprintf('root or square?\n')

% prompt strings
numberPrompt='Choose any number: ';
userOperationPrompt='Find number''s root or square?: ';

% gathering user input
number=input(numberPrompt);
userOperation=input(userOperationPrompt,'s');

% determining user answer & executing operations
if  strcmpi(userOperation,'root')
    finalValue=sqrt(number);
else 
    finalValue=number^2;
end

% returns answer
fprintf('The result of your %s is %.2f\n',userOperation,finalValue)


%% 2D Polygons using Cartesian coordinates

% x and y coords
x=[0 .2 .8 1];
y=[0  1 1  0];

% x=[0 .8 1 .2];
% y=[0 1 0 1];


% assigning to one variable
square=[x;
        y];
figure
hold on
plot(square(1,:),square(2,:),[1 0 1])

%% 2D Polygons using polar coordinates and scaling

figure
hold on
t = (1/16:1/8:1)*2*pi; % pi/8:pi/4:2*pi

% generating points along a circle
y = 10*sin(t);
x = 10*cos(t);


figure(3)
axis([-1 1 -1 1])
hold on

t = (1/16:1/8:1)*2*pi;

for i=10:-0.01:1
    x = i/10*sin(t); % sin(t) -> 0.9sin(t)
    y = i/10*cos(t);
%     fill(x,y,'c');
%     pause(.2) %animation effect
    h = fill(x,y,'c'); % draw object
    pause(.003) % show object for .3s
    delete(h) % delete it
end
hold off

%% Translating along a curve
close all
% generate points for shape
x=[0 1 1 0]-.5;
y=[0 0 1 1]-.5;

square=[x;y];

% figure properties
figure
% xmin xmax ymin ymax]
axis([0 5*pi -2 2])
xlabel('theta')
ylabel('sin(theta)')
title('animation along a sine wave')

% locking in settings
hold on

% generate points
t = linspace(0,4*pi,1000); % t= 1:4*pi/100:4*pi
trajectory = sin(t);
plot(t, trajectory,':')

for i = 1:length(t)
    h=fill(square(1,:)+t(i), square(2,:)+trajectory(i),rand(1,3));
    set(h,'EdgeColor',rand(1,3),'lineWidth',3)

    pause(0.01) % "what you see"

end

hold off
