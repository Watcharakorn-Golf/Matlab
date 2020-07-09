%%Read Image
i = imread('19238003_1523473987677371_3107503963825788667_o.jpg');
%figure, imshow(i)
%% Grayscale
I = rgb2gray(i);
%figure, imagesc(I),truesize , colormap gray, title('Cvt2Gray')
%%Plot histogram
I2 = imhist(I).';
figure, imhist(I)
xlabel('Intensity'), ylabel('Number of Pixel'), title('Histogram')
%% 

%find Global Maximum & Local Maximum
%Seperate 2 curve of data from histogram plot with your eyes
  data1 = I2(); 
 [peak1,shade1] = max(data1); %Absolute Max
pk_num = zeros();
[pks,~] = findpeaks(I2);
while(pk_num < 2)
    pks_temp = pks;
    pk_num = numel(pks_temp);
    if(pk_num >= 2)
        [pks_temp,~] = findpeaks(pks);
        pks = pks_temp;
    else
        break
    end
end
peak2 = findpeaks(pks); 
figure, findpeaks(I2,'Threshold',1)
figure, findpeaks(I2)
figure, findpeaks(pks)
shade2 = find(I2==peak2); % location
pk_num = numel(peak2);
x1 = shade1; % change name to be easy to cpmpute
x2 = shade2; % change name to be easy to cpmpute
y1 = peak1;  % change name to be easy to cpmpute
y2 = peak2;  % change name to be easy to cpmpute
%find a linear : y = mx+c => Ax+By+C=0 so
m = (y1- y2)/(x1 - x2);
A = m; % slope
B = -1; % y
C = (y1 - (x1 * m));
data3 = I2(x1:x2); % data(x,y) of linear between x1:x2
d_max = zeros();
x3_max = zeros(); %x3,at this point have the longest distance(d) % this is the best threshould
y3_max = zeros(); %y3,at this point have the longest distance(d)
for i=x1:x2
    y3 = I2(i); % temporary y3
    x3 = i; % temporary x3
    d  = abs(A*x3 + B*y3 + C)/sqrt(A.^2 + B.^2); %line point distance formular
    if d >= d_max
        d_max = d;
        y3_max = y3;
        x3_max = x3; 
    else
    end
end
%% Cvt histogram to binary
tsh = x3_max/255;
I4 = imbinarize(I,tsh);
figure, imshow(I4), title('Using Histogram Function Medthod 1')
