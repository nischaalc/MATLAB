function [ matrixSum ] = matrixAdder( X ,Y ,M ,D )

    myMatrix = M + (D*rand(X,Y));
    matrixSum = 0;
    
    for i = 1:X
        for j = 1:Y
            matrixSum = matrixSum + myMatrix(i,j);
        end
    end
    
end

