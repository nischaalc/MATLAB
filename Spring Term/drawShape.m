function drawShape
% This function draws a shape based on an integer and a character input by the user.

close all; clear all; clc;  %Clear command window and close any figures

fprintf('List of Shapes: \n 1. Triangle \n 2. Circle \n 3. Square \n 4. Pentagon \n 5. Hexagon \n 6. Octagon \n 7. Star \n 8. Rhombus \n 9. Trapezoid \n'); %Inform user of possible choices
userShape = input('Enter a number between 1 and 9 to choose a shape: ');      %Request user input to determine shape

fprintf('List of Colors: \n y = Yellow \n m = Magenta \n c = Cyan \n r = Red \n g = Green \n b = Blue \n w = White \n k = Black \n');
userColor = input('Enter a color (y, m, c, r, g, b, w, k): ','s');

figure                      %Initialize a figure window
axis equal;
title('Your Shape');
hold on;

if (userShape == 1)         %If the user inputs '1', plot a right triangle and fill it with the users chosen color
    disp('You chose to plot a right angled triangle!');
    x = [3, 7, 7];
    y = [3, 3, 7];
    fill(x,y,userColor);
    
elseif (userShape == 2)     %If the user inputs '2', plot a circle and fill it with the users chosen color
    disp('You chose to plot a circle!');
    t = 0:pi/50:2*pi;
    xPlot = 3 * cos(t) + 5;
    yPlot = 3 * sin(t) + 5;
    fill(xPlot, yPlot, userColor);
    
elseif (userShape == 3)     %If the user inputs '3', plot a square and fill it with the users chosen color
    disp('You chose to plot a square!');
    squareX = [3, 6, 6, 3, 3];
    squareY = [3, 3, 6, 6 3]; 
    fill(squareX, squareY, userColor);

elseif (userShape == 4)     %If the user inputs '4', plot a pentagon and fill it with the users chosen color
    disp('You chose to plot a pentagon');
    step = 360/5;
    degrees = linspace(0,2*pi,361);
    c = cos(degrees);
    s = sin(degrees);
    fill((c(1:step:361) * 2) + 5, (s(1:step:361) * 2) + 5, userColor);
    
elseif (userShape == 5)     %If the user inputs '5', plot a hexagon and fill it with the users chosen color
    disp('You chose to plot a hexagon!');
    step = 360/6;
    degrees = linspace(0,2*pi,361);
    c = cos(degrees);
    s = sin(degrees);
    fill((c(1:step:361) * 2) + 5, (s(1:step:361) * 2) + 5, userColor);
    
elseif (userShape == 6)     %If the user inputs '6', plot an octagon and fill it with the users chosen color
    disp('You chose to plot an octagon!');
    step = 360/8;
    degrees = linspace(0,2*pi,361);
    c = cos(degrees);
    s = sin(degrees);
    fill((c(1:step:361) * 2) + 5, (s(1:step:361) * 2) + 5, userColor);
    
elseif (userShape == 7)     %If the user inputs '7', plot a star and fill it with the users chosen color
    disp('You chose to plot a star!');
    starX = [5, 4, 1, 3, 2, 5, 8, 7, 9, 6];
    starY = [8, 6, 6, 5, 2, 4, 2, 5, 6, 6];
    fill(starX, starY, userColor);
    
elseif (userShape == 8)     %If the user inputs '8', plot a rhombus and fill it with the users chosen color
    disp('You chose to plot a rhombus!');
    rhombusX = [2, 6, 8, 4];
    rhombusY = [3, 3, 6, 6];
    fill(rhombusX, rhombusY, userColor);
    
elseif (userShape == 9)     %If the user inputs '9', plot a trapezoid and fill it with the users chosen color
    disp('You chose to plot a trapezoid!');
    tropX = [2, 8, 6, 4];
    tropY = [3, 3, 6, 6];
    fill(tropX, tropY, userColor);
    
end                         %End nested conditional statement

end                         %End function
