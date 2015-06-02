close all; clear all; clc;      %Clear command window and close any figures

%% Question 1

%% Variables
scale = 0.75;       %Scaling facor
shiftY = 3;         %Translation factor for y
shiftX = 3;         %Translation factor for x
transparency = 1;   %Initial value for the transparency of the square

%% Implementation

figure                              %Initialize figure window
hold on;
axis([0 11 0 11]);
title('Animated Square')

squareX = [0, 2, 2, 0, 0];          %Define the initial coordinates of the corners of the square
squareY = [0, 0, 2, 2, 0];          

fill(squareX, squareY, 'r');        %Plot the first square and fill with a color    

for i = 1:10                        %Run loop for 11 'frames'
    
    squareX = (squareX * scale) + shiftX;   %Calculate the coordinates of the corners of the square after scaling and translation
    squareY = (squareY * scale) + shiftY;
    
    fill(squareX, squareY, 'r', 'facealpha', transparency);     %Plot the new square and fill with a color and change its transparency
    
    pause(0.1);                     %Pause to simulate effect of the square being animated
    
    shiftY = (shiftY - 0.03);       %Update the translation factors for x and y
    shiftX = (shiftX - 0.03);
    transparency = transparency - 0.09;     %Update the transparency factor
    
    hold on;                        %Stop MATLAB from clearing figure window
end

%% End of Question 1
