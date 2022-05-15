clear;
clc;
close all;

%load the image
I=imread('TestIm1.png');
fprintf('Generating the rotated images...');
angle=35;
%rotate the image
I_new=myImgRotation(I,angle);
%show the image
figure(1);
imshow(I_new);

angle2=222;
%rotate the image
I_new2=myImgRotation(I,angle2);
%show the image
figure(2);
imshow(I_new2);


