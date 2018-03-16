%读取txt格式，但是会出现点问题  
M=load('data_out_1.txt');  
%turn to 480x272


%-----------
[r,c]=size(M);  
imwrite(uint8(M),'matrix1.jpg','jpg');  
imshow('matrix1.jpg'); 


% b=dlmread('D:\matlab\bin\BingZhouWork\Image\lena.txt');  
% [r2,c2]=size(b);  
% imwrite(uint8(b),'matrix1.tif','tif');  
% imshow('matrix1.tif'); 