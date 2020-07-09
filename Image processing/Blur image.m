I = imread('18582498_1018678291598217_6560858423540661559_n.jpg');
I2 = rgb2gray(I); %convertRGBtoGray
%--------Values--------------
[r,c] = size(I2); %sizeofImage
centerR = ceil(r/2);
centerC = ceil(c/2);
%--------FFT----------------
F = fft2(I2); %Fast Fourier Transform
ShiftF = fftshift(F); % Shift 0 frequency Circularly
F2 = abs(fft2(I2));
logF2 = log(1 + F2);
ShiftF2 = fftshift(logF2);
figure('name','Filtered Image'), imagesc(ShiftF2), truesize, colormap gray, title('Filtered Real')
F3 = imag(fft2(I2));
ShiftF3 = fftshift(F3);
figure('name','Filtered Image'), imshow(ShiftF3), truesize, colormap gray, title('Filtered Imagin')
%-------------Create Mask ------------------
Radius = 500; %size of Mask
R = ones(Radius,Radius);
h = padarray(R,[(r/2)-(Radius/2) (c/2)-(Radius/2)],0,'both'); % to Matched size of Image
catH = cast(h,'like',F);
conv = h.*ShiftF; %Convolution H(u,v).F(u,v)
IFFT = ifft2(conv); %Invert Fast Fourier Transform
I_new = ceil(abs(IFFT)); %Blurred Image
figure('name','Filtered Image'), imagesc(h), truesize, colormap gray, title('Mask H(u,v)')
figure('name','Filtered Image'), imagesc(I_new), truesize, colormap gray, title('Blur Image')
