%% Accelerometer Module, Week 2 Lab Investigation, Motor Control

%% Overivew
% This is a small script to show how the servo motors are initialized and
% how commands can be sent to them.

%% Ensure that the ENGR 101 Accelerometer Files are Available
% This is a small administrative command. This ensures that the required
% commands to interface with the accelerometer/balance board are all
% available.
path([getenv('home') '\Documents\MATLAB\Matlab_ENGR101'],path)


%% Initializing the servos
% The command setup_motors() creates an object in MATLAB's memory which
% contains the information required to interface with the balance board
% motors. This needs to be saved in a variable, so for simplicity we save
% it here as the variable "servos". The conditional statement it is
% enclosed it will look for that variable in memory, so MATLAB doesn't
% reconfigure the motors unless it needs to.
if ~exist('servos','var')
    servos = setup_motors();         
end

%% Sending out some movement commands
% Using the variable that contains the motor data, it is relatively easy
% for one to send commands to the motors. The commands servos.moveX(degrees)
% and servos.moveY(degrees) will move the X and Y motors of the balance
% board by the value "degrees". Degrees is a number between -45 and +45
% degrees.
%
% We also have pause commands here to make sure the balance board has time
% to move the motors before the next command is sent. If too many commands
% are sent at once to the balance board, then the motors may not move.

servos.moveX(-45); pause(0.5);                              
servos.moveX(0); pause(0.5);                               

servos.moveY(-45);pause(0.5);                            
servos.moveY(0); pause(0.5);                            