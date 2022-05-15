clear;
clc;
close all;

I=imread('TestIm1.png');
I2=imread('TestIm2.png');
fprintf('Generating the stitched image...');
stitched_image=myStitch(I,I2);

figure(1);
imshow(stitched_image);






