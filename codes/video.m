a=VideoReader('test.mp4');

field='dif';
value=[];
I= struct(field,value);


 k=[];
 for img=1:a.NumberOfFrames-1
     b1=double(imresize(read(a,img),[100 100]));
     b2=double(imresize(read(a,img+1),[100 100]));
     I(img).dif=imabsdiff(b1,b2);
 end
 img
 k=I(1).dif;
 for i=2:a.NumberOfFrames-1
     k=k+I(i).dif;
 end
 k=k/a.NumberOfFrames;
 m=sum(sum(sum(k)));
 i
 img=1;
 for i=1:a.NumberOfFrames-1
     if(sum(sum(sum(I(i).dif)))>= m)
         filename=strcat('frame',num2str(img),'.jpg');
         b=read(a,i);
         imwrite(b,filename);
         img=img+1;
          filename=strcat('frame',num2str(img),'.jpg');
         b=read(a,i+1);
         imwrite(b,filename);
     end
 end

 

