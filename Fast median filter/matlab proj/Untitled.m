clc;
clear;
i=imread('1.jpg');
A=rgb2gray(i);
subplot(1,2,1);
imshow(A);
title('ԭʼͼ��');

[r,c]=size(A);
 fid=fopen('1.txt','wt');  
 for i=1:r  
     for j=1:c  
         fprintf(fid,'%d\t ',A(i,j));  
     end  
             fprintf(fid,'\n');  
 end  
 fclose(fid);
 
i=imread('1.jpg');
A=rgb2gray(i);
k=medfilt2(A);
subplot(1,2,2);
imshow(k);
title('�����ͼ��');
[r,c]=size(k);
 fid=fopen('2.txt','wt');  
 for i=1:r  
     for j=1:c  
         fprintf(fid,'%d\t ',k(i,j));  
     end  
             fprintf(fid,'\n');  
 end  
 fclose(fid);