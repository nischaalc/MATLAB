clear all; clc;

%% 

fID = fopen('twitterdata.txt');         %Initializing variables
myLine = fgetl(fID);
counter = 0;
Icount = 0;
hashCount = 0;
j = 1;
theCount = 0;
atCount = 0;
k = 1;
lineLength = 0;
avgLength = 0;
hashLength = 0;
handleLength = 0;
avgHash = 0;
avgHandle = 0;

while ischar(myLine)                    %Enters the loop only if a valid line is found
    counter = counter + 1;              %Increment a counter that counts the number of lines
    lineLength = lineLength + length(myLine);   %Counts the number of characters in each line and adds to a variable 
    
    myLineArray = regexp(myLine, ' ', 'split');     %Split the line into its seperate words
    
    for i = 1:length(myLineArray)                   %This loop finds all occurences of just 'I' and increments a counter when found
        if regexp(myLineArray{i}, 'I(?=$|_)') > 0
            Icount = Icount + 1;
        end
        if regexpi(myLineArray{i}, 'the(?=$|_)') > 0    %This loop finds all occurences of just 'the' and increments a counter when found
            theCount = theCount + 1;
        end
        if regexp(myLineArray{i}, '#') > 0              %This loop finds hashtags and stores them in a cell. Also increments a counter.
            hashCount = hashCount + 1;
            hashVal{j} = myLineArray{i};
            j = j + 1;
        end
        if regexp(myLineArray{i}, '@') > 0              %This loop finds Twitter hands and stores them in a cell. Also increments a counter. 
            atCount = atCount + 1;
            atVal{k} = myLineArray{i};
            k = k + 1;
        end
    end
 
    myLine = fgetl(fID);                                %Get the next line of the document
    
end

for i = 1:length(hashVal)                               %Calculate the average hashtag length
    hashLength = hashLength + length(hashVal{i});
end
    
avgLength = lineLength/counter;                         %Calculate the average length of the lines
avgHash = (hashLength-length(hashVal))/length(hashVal);     %Calculates the average length of the hashtags

fprintf('The number of tweets is %d\n', counter)            %Display the number of tweets in the document
fprintf('The average length of the tweets is %d characters\n', avgLength)       %Display the average length of the tweets
fprintf('The number of I''s is %d\n', Icount)               %Display the number of 'I's found in the document
fprintf('The number of the''s is %d\n', theCount)           %Display the number of 'the's found in the document
fprintf('The number of hashtags is %d\n', hashCount)        %Display the number of hashtags found in the document
fprintf('The hashtags are;\n')                              %Display the individual hashtags
for i = 1:length(hashVal)
    temp = sprintf('%s\n', hashVal{i});
    fprintf('%s', temp)
end
fprintf('The average length of the hashtags is %d characters\n', avgHash)   %Display the average lenght of a hashtag
fprintf('The number of Twitter handles is %d\n', atCount)                   %Display the number of Twitter handles in the document
fprintf('The Twitter handles are;\n')                                       %Display the individual Twitter handles
for i = 1:length(atVal)
    temp = sprintf('%s\n', atVal{i});
    fprintf('%s', temp)
end

fclose(fID);                %Close the file

%The Twitter account I am analyzing is @StephenAtHome, the Twitter page of
%Stephen Colbert.
%I think this person is very popular on Twitter as he has over 5 million followers on
%Twitter. I believe most of them would be viewers of his show ('The Colbert
%Report') that airs on Comedy Central. 
%No, I do not think there was any recent even that affected this person. 
%He does not tweet alot, averaging between 2 and 4 tweets a week. His
%tweets mainly relate to his show and remain relatively short. Occasionally
%he tweets about events that are occuring. For example, he recently tweeted
%about Thanksgiving. 