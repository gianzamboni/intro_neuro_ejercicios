allData = [];
[dataFiles, cantFiles] = getImagesName('Data');
for k = 1:cantFiles
    load(cat(2, 'Data/',dataFiles(k,:)));
    dataSize = size(fullData);
    heigth = dataSize(1);
    subjectNumber = ones(heigth, 1)*k;
    fullData = cat(2, subjectNumber, fullData);
    if(k == 1) 
       allData = fullData([20:end],:); 
    else
       allData = cat(1, allData, fullData([20:end],:));
    end
end
