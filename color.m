function color = color(axis2,I)
if axis2(1,1)>1 && axis2(1,1)<size(I,2) && axis2(2,1)>1 && axis2(2,1)<size(I,1)
    color=(double(I(axis2(2,1)-1,axis2(1,1),:))+double(I(axis2(2,1)+1,axis2(1,1),:))+double(I(axis2(2,1),axis2(1,1)-1,:))+double(I(axis2(2,1),axis2(1,1)+1,:)))/4;
elseif axis2(1,1)==1 && axis2(2,1)~=1 && axis2(2,1)~=size(I,1)
    color=(double(I(axis2(2,1)-1,axis2(1,1),:))+double(I(axis2(2,1)+1,axis2(1,1),:))+double(I(axis2(2,1),axis2(1,1)+1,:)))/3;
elseif axis2(1,1)==size(I,2) && axis2(2,1)~=1 && axis2(2,1)~=size(I,1)
    color=(double(I(axis2(2,1)-1,axis2(1,1),:))+double(I(axis2(2,1)+1,axis2(1,1),:))+double(I(axis2(2,1),axis2(1,1)-1,:)))/3;
elseif axis2(2,1)==1 && axis2(1,1)~=1 && axis2(1,1)~=size(I,2)
    color=(double(I(axis2(2,1)+1,axis2(1,1),:))+double(I(axis2(2,1),axis2(1,1)-1,:))+double(I(axis2(2,1),axis2(1,1)+1,:)))/3;
elseif axis2(2,1)==size(I,1) && axis2(1,1)~=1 && axis2(1,1)~=size(I,2)
    color=(double(I(axis2(2,1)-1,axis2(1,1),:))+double(I(axis2(2,1),axis2(1,1)-1,:))+double(I(axis2(2,1),axis2(1,1)+1,:)))/3;
elseif axis2(2,1)==1 && axis2(1,1)==1
    color=(double(I(axis2(2,1)+1,axis2(1,1),:))+double(I(axis2(2,1),axis2(1,1)+1,:)))/2;
elseif axis2(2,1)==1 && axis2(1,1)==size(I,2)
    color=(double(I(axis2(2,1)+1,axis2(1,1),:))+double(I(axis2(2,1),axis2(1,1)-1,:)))/2;
elseif axis2(2,1)==size(I,1) && axis2(1,1)==size(I,2)
    color=(double(I(axis2(2,1)-1,axis2(1,1),:))+double(I(axis2(2,1),axis2(1,1)-1,:)))/2;
elseif axis2(2,1)==size(I,1) && axis2(1,1)==1
    color=(double(I(axis2(2,1)-1,axis2(1,1),:))+double(I(axis2(2,1),axis2(1,1)+1,:)))/2;
end
color=color./255;

end

