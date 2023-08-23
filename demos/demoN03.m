%get dice coefficient between the MAG segmentations and the radiologist's
%segmentations
clear, clc

%load segmentations
MAGseg = load('...\magSegFile.mat');
Aseg = load('...\ConFiSegFile.mat');

%Dice coefficient
similarity = cell(length(Aseg.images),1);
%for the mean absoulete error
Apd = cell(length(Aseg.images),1);

%get Dice
tic
for i = 1:length(Aseg.images) 
    
    index = find(ismember(MAGseg.images,Aseg.images{i});
    
    similarity{i,1} = dice(MAGseg.mask_density{index}, Aseg.mask_density{i});
    
    Mpd{i,1} = MAGseg.pd{index};
end

timeElapsed = toc;

fprintf('%i image pairs assessed in %.1f seconds\n', j-1, timeElapsed)

%mean absolute error of PD
err = cell2mat(Mpd(:,1)) - cell2mat(Aseg.pd);
absoluteErr = abs(err);
meanAbsoluteErr = mean(absoluteErr);

men = mean(cell2mat(similarity), 'omitnan');
medn = median(cell2mat(similarity), 'omitnan');
qu = quantile(cell2mat(similarity), [0.25, 0.5, 0.75]);

fprintf('Mean = %i\n Median = %i\n Perc. 25th = %i\n Perc. 50th = %i\n Perc. 75th = %i\n Mean abs.error pd = %i\n' ,...
            men, medn, qu(1), qu(2), qu(3), meanAbsoluteErr)