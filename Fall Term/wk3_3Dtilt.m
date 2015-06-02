%% Accelerometer Module, Week 3 Lab Investigation, 3D Tilt Calc

%% Overview
% The code from wk3_tiltCalc.m gives us a top-down view of the
% accelerometer signals. We will use this code to view the signals in 3D.
%
% This code displays the accelerometer's X-axis of acceleration in a 3D
% plot. Your end goal is to modify the code to display all three axes and
% the overall acceleration magnitude vector on the plot. This can be
% achieved by using line commands.

%% Ensure that the ENGR 101 Accelerometer Files are Available
% This is a small administrative command. This ensures that the required
% commands to interface with the accelerometer/balance board are all
% available.
path([getenv('home') '\Documents\MATLAB\Matlab_ENGR101'],path)

%% Initializing the Accelerometer and Figure window
% Same as last week. See that code for further explanation.

if ~exist('accelerometer','var')
    accelerometer = setup_accel();
end

if exist('h','var') && ishandle(h)
    close(h)               
end

h = figure(1);
ax = axes('box', 'on', 'xdir', 'reverse','ydir','reverse');
limits = 2.5;
axis(limits*[-1 1 -1 1 -1 1])
axis square


xlabel('Y-component of acceleration')
ylabel('X-component of acceleration')
zlabel('Z-component of acceleration')

%% Data Collection and Display
% To display the data in real time, we run a loop that continues as long as
% the figure window is open. In this loop, we pull the component data from
% the accelerometer, reset the values within plot window from the previous
% loop iteration, and plot the new component vectors,

while(ishandle(h))
    
    % Read new values from the accelerometer
    [gx gy gz] = accelerometer.read;

    % Clear the values from the previous run of the loop
    cla            
    
    % Plot the X, Y, Z, and resultant acceleration vectors
    line([0 0], [0 0], [0 gz],  'Color', 'b', 'LineWidth', 2, 'Marker', 'o');
    %%%%---%%%%---%%%%---%%%%---%%%%---%%%
    %%%%--- STUDENTS ADD CODE HERE ---%%%%

    
    %%%%---%%%%---%%%%---%%%%---%%%%---%%%
    %%%%---%%%%---%%%%---%%%%---%%%%---%%%    
    
    % Determine the tilt angles about the X and Y accelerometer axes.
    %%%%---%%%%---%%%%---%%%%---%%%%---%%%%%%
    %%%%--- STUDENTS MODIFY CODE HERE ---%%%%
    thetaX = 1234;
    thetaY = 5678;
    %%%%---%%%%---%%%%---%%%%---%%%%---%%%%%%
    %%%%---%%%%---%%%%---%%%%---%%%%---%%%%%%  
    
    % Update the figure title
    title(['X-axis Tilt Angle: ' num2str(real(thetaX), '%.0f')...
         ', Y-axis Tilt Angle: ' num2str(real(thetaY), '%.0f')]);
        
    % Force MATLAB to redraw the figure
    drawnow;
    
end
