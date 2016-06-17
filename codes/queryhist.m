function [h,d,p]= queryhist(img,meanset)

    img=imresize(img,[100 100]);
    img=single(rgb2gray(img));
    [f,d]=vl_sift(img);
     d=double(d);
     d=d';
     [a,b]=size(d);
     
     for i=1:300
        h(i)=0;
    end
     
     for i=1:a
         for j=1:300
             k(j)=norm(imabsdiff(meanset(j,:)',d(i,:)'));
         end
         [M,In]=min(k);
         p(i)=In;
         h(In)=h(In)+1;
     end