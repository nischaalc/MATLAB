clc; clear all; close all

%% Question 3

for i = 1:5
    disp(i)
end

i = 1; 
while i <= 5
    disp(i)
    i = i + 1 ;
end

myNumbers = rand(100,1);
mySum = 0;
index = 1;
while mySum <= 25
    mySum = mySum + myNumbers(index);
    index = index + 1;
end
fprintf('It took %d numbers. The sum is %.2f', index, mySum)

myPaper = 42;
numCuts = 0;
while myPaper > 0.3
    myPaper = (myPaper/2)
    numCuts = numCuts + 1;
end
fprintf('It took %d cuts.', numCuts)

% myCondition = true;
% index = 0;
% while myCondition == true
%     fprintf('Running away... Currently at line %d.', index)
%     index = index + 1;
% end

%% Question 4

fileID = fopen('file1.txt')
fileContent = fgetl(fileID)
fclose(fileID)

fid = fopen('file2.txt')
fileContents{1,1} = fgetl(fid)
fileContents{2,1} = fgetl(fid)
fileContents{3,1} = fgetl(fid)
fclose(fid)

fID = fopen('file3.txt')
myLine = fgetl(fID);
i = 1;
count = 1;

while ischar(myLine)
    lineLength = length(myLine);
    fprintf('Line #%d %d characters: %s\n\n', count, lineLength, myLine)
    i = i + 1;
    count = count + 1;
    myLine = fgetl(fID);
end
fclose(fID);

%% Question 5

fId = fopen('file4.txt');
myLine = fgetl(fId);
i = 1;
count = 1;

while ischar(myLine)
    if strcmp(myLine, 'STOP') == 1
        fprintf('The line that contains the word STOP is %d', count)
    end
    count = count + 1;
    myLine = fgetl(fId);
end

% End of Lab 7












