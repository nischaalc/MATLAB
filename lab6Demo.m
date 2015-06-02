% Lab 7 - 3D Objects and Animations

hold off; clear all; close all; clc;

% Creating axes

myAxes=axes('xlim',[-4 12], 'ylim', [-4 4], 'zlim', [-2 4]);

grid on
view(3)
axis equal
hold on
xlabel('x')
ylabel('y')
zlabel('z')

%% Creating shapes
[xcyl ycyl zcyl]=cylinder([2 2],30);
[xsph ysph zsph]=sphere(20);
% 
% 
h(1)=surface(xcyl,ycyl,.5*(zcyl-0.5),'FaceColor','r');
h(2)=surface(xsph, ysph, zsph);

%% Combining shapes

combinedObject = hgtransform('parent',myAxes);
set(h,'parent',combinedObject)
drawnow

longitude = linspace(10,0,10); % x translation
% latitude  = [2 2 2 2 2 -2 -2 -2 -2 -2]; % y translation
% altitude =  [0 1 3 4 4 4 3 2 1 0]; % z translation
bearing = linspace(0,90,10); % rotation


%% Animating objects

for i = 1:length(longitude)
        translation = makehgtform('translate',[longitude(i) 0 0]);
        rotation1 = makehgtform('xrotate',(pi/180)*bearing(i));
        rotation2 = makehgtform('yrotate',(pi/180)*bearing(i));
        rotation3 = makehgtform('zrotate',(pi/180)*bearing(i));
        scaling   = makehgtform('scale',1-i/20);
        
        
        % combine the transformations
        
%         set(combinedObject,'matrix',rotation2*translation);
        set(combinedObject,'matrix',translation*rotation2);
        pause(0.3)
end

%% other animation

longitude=linspace(0, 0, 200);
latitude= linspace(0,0,200);
altitude=linspace(0,4,200);
bearing=linspace(0,20*pi,200);

for i = 1:length(latitude)
        translation = makehgtform('translate',[latitude(i) longitude(i) altitude(i)]);
        rotation1 = makehgtform('xrotate',bearing(i));
        rotation2 = makehgtform('yrotate',bearing(i));
        rotation3 = makehgtform('zrotate',bearing(i));
        scaling   = makehgtform('scale',1-i/100);
        
        % combine the transformations
        
        set(combinedObject,'matrix',translation*rotation1*rotation2*rotation3*scaling);
        pause(0.03)
end