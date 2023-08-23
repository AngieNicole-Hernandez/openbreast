%Get the segmentations from the output file of ConFi
clear, clc

%load data
load('.../fileFromConFI.mat');

%run the segmentation re-building
mask_breast = cell(length(dataset.images),1);
mask_density = cell(length(dataset.images),1);
pd = cell(length(dataset.images),1);

for i = 1:length(dataset.images)
    [mask0,mask1,pd] = showmseg(dataset,i);
    mask_breast{i,1} = mask0;
    mask_density{i,1} = mask1;
    pd{i,1} = pd;
end

%save if needed
%save('radiologistMasks.mat', 'paths', 'mask_breast', 'mask_density', 'pd');