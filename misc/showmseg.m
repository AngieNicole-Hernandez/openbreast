function [ims, mask1, pd] = showmseg(segdata,i)

% display manual segmentation
impath = segdata.images{i};
im = ffdmRead(char(impath), getinfo(char(impath)));
mask0 = seg2mask(segdata.contour{i},...
    segdata.cwall{i});
maske = seg2mask(segdata.contour{i},...
    segdata.cwall{i},...
    [], segdata.gap1(i),...
    segdata.gap2(i));


mask1 = im>segdata.th1(i);
mask1 = imresize(mask1, size(maske));
mask1 = mask1&maske;
mask1 = bwareaopen(mask1, segdata.th2(i));
pd = sum(mask1(:))/sum(mask0(:));

im = adapthisteq(mat2gray(im));
ims = showseg(im, mask0);
ims = showseg(ims, mask1, 0.25);
if nargout==0
    imshow(ims);
end