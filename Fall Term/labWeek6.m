clc; clear all
%% Question 3(a)(b)

% A = 5 : 3 : 23
% B = [ 2 4 6 ; 3 6 9 ; 1 4 7 ]
% C = [ 1 2 3 ; 4 5 6 7 ; 8 9 10]
% D = ' This i s some text . '
% E = [ ' teach ' ; ' peach ' ; ' catch ' ]
% F = [  's t u d e n t s ' ; ' do not ' ;  'cheat ' ]

C = { [ 1 2 3 ] ; [ 4 5 6 7 ] ; [ 8 9 10] }
H = {{1 2 3 } ; {4 5 6 7 } ; {8 9 10}}
F = { ' s t u d e n t s ' ; ' do not ' ; ' cheat ' }
A( 1 : 4 )
A( 1 : 2 : 5 )
lengthA = length(A)
B ( : , 2 )
temp = C{1}     % This gives the first row of C
temp ( 2 )      % This extracts the second number in the first row of C
H{1}{2}         % Easier method but pay attention to how H is created
D( 1 : 4 )
E ( : , 1 )
F{2:3}
class(A)
class(F)

%% Question 3(c)

A(5:end)
C{2}
C{2}(3:4)
D(9:13)
E(:, 5)

%% Question 3(d)

myText = ['cat'; 'pat' ; 'bat']
myNewText = [myText(1, :) ' ' myText(2, :) ' ' myText(3, :)]
size(myText)
size(myNewText)

%% Question 3(e)

theNewString = [F{1} ' ' F{2} ' ' F{3}]

%% Question 4(a)

myString = 'Hello, World!'
myStringwNumbers = 'It is 2013'
newString = [myString ' ' myStringwNumbers]
firstWord = myString(1:5)
fprintf('THe first word is %s.\n' , firstWord)
fprintf('If A is %d and B is %d, then C is %d\n', A, B, C)


%% Question 4(b)

myVector = 20 + 40*randn(500, 1);
meanVector = mean(myVector);
modeVector = mode(myVector);
stdVector = std(myVector);
lengthVector = length(myVector);

fprintf('Calculate mean = %.1f Standard Deviation = %.1f\n Mode of the data = .%1f Mean of the Data = %d', meanVector, stdVector, modeVector, lengthVector)


% Question 5

text1 = 'Test'; text2 = 'Tire'; text3 = 'test'; text4 = 'Tire'; text5 = 'wheel';
if text1 == text2
    disp('Match')
end
if text2 == text4 
    disp('Match')
end
if text4 == text5
    disp('Match')
end
if strcmp(text1, text3)
    disp('Match')
end
if strcmpi(text1, text3)
    disp('Match')
end




