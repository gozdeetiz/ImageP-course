close all
clear all
[filename,pathname] = uigetfile('*.bmp');
out = imread(filename);
out = logical(out);
figure, imshow(out);

se = strel('square',3);
se2 = strel('square',7);

openBW = imopen(out,se);
figure, imshow(openBW);

L = bwlabel(openBW);
stats = regionprops(L,'All');

% Eliminate the patches whose area is less than 75 pixels
idx = find([stats.Area] > 75);                    
BW2 = ismember(L,idx);                                     

L1 = bwlabel(BW2);                                          
stats = regionprops(L1,'All');  
figure, imshow(L1);

filledBW = imfill(L1,'holes');
figure, imshow(filledBW); 

closedBW = imclose(filledBW, se2);
figure, imshow(closedBW);

imwrite(closedBW,'processed.TIF');
