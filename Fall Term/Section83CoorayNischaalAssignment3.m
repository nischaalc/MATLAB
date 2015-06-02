clc; clear all %Clear the command window and existing variables

%---------------------------- PLEASE READ --------------------------------
%In creating several of the functions, loops, checks etc in this document,
%StackOverflow.com was used for inspiration and help. 
%-------------------------------------------------------------------------
%%

sentenceArray = {'The quick brown fox and the cow jumped over the moon!' ; 'Twitter is the website that started the #craze' ; 'An email address always has an ''@'' character in it.' ; 'Being a Drexel Student is an amazing experience isn''t it?' ; 'MATLAB is a very useful tool.'};
specialChar = '[]{}()=''.().....,;:%%{%}!@';

for i = 1:length(sentenceArray)         %This loop displays the sentences
    fprintf('Sentence %d is: %s \n\n', i, sentenceArray{i})
end

for i = 1:length(sentenceArray)         %This loop displays the number of characters in each sentence
    fprintf('The total number of characers in Sentence %d is %d \n\n',i, length(sentenceArray{i}))
end

for i = 1:length(sentenceArray)         %This loop calculates and displays the number of times the word 'the' appears in a sentence
    theSentence = sentenceArray{i};
    totalThe = length(regexpi(theSentence, 'the'));
    fprintf('The number instances of ''the'' in sentence #%d is: %d \n\n', i, totalThe)
end

for i = 1:length(sentenceArray)         %This loop calculates and displays the number of times the word 'and' appears in a sentence
    theSentence = sentenceArray{i};
    totalAnd = length(regexpi(theSentence, 'and'));
    fprintf('The number instances of ''and'' in sentence #%d is: %d \n\n', i, totalAnd)
end

for i = 1:length(sentenceArray)         %This loop calculates and displays the number of times a space occurs in a sentence
    theSentence = sentenceArray{i};
    totalSpace = length(regexpi(theSentence, ' '));
    fprintf('The number of spaces in sentence #%d is: %d \n\n', i, totalSpace)
end

for i = 1:length(sentenceArray)         %This loop calculates and displays the number of times a special characters occurs in a sentence
    theSentence = sentenceArray{i};
    totalSpecial{i} = regexpi(theSentence, '[^\w\s]');
    fprintf('The number of special characters in sentence #%d is: %d \n\n', i, length(totalSpecial{i}))
end

for i = 1:length(sentenceArray)         %This loop calculates and displays the number of times a vowel appears in a sentence
    theSentence = sentenceArray{i};
    totalVowel{i} = regexpi(theSentence, '[aeiouy]');
    fprintf('The number of vowels in sentence #%d is: %d \n\n', i, length(totalVowel{i}))
end

%-------------------------------------------------------------------------
%The following code was inspired by an example posted on Stackoverflow.com
%-------------------------------------------------------------------------

A = '';     %define as an empty string
space = ' '; %define a space for later use

for i = 1:length(sentenceArray)     %This loop adds the value in the cells of sentenceArray to a string for easier searching
    newcell = sentenceArray{i, :};
    newstring = newcell(1,:);
    A = [A newstring space];
end

words = regexp(A, ' ' , 'split');       %Split the generated string into its different words and store in a cell array
uniquewords = unique(words);              %Removes duplicate strings from the cell array and assigns the answers to a new array
n = length(uniquewords);                  %Calculates the length of the new cell array
count = zeros(n, 1);               %Creates a matrix of zeros

for i = 1:n                         %This loop compares each value of the original cell array (words) with the unique values
    count(i) = sum(strcmpi(words, uniquewords{i}));      
end

[frequency, id] = max(count);         %Find the highest value of count
mostfrequentword = uniquewords{id};             %Use the index associated with this value of count to find the word that occurs most
fprintf('The most frequently occuring word is %s \n\n', mostfrequentword)      %Display the answer

%%

suspiciousWord = {'Drexel' ; 'public safety' ; 'hazing'};       
instances = 0;

i = 1;
for i = 1: length(suspiciousWord)
    fID = fopen('file5.txt');           %Open the file
    myLine = fgetl(fID);                %Get a line from the file
    count = 1;
    theword = suspiciousWord{i};        
    fprintf('Suspicious word: %s (%d instances) \n\n', theword, instances)      %Display which suspicious word is being searched for 
    if regexp(theword, 'Drexel') == 1               %As only 'Drexel' is case sensitive, this for loop checks if the word being searched for is Drexel
        while ischar(myLine)                        %This loop will continue to be processed as long as the line obtained from the file is valid
        if regexp(myLine, theword) > 0              %This searches the file, line by line, for the matching words
            column = regexp(myLine, theword);       %Assigns the column number that the word begins at to a variable
            fprintf('Line #%d (starting at column %d): %s \n\n', count, column, myLine)     %Display 
        end
        count = count + 1;              %Increment the counter
        myLine = fgetl(fID);            %Get the next line
        end
    else 
    while ischar(myLine)
        if regexpi(myLine, theword) > 0
            column = regexpi(myLine, theword);
            fprintf('Line #%d (starting at column %d): %s \n\n', count, column, myLine)
        end
        count = count + 1;
        myLine = fgetl(fID);
    end
    end
end

fclose(fID);

