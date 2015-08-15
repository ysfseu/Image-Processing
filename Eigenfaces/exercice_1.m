clear;
close all;
load donnees;

% Calcul de l'individu moyen :
% A DECOMMENTER/COMPLETER
individu_moyen= mean(X,1);

% Centrage des donnees :
% A DECOMMENTER/COMPLETER
Xc = X-ones(n,1)*individu_moyen;

% Calcul de la matrice Sigma_2 (de taille inferieure a celle de Sigma) :
% A DECOMMENTER/COMPLETER
 Sigma_2 = Xc*Xc';
 Sigma_2 = Sigma_2/n;

% Calcul des vecteurs/valeurs propres de la matrice Sigma_2 :
% A DECOMMENTER/COMPLETER
[V_2,D] = eig(Sigma_2);				% V_2 est de taille n x n

% Calcul des vecteurs propres de Sigma (qui sont les eigenfaces) deduits de ceux de Sigma_2 :
% A DECOMMENTER/COMPLETER			

V=Xc'*V_2;% V est de taille p x n
% Tri par ordre decroissant des valeurs propres de Sigma_2 :
% A DECOMMENTER/COMPLETER
 [lambda,indices] = sort(diag(D),'descend');

% Tri des eigenfaces dans le meme ordre :
% A DECOMMENTER/COMPLETER
 W = V(:,indices);

% Comme Sigma_2 est semi-definie positive, ses valeurs propres sont positives ou nulles et la plus petite est egale a 0 :
% A DECOMMENTER/COMPLETER
W = W(:,1:n-1);				% W est de taille p x (n-1)

% Normalisation des eigenfaces :
% A DECOMMENTER/COMPLETER
 normes_eigenfaces = sqrt(sum(W.*W));
 W = W./(ones(p,1)*normes_eigenfaces);

% Affichage de l'individu moyen et des eigenfaces sous forme de pseudo-images :
% A DECOMMENTER/COMPLETER
 figure('Name','Individu moyen et eigenfaces','Position',[0.33*L,0,0.67*L,H]);
 colormap(gray);
 img = reshape(individu_moyen,[nb_lignes,nb_colonnes]);
 subplot(nb_individus,nb_postures,1);
 imagesc(img);
 hold on;
 axis image;
 axis off;
 title(['Individu moyen']);
 for k = 1:n-1
 	img = reshape(W(:,k),[nb_lignes,nb_colonnes]);
 	subplot(nb_individus,nb_postures,k+1);
 	imagesc(img);
 	hold on;
 	axis image;
 	axis off;
 	title(['Eigenface ',num2str(k)]);
 end

save exercice_1;
