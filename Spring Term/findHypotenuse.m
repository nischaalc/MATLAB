function [ c, perimeter, area, isRight ] = findHypotenuse(a , b)
    
    c = sqrt(a^2 + b^2);
    
    perimeter = a + b + c;
        
    area = 0.5 * a * b;
    
    if (a == b) || (b == c) || (c == a)
        isRight = true;
    else 
        isRight = false;
    end
    

end

