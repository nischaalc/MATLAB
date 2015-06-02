function y = problem3(x)

    axis equal;
    hold on
    
    translate = 0.5;
    translatey = 7;
    
    y = plot(x(1,:)*translate, (x(2,:)+translatey)*translate,'r');

end
