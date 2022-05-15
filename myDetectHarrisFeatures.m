function corners = myDetectHarrisFeatures(I)

Rthres=0.03;
radius=1;
order=(2*radius+1);

%mask
[dx,dy]=meshgrid(-1:1, -1:1);

%deravatives 
Ix=conv2(double(I),dx,'same');
Iy=conv2(double(I),dy,'same');
Ixy=Ix.*Iy;

%gaussian filter
g=fspecial('gaussian', 15, 1);

Ix2=conv2(double(Ix.^2), g, 'same');
Iy2=conv2(double(Iy.^2), g, 'same');
Ixy=conv2(double(Ixy), g, 'same');

for i=1:1:size(I,1)
    for j=1:1:size(I,2)
        M=[Ix2(i,j) Ixy(i,j); Ixy(i,j) Iy2(i,j)];
        detM = det(M);
        traceM = trace(M);
        R(i,j)=detM-0.04*(traceM)^2;
    end
end


mx=ordfilt2(R,order.^2,ones(order));
point= (R==mx) & (R>Rthres);
%the array 'point' has 0 as element if (i,j) is not corner and 1 as
%element if (i,j) is corner


red_pixels=zeros(size(point));
for i=1:size(point,1)
    for j=1:size(point,2)
        if point(i,j)==1 && i>2 && j>2 && i<size(point,1)-2 && j<size(point,2)-2
            red_pixels(i-2:i+2,j-2:j+2)=1;
        end
    end
end

[rows_red, cols_red]=find(red_pixels);
%generate a (5x5) square with center on the pixel that is corner

corners=cat(2,rows_red,cols_red);

end

