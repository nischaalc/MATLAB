function v = problem1
%squareX = [-2, 2, 2, -2, -2];
%squareY = [-2, -2, 2, 2, -2];

%squareX = [0 4 4 0 0];
%squareY = [0 0 4 4 0];
%square = [squareX; squareY];
%square = [[0 4 4 0 0]; [0 0 4 4 0]];
square = [[-2, 2, 2, -2, -2]; [-2, -2, 2, 2, -2]];

figure
xmin = -5;
xmax = 25;
ymin = -5;
ymax = 125;
axis equal
grid on
axis([xmin xmax ymin ymax])
hold on

plot(square)

%setting your trajectory
t = linspace(0,20,500); % independent variable of your function
trajectory = 0.25*power(t,2); % represents y in y = t^2
%trajectory = linspace(0,100,500);
scale = linspace(1,0.25,500);

% all fill/drawing steps should occur in for loop
    for i = 1:length(t)
         % fill in the appropriate inputs for fill
         h = fill((square(1,:) *scale(i)) + t(i), (square(2,:) * scale(i)) +trajectory(i), 'r');
         % do not change below 2 lines, should follow your fill command
         v.x(i,:)=get(h,'xdata')';
         v.y(i,:)=get(h,'ydata')';
         % add anything below
    end
    
end
