%% Accelerometer Module, Week 3 Lab Investigation, Tilt Calc

%% Overview
% We will be orienting the accelerometer like a balance board this week,
% and observing the axis signals produced by it. The following code shows
% the X and Y axes of acceleration, and the resultant vector between the
% two.
%
% Notice that when looking at the accelerometer from above, the horizontal
% axis (left-to-right) is the Y axis and the vertical axis
% (forward-to-back) is the X axis.
%
% We will modify the code to produce the following:
%
%   1) Add the tilt angles for each axis.
%   2) Format and label the plot axes

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
axis(limits*[-1 1 -1 1])
axis square

% Label the axes of the plot. Do this for the top-down view of the
% accelerometer.
%%%%---%%%%---%%%%---%%%%---%%%%---%%%
%%%%--- STUDENTS ADD CODE HERE ---%%%%    


%%%%---%%%%---%%%%---%%%%---%%%%---%%%
%%%%---%%%%---%%%%---%%%%---%%%%---%%%

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
    
    % Plot the X and Y acceleration vecotrs, and the magnitude of them
    line([0 gy], [0 0], 'Color', 'g', 'LineWidth', 2, 'Marker', 'o');
    line([0 0], [0 gx],  'Color', 'r', 'LineWidth', 2, 'Marker', 'o');
    line([0 gy], [0 gx],  'Color', 'c', 'LineWidth', 2, 'Marker', 'o');
    
    % Determine the tilt angles via trigonometry rules (from your HW
    % assignment).
    %%%%---%%%%---%%%%---%%%%---%%%%---%%%%%%
    %%%%--- STUDENTS MODIFY CODE HERE ---%%%%    
    thetaX = 1234;         % Rotation about accelerometer's x-axis
    thetaY = 5678;         % Rotation about accelerometer's y-axis
    %%%%---%%%%---%%%%---%%%%---%%%%---%%%%%%
    %%%%---%%%%---%%%%---%%%%---%%%%---%%%%%%

    % Update the plot titles
    title(['X-axis Tilt Angle: ' num2str(real(thetaX), '%.0f')...
         ', Y-axis Tilt Angle: ' num2str(real(thetaY), '%.0f')]);
        
    % Force MATLAB to redraw the figure
    drawnow;
    
end
