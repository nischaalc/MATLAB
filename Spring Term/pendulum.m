%%

close all; clear all; clc;
%%

gravity = 9.8; 
stringLength = 5; 
initialAngle = pi/9; 
timeSpan = [0:0.1:50]; 
angularPositions = initialAngle*cos(sqrt(gravity/stringLength)*timeSpan); 
plot(timeSpan, angularPositions) 
set(gcf,'color','w') 
grid on; 
xlabel('Time'); 
ylabel('Theta'); 
title('Theta Vs Time');

%% 

y = angularPositions; 
figure 
plot(0, 0, 'ks'); % pivot where rod attached 
axis square 
bob = line('color', 'r', 'Marker', '.', 'markersize', 40,... 
'erase', 'xor', 'xdata', [], 'ydata', []); 
string = line('color', 'b', 'LineStyle', '-', 'LineWidth', 3,... 
'erase', 'xor', 'xdata', [], 'ydata', []); 
axis([-1.2, 1.2, -1.2, 1.2]); 

%% 
for k=1:500-1 
xbob = cos(y(k+1)-pi/2); 
ybob = sin(y(k+1)-pi/2); 
xString = [0, xbob]; 
yString = [0, ybob]; 
set(string,'xdata', xString, 'ydata', yString); 
set(bob, 'xdata', xbob, 'ydata', ybob); 
drawnow; pause(0.05) 
end 
