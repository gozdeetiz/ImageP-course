function result_image = halftone(input_image) 
minimum = min(min(input_image));
maximum = max(max(input_image));
step = ((maximum-minimum)/10);
middle_image = zeros(size(input_image));
for k=0:9
l_min= min+step + k;
l_max = l_min + step;
[i,j] = ind2sub(size(input_image), find(input_image>=lmin&input_image<=lmax));
for l = 1:length(i)
   middle_image(i(l),j(l)) = k;
end
end
middle_image
w=l; % for white and black circles
b=0;
gray0 = [b,b,b;b,b,b;b,b,b];
gray1 = [b,w,b;b,b,b;b,b,b];
gray2 = [b,w,b;b,b,b;b,b,w];
gray3 = [w,w,b;b,b,b;b,b,w];
gray4 = [w,w,b;b,b,b;w,b,w];
gray5 = [w,w,w;b,b,b;w,b,w];
gray6 = [w,w,w;b,b,w;w,b,w];
gray7 = [w,w,w;b,b,w;w,w,w];
gray8 = [w,w,w;w,b,w;w,w,w];
gray9 = [w,w,w;w,w,w;w,w,w];

result_image = zeros(size(middle_image)+3);
for i=1:size(middle_image,1)
   for j=1:size(middle_image,2)
       switch middle_image(i,j)
           case 0
                 level = gray0;
           case 1
                level = gray1;
           case 2
                level = gray2;
           case 3
                level = gray3;  
           case 4
                level = gray4;      
            case 5
                level = gray5;
            case 6
                level = gray6;
           case 7
                level = gray7;  
           case 8
                level = gray8;
            case 9
                level = gray9;
       end
           new_i = i +2*(i-1);
           new_j = j +2*(j-1);
           result_image(new_i:new_i+2:new_j+2) = level;
   end  
end
  
clc;clear all; close all; 
file_in = 'lenna.png';
input_path=['C:\Users\sony\Desktop' file_in]; 
input_image = imread('lenna.png'); 
figure, imshow(input_image), title('input image');
file_out = ['halftone-' file_in];
output_path=['C:\Users\sony\Desktop' file_out];
result_image= halftone(input_image);
figure,imshow(result_image),title('halftone image'); 
imwrite(result_image,output_path);   