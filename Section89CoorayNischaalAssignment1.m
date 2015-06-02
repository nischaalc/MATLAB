%Nischaal Cooray
%Section 089

clear all;clc;

%% Question 1

r = 12;

C = 2 * pi * r;
A = pi * r^2;

fprintf('The Area of the swimming pool is %.2f and the circumference is %.2f.\n\n', A, C);

%% Question 2

rowVector = (1:2:20);
columnVector = (2:2:20)';

disp('The dimensions of the Row Vector are: ');
disp(size(rowVector));
disp('The dimensions of the column Vector are: ');
disp(size(columnVector));
disp('The dimensions of the transposed column Vector are: ')
disp(size(columnVector)');

additionResult = rowVector + columnVector'
possibilityOne = rowVector * columnVector
disp('Yes, this is the expected result.');
possibilityTwo = rowVector .* columnVector'
possibilityThree = columnVector * rowVector

%% Question 3

plotPoints = 20 * rand(1,100);
figure(1)
plot(plotPoints)
hold on
title('Uniformly Distibuted Random Numbers')
ylabel('Generated Numbers')
xlabel('Numbers')
plot(plotPoints, 'gx')

%% Question 4

firstRandom1000 = 50*randn(1,1000);

greaterThan50 = 0;
greaterThanOrEqual50 = 0;
lessThan50GreaterThan20 = 0;

for i = 1:length(firstRandom1000)
    if firstRandom1000(i) > 50
        greaterThan50 = greaterThan50 + 1;
        if firstRandom1000(i) >= 50
            greaterThanOrEqual50 = greaterThanOrEqual50 + 1;
        end
    elseif (firstRandom1000(i) < 50) && (firstRandom1000(i) >= 20) 
        lessThan50GreaterThan20 = lessThan50GreaterThan20 + 1;
    end
end
        
greaterThan50Prob = (greaterThan50/1000);
greaterThanOrEqual50Prob = greaterThanOrEqual50 / 1000;
lessThan50GreaterThan20Prob = lessThan50GreaterThan20 / 1000;

fprintf('The probability of getting a number greater than 50 is %.3f.\n', greaterThan50Prob);
fprintf('The probability of getting a number greater than or equal to 50 is %.3f.\n', greaterThanOrEqual50Prob);
fprintf('The probability of getting a number between 50 and 20 (including 20) is %.3f.\n\n', lessThan50GreaterThan20Prob);

%% Question 5


secondRandom1000 = 500 * randn(1,1000);

greaterThan150 = 0;
greaterThanOrEqual150 = 0;
lessThan150GreaterThan120 = 0;

for i = 1:length(secondRandom1000)
    if secondRandom1000(i) > 150
        greaterThan150 = greaterThan150 + 1;
        if secondRandom1000(i) >= 150
            greaterThanOrEqual150 = greaterThanOrEqual150 + 1;
        end
    elseif (secondRandom1000(i) < 150) && (secondRandom1000(i) >= 120) 
        lessThan150GreaterThan120 = lessThan150GreaterThan120 + 1;
    end
end

greaterThan150Prob = (greaterThan50/1000);
greaterThanOrEqual150Prob = greaterThanOrEqual150 / 1000;
lessThan150GreaterThan120Prob = lessThan150GreaterThan120 / 1000;

fprintf('The probability of getting a number greater than 150 is %.3f.\n', greaterThan150Prob);
fprintf('The probability of getting a number greater than or equal to 150 is %.3f.\n', greaterThanOrEqual150Prob);
fprintf('The probability of getting a number between 150 and 120 (including 120) is %.3f.\n\n', lessThan150GreaterThan120Prob);


%% Question 6

hypOne = findHypotenuse(6,8);
hypTwo = findHypotenuse(5,12);
hypThree = findHypotenuse(7,24);
hypFour = findHypotenuse(10,10);

fprintf('The hypotenuse of a right triangle with base 8 and height 6 is %.2f.\n', hypOne);
fprintf('The hypotenuse of a right triangle with base 12 and height 5 is %.2f.\n', hypTwo);
fprintf('The hypotenuse of a right triangle with base 24 and height 7 is %.2f.\n', hypThree);
fprintf('The hypotenuse of a right triangle with base 10 and height 10 is %.2f.\n\n', hypFour);

%% Question 7

sumOne = matrixAdder(10,10,0,100);
sumTwo = matrixAdder(100,1,10,10);
sumThree = matrixAdder(1000,760,-25,50);

fprintf('The sum of a matrix with dimensions (10,10), a mean of 0 and a standard deviation of 100 is %.2f.\n', sumOne); 
fprintf('The sum of a matrix with dimensions (100,1), a mean of 10 and a standard deviation of 10 is %.2f.\n', sumTwo);
fprintf('The sum of a matrix with dimensions (1000,7600), a mean of -25 and a standard deviation of 50 is %.2f.\n\n', sumThree);

%% Question 8

[c, perimeter, area, isRight] = findHypotenuse(6,8);
if (isRight == 1)
    dispStatement = 'would be';
else 
    dispStatement = 'would not be';
end
fprintf('A triangle with base 8 and height 6 would have:\n A hypotenuse of %.2f,\n A perimeter of %.2f, \n An area of %.2f, \n And %s a right triangle.\n\n', c, perimeter, area, dispStatement);

[c, perimeter, area, isRight] = findHypotenuse(5,12);
if (isRight == 1)
    dispStatement = 'would be';
else 
    dispStatement = 'would not be';
end
fprintf('A triangle with base 12 and height 5 would have:\n A hypotenuse of %.2f,\n A perimeter of %.2f, \n An area of %.2f, \n And %s a right triangle.\n\n', c, perimeter, area, dispStatement);

[c, perimeter, area, isRight] = findHypotenuse(7,24);
if (isRight == 1)
    dispStatement = 'would be';
else 
    dispStatement = 'would not be';
end
fprintf('A triangle with base 24 and height 7 would have:\n A hypotenuse of %.2f,\n A perimeter of %.2f, \n An area of %.2f, \n And %s a right triangle.\n\n', c, perimeter, area, dispStatement);

[c, perimeter, area, isRight] = findHypotenuse(10,10);
if (isRight == 1)
    dispStatement = 'would be';
else 
    dispStatement = 'would not be';
end
fprintf('A triangle with base 10 and height 10 would have:\n A hypotenuse of %.2f,\n A perimeter of %.2f, \n An area of %.2f, \n And %s a right triangle.\n\n', c, perimeter, area, dispStatement);


