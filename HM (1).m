pic = imread('scene1.tif');
for mm = 1 : size(pic, 1)
  for nn = 1 : size(pic, 2)
    if pic(mm, nn, 1) < 80 && pic(mm, nn, 2) > 80 && pic(mm, nn, 3) > 100
      gsc = 0.3 * pic(mm, nn, 1) + 0.59 * pic(mm, nn, 2) + 0.11 * pic(mm, nn, 3);
      pic(mm, nn, :) = [gsc gsc gsc];
    end
  end
end
% check if an RGB color is in the +/-30 range of rgb(100, 110, 120)
R = 128;
G = 100;
B = 220;
result = R > 70 && R < 130 &&
         G > 80 && G < 140 &&
         B > 90 && B < 150;
% calculate distance between an RGB color and rgb(100, 110, 120)
R = 128;
G = 100;
B = 220;
distance = (R - 100) .^ 2 + (G - 110) .^ 2 + (B - 120) .^ 2;

% decision based on distance
result = distance < 100;
% define R, G and B components of required color
R = 210;
G = 175;
B = 125;

% read image
image = imread('scene1.tif.jpg');

% extract R, G and B channels
channelR = image(:, :, 1);
channelG = image(:, :, 2);
channelB = image(:, :, 3);

% calculate gray image
gray = rgb2gray(image);
% calculate differences for each channels
dR = channelR - R;
dG = channelG - G;
dB = channelB - B;

% calculate overall distance from the given RGB color
d = dR .^ 2 + dG .^ 2 + dB .^ 2;

% create a mask by thresholding the differences
mask = d < 2000;
% copy the gray values where the mask is true
channelR(mask) = gray(mask);
channelG(mask) = gray(mask);
channelB(mask) = gray(mask);

% copy channels into the RGB image
image(:, :, 1) = channelR;
image(:, :, 2) = channelG;
image(:, :, 3) = channelB;
imshow(channelR);
imshow(channelG);
imshow(channelB);