% do not modify the function line below
function [v, square] = problem2 

% coordinates of square under one variable
square = [[3.5 6.5 6.5 3.5 3.5];[3.5 3.5 6.5 6.5 3.5]];

% generate animation window
figure
xmin = -pi;
xmax = 7*pi;
ymin = -8;
ymax = 8;
axis equal
axis([xmin xmax ymin ymax])
grid on
hold on
title('test')

%setting your trajectory
t = linspace(0,6*pi,500); % independent variable of your function
trajectory = cos(t); % represents y in y = cos(t)
rotation = linspace(0, 3600 ,500) * pi/180;

plot(t,trajectory,':')
    for i = 1:length(t)
        
         rotationMatrix = [cos(rotation(i)) -sin(rotation(i))
                            sin(rotation(i)) cos(rotation(i))];
         
         newSquare = [[square(1,:) - 4.5];[square(2,:) - 5.5]];
         newSquare = rotationMatrix *newSquare;
         
         h = fill( newSquare(1,:) + t(i),newSquare(2,:) + trajectory(i) ,'r'); 
         % do not change below 2 lines, should follow your fill command
         v.x(i,:)=get(h,'xdata')';
         v.y(i,:)=get(h,'ydata')';
         
   
        % add anything below
    end
end