function x_p = myLocalDescriptorUpgrade(I,p,rhom,rhoM,rhostep,N)

angle=2*pi/N;
i=p(1,1);
j=p(2,1);
col=1;
x_p=zeros(8,1);

for r=rhom:rhostep:rhoM
    if i-abs(r)<=0 || j-abs(r)<=0 || i+abs(r)>= size(I,1) || j+abs(r)>=size(I,2)
        break;
    end
    for z=1:N
        x_p(z,col)=I(i+round(sin(z*angle)*r), j+round(cos(z*angle)*r));
    end
    col=col+1;
end  

end

