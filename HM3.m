A=zeros(256,256); % initializing matrix A of size 256*256 with zero

% creating the test pattern image of grayscale wedge

for i=1:256

    for j=1:256

        A(j,i)=i-1;

    end

end

imshow(A,[]); % showing the wedge image

title('Grayscale wedge');