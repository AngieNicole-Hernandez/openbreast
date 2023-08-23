%Modify the paths of the images (usually needed)
clear, clc

%load data
load('.../fileFromConFI.mat');

paths = dataset.images;

for i = 1:length(paths) 
    newStr = strrep(paths(i), ...
       'C:\Users\cumul\Documents\cumulus\dataset_cumulus\superficial', ...
       'E:\Seulontamammo');
    dataset.images{i} = newStr;
end

%save if needed
%save('.../fileFromConFI_new.mat', 'dataset');