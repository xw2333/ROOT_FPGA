% A=load('data_out_1.txt');
% %B=reshape(A,272,480);
% %[r,c]=size(B);
% [r,c]=size(A);
%  fid=fopen('final.txt','wt'); 
%   for i=1:272 
%      for j=1:480 
%          fprintf(fid,'%d\t ',A((i-1)*480+j));  
%      end  
%      fprintf(fid,'\n'); 
%  end 
%               
%  fclose(fid);
%  
%  B=load('final.txt');
% code to create image data from txt file
clc;
clear all;
close all;
medfilt_v_load = load('.\data_out_1.txt'); % verilog 产生的中值滤波之后数据
m = 480;
n = 272;
medfilt_v = reshape(medfilt_v_load, m, n);
medfilt_v = uint8(medfilt_v');
imshow(medfilt_v)