clear;
close all;
load exercice_1;

% Affichage du nuage de pixels dans le repere RVB :
% A DECOMMENTER/COMPLETER
X = [Rbis, Vbis, Bbis];
n = size(X,1);
figure('Name','Nuage de pixels dans le repere RVB','Position',[0,0,550,450]);
plot3(Rbis, Vbis, Bbis, '.');
axis equal;
xlabel('R');
ylabel('V');
zlabel('B');
rotate3d;

% Centrage des donnees (changement d'origine du repere) :
G = [moyenne_R, moyenne_V, moyenne_B];
Xc = X - ones(n, 1) * G;

% Matrice de variance/covariance :
Sigma = Xc' * Xc ./ n;

% Calcul des valeurs et vecteurs propres de Sigma :
% A DECOMMENTER/COMPLETER
[W,D] = eig(Sigma);

% Tri des valeurs propres par ordre decroissant :
% A DECOMMENTER/COMPLETER
valp = diag(D);
[valp, idx] = sort(valp, 'descend');

% Matrice de passage de l'ancienne base vers la nouvelle base :
P1 = W(:, idx);

% Calcul des composantes des pixels  dans le nouveau repere :
Z = X * P1;

% Affichage de l'image couleur et de ses trois composantes principales :
figure('Name','Image couleur et composantes principales','Position',[550,0,1100,900]);
subplot(2,2,1);
imagesc(I);
axis off;
axis equal;
title('Image couleur');

% Affichage de la premiere composante principale :
Z1 = reshape(Z(:,1), nb_lignes, nb_colonnes);
subplot(2,2,2);
imagesc(Z1);
colormap(gray);
axis off;
axis equal;
title('Premiere composante principale');

% Affichage de la deuxieme composante principale :
Z2 = reshape(Z(:,2), nb_lignes, nb_colonnes);
subplot(2,2,3);
imagesc(Z2);
axis off;
axis equal;
colormap(gray);
title('Deuxieme composante principale');

% Affichage de la troisieme composante principale :
Z3 = reshape(Z(:,3), nb_lignes, nb_colonnes);
subplot(2,2,4);
imagesc(Z3);
axis off;
axis equal;
colormap(gray);
title('Troisieme composante principale');

% Moyennes, variances et covariances :
Z1bis = Z1(:);
Z2bis = Z2(:);
Z3bis = Z3(:);
moyenne_Z1 = mean(Z1bis);
moyenne_Z2 = mean(Z2bis);
moyenne_Z3 = mean(Z3bis);
variance_Z1 = mean(Z1bis.^2) - moyenne_Z1^2;
variance_Z2 = mean(Z2bis.^2) - moyenne_Z2^2;
variance_Z3 = mean(Z3bis.^2) - moyenne_Z3^2;
covariance_Z1Z2 = mean(Z1bis .* Z2bis) - moyenne_Z1 * moyenne_Z2;
covariance_Z1Z3 = mean(Z1bis .* Z3bis) - moyenne_Z1 * moyenne_Z3;
covariance_Z2Z3 = mean(Z2bis .* Z3bis) - moyenne_Z2 * moyenne_Z3;

% Coefficients de correlation lineaire :
corrZ1Z2 = covariance_Z1Z2 / (sqrt(variance_Z1) * sqrt(variance_Z2));
corrZ1Z3 = covariance_Z1Z3 / (sqrt(variance_Z1) * sqrt(variance_Z3));
corrZ2Z3 = covariance_Z2Z3 / (sqrt(variance_Z2) * sqrt(variance_Z3));
disp(['Correlation entre Z1 et Z2 = ' num2str(corrZ1Z2,'%.3f')]);
disp(['Correlation entre Z1 et Z3 = ' num2str(corrZ1Z3,'%.3f')]);
disp(['Correlation entre Z2 et Z3 = ' num2str(corrZ2Z3,'%.3f')]);

% Proportions de contraste :
c = variance_Z1 + variance_Z2 + variance_Z3;
disp(['Proportion de contraste contenue dans Z1 = ' num2str(variance_Z1 / c,'%.3f')]);
disp(['Proportion de contraste contenue dans Z2 = ' num2str(variance_Z2 / c,'%.3f')]);
disp(['Proportion de contraste contenue dans Z3 = ' num2str(variance_Z3 / c,'%.3f')]);
