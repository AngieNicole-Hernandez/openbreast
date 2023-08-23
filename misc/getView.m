function images = getView(imageList, view)
%Checks the images in the table imageList and returns another table with
%only the images that are o that view (CC or MLO)

images = {};

switch view
    case 'CC'   
        for i = 1:length(imageList)
            info = getinfo(char(imageList{i}));
             if info.iscc == 1
                 images{end+1,1} = imageList{i};
             end
        end
    case 'MLO'
        for i = 1:length(imageList)
            info = getinfo(char(imageList{i}));
             if info.iscc == 0
                 images{end+1,1} = imageList{i};
             end
        end
    otherwise
        warning('eh');
end
end