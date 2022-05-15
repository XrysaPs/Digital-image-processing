function c = isCorner(I,p,k,Rthres)

%mask
[dx,dy]=meshgrid(-1:1, -1:1);
%deravatives 
Ix=conv2(double(I),dx,'same');
Iy=conv2(double(I),dy,'same');
Ixy=Ix.*Iy;

%gaussian filter
g=fspecial('gaussian', 3, 1);

Ix2=conv2(Ix.*Ix, g, 'same');
Iy2=conv2(Iy.*Iy, g, 'same');
Ixy=conv2(Ixy, g, 'same');
detM = (Ix2.*Iy2)-(Ixy.^2);
traceM = Ix2+Iy2;
R=detM-k*(traceM).^2;

if R(p(1,1),p(2,1))>=Rthres
    c=true;
else
    c=false;
end


end

