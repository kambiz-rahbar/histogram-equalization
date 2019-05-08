clc
clear
close all

i = imread('1.jpg');
if size(i,3)>1
	i = rgb2gray(i);
end
subplot(2,3,1); imshow(i);

ch = zeros(256,1);
ch(1) = sum(i(:)==0);
for k = 2:255
	ch(k+1) = ch(k)+sum(i(:)==k);
end
subplot(2,3,2); bar(ch); title('ch');

T = ch /ch(256);
subplot(2,3,3); plot(T); axis square; title('T');

j = double(i);
for k=1:256
	j(j==k)=T(k);
end
subplot(2,3,4); imshow(j);
subplot(2,3,5); imshow(histeq(i));

aj = j*double((max(i(:))-min(i(:)))+min(i(:)));

aj = uint8(aj);
subplot(2,3,6); imshow(aj);


