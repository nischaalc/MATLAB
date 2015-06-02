clear all
clc

%% Question 2

A = 5;
if A >10 
        result = 3
end

C= 5;
if C > 10 
    result = 3
else    
    result = 1
end

B = 14;
if A > 10 && B <=13 
    result = 3;
elseif A == 5 || B > 13
    result = 1
    else
        result = 7
end

x = 27;
y = 15;
z = 40;

if x < 25;
    z = 10
elseif x > 30 && y > 20;
    z = 12
elseif 30 > x > 25 && y < 20;
    z = 0
else
    z = 8
end

disp('End of Question 2')

%% Question 3

for i = 1:10
    disp(i)
end

for i = [2 4 6 8 10]
    disp(i)
end

for i = 1:5:50
    disp(i)
end

disp('End of Question 3')

%% Question 3

myUniformVector  = 10 * rand(25,1)
myNormalVector = 5 + randn(25, 1)

figure(1)
plot(myUniformVector, 'ro-')
title('Uniform Vector')

figure(2)
plot(myNormalVector, 'bd-')
title('Normal Vector')

figure(3)
hist(myUniformVector)
title('Uniform Vector')

figure(4)
hist(myNormalVector)
title('Normal Vector')

testVector = [2 4 6 8 10];
testVector(2)

for k = 1:length(testVector)
    testVector(k)
end

greaterThan6 = 0;
lessThan6 = 0;

for i = 1:length(myUniformVector);
    if myUniformVector(i) > 6
        greaterThan6 = greaterThan6 + 1;
    end
end

for i = 1:length(myNormalVector);
    if myNormalVector(i) < 6
        lessThan6 = lessThan6 + 1;
    end
end

Greater_Than_6 = greaterThan6
Less_Than_6 = lessThan6



       
