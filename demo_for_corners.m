clear;
clc;
close all;

I_RGB=imread('TestIm1.png');
%load the image

fprintf('Generating the image and ploting the corners...');

for i=1:size(I_RGB,1)
    for j=1:size(I_RGB,2)
        color2=color([j; i],I_RGB);
        I_RGB2(i,j,1)=color2(1,1,1);
        I_RGB2(i,j,2)=color2(1,1,2);
        I_RGB2(i,j,3)=color2(1,1,3);
    end
end
%color interpolation

I_grayscale=rgb2gray(I_RGB2);
%convert from RGB to grayscale

corners=myDetectHarrisFeatures(I_grayscale);

figure(1);
imshow(I_grayscale);
hold on;
plot(corners(:,2),corners(:,1), 'r.');
