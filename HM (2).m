my_image = imread('pout.tif');
my_image = my_image(:,:,1);
% allocate space for thresholded image
image_thresholded = zeros(size(my_image));
a1=input('a1 degerini giriniz:');
a2=input('a2 degerini giriniz:');
% loop over all rows and columns
for ii=1:size(my_image,1)
    for jj=1:size(my_image,2)
        % get pixel value
        pixel=my_image(ii,jj);
          % check pixel value and assign new value
          if pixel>a1 && pixel<a2
              new_pixel=255;
          else
              new_pixel = pixel;
          end
          % save new pixel value in thresholded image
          image_thresholded(ii,jj)=new_pixel;
      end
  end
% display result
figure()
subplot(1,2,1)
imshow(my_image,[])
title('orijinal görüntü')
subplot(1,2,2)
imshow(image_thresholded,[])
title('transform edilmiþ görüntü')