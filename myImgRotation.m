function rotImg = myImgRotation(img,angle)

%rotation matrixes
R=[cosd(angle) sind(angle); -sind(angle) cosd(angle)];
R2=[cosd(angle) -sind(angle); sind(angle) cosd(angle)];

%calculating the position of the corners of the image after the rotation
pixel1=R2*[-floor(size(img,2)/2); floor(size(img,1)/2)];
pixel2=R2*[floor(size(img,2)/2); floor(size(img,1)/2)];
pixel3=R2*[floor(size(img,2)/2); -floor(size(img,1)/2)];
pixel4=R2*[-floor(size(img,2)/2); -floor(size(img,1)/2)];
pixels=cat(2,pixel1,pixel2,pixel3,pixel4);
maximum=max(pixels,[],2);
start_x=maximum(1,1);
start_y=maximum(2,1);

i=1;
j=1;
for row=start_y:-1:-start_y
    j=1;
    for col=-start_x:1:start_x -1
        if col==0
            j=j+1;
            continue;
        elseif row==0
            continue;
        end
        
        %calculating the position of the pixel aftel the rotation
        axis=floor(R*[col; row]);
        
        %paint black the pixels that do not belong to the rotated image
        if abs(axis(1,1))>floor(size(img,2)/2) || abs(axis(2,1))>floor(size(img,1)/2)
            rotImg(i,j,1)=0;
            rotImg(i,j,2)=0;
            rotImg(i,j,3)=0;
            j=j+1;
            continue;
        end
        
        %convert the coordinates of the pixel 
        %the new coordinates have as reference the point top left in
        %the image
        if axis(1,1)>0 && axis(2,1)>0
            axis2=[abs(axis(1,1))+floor(size(img,2)/2); floor(size(img,1)/2)-abs(axis(2,1))];
        elseif axis(1,1)<0 && axis(2,1)>0
            axis2=[floor(size(img,2)/2)-abs(axis(1,1)); floor(size(img,1)/2)-abs(axis(2,1))];
        elseif axis(1,1)<0 && axis(2,1)<0
            axis2=[floor(size(img,2)/2)-abs(axis(1,1)); floor(size(img,1)/2)+abs(axis(2,1))];
        elseif axis(1,1)>0 && axis(2,1)<0
            axis2=[abs(axis(1,1))+floor(size(img,2)/2); floor(size(img,1)/2)+abs(axis(2,1))];
        end
        if axis2(1,1)==0 || axis2(2,1)==0
            continue;
        end
        
        %call the coloring function to make the interpolation and paint the pixel
        color2=color(axis2,img);
        rotImg(i,j,1)=color2(1,1,1);
        rotImg(i,j,2)=color2(1,1,2);
        rotImg(i,j,3)=color2(1,1,3);

        j=j+1;
    end
    
    i=i+1;
end


end

