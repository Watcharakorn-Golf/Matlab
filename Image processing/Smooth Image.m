clear all
clc
warning off
% Read color input image, I
I = imread('18582498_1018678291598217_6560858423540661559_n.jpg');
I2 = rgb2gray(I);
figure('name','rgb2gray'), imagesc(I2), truesize, colormap gray, title('rgb2gray')
w = (1/9)*ones(3);
[r,c] = size(I2); %[row,column]
[rw,cw] = size(w);
w = cast(w,'double');
I2 = cast(I2,'double');
%convolution
newIm = I2();
mask = zeros();
for x = 1:r-2
for y = 1:c-2
i = x:x+rw-1;
j = y:y+cw-1;
sd = dot(I2(i,j),w) ;
kep = sum(sd);
newIm(x+rw-2,y+cw-2) = cast(kep,'uint8');
end
end
figure('name','smoothing'), imagesc(newIm), truesize, colormap gray, title('smoothing')
