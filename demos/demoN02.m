%get MAG (and LIBRA) segmentations
clear, clc

%load the list of images
load('...\listaMLO_profound.mat'); % this is images

mask_breast = cell(length(images),1);
mask_density = cell(length(images),1);
pd = cell(length(imageList),1);

tic 

%get MAG segmentations
for i = 1:length(images)
    
    % read reference image:
    info    = getinfo(char(images{i}));
    im      = ffdmRead(char(images{i}), info);
    %images are resized to .25 because these were the sizes that were used
    %with ComFi, this way the sizes fit immediately
    im      = imresize(im, 0.25); 
    %I think this has an effect on the skin gap, the bigger the pixel
    %size,the more drastic the distance fromthe skin and the weirdest it ends
    %up being
    
    % morphology-based density estimation 
    mask = segBreast(im, info.ismlo); 
    [seg, pden, ~] = mseg(im, mask, info.psize);
    
    %arrays
    mask_breast{i,1} = mask;
    mask_density{i,1} = seg;
    pd{i,1} = pden;
end

timeElapsed = toc;

fprintf('MAG: %i images segmented in %.1f minutes\n', ...
    length(images),timeElapsed/60)

%save if needed
%save('magSeg.mat', 'imageList', 'mask_breast', 'mask_density', 'pd');


%-------------------------------------------------------------------------
%get LIBRA segmentations

mask_breast_LIBRA = cell(length(images),1);
mask_density_LIBRA = cell(length(images),1);
pd_LIBRA = cell(length(images),1);

for i = 1:length(images)
    
    [pd1, mask1] = pdensity(impath);
    
    mask_density_LIBRA{i,1} = mask1;
    pd_LIBRA{i,1} = pd1;
end

%save if needed
%save('LibraSeg.mat', 'imageList', 'mask_density_LIBRA', 'pd_LIBRA');
