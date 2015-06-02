clear all; close all; clc;

%%

A = 5:3:23
B = [2 4 6; 3 6 9; 1 4 7]
C = magic(4)
D = eye(5)

x= A(1,4)       %Displays the 4th value in the first row of A
y = A(1:2:5)    %Displays the 1st, 3rd and 5th values from A
s = B(:,2)      %Displays the second column of B
t = C(1:3,2:4)  %Displays the 1st through third rows of the 2nd through 4th columns
z = D(end,end)  %Displays the final value from D

%%

i = A(end, 5:7) %Dispays the final 3 values of A
ii = B(2,:)     %Displays all values in the second row of B
iii = B(:,2)    %Displays all values in the second column of B
iv = C(1:2:3,2:2:4) %Displays the 1st and 3rd rows, 2nd and 4th columns of C
v = D(1,5)      %Displays the 1st row , 5th column of D
vi = B(2,3)     %Displays the 2nd row, 3rd column of B

%%

i = 1;
for j = 1:4             %Displays the diagonal values of C
    C(j, i)
    i = i + 1;
end

%%

myVector = 15 + 5*randn(250, 1);        %Creates a vector with 250 numbers, std of 5 and mean of 15
myMean = 0;
mySum = 0;

a = mean(myVector)

for i = 1:250
    mySum = mySum + myVector(i);        %Calculates the sum of the vector  
end

myMean = mySum/250                      %Calculates the mean of the vector using the calcualted sum

%%

standardDeviation = 0;
bracketPart = 0;

for i = 1:250
    bracketPart = bracketPart + (myVector(i) - myMean)^2;
end

bracketPart = sqrt((1/250)*bracketPart)
realSTD = std(myVector)