clear all
clc

x = [1 2 3];
y = [1:10];

y2 = linspace(1,10,4); %Useful if number of data points needed is known, but not the interval

z = rand(3,4);
length(z); % largest dimension
size(z); %size of variable

a = 1;b=3;c=10;

if (a > b)
    fprintf('condition is true \n')
elseif (b < c)
    fprintf('condition is false \n')
end

d = 5*rand(20,1); %Normal
e = 2 + 2*rand(20,1);

for (i = 1:length(d))
    if d(i) > 2.5
        fprintf('value > 2.5\n')
    else 
        fprintf('value < 2.5\n')
    end    
end

figure(1)
plot(d, 'bo:');
hold on;
plot(e, 'm^:');

figure(2)
hist(e);

f = 5 * randn(2000, 1); %Uniform
figure(3)
hist(f);






