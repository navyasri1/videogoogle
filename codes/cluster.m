function [s,B]= cluster(imageset)


N=0;
S(1)=0;

for i=1:imageset.Count
    
     I= imresize(read(imageset,i),[100 100]);
     I=single(rgb2gray(I));
     [f,d]=vl_sift(I);
     d=double(d);
     d=d';
     [a,b]=size(d);
     S(i+1)=S(i)+a;
     X(N+1:N+a,:)=d;
     N=N+a;
end
m=300;
[A,B]=kmeans(X,m);

field='his';
value=[];
s= struct(field,value);


for i=1:imageset.Count
    
    siz=S(i+1)-S(i)-1;
    for k=1:m
        s(i).his(k)=0;
    end
    
    for j= S(i)+1:S(i+1)
        k=A(j);
        s(i).his(k)=s(i).his(k)+1;
    end

end