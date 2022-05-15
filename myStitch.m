function Im = myStitch(im1,im2)

%color interpolation
for i=1:size(im1,1)
    for j=1:size(im1,2)
        color2=color([j; i],im1);
        Img(i,j,1)=color2(1,1,1);
        Img(i,j,2)=color2(1,1,2);
        Img(i,j,3)=color2(1,1,3);
    end
end

%convert the image from RGB to grayscale
I_grayscale=rgb2gray(Img);


Rthres=0.04;
radius=1;
order=(2*radius+1);

%mask
[dx,dy]=meshgrid(-1:1, -1:1);
%deravatives 
Ix=conv2(double(I_grayscale),dx,'same');
Iy=conv2(double(I_grayscale),dy,'same');
Ixy=Ix.*Iy;

%gaussian filter
g=fspecial('gaussian', 15, 1);

Ix2=conv2(double(Ix.^2), g, 'same');
Iy2=conv2(double(Iy.^2), g, 'same');
Ixy=conv2(double(Ixy), g, 'same');

for i=1:1:size(I_grayscale,1)
    for j=1:1:size(I_grayscale,2)
        M=[Ix2(i,j) Ixy(i,j); Ixy(i,j) Iy2(i,j)];
        detM = det(M);
        traceM = trace(M);
        R(i,j)=detM-0.04*(traceM)^2;
    end
end


mx=ordfilt2(R,order.^2,ones(order));
point= (R==mx) & (R>Rthres);
[rows, cols]=find(point);

%color interpolation for the second image
for i=1:size(im2,1)
    for j=1:size(im2,2)
        color2=color([j; i],im2);
        Img2(i,j,1)=color2(1,1,1);
        Img2(i,j,2)=color2(1,1,2);
        Img2(i,j,3)=color2(1,1,3);
    end
end

%convert the second image from RGB to grayscale
I_grayscale2=rgb2gray(Img2);

Rthres=0.04;
radius=1;
order=(2*radius+1);

%mask
[dx,dy]=meshgrid(-1:1, -1:1);
%deravatives 
Ix=conv2(double(I_grayscale2),dx,'same');
Iy=conv2(double(I_grayscale2),dy,'same');
Ixy=Ix.*Iy;

%gaussian filter
g=fspecial('gaussian', 15, 1);

Ix2=conv2(double(Ix.^2), g, 'same');
Iy2=conv2(double(Iy.^2), g, 'same');
Ixy=conv2(double(Ixy), g, 'same');

for i=1:1:size(I_grayscale2,1)
    for j=1:1:size(I_grayscale2,2)
        M2=[Ix2(i,j) Ixy(i,j); Ixy(i,j) Iy2(i,j)];
        detM2 = det(M2);
        traceM2 = trace(M2);
        R2(i,j)=detM2-0.04*(traceM2)^2;
    end
end


mx2=ordfilt2(R2,order.^2,ones(order));
point2= (R2==mx2) & (R2>Rthres);
[rows2, cols2]=find(point2);

%find and compare the descriptors
rhom=1;
rhoM=15;
rhostep=1;
N=24;

for j=1:length(rows2)
    d1=myLocalDescriptorUpgrade(I_grayscale2,[rows2(j); cols2(j)],rhom,rhoM,rhostep,N);

    for i=1: length(rows)
        d2=myLocalDescriptorUpgrade(I_grayscale, [rows(i); cols(i)], rhom, rhoM, rhostep, N);
        if length(d1)==length(d2)
            for z=1:size(d2,1)
                lia=ismembertol(d1(z,:),d2(z,:),0.01);
                x(i,z)=sum(lia);
            end
        end
    end
    %find the best match for each corner
    [max_value,pos]=max(sum(x,2));
    mached_pixels(j,:)=[rows2(j) cols2(j) rows(pos) cols(pos) max_value];
end

%find the two best matches
[~, posision]=max(mached_pixels(:,5));
pixel1=[mached_pixels(posision,1) mached_pixels(posision,2)];
origin_pixel1=[mached_pixels(posision,3) mached_pixels(posision,4)];

mached_pixels(posision,:)=[];

[~, posision]=max(mached_pixels(:,5));
pixel2=[mached_pixels(posision,1) mached_pixels(posision,2)];
origin_pixel2=[mached_pixels(posision,3) mached_pixels(posision,4)];

axis1=[pixel1(1,2)-floor(size(I_grayscale2,2)/2); floor(size(I_grayscale2,1)/2)-pixel1(1,1)];
axis2=[pixel2(1,2)-floor(size(I_grayscale2,2)/2); floor(size(I_grayscale2,1)/2)-pixel2(1,1)];

slope1=atand((axis1(2,1)-axis2(2,1))/(axis1(1,1)-axis2(1,1)));


origin_axis1=[origin_pixel1(1,2)-floor(size(I_grayscale,2)/2); floor(size(I_grayscale,1)/2)-origin_pixel1(1,1)];
origin_axis2=[origin_pixel2(1,2)-floor(size(I_grayscale,2)/2); floor(size(I_grayscale,1)/2)-origin_pixel2(1,1)];

slope2=atand((origin_axis1(2,1)-origin_axis2(2,1))/(origin_axis1(1,1)-origin_axis2(1,1)));
slope=slope2-slope1;
%find the slope of each line which is the rotation angle


if slope~=0
    rotated_image = myImgRotation(im2,slope);
else
    rotated_image=Img2;
end

%rotation matrix
R=[cosd(slope) sind(slope); -sind(slope) cosd(slope)];

%position of pixel after rotation
pixel1_after_rotate=flip(floor(R*[axis1(2,1); axis1(1,1)]));

if pixel1_after_rotate(1,1)>0 && pixel1_after_rotate(2,1)>0
    pixel1_after_rotate=[abs(pixel1_after_rotate(1,1))+floor(size(rotated_image,2)/2) floor(size(rotated_image,1)/2)-abs(pixel1_after_rotate(2,1))];
elseif pixel1_after_rotate(1,1)<0 && pixel1_after_rotate(2,1)>0
    pixel1_after_rotate=[floor(size(rotated_image,2)/2)-abs(pixel1_after_rotate(1,1)) floor(size(rotated_image,1)/2)-abs(pixel1_after_rotate(2,1))];
elseif pixel1_after_rotate(1,1)<0 && pixel1_after_rotate(2,1)<0
    pixel1_after_rotate=[floor(size(rotated_image,2)/2)-abs(pixel1_after_rotate(1,1)) floor(size(rotated_image,1)/2)+abs(pixel1_after_rotate(2,1))];
elseif pixel1_after_rotate(1,1)>0 && pixel1_after_rotate(2,1)<0
    pixel1_after_rotate=[abs(pixel1_after_rotate(1,1))+floor(size(rotated_image,2)/2) floor(size(rotated_image,1)/2)+abs(pixel1_after_rotate(2,1))]; 
end

pixel1_after_rotate=flip(pixel1_after_rotate);

%dx and dy movement 
move_x=origin_pixel1(1,2)-pixel1_after_rotate(1,2);
move_y=origin_pixel1(1,1)-pixel1_after_rotate(1,1);

for i=1:(origin_pixel1(1,2)+size(rotated_image,2)-pixel1_after_rotate(1,2))
    for j=1:size(rotated_image,1)+floor(move_y)
        if i<size(I_grayscale,2) && j<size(I_grayscale,1)
            Im(j,i,:)=Img(j,i,:);
        end
        if i>move_x && j>floor(move_y) && sum(rotated_image(j-floor(move_y),i-move_x,:))~=0
            Im(j,i,:)=rotated_image(j-floor(move_y),i-move_x,:);
        end
    end
end
%generate the new image


end

