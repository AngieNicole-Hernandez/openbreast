function dataFile = getViewFull(dataset, view)
%Checks the images in the table dataset.images and returns another table with
%only the images that are o that view (CC or MLO)

contour = {};
images = {};
cwall = {};
th0 = [];
th1 = [];
th2 = [];
gap1 = [];
gap2 = [];
birads4 = [];
birads5 = {};
percent_density = [];

switch view
    case 'CC'   
        for i = 1:length(dataset.images)
            info = getinfo(char(dataset.images{i}));
             if info.iscc == 1
                 contour{end+1,1} = dataset.contour{i};
                 images{end+1,1} = dataset.images{i};
                 cwall{end+1,1} = dataset.cwall{i};
                 th0(end+1,1) = dataset.th0(i);
                 th1(end+1,1) = dataset.th1(i);
                 th2(end+1,1) = dataset.th2(i);
                 gap1(end+1,1) = dataset.gap1(i);
                 gap2(end+1,1) = dataset.gap2(i);
                 birads4(end+1,1) = dataset.birads4(i);
                 birads5{end+1,1} = dataset.birads5{i};
                 percent_density(end+1,1) = dataset.percent_density(i);
             end
        end
    case 'MLO'
        for i = 1:length(dataset.images)
            info = getinfo(char(dataset.images{i}));
             if info.iscc == 0
                 contour{end+1,1} = dataset.contour{i};
                 images{end+1,1} = dataset.images{i};
                 cwall{end+1,1} = dataset.cwall{i};
                 th0(end+1,1) = dataset.th0(i);
                 th1(end+1,1) = dataset.th1(i);
                 th2(end+1,1) = dataset.th2(i);
                 gap1(end+1,1) = dataset.gap1(i);
                 gap2(end+1,1) = dataset.gap2(i);
                 birads4(end+1,1) = dataset.birads4(i);
                 birads5{end+1,1} = dataset.birads5{i};
                 percent_density(end+1,1) = dataset.percent_density(i);
             end
        end
    otherwise
        warning('eh');
end

dataFile.contour = contour;
dataFile.images = images;
dataFile.cwall = cwall;
dataFile.th0 = th0;
dataFile.th1 = th1;
dataFile.th2 = th2;
dataFile.gap1 = gap1;
dataFile.gap2 = gap2;
dataFile.birads4 = birads4;
dataFile.birads5 = birads5;
dataFile.percent_density = percent_density;
end