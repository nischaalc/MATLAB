clear all; clc

%% Question 1

fID = fopen('dataFile.txt');        %Initializing Variables
myLine = fgetl(fID);
count = 0;
valid = 0;
corrupt = 0;
total = 0;
stdev = 0;
threshold = 0;
j = 1;
meanCount = 0;

while ischar(myLine)                %This while loop only runs if there is a line in the document
    myCell = regexp(myLine, '[- ]', 'split');   %Seperate the line into individual numbers and words
    count = count + 1;                %Counter to count number of lines in the document
    if regexp(myLine, 'valid') > 0      %Checks if the line contains the word 'valid'
        valid = valid + 1;              %Increments the counter for valid lines
        validCell{j} = myLine;          %Stores the line in a cell
        j = j + 1;                      
    else 
        corrupt = corrupt + 1;          %Increments the counter for corrupt lines
    end
    
    for i = 1:(length(myCell)-1)            
        total = total + str2num(myCell{i});     %Calculates the total by adding all the numbers in the document
        stdev = sqrt((1./(length(myCell)-1)*stdev));    %calculates the standard deviation
        meanCount = meanCount + 1;              %Increments a counter that counts how many numbers exist in the document
    end
    
    for i = 1:(length(myCell)-1)            
        myNumber = str2num(myCell{i});      %converts the Cell contents from strings to numbers
        if (myNumber > 30.7) == 1           %Checking if the number is greater than the threshold value
            threshold = threshold + 1;      %Increments the threshold counter if the condition is satisfied
        end
    end
    
    myLine = fgetl(fID);                    %Get the next line in the document
end

out = regexp(validCell, '[[\d]+[.\d*]-]*', 'match');        %Seperate each 'Valid' line in the document into its numbers
out = cat(2,out{:});                                        %Concatenates the resulting data

for i = 1:length(out)
    newOut{i} = regexp(out{i}, '-', 'split');
    %numOut = str2num(newOut{i});
end


myMean = total/meanCount;                           %Calculate the mean of the data
    
fprintf('Total number of lines: %d\n', count)       %These lines display information in the command window
fprintf('Number of valid lines: %d\n', valid)
fprintf('Number of corrupted lines: %d\n', corrupt)
fprintf('Number of numbers greater than the threshold: %d\n', threshold)
fprintf('Mean of all the data: %d\n', myMean)
fprintf('Std dev of all the data: %d\n', stdev);

fclose(fID);        %Close the file

%% Question 2

fID = fopen('keydata.txt');         %Initializing variables
myLine = fgetl(fID);                
a = 1;
b = 1;
count = 0;

while ischar(myLine)                %This while loop only runs if there is a valid line in the document
    count = count + 1;              %Increment a counter
    if regexp(myLine, 'midi') > 0   %Checks if the line has the word 'midi'
        midiPos{a} = myLine;        %stores the line in a cell
        a = a + 1;                  %Increment a counter
    elseif regexp(myLine, 'oscp') > 0   %Checks if the line has the word 'oscp' 
        keyPos{b} = myLine;         %Store the line in a cell
        b = b + 1;                  %Increment a counter
    else
        error = regexp(myLine, ' ', 'split');   %If neither of these are in a line
        errorPath = error{1};                   
        fprintf('Warning (line #%d): Unhandled OSC path %s\n', count, errorPath)    %Output an error message highlighting the path of the wrong line
    end
    
    if regexp(myLine, '0.750+') > 0     %Searches the document to see which line has the exact value 0.75 in it
        impLine = myLine;               %Store this line in a variable
        newImpLine = regexp(impLine, '[/ ]', 'split');  %Split the line into its individual components
        lineNumber = count;             %Store the line number of this line
    end
    
myLine = fgetl(fID);                %Get the next line in the document
end

for i = 1:length(midiPos)           
    newMidiPos = regexp(midiPos{i}, ' ', 'split');  %Splits the lines with the word 'midi' into their individual components
    for j = 2: length(newMidiPos)               
    numMidiPos(i) = str2num(newMidiPos{4});         %Converts the above cell contents into numbers
    end
    if numMidiPos(i) > 0
        startStamp = newMidiPos(5);                 %records the starting timestamp
    else
        endStamp = newMidiPos(5);                   %Record the ending time stamp
    end
end


for k = 1:length(keyPos)                            
    newKeyPos = regexp(keyPos{k}, ' ', 'split');        %Split the lines with the word 'oscp' into their individual components
    for l = 2: length(newKeyPos)                        
    numKeyPos(k) = str2num(newKeyPos{4});               %Converts the above cell contents into numbers
    timeStamp(k) = newKeyPos(5);                        %Record the time stamp of the key
    posStamp(k) = newKeyPos(4);                         %Record the position of the key
    end 
end

prevLineNumber = lineNumber - 3;                        %Find the lines before and after the line that contains '0.75'
follLineNumber = lineNumber - 1;

prevLine = regexp(keyPos{prevLineNumber}, '[/ ]', 'split'); %Split them into their components
follLine = regexp(keyPos{follLineNumber}, '[/ ]', 'split');

prevPos = str2num(prevLine{6});                         %Get the position and time stamp information of these lines
follPos = str2num(follLine{6});
prevTme = str2num(prevLine{7});
follTme = str2num(follLine{7});

velocity = (follPos - prevPos)/(follTme - prevTme);     %Calculate velocity at the point by using the gradient formula
fprintf('The velocity when the key position is equal to 0.75 is %d', velocity)  %Display this value

for i = 1:length(timeStamp)         %Convert time stamp information to numbers
    newTimeStamp(i) = str2num(timeStamp{i});
end

for i = 1:length(posStamp)          %Convert position information to numbers
    newPosStamp(i) = str2num(posStamp{i});
end

xval = newTimeStamp(1);             %Specify x and y coordinates to be plotted
xfin = newTimeStamp(end);
x = [xval, xval];
y = [0, 1000];
dotLine = str2num(newImpLine{7});
xdot = [dotLine dotLine];

figure(2)                           %Plot the graph of position vs. time
plot(newTimeStamp, newPosStamp)
axis([0 3 0 1])
hold on
line(x,y,'color', 'r')
hold on
line([xfin xfin],y, 'color','k')
hold on
line(xdot,y, 'color', 'k', 'LineStyle','--')
xlabel('Time (seconds)')
ylabel('Position')
title('Key Position vs. Time')
legend('Position', 'Start Time', 'End Time', 'Position == 0.75', 'Location','NorthWest')



