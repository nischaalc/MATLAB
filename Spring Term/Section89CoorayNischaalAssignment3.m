%Nischaal Cooray
%Section 089

%%
clear all; close all; clc; 

%% Question 1

square = [[0 5 5 0 0];[0 0 5 5 0]]; %Plots for a square of side 5

v0 = 50;                            %Initial variables for projectile motion
theta = 35;
t = linspace(0, 5.9, 100);
y0 = 0;

vx = v0 * cosd(theta);              %Calculate trajectory for the motion
vy = v0 * sind(theta) - (9.8*t);

rotationVector = linspace(360, 0 ,100) * pi/180;  %Initialize the values for rotation of the shape

figure(1)       %Prepare the figure window
axes('xlim', [0 275], 'ylim', [0 200]);
hold on;

for i=1:length(t)
    
    if i~=1
        delete(h1)      %To ensure that the program does not crash upon running
    end
    
    rotationMatrix = [cos(rotationVector(i)) -sin(rotationVector(i))        %Calculate values to be used for rotation
                      sin(rotationVector(i)) cos(rotationVector(i))];
    
    x = (v0*t(i))*cosd(theta);      %Calculate horizontal position
    y = (y0 + (v0 * t(i))*sind(theta) - (9.8 * power(t(i), 2))/2);  %Calculate vertical position
    
    rotatedSquare = [[square(1,:)];[square(2,:)]];  %Apply the rotation to the square
    rotatedSquare = rotationMatrix *rotatedSquare;
         
    h1 = fill(rotatedSquare(1,:) + x, rotatedSquare(2,:) + y, 'r'); %Draw the square on the figure
    
    pause(0.05);        %Pause to simulate animation
    
end

%% Question 2

hold off; clear all; close all; clc;

%% Creating axes

figure(2)       %Prepare the figure window
myAxes=axes('xlim',[-2 10], 'ylim', [-2 6], 'zlim', [-2 6]);
grid on
view(3)
axis equal
hold on
xlabel('x')
ylabel('y')
zlabel('z')

%% Create Shapes

[UFOxsph UFOysph UFOzsph] = sphere(30);     %Generate the main body of the UFO
[UFOxcyl UFOycyl UFOzcyl]=cylinder([2 0.5],30);     %Generate the ring around the UFO
[bxsph bysph bzsph] = sphere(30);               %Generate the ball that circles the UFO

UFOzsph(find(UFOzsph<=0))=0;        %This line of code inspired from a post on stack overflow. Needed to generate the hemisphere.

%% Combine and prepare shapes

u(1)=surface(UFOxcyl,UFOycyl,.5*(UFOzcyl-0.5),'FaceColor','r');     %Define the surfaces for the shapes
u(2)=surface(UFOxsph, UFOysph, UFOzsph, 'FaceColor', 'b');
u(3) = surface((bxsph) * 0.5, (bysph + 6) * 0.5, (bzsph) * 0.5, 'FaceColor', 'g', 'EdgeColor', 'none');

UFOObject = hgtransform('parent',myAxes);   %Group the objects
set(u,'parent',UFOObject)
drawnow

%% Animations

UtranslateX = linspace(-1,10,200);      %Initialize values for transformations and translations
UtranslateY = linspace(-1, 6, 200);
UtranslateZ = linspace(-1,6,200);
Urotate = linspace(10, 1080, 200);
Uscale = linspace(1, 0.5, 200);

for i=1:length(UtranslateX)
    
    Utranslate = makehgtform('translate', [UtranslateX(i) UtranslateY(i) UtranslateZ(i)]);      %Translate the grouped shape
    Zrotate = makehgtform('zrotate', Urotate(i));       %Rotate the grouped shape
    UFOscale = makehgtform('scale', Uscale(i));         %Scale the grouped shape
    
    set(UFOObject, 'matrix', Utranslate*Zrotate*UFOscale);  %Draw the shape
    
    pause(0.05);        %Pause to simulate animation
    
end

%This animation illustrates the journey of a UFO through space, as it
%travels with its companion orb. This orb circles the UFO, scanning for 
%threats. 


