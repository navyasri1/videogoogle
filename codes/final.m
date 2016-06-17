%imageset=imageSet('/home/navyasri/Desktop/problems/video/images');

%[s,B]=cluster(imageset);
z=imread('/home/navyasri/Desktop/problems/video/images/frame795.jpg');
imshow(z);
rect=getrect;
rect=round(rect);
z=z(rect(2):rect(2)+rect(4),rect(1):rect(1)+rect(3),:);
[h,d,p]=queryhist(z,B);

for i=1:size(s,2)
    n(i)=sum(s(i).his);
end
nd=sum(n);
Nt=size(s,2);




[a,b]=size(d);
[c,e]=size(s);
for i=1:e
    f(i)=0;
end
for i=1:size(d,1)
    for j=1:size(s,2)
        f(j)=f(j)+s(j).his(p(i));
       % f(j)=f(j)+(n(j)/nd)*log(Nt/s(j).his(p(i)));
        
    end
end

[M,N]=sort(f,'descend');
%figure,imshow(read(imageset,N(5)))
for i=1:64
        subplot(8,8,i)
        imshow(read(imageset,N(i)));
end