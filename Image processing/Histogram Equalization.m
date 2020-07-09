% Read color input image, I
I = imread('IMG_25601227_191213.jpg');
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
figure('name','color'), imshow(I), title('color')
% Convert to grayscale image, I2
I2 = rgb2gray(I);
figure('name','rgb2gray'), imagesc(I2), truesize, colormap gray, title('rgb2gray')
%Histogram Equalization
Gray_Histeq = Histeq(I2);
figure('name','Histogram Equalization'), imagesc(Gray_Histeq), truesize, colormap gray, title('HistogramEqualization')
R_Histeq = Histeq(R);
G_Histeq = Histeq(G);
B_Histeq = Histeq(B);
RGB_new = cat(3,R_Histeq,G_Histeq,B_Histeq); %RGB
figure('name','RGB_new'), imagesc(RGB_new), truesize, colormap gray, title('RGB_new')
function I2_new = Histeq(input_image)
[r,c]=size(input_image);
% Plot histogram
H = imhist(input_image);
figure('name','histogram1'), imhist(input_image)
xlabel('Intensity'), ylabel('Number of Pixel'), title('Histogram1')
N = r*c;
pdf = H/N ;
P = pdf.';
Cdf = cumsum(P);
C = round(Cdf*255);
v1 = zeros(1,256);
for k=1:256
v1(1,k) = k;
end
I2_new = changem(input_image,C,v1);
figure('name','Cumulative Probability'), cdfplot(Cdf)
figure('name','histogram2'),imhist(I2_new)
xlabel('Intensity'), ylabel('Number of Pixel'), title('Histogram2')
end
