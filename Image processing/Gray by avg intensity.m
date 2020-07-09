clear all
warning off
%%Read Image
i = imread('buff.jpg');
%figure, imshow(i)
%% Grayscale
I = rgb2gray(i);
%figure, imagesc(I),truesize , colormap gray, title('Cvt2Gray')
%%Plot histogram
I2 = imhist(I).';
figure, imhist(I)
xlabel('Intensity'), ylabel('Number of Pixel'), title('Histogram')

%% 
%Average Intensities Method
% assume value
Th = randi([10,150],1,1);
while(1)
W1 = 0.6;
W2 = 0.4;
counts = I2;
count1 = counts(1:Th);
count2 = counts(Th+1:256);
g1_avg = sum( dot(count1,(1:Th)) ) / sum(count1);

g2_avg = sum( dot(count2,(Th+1:256)) )/ sum(count2);
%Update new threshould
 Th_new = ( (W1*g1_avg) + (W2*g2_avg) ) / (W1+W2);
 check_stp = abs(Th-Th_new);
     if(check_stp <= 1)
        break
     else
        Th = double(Th_new);
     end
end
%% Cvt histogram to binary
tsh = Th/256;
I4 = imbinarize(I,tsh);
figure, imshow(I4), title('Using Histogram Function Medthod 2')
