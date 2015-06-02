clc; clear all

arr = {'hello', 'world'; 'hello', 'again'; 'I----', 'said-'; 'hello', 'again'};

[uniquestrings, ~, stringmap] = unique(arr) 
common = uniquestrings(mode(stringmap))