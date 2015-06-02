clear all; clc;

%% 2(a)

myNum = 10.5;
myNumConverted = num2str(myNum)
class(myNum)
class(myNumConverted)
myNumBack = str2num(myNumConverted)
class(myNumBack)
size(myNum)
size(myNumConverted)

%% 2(b)

myNumbers = {'12', '40', '8', '24'};
index = 1;
mySum = 0;
while index <= length(myNumbers)
    number = str2num(myNumbers{index});
    mySum = mySum + number;
    index = index + 1;
end
fprintf('The final sum is %d. \n', mySum)

%% 2(c)

fid = fopen('data1.txt');
myLine1 = fgetl(fid);
myLine2 = fgetl(fid);
myLine3 = fgetl(fid);
myNum1 = str2num(myLine1);
myNum2 = str2num(myLine2);
myNum3 = str2num(myLine3);
totalSum = myNum1 + myNum2 + myNum3

fclose(fid)

%% 2(d)

fID = fopen('data2.txt');
myLine = fgetl(fID);
myTot = 0;

while ischar(myLine)
    myNum = str2num(myLine);
    myTot = myTot + myNum;
    myLine = fgetl(fID);
end

fprintf('The Total is %d \n', myTot)

fclose(fID);

%% 3(b)

str1 = 'bat cat can car coat court cut ct caoueouat';
pat1 = 'c[aeiou]+t';
answer = regexp(str1, pat1)

str2 = 'regexp helps you relax';
pat2 = '\w*x\w';
m = regexp(str2, pat2, 'match')

pat3 = '\s+';
n = regexp(str2, pat3, 'split')

str3 = 'freebies are better than cats hiding in the trees';
pat4 = '\w*es\>';
b = regexp(str3, pat4, 'match')

%% 4

fId = fopen('data4.txt');
myLine = fgetl(fId);
myCell = regexp(myLine, '\s', 'split');

mySum = 0;
myMean = 0;
myStd = 0;
count = 0;

for i = 1:length(myCell)
    mySum = mySum + str2num(myCell{i});
    myMean = (mySum + str2num(myCell{i}))/2;
    myStd = std(myCell{i});
    count = count + 1;
end

fprintf('Total Number of elements: %d\n\n', count)
fprintf('Mean of all numbers: %d\n\n', myMean)
fprintf('Std. Dev of all numbers: %d\n\n', myStd)


