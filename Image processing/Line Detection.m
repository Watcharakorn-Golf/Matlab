x = 10;y = 10;
img_space = zeros(x,y);
img_space(1,1) = 255;img_space(2,2) = 255;img_space(3,3) = 255;
img_space(4,4) = 255;img_space(5,5) = 255;img_space(9,2) = 255;
% c = -xm + y
dx = 0.1;
m = 0:dx:x;
c1 = -m +1; % line1
c2 = -2*m +2; % line2
c3 = -3*m +3; % line3
c4 = -4*m +4; % line4
c5 = -5*m +5; % line5
c6 = -9*m +2; % line6
%Defines your own equation from image
[x_pixel, y_pixel] = find(img_space == 255);
[n_pixel,~] = size(x_pixel);
[~,sizem] = size(m);
C = zeros(n_pixel,sizem);
for i =1:n_pixel
for j =1:sizem
C(i,j) = (-x_pixel(i,1) .* m(1,j)) + y_pixel(i,1);
end
end
%End of Defines
sub = find(c1 == c2 & c1 == c3 & c1 == c4 & c1 == c5 );
x_intersect = m(sub);
intersect_pt = c1(sub);
intersect_of_linear = [x_intersect intersect_pt];
figure(1),plot(m,c1,m,c2,m,c3,m,c4,m,c5,m,c6,'--',x_intersect,intersect_pt,'ko'),legend('c1','c2','c3','c4','c5','c6'),xlabel('m'),ylabel('c'),title('Hough space'),grid
figure(2),pcolor(img_space), colormap gray
figure(3),plot(m,C) %Plot Hough Again
