%% Grayscale
clear all
clc
i = imread('tonnam.jpg');
R = i(:,:,1);
G = i(:,:,2);
B = i(:,:,3);
I = 0.3*R+0.6*G+0.1*B;
figure, imagesc(i),truesize, title('Original')
figure, imagesc(I),truesize , colormap gray, title('Cvt2Gray')
%%
%%Plot histogram
[r,c]=size(I);
I2=zeros(1,256);
for i=1:r
    for j = 1:c
        b = I(i,j);
        I2(b+1) = I2(b+1)+1;
    end 
end
figure, bar(I2), title('Histogram Plot')
%% Cvt histogram to binary
tsh = 55;
I3=cast(zeros(r,c),'logical');
for i=1:r
    for j = 1:c
        b = I(i,j);
        if b > tsh
            I3(i,j)=1;
        else
             I3(i,j)=0;
        end
    end
end
figure, imshow(I3), title('CvtHist2Binary')
I4 = imbinarize(I);
figure, imshow(I4), title('Using Histogram Function')






