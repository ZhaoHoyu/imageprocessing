​
%% 
%题目：基于灰度变换的伪彩色方法
%意义：将亮度低的映射为蓝色(冷色)，亮度高的映射为红色（暖色）。
%方法：分别用三个矩阵保存，三个通道的灰度值。每个通道的灰度值，有不同的映射函数。
% 输入灰度级        输出彩色
% 0～63  1/4         蓝色
% 64～127 2/4        紫色
% 128～191 3/4       黄色
% 192～255  4/4      红色
%% 
clc;
clear;
grayImage=rgb2gray(imread('C:\Users\ch\Desktop\1_0°.bmp'));
figure,imshow(grayImage);
[row,col]=size(grayImage);
range=255;%每个通道的最大灰度值
 
R = zeros(row,col);
G = zeros(row,col);
B = zeros(row,col);
%% 
for i=1:row
    for j=1:col
        if grayImage(i,j)<=range/4 % [0,64]偏蓝
             R(i,j)=0;
             G(i,j)=4*grayImage(i,j);
             B(i,j)=range;
 
        elseif grayImage(i,j)<=range/2 % (64,128] 偏紫
             R(i,j)=0;
             G(i,j)=range;
             B(i,j)=-4*grayImage(i,j)+2*range;
 
        elseif grayImage(i,j)<=3*range/4% (128, 192]
             R(i,j)=4*grayImage(i,j)-2*range;
             G(i,j)=range;
             B(i,j)=0;
         
        else
             R(i,j)=range;
             G(i,j)=4*(range-grayImage(i,j));
             B(i,j)=0;
                  
              
        end
    end
end
%%
out = zeros(row,col);
for i=1:row
    for j=1:col
              out(i,j,1)=R(i,j);
              out(i,j,2)=G(i,j);
              out(i,j,3)=B(i,j);
    end
end
 
out=out/256;
figure,imshow(out);
 
​
