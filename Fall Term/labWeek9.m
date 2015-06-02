clear all; clc;

%% Question 2

myPrice = 325;

for i = 1:30
    myRand = rand(1,1);
    if myRand <= 0.34 
        myPrice = 325 -15;
    else 
        myPrice = myPrice * 1.03;
    end
end

disp(myPrice)

%% Question 3

fID = fopen('review1.txt');
myLine = fgetl(fID);
i = 1;

while ischar(myLine)
    myVector(i) = str2num(myLine);
    myLine = fgetl(fID);
    i = i + 1;
end

for i = 1:length(myVector)
    if myVector(i) < 0
        



