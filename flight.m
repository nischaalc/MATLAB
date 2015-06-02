function [totalTime, range, velocity] = flight(v0, alpha, y0)

    g = 32;
    
    vx = v0*cos(alpha);
        
    totalTime = ((v0*sin(alpha)) + sqrt((((v0)*sin(alpha))^2) + (2*g*y0)))/g;
        
    range = (v0*cos(alpha))*totalTime;
    
    vy = v0*sin(alpha) - (g*totalTime);
    
    velocity = sqrt((vx*vx) + (vy*vy));

end

