clc; 
clear all;
close all;
 
load woman; 
figure
imshow(X,map)
title('Original Image');
imsave
wname = input('Enter type of wavelet in single quotes ');
[c,s]=wavedec2(X,1,wname);
[c1,s1]=wavedec2(X,2,wname);
 
[H1,V1,D1] = detcoef2('all',c,s,1);
A1 = appcoef2(c,s,wname,1); 
V1img = wcodemat(V1,255,'mat',1);
H1img = wcodemat(H1,255,'mat',1);
D1img = wcodemat(D1,255,'mat',1);
A1img = wcodemat(A1,255,'mat',1);
 
[H2,V2,D2] = detcoef2('all',c1,s1,2);
A2 = appcoef2(c1,s1,wname,2); 
V2img = wcodemat(V2,255,'mat',1);
H2img = wcodemat(H2,255,'mat',1);
D2img = wcodemat(D2,255,'mat',1);
A2img = wcodemat(A2,255,'mat',1);
 
figure
imshow(uint8(A1))
imsave
 
figure
subplot(2,2,1);
imagesc(A1img);
colormap pink(255);
title('Approximation Coef. of Level 1');

%imsave
 
subplot(2,2,2);
imagesc(H1img);
title('Horizontal detail Coef. of Level 1');
 
subplot(2,2,3);
imagesc(V1img);
title('Vertical detail Coef. of Level 1');
 
subplot(2,2,4);
imagesc(D1img);
title('Diagonal detail Coef. of Level 1');
 
figure
imshow(uint8(A2))
imsave
 
figure;
subplot(2,2,1);
imagesc(A2img);
colormap pink(255);
title('Approximation Coef. of Level 2');
%imsave
 
subplot(2,2,2)
imagesc(H2img);
title('Horizontal detail Coef. of Level 2');
 
subplot(2,2,3)
imagesc(V2img);
title('Vertical detail Coef. of Level 2');
 
subplot(2,2,4)
imagesc(D2img);
title('Diagonal detail Coef. of Level 2');
 
energyImage = sum(power(c,2));
 
Xapp1 = [A1 zeros(size(A1));zeros(size(A1)) zeros(size(A1))];
details1 = reshape([H1 V1 D1],[1,prod(size([H1 V1 D1]))]);
average1 = reshape([A1],[1,prod(size([A1]))]);
energyDetails1 = sum(power(details1,2));
percentEnergyDetails1 = (energyDetails1/energyImage)*100
energyAverage1 = sum(power(average1,2));
percentEnergyAverage1 = (energyAverage1/energyImage)*100
 
Xapp2 = [A2 zeros(size(A2));zeros(size(A2)) zeros(size(A2))];
Xapp2 = [Xapp2 zeros(size(Xapp2));zeros(size(Xapp2)) zeros(size(Xapp2))];
details2 = reshape([H2 V2 D2],[1,prod(size([H2 V2 D2]))]);
average2 = reshape([A2],[1,prod(size([A2]))]);
energyDetails2 = sum(power(details2,2));
percentEnergyDetails2 = (energyDetails2/energyImage)*100
energyAverage2 = sum(power(average2,2));
percentEnergyAverage2 = (energyAverage2/energyImage)*100
 
%Xapp1 = [A1 zeros(size(A1));zeros(size(A1)) zeros(size(A1))];
Xrec1 = wrcoef2('a',c,s,wname,1);
figure
imshow(uint8(Xrec1))
title('Recovered image after first level decomposition');
imsave
[PSNR1,MSE1] = measerr(X,Xrec1)
 
% Xapp2 = [A2 zeros(size(A2));zeros(size(A2)) zeros(size(A2))];
% Xapp2 = [Xapp2 zeros(size(Xapp2));zeros(size(Xapp2)) zeros(size(Xapp2))];
Xrec2 = wrcoef2('a',c1,s1,wname,2);
figure
imshow(uint8(Xrec2))
title('Recovered image after second level decomposition');
imsave
[PSNR2,MSE2] = measerr(X,Xrec2)
