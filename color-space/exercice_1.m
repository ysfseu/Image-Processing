clear;
close all;

% Read image :
I = imread('autumn.tif');
[nb_lignes,nb_colonnes,nb_canaux] = size(I);
figure('Name','Image color and RGB','Position',[550,0,1100,900]);
subplot(2,2,1);
imagesc(I);
axis off;
axis equal;
title('Image couleur');
Id = double(I);

%Show Different canaux

 R = Id(:,:,1);
 subplot(2,2,2);
 imagesc(R);
 colormap(gray);
 axis off;
 axis equal;
 title('Canal R');


 V = Id(:,:,2);
 subplot(2,2,3);
 imagesc(V);
 colormap(gray);
 axis off;
 axis equal;
 title('Canal V');

 B = Id(:,:,3);
 subplot(2,2,4);
 imagesc(B);
 colormap(gray);
 axis off;
 axis equal;
 title('Canal B');

%caculate mean and covariances matrix :
 Rbis = R(:);
 Vbis = V(:);
 Bbis = B(:);
 moyenne_R = mean(Rbis);
 moyenne_V = mean(Vbis);
 moyenne_B = mean(Bbis);
 variance_R = mean((Rbis-moyenne_R).^2);
 variance_V = mean((Vbis-moyenne_V).^2);
 variance_B = mean((Bbis-moyenne_B).^2);
 covariance_RV = mean((Rbis-moyenne_R).*(Vbis-moyenne_V));
 covariance_RB = mean((Rbis-moyenne_R).*(Bbis-moyenne_B));
 covariance_VB = mean((Vbis-moyenne_V).*(Bbis-moyenne_B));

% Correlation :
 disp(['Correlation entre rouge et vert = ' num2str(covariance_RV/(std(Rbis)*std(Vbis)),'%.3f')]);
 disp(['Correlation entre rouge et bleu = ' num2str(covariance_RB/(std(Rbis)*std(Bbis)),'%.3f')]);
 disp(['Correlation entre vert et bleu = ' num2str(covariance_VB/(std(Vbis)*std(Bbis)),'%.3f')]);

% total constrast :
 c = variance_R+variance_V+variance_B;

% Proportions de contraste :
 disp(['Proportion de contraste contenue dans le canal rouge = ' num2str(variance_R/c,'%.3f')]);
 disp(['Proportion de contraste contenue dans le canal vert = ' num2str(variance_V/c,'%.3f')]);
 disp(['Proportion de contraste contenue dans le canal bleu = ' num2str(variance_B/c,'%.3f')]);

save exercice_1;
