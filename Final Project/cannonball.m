function cannonball
%% Authors: Michael Murphy and Nischaal Cooray

%% Initialize MATLAB
clear all; close all; clc;

%% Global variables 
didCollide = 0;
keepPlaying = 1;
rotationVector = linspace(360, 0, 250) * pi/180;

while keepPlaying == 1      % Conditional loop to ensure that the user wants to play again
    %% Generate shapes 
    
    square = [[0 5 5 0 0];[0 0 5 5 0]];
    cannon = [[5 10 9 4 5];[2 6 8 4 2]];
    cannonBase = [[3 5 6 2];[0 4 0 0]];
    target = [[100 110 110 100 100];[80 80 90 90 80]];

    %% Prepare the figure window
    figure(1)
    axes('xlim', [0 275], 'ylim', [0 200]);
    hold on;
    
    %% Generate random variables
    
    randX = randi([0, 100]);        %Used to shift the x position of the target
    randY = randi([0, 110]);        %Used to shift the y position of the target
    
    %% Add translations for target and fill
    targetfill = fill(target(1,:) + randX, target(2,:) + randY, 'b');
    
    %% Draw cannon and base on figure
    baseFill = fill(cannonBase(1,:)*3, cannonBase(2,:)*3, 'k');
    cannonFill = fill(cannon(1,:) * 3, cannon(2,:) * 3, 'r');

    %% Get user input and convert to integers
    
    v = inputdlg('Enter desired speed: ', 'Fire!');
    velocity = str2num(v{1});       %Conversion to ensure that the program can understand the input
    a = inputdlg('Enter desired angle: ', 'Fire!');
    angle = str2num(a{1});          %Conversion to ensure that the program can understand the input
    
    %% Generate equations
    t = linspace (0,7, 250);        %Time to run the simulation for 
    vx = velocity * cosd(angle);    %Horizontal component of velocity
    vy = velocity * sind(angle) - (9.8*t);      %Vertical component of velocity

    %% Perform animation
    i = 1;
    while i < length(t)             %Only run for the length of the time vector

        if i~=1
            delete(h1)      %To ensure that the program does not crash upon running
        end

        rotationMatrix = [cos(rotationVector(i)) -sin(rotationVector(i))        %Calculate values to be used for rotation
                          sin(rotationVector(i)) cos(rotationVector(i))];

        x = (velocity*t(i))*cosd(angle);      %Calculate horizontal position
        y = (0 + (velocity * t(i))*sind(angle) - (9.8 * power(t(i), 2))/2);  %Calculate vertical position

        hit = detectCollision(x, y, randX, randY);      %Call the collision detection function

        if (hit == 1)           %If the collision detection function returns true,
            i = length(t);      %assign i to the end of the time vector so that the simulation stops
            didCollide = 1;     %initialize a variable to indicate collision has occured
        end

        rotatedSquare = [[square(1,:)];[square(2,:)]];  %Apply the rotation to the square
        rotatedSquare = rotationMatrix *rotatedSquare;

        h1 = fill(rotatedSquare(1,:) + x, rotatedSquare(2,:) + y, 'r'); %Draw the square on the figure

        pause(0.01);        %Pause to simulate animation
        i = i + 1;
    end

    %% Display image and scale

    if didCollide == 1

        initialImage = imread('congrats2.jpg');     %Read in the image file

        initialImage = flipdim(initialImage, 1);    %Flip the image the right way around

        for i = 1:10                                %Scale the image larger over several frames
            explosion = imresize(initialImage, 0.05*i);
            figure(1);
            axes('xlim', [0 275], 'ylim', [0 200]);
            hold on

            image(100 - (2 * i), 100 - (2 * i), explosion);
            pause(0.01);

        end
        
        cont = inputdlg('Enter 1 to try again or 2 to quit: ', 'Submit');       %Check if the player wants to play again
        keepPlaying = str2num(cont{1});
        
    else

        initialImage = imread('failure.jpg');           %Read in the image file

        initialImage = flipdim(initialImage, 1);        %Flip the image the right way around

        failure = imresize(initialImage, 0.2);          %Scale the image to fit the figure window

        figure(1);
        axes('xlim', [0 275], 'ylim', [0 200]);
        hold on

        image(100, 100, failure);                       %Display the image

        msg = msgbox('Oh no! Looks like you just missed!', 'Just your luck...');    %Message box to indicate that the player missed the target
        pause(2.5);

        cont = inputdlg('Enter 1 to try again or 2 to quit: ', 'Submit');           %Check if the player wants to play again
        keepPlaying = str2num(cont{1});

    end

end
