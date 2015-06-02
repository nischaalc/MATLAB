% example input
example = 'This is an example corpus. Is is a verb?';
words = regexp(example, ' ', 'split');

%your program, result in vocabulary and counts. (input is a cell array called words)
vocabulary = unique(words)
n = length(vocabulary);
counts = zeros(n, 1);
for i=1:n
    counts(i) = sum(strcmpi(words, vocabulary{i}));
end

%process results
[val, id]=max(counts);
most_frequent_word = vocabulary{id};
