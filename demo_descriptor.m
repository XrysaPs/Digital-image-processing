clear;
close all;
clc;

rhom=5;
rhoM=20;
rhostep=1;
N=8;

%% Demo for the basic descriptor
%% pixel [100 100]
pixel1=[100; 100];

%load the image
I_RGB1=imread('TestIm1.png');
I_RGB_rotated=myImgRotation(I_RGB1,0);

%convert RGB image to grayscale image
I_grayscale1=rgb2gray(I_RGB_rotated);

%find the descriptor of the pixel
d1=myLocalDescriptor(I_grayscale1,pixel1,rhom,rhoM,rhostep,N);
fprintf('The descriptor of pixel  [100,100] is: [');
fprintf('%g ', d1.*256);
fprintf(']\n');

%rotate the image
I_RGB_rotated1=myImgRotation(I_RGB1,35);

%convert RGB image to grayscale image
I_grayscale_rotated1=rgb2gray(I_RGB_rotated1);

%find the rotation matrix
R=[cosd(35) -sind(35); sind(35) cosd(35)];
axis=[pixel1(2,1)-floor(size(I_RGB1,2)/2); floor(size(I_RGB1,1)/2)-pixel1(1,1)];
axis2=R*[axis(1,1); axis(2,1)];

if axis2(1,1)>0 && axis2(2,1)>0
    pixel1_rotated1=[abs(axis2(1,1))+floor(size(I_grayscale_rotated1,2)/2); floor(size(I_grayscale_rotated1,1)/2)-abs(axis2(2,1))];
elseif axis2(1,1)<0 && axis2(2,1)>0
    pixel1_rotated1=[floor(size(I_grayscale_rotated1,2)/2)-abs(axis2(1,1)); floor(size(I_grayscale_rotated1,1)/2)-abs(axis2(2,1))];
elseif axis2(1,1)<0 && axis2(2,1)<0
    pixel1_rotated1=[floor(size(I_grayscale_rotated1,2)/2)-abs(axis2(1,1)); floor(size(I_grayscale_rotated1,1)/2)+abs(axis2(2,1))];
elseif axis2(1,1)>0 && axis2(2,1)<0
    pixel1_rotated1=[abs(axis2(1,1))+floor(size(I_grayscale_rotated1,2)/2); floor(size(I_grayscale_rotated1,1)/2)+abs(axis2(2,1))]; 
end

pixel1_rotated1=floor(flip(pixel1_rotated1));

%find the descriptor of the pixel
d2=myLocalDescriptor(I_grayscale_rotated1,pixel1_rotated1,rhom,rhoM,rhostep,N);
fprintf('The descriptor of pixel  [100,100] after first rotation is: [');
fprintf('%g ', d2.*256);
fprintf(']\n');



%rotate the image
I_RGB_rotated2=myImgRotation(I_RGB1,222);

%convert RGB image to grayscale image
I_grayscale_rotated2=rgb2gray(I_RGB_rotated2);

%find the rotation matrix
R=[cosd(222) -sind(222); sind(222) cosd(222)];
axis=[pixel1(2,1)-floor(size(I_RGB1,2)/2); floor(size(I_RGB1,1)/2)-pixel1(1,1)];
axis2=R*[axis(1,1); axis(2,1)];

if axis2(1,1)>0 && axis2(2,1)>0
    pixel1_rotated2=[abs(axis2(1,1))+floor(size(I_grayscale_rotated2,2)/2); floor(size(I_grayscale_rotated2,1)/2)-abs(axis2(2,1))];
elseif axis2(1,1)<0 && axis2(2,1)>0
    pixel1_rotated2=[floor(size(I_grayscale_rotated2,2)/2)-abs(axis2(1,1)); floor(size(I_grayscale_rotated2,1)/2)-abs(axis2(2,1))];
elseif axis2(1,1)<0 && axis2(2,1)<0
    pixel1_rotated2=[floor(size(I_grayscale_rotated2,2)/2)-abs(axis2(1,1)); floor(size(I_grayscale_rotated2,1)/2)+abs(axis2(2,1))];
elseif axis2(1,1)>0 && axis2(2,1)<0
    pixel1_rotated2=[abs(axis2(1,1))+floor(size(I_grayscale_rotated2,2)/2); floor(size(I_grayscale_rotated2,1)/2)+abs(axis2(2,1))]; 
end

pixel1_rotated2=floor(flip(pixel1_rotated2));

%find the descriptor of the pixel
d3=myLocalDescriptor(I_grayscale_rotated2,pixel1_rotated2,rhom,rhoM,rhostep,N);
fprintf('The descriptor of pixel  [100,100] after second rotation is: [');
fprintf('%g ', d3.*256);
fprintf(']\n');


%% pixel [200 200]
pixel2=[200; 200];

%find the descriptor of the pixel
d1=myLocalDescriptor(I_grayscale1,pixel2,rhom,rhoM,rhostep,N);
fprintf('The descriptor of pixel  [200,200] is: [');
fprintf('%g ', d1.*256);
fprintf(']\n');

%rotate the image
I_RGB_rotated1=myImgRotation(I_RGB1,35);

%convert RGB image to grayscale image
I_grayscale_rotated1=rgb2gray(I_RGB_rotated1);

%find the rotation matrix
R=[cosd(35) -sind(35); sind(35) cosd(35)];
axis=[pixel2(2,1)-floor(size(I_RGB1,2)/2); floor(size(I_RGB1,1)/2)-pixel2(1,1)];
axis2=R*[axis(1,1); axis(2,1)];

if axis2(1,1)>0 && axis2(2,1)>0
    pixel1_rotated1=[abs(axis2(1,1))+floor(size(I_grayscale_rotated1,2)/2); floor(size(I_grayscale_rotated1,1)/2)-abs(axis2(2,1))];
elseif axis2(1,1)<0 && axis2(2,1)>0
    pixel1_rotated1=[floor(size(I_grayscale_rotated1,2)/2)-abs(axis2(1,1)); floor(size(I_grayscale_rotated1,1)/2)-abs(axis2(2,1))];
elseif axis2(1,1)<0 && axis2(2,1)<0
    pixel1_rotated1=[floor(size(I_grayscale_rotated1,2)/2)-abs(axis2(1,1)); floor(size(I_grayscale_rotated1,1)/2)+abs(axis2(2,1))];
elseif axis2(1,1)>0 && axis2(2,1)<0
    pixel1_rotated1=[abs(axis2(1,1))+floor(size(I_grayscale_rotated1,2)/2); floor(size(I_grayscale_rotated1,1)/2)+abs(axis2(2,1))]; 
end

pixel1_rotated1=floor(flip(pixel1_rotated1));

%find the descriptor of the pixel
d2=myLocalDescriptor(I_grayscale_rotated1,pixel1_rotated1,rhom,rhoM,rhostep,N);
fprintf('The descriptor of pixel  [200,200] after first rotation is: [');
fprintf('%g ', d2.*256);
fprintf(']\n');



%rotate the image
I_RGB_rotated2=myImgRotation(I_RGB1,222);

%convert RGB image to grayscale image
I_grayscale_rotated2=rgb2gray(I_RGB_rotated2);

%find the rotation matrix
R=[cosd(222) -sind(222); sind(222) cosd(222)];
axis=[pixel2(2,1)-floor(size(I_RGB1,2)/2); floor(size(I_RGB1,1)/2)-pixel2(1,1)];
axis2=R*[axis(1,1); axis(2,1)];

if axis2(1,1)>0 && axis2(2,1)>0
    pixel1_rotated2=[abs(axis2(1,1))+floor(size(I_grayscale_rotated2,2)/2); floor(size(I_grayscale_rotated2,1)/2)-abs(axis2(2,1))];
elseif axis2(1,1)<0 && axis2(2,1)>0
    pixel1_rotated2=[floor(size(I_grayscale_rotated2,2)/2)-abs(axis2(1,1)); floor(size(I_grayscale_rotated2,1)/2)-abs(axis2(2,1))];
elseif axis2(1,1)<0 && axis2(2,1)<0
    pixel1_rotated2=[floor(size(I_grayscale_rotated2,2)/2)-abs(axis2(1,1)); floor(size(I_grayscale_rotated2,1)/2)+abs(axis2(2,1))];
elseif axis2(1,1)>0 && axis2(2,1)<0
    pixel1_rotated2=[abs(axis2(1,1))+floor(size(I_grayscale_rotated2,2)/2); floor(size(I_grayscale_rotated2,1)/2)+abs(axis2(2,1))]; 
end

pixel1_rotated2=floor(flip(pixel1_rotated2));

%find the descriptor of the pixel
d3=myLocalDescriptor(I_grayscale_rotated2,pixel1_rotated2,rhom,rhoM,rhostep,N);
fprintf('The descriptor of pixel  [200,200] after second rotation is: [');
fprintf('%g ', d3.*256);
fprintf(']\n');




%% pixel [202 202]
pixel3=[202; 202];

%find the descriptor of the pixel
d1=myLocalDescriptor(I_grayscale1,pixel3,rhom,rhoM,rhostep,N);
fprintf('The descriptor of pixel  [202,202] is: [');
fprintf('%g ', d1.*256);
fprintf(']\n');

%rotate the image
I_RGB_rotated1=myImgRotation(I_RGB1,35);

%convert RGB image to grayscale image
I_grayscale_rotated1=rgb2gray(I_RGB_rotated1);

%find the rotation matrix
R=[cosd(35) -sind(35); sind(35) cosd(35)];
axis=[pixel3(2,1)-floor(size(I_RGB1,2)/2); floor(size(I_RGB1,1)/2)-pixel3(1,1)];
axis2=R*[axis(1,1); axis(2,1)];

if axis2(1,1)>0 && axis2(2,1)>0
    pixel1_rotated1=[abs(axis2(1,1))+floor(size(I_grayscale_rotated1,2)/2); floor(size(I_grayscale_rotated1,1)/2)-abs(axis2(2,1))];
elseif axis2(1,1)<0 && axis2(2,1)>0
    pixel1_rotated1=[floor(size(I_grayscale_rotated1,2)/2)-abs(axis2(1,1)); floor(size(I_grayscale_rotated1,1)/2)-abs(axis2(2,1))];
elseif axis2(1,1)<0 && axis2(2,1)<0
    pixel1_rotated1=[floor(size(I_grayscale_rotated1,2)/2)-abs(axis2(1,1)); floor(size(I_grayscale_rotated1,1)/2)+abs(axis2(2,1))];
elseif axis2(1,1)>0 && axis2(2,1)<0
    pixel1_rotated1=[abs(axis2(1,1))+floor(size(I_grayscale_rotated1,2)/2); floor(size(I_grayscale_rotated1,1)/2)+abs(axis2(2,1))]; 
end

pixel1_rotated1=floor(flip(pixel1_rotated1));

%find the descriptor of the pixel
d2=myLocalDescriptor(I_grayscale_rotated1,pixel1_rotated1,rhom,rhoM,rhostep,N);
fprintf('The descriptor of pixel  [202,202] after first rotation is: [');
fprintf('%g ', d2.*256);
fprintf(']\n');



%rotate the image
I_RGB_rotated2=myImgRotation(I_RGB1,222);

%convert RGB image to grayscale image
I_grayscale_rotated2=rgb2gray(I_RGB_rotated2);

%find the rotation matrix
R=[cosd(222) -sind(222); sind(222) cosd(222)];
axis=[pixel3(2,1)-floor(size(I_RGB1,2)/2); floor(size(I_RGB1,1)/2)-pixel3(1,1)];
axis2=R*[axis(1,1); axis(2,1)];

if axis2(1,1)>0 && axis2(2,1)>0
    pixel1_rotated2=[abs(axis2(1,1))+floor(size(I_grayscale_rotated2,2)/2); floor(size(I_grayscale_rotated2,1)/2)-abs(axis2(2,1))];
elseif axis2(1,1)<0 && axis2(2,1)>0
    pixel1_rotated2=[floor(size(I_grayscale_rotated2,2)/2)-abs(axis2(1,1)); floor(size(I_grayscale_rotated2,1)/2)-abs(axis2(2,1))];
elseif axis2(1,1)<0 && axis2(2,1)<0
    pixel1_rotated2=[floor(size(I_grayscale_rotated2,2)/2)-abs(axis2(1,1)); floor(size(I_grayscale_rotated2,1)/2)+abs(axis2(2,1))];
elseif axis2(1,1)>0 && axis2(2,1)<0
    pixel1_rotated2=[abs(axis2(1,1))+floor(size(I_grayscale_rotated2,2)/2); floor(size(I_grayscale_rotated2,1)/2)+abs(axis2(2,1))]; 
end

pixel1_rotated2=floor(flip(pixel1_rotated2));

%find the descriptor of the pixel
d3=myLocalDescriptor(I_grayscale_rotated2,pixel1_rotated2,rhom,rhoM,rhostep,N);
fprintf('The descriptor of pixel  [202,202] after second rotation is: [');
fprintf('%g ', d3.*256);
fprintf(']\n');


%% Demo for the Upgraded descriptor
%% pixel [100 100]
fprintf('\nWith the upgraded descriptor:\n');
pixel1=[100; 100];

%load the image
I_RGB1=imread('TestIm1.png');
I_RGB_rotated=myImgRotation(I_RGB1,0);

%convert RGB image to grayscale image
I_grayscale1=rgb2gray(I_RGB_rotated);

%find the descriptor of the pixel
d1=myLocalDescriptorUpgrade(I_grayscale1,pixel1,rhom,rhoM,rhostep,N);
fprintf('The descriptor of pixel  [100,100] is: [');
fprintf('%g ', d1.*256);
fprintf(']\n');

%rotate the image
I_RGB_rotated1=myImgRotation(I_RGB1,35);

%convert RGB image to grayscale image
I_grayscale_rotated1=rgb2gray(I_RGB_rotated1);

%find the rotation matrix
R=[cosd(35) -sind(35); sind(35) cosd(35)];
axis=[pixel1(2,1)-floor(size(I_RGB1,2)/2); floor(size(I_RGB1,1)/2)-pixel1(1,1)];
axis2=R*[axis(1,1); axis(2,1)];

if axis2(1,1)>0 && axis2(2,1)>0
    pixel1_rotated1=[abs(axis2(1,1))+floor(size(I_grayscale_rotated1,2)/2); floor(size(I_grayscale_rotated1,1)/2)-abs(axis2(2,1))];
elseif axis2(1,1)<0 && axis2(2,1)>0
    pixel1_rotated1=[floor(size(I_grayscale_rotated1,2)/2)-abs(axis2(1,1)); floor(size(I_grayscale_rotated1,1)/2)-abs(axis2(2,1))];
elseif axis2(1,1)<0 && axis2(2,1)<0
    pixel1_rotated1=[floor(size(I_grayscale_rotated1,2)/2)-abs(axis2(1,1)); floor(size(I_grayscale_rotated1,1)/2)+abs(axis2(2,1))];
elseif axis2(1,1)>0 && axis2(2,1)<0
    pixel1_rotated1=[abs(axis2(1,1))+floor(size(I_grayscale_rotated1,2)/2); floor(size(I_grayscale_rotated1,1)/2)+abs(axis2(2,1))]; 
end

pixel1_rotated1=floor(flip(pixel1_rotated1));

%find the descriptor of the pixel
d2=myLocalDescriptorUpgrade(I_grayscale_rotated1,pixel1_rotated1,rhom,rhoM,rhostep,N);
fprintf('The descriptor of pixel  [100,100] after first rotation is: [');
fprintf('%g ', d2.*256);
fprintf(']\n');



%rotate the image
I_RGB_rotated2=myImgRotation(I_RGB1,222);

%convert RGB image to grayscale image
I_grayscale_rotated2=rgb2gray(I_RGB_rotated2);

%find the rotation matrix
R=[cosd(222) -sind(222); sind(222) cosd(222)];
axis=[pixel1(2,1)-floor(size(I_RGB1,2)/2); floor(size(I_RGB1,1)/2)-pixel1(1,1)];
axis2=R*[axis(1,1); axis(2,1)];

if axis2(1,1)>0 && axis2(2,1)>0
    pixel1_rotated2=[abs(axis2(1,1))+floor(size(I_grayscale_rotated2,2)/2); floor(size(I_grayscale_rotated2,1)/2)-abs(axis2(2,1))];
elseif axis2(1,1)<0 && axis2(2,1)>0
    pixel1_rotated2=[floor(size(I_grayscale_rotated2,2)/2)-abs(axis2(1,1)); floor(size(I_grayscale_rotated2,1)/2)-abs(axis2(2,1))];
elseif axis2(1,1)<0 && axis2(2,1)<0
    pixel1_rotated2=[floor(size(I_grayscale_rotated2,2)/2)-abs(axis2(1,1)); floor(size(I_grayscale_rotated2,1)/2)+abs(axis2(2,1))];
elseif axis2(1,1)>0 && axis2(2,1)<0
    pixel1_rotated2=[abs(axis2(1,1))+floor(size(I_grayscale_rotated2,2)/2); floor(size(I_grayscale_rotated2,1)/2)+abs(axis2(2,1))]; 
end

pixel1_rotated2=floor(flip(pixel1_rotated2));

%find the descriptor of the pixel
d3=myLocalDescriptorUpgrade(I_grayscale_rotated2,pixel1_rotated2,rhom,rhoM,rhostep,N);
fprintf('The descriptor of pixel  [100,100] after second rotation is: [');
fprintf('%g ', d3.*256);
fprintf(']\n');


%% pixel [200 200]
pixel2=[200; 200];

%find the descriptor of the pixel
d1=myLocalDescriptorUpgrade(I_grayscale1,pixel2,rhom,rhoM,rhostep,N);
fprintf('The descriptor of pixel  [200,200] is: [');
fprintf('%g ', d1.*256);
fprintf(']\n');

%rotate the image
I_RGB_rotated1=myImgRotation(I_RGB1,35);

%convert RGB image to grayscale image
I_grayscale_rotated1=rgb2gray(I_RGB_rotated1);

%find the rotation matrix
R=[cosd(35) -sind(35); sind(35) cosd(35)];
axis=[pixel2(2,1)-floor(size(I_RGB1,2)/2); floor(size(I_RGB1,1)/2)-pixel2(1,1)];
axis2=R*[axis(1,1); axis(2,1)];

if axis2(1,1)>0 && axis2(2,1)>0
    pixel1_rotated1=[abs(axis2(1,1))+floor(size(I_grayscale_rotated1,2)/2); floor(size(I_grayscale_rotated1,1)/2)-abs(axis2(2,1))];
elseif axis2(1,1)<0 && axis2(2,1)>0
    pixel1_rotated1=[floor(size(I_grayscale_rotated1,2)/2)-abs(axis2(1,1)); floor(size(I_grayscale_rotated1,1)/2)-abs(axis2(2,1))];
elseif axis2(1,1)<0 && axis2(2,1)<0
    pixel1_rotated1=[floor(size(I_grayscale_rotated1,2)/2)-abs(axis2(1,1)); floor(size(I_grayscale_rotated1,1)/2)+abs(axis2(2,1))];
elseif axis2(1,1)>0 && axis2(2,1)<0
    pixel1_rotated1=[abs(axis2(1,1))+floor(size(I_grayscale_rotated1,2)/2); floor(size(I_grayscale_rotated1,1)/2)+abs(axis2(2,1))]; 
end

pixel1_rotated1=floor(flip(pixel1_rotated1));

%find the descriptor of the pixel
d2=myLocalDescriptorUpgrade(I_grayscale_rotated1,pixel1_rotated1,rhom,rhoM,rhostep,N);
fprintf('The descriptor of pixel  [200,200] after first rotation is: [');
fprintf('%g ', d2.*256);
fprintf(']\n');



%rotate the image
I_RGB_rotated2=myImgRotation(I_RGB1,222);

%convert RGB image to grayscale image
I_grayscale_rotated2=rgb2gray(I_RGB_rotated2);

%find the rotation matrix
R=[cosd(222) -sind(222); sind(222) cosd(222)];
axis=[pixel2(2,1)-floor(size(I_RGB1,2)/2); floor(size(I_RGB1,1)/2)-pixel2(1,1)];
axis2=R*[axis(1,1); axis(2,1)];

if axis2(1,1)>0 && axis2(2,1)>0
    pixel1_rotated2=[abs(axis2(1,1))+floor(size(I_grayscale_rotated2,2)/2); floor(size(I_grayscale_rotated2,1)/2)-abs(axis2(2,1))];
elseif axis2(1,1)<0 && axis2(2,1)>0
    pixel1_rotated2=[floor(size(I_grayscale_rotated2,2)/2)-abs(axis2(1,1)); floor(size(I_grayscale_rotated2,1)/2)-abs(axis2(2,1))];
elseif axis2(1,1)<0 && axis2(2,1)<0
    pixel1_rotated2=[floor(size(I_grayscale_rotated2,2)/2)-abs(axis2(1,1)); floor(size(I_grayscale_rotated2,1)/2)+abs(axis2(2,1))];
elseif axis2(1,1)>0 && axis2(2,1)<0
    pixel1_rotated2=[abs(axis2(1,1))+floor(size(I_grayscale_rotated2,2)/2); floor(size(I_grayscale_rotated2,1)/2)+abs(axis2(2,1))]; 
end

pixel1_rotated2=floor(flip(pixel1_rotated2));

%find the descriptor of the pixel
d3=myLocalDescriptorUpgrade(I_grayscale_rotated2,pixel1_rotated2,rhom,rhoM,rhostep,N);
fprintf('The descriptor of pixel  [200,200] after second rotation is: [');
fprintf('%g ', d3.*256);
fprintf(']\n');




%% pixel [202 202]
pixel3=[202; 202];

%find the descriptor of the pixel
d1=myLocalDescriptorUpgrade(I_grayscale1,pixel3,rhom,rhoM,rhostep,N);
fprintf('The descriptor of pixel  [202,202] is: [');
fprintf('%g ', d1.*256);
fprintf(']\n');

%rotate the image
I_RGB_rotated1=myImgRotation(I_RGB1,35);

%convert RGB image to grayscale image
I_grayscale_rotated1=rgb2gray(I_RGB_rotated1);

%find the rotation matrix
R=[cosd(35) -sind(35); sind(35) cosd(35)];
axis=[pixel3(2,1)-floor(size(I_RGB1,2)/2); floor(size(I_RGB1,1)/2)-pixel3(1,1)];
axis2=R*[axis(1,1); axis(2,1)];

if axis2(1,1)>0 && axis2(2,1)>0
    pixel1_rotated1=[abs(axis2(1,1))+floor(size(I_grayscale_rotated1,2)/2); floor(size(I_grayscale_rotated1,1)/2)-abs(axis2(2,1))];
elseif axis2(1,1)<0 && axis2(2,1)>0
    pixel1_rotated1=[floor(size(I_grayscale_rotated1,2)/2)-abs(axis2(1,1)); floor(size(I_grayscale_rotated1,1)/2)-abs(axis2(2,1))];
elseif axis2(1,1)<0 && axis2(2,1)<0
    pixel1_rotated1=[floor(size(I_grayscale_rotated1,2)/2)-abs(axis2(1,1)); floor(size(I_grayscale_rotated1,1)/2)+abs(axis2(2,1))];
elseif axis2(1,1)>0 && axis2(2,1)<0
    pixel1_rotated1=[abs(axis2(1,1))+floor(size(I_grayscale_rotated1,2)/2); floor(size(I_grayscale_rotated1,1)/2)+abs(axis2(2,1))]; 
end

pixel1_rotated1=floor(flip(pixel1_rotated1));

%find the descriptor of the pixel
d2=myLocalDescriptorUpgrade(I_grayscale_rotated1,pixel1_rotated1,rhom,rhoM,rhostep,N);
fprintf('The descriptor of pixel  [202,202] after first rotation is: [');
fprintf('%g ', d2.*256);
fprintf(']\n');



%rotate the image
I_RGB_rotated2=myImgRotation(I_RGB1,222);

%convert RGB image to grayscale image
I_grayscale_rotated2=rgb2gray(I_RGB_rotated2);

%find the rotation matrix
R=[cosd(222) -sind(222); sind(222) cosd(222)];
axis=[pixel3(2,1)-floor(size(I_RGB1,2)/2); floor(size(I_RGB1,1)/2)-pixel3(1,1)];
axis2=R*[axis(1,1); axis(2,1)];

if axis2(1,1)>0 && axis2(2,1)>0
    pixel1_rotated2=[abs(axis2(1,1))+floor(size(I_grayscale_rotated2,2)/2); floor(size(I_grayscale_rotated2,1)/2)-abs(axis2(2,1))];
elseif axis2(1,1)<0 && axis2(2,1)>0
    pixel1_rotated2=[floor(size(I_grayscale_rotated2,2)/2)-abs(axis2(1,1)); floor(size(I_grayscale_rotated2,1)/2)-abs(axis2(2,1))];
elseif axis2(1,1)<0 && axis2(2,1)<0
    pixel1_rotated2=[floor(size(I_grayscale_rotated2,2)/2)-abs(axis2(1,1)); floor(size(I_grayscale_rotated2,1)/2)+abs(axis2(2,1))];
elseif axis2(1,1)>0 && axis2(2,1)<0
    pixel1_rotated2=[abs(axis2(1,1))+floor(size(I_grayscale_rotated2,2)/2); floor(size(I_grayscale_rotated2,1)/2)+abs(axis2(2,1))]; 
end

pixel1_rotated2=floor(flip(pixel1_rotated2));

%find the descriptor of the pixel
d3=myLocalDescriptorUpgrade(I_grayscale_rotated2,pixel1_rotated2,rhom,rhoM,rhostep,N);
fprintf('The descriptor of pixel  [202,202] after second rotation is: [');
fprintf('%g ', d3.*256);
fprintf(']\n');






