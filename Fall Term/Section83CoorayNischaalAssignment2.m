clear all; clc; close all

%%

%Question 1

count = 0;                                      %Definition of variables
w1 = 0;
w2 = 0;
w3 = 0;
x1 = 0;
x2 = 0;
x3 = 0;
y1 = 0;
y2 = 0;
y3 = 0;
z1 = 0;
z2 = 0;
z3 = 0;

random10 = 0 + 50 * randn(10, 1);               %Creation of the 4 vectors
random100 = 0 + 50 * randn(100, 1);
random1000 = 0 + 50 * randn(1000, 1);
random10000 = 0 + 50 * randn(10000, 1);

for i = 1:4                                     %Selection of a number at random from within these vectots
    if i == 1 
        x = randi(10, 1, 1);
        chosen10 = random10(x);
    end
    if i == 2
        x = randi(100, 1, 1);
        chosen100 = random100(x);
    end
    if i == 3
        x = randi(1000, 1, 1);
        chosen1000 = random1000(x);
    end
    if i == 4 
        x = randi(10000, 1, 1);
        chosen10000 = random10000(x);
    end   
end

figure(1)                                       %Plotting the histograms of the generated vectors
hist(random10)
title('10 random numbers')
xlabel('Range')
ylabel('Number of occurences')

figure(2)
hist(random100)
title('100 random numbers')
xlabel('Range')
ylabel('Number of occurences')

figure(3)
hist(random1000)
title('1000 random numbers')
xlabel('Range')
ylabel('Number of occurences')

figure(4)
hist(random10000)
title('10000 random numbers')
xlabel('Range')
ylabel('Number of occurences')



for count = 1:10                                %These FOR loops calculate the probabilties of a number being selected if;
    if random10(count) > 50                     %The number is greater than 50
       w1 = w1 + 1;
    if random10(count) >= 50                    %The number is greater than or equal to 50
       w2 = w2 + 1;
    end
    elseif (50 > random10(count)) & (random10(count) >= 20) %The number is greater than or equal to 20 and less than 50
       w3 = w3 + 1;
    end
end
 
for count = 1:100                               
    if random100(count) > 50
       x1 = x1 + 1;
    if random100(count) >= 50
       x2 = x2 + 1;
    end
    elseif (50 > random100(count)) & (random100(count) >=20)
        x3 = x3 + 1;
    end
end

for count = 1:1000
    if random1000(count) > 50
       y1 = y2 + 1;
    if random1000(count) >= 50
       y2 = y2 + 1;
    end
    elseif (50> random1000(count)) & (random1000(count) >=20)
       y3 = y3 + 1;
    end
end

for count = 1:10000
    if random10000(count) > 50
       z1 = z1 + 1;
    if random10000(count) >= 50
       z2 = z2 + 1;
    end
    elseif (50 > random10000(count)) & (random10000(count) >= 20)
        z3 = z3 + 1;
    end
end


w1 = (w1/length(random10))*100;             %Calculating the percentage probability of a number being selected
w2 = (w2/length(random10))*100;
w3 = (w3/length(random10))*100;
x1 = (x1/length(random100))*100;
x2 = (x2/length(random100))*100;
x3 = (x3/length(random100))*100;
y1 = (y1/length(random1000))*100;
y2 = (y2/length(random1000))*100;
y3 = (y3/length(random1000))*100;
z1 = (z1/length(random10000))*100;
z2 = (z2/length(random10000))*100;
z3 = (z3/length(random10000))*100;

str1 = ['The probability of a number from the 10 number vector being greater than 50 is ' num2str(w1) '%'];             %Assigning the display strings to a variable
str2 = ['The probability of a number from the 10 number vector being greater than or equal 50 is ' num2str(w2) '%'];
str3 = ['The probability of a number from the 10 number vector being greater or equal to 20 and less than 50 is ' num2str(w3) '%'];
str4 = ['The probability of a number from the 100 number vector being greater than 50 is ' num2str(x1) '%'];
str5 = ['The probability of a number from the 100 number vector being greater than or equal to 50 is ' num2str(x2) '%'];
str6 = ['The probability of a number from the 100 number vector being greater than or equal to 20 and less than 50 is ' num2str(x3) '%'];
str7 = ['The probability of a number from the 1000 number vector being greater than 50 is ' num2str(y1) '%'];
str8 = ['The probability of a number from the 1000 number vector being greater than or equal to 50 is ' num2str(y2) '%'];
str9 = ['The probability of a number from the 1000 number vector being greater than or equal to 20 and less than 50 is ' num2str(y3) '%'];
str10 = ['The probability of a number from the 10000 number vector being greater than 50 is ' num2str(z1) '%'];
str11 = ['The probability of a number from the 10000 number vector being greater than or equal to 50 is ' num2str(z2) '%'];
str12 = ['The probability of a number from the 10000 number vector being greater than or equal to 20 and less than 50 is ' num2str(z3) '%'];

disp(str1)              %Displaying the final answers
disp(str2)
disp(str3)
disp(str4)
disp(str5)
disp(str6)
disp(str7)
disp(str8)
disp(str9)
disp(str10)
disp(str11)
disp(str12)

%As the length of the vector increases, the probability of a number being
%chosen within the specified ranges decresaes. This is due to the fact that
%the vector is uniform and has a defined standard deviation. As these
%vectors have a mean of 0 and a standard deviation of 50, the most commonly
%occuring numbers will be between -50 and 50, therefore, as more numbers
%are generated, in order to ensure that the mean is kept as close to 0 as
%possible, the numbers will be generated over a larger range. 

disp('End of Question 1')

%%

myVector = 15 + (rand(600, 1) * 17);            %Definition of variables
standardDeviation = 0;
mySum = 0;
myStd = 0;
n = length(myVector);

for i = 1:n                                     %This FOR loop calculates the sum of the vector
    mySum = mySum + myVector(i);
end

myMean = mySum / n                              %Calculating the mean of the vector without using built in functions
realMean = mean(myVector)                       %Calculating the mean of the vector using the built in functions for comparison

for i = 1:n                                     %This FOR loop calculates the sum of the vector elements and the mean
    myStd = myStd + (myVector(i) - myMean)^2;
end

myStd = sqrt((1./n)*myStd)                      %Calculating the final standard deviation. The formula is broken into parts to allow for Stepwise Refinement
realSTD = std(myVector)                         %Calculating the standard deviation using built in functions for comparison

figure(5)                                       %Plotting a histogram of the vector
hist(myVector)
title('Distribution of My Vector')
xlabel('Range of Numbers')
ylabel('Number of Occurences')

%The calculation of mean that I carried out without using the built in
%functions as the formula used by MATLAB is the same as what I did.
%However, the miniscule difference in the standard deviations is caused by
%the fact that MATLAB uses a slightly different formula to calculate 
%its value. Where I did sqrt((1/n)*mySTD), MATLAB does sqrt((1/n -
%1)*mySTD). This causes the small variation in the calculated values.

disp('End of Question 2')
