% do not modify the function line below
function [xTranslation, yTranslation, zTranslation] = problem3Week6

% generate the figure window and axes
myAxes = axes('xlim',[-20 20], 'ylim', [-20 20], 'zlim', [-20 20]);
view(3);

% generate sphere
[xsp ysp zsp] = sphere(10);
h = surface(xsp * 1.5, ysp * 1.5, zsp * 1.5, 'FaceColor', 'r');
combinedObject = hgtransform('parent', myAxes);
set(h, 'parent', combinedObject);

% 3-D Animation
xTranslation = [-10  10 10  -10 -10 10  10 -10];
yTranslation = [-10 -10 10   10 10  10 -10 -10];
zTranslation = [-10 -10 -10 -10 10  10  10  10];

for i = 1:length(xTranslation)
    translation = makehgtform('translate', [xTranslation(i) yTranslation(i) zTranslation(i)]);    
    % Combining the individual transformation
    set(combinedObject,'matrix',translation);
    pause(.5)
    hold on
end

end