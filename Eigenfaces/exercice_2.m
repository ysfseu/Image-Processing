clear;
close all;
load exercice_1;

% Matrice des q premieres eigenfaces (faire varier la valeur de q) :
% A DECOMMENTER/COMPLETER
 q = 12;
 Wq = W(:,1:q);% Wq est de taille p x q

% Calcul des composantes principales des images :
% A DECOMMENTER/COMPLETER
CP = X*Wq;

% Reconstruction des images a partir de ces q composantes principales :
% A DECOMMENTER/COMPLETER
X_reconstruit = Wq*CP';

% Affichage des n images reconstruites :
% A DECOMMENTER/COMPLETER
 figure('Name',['Images reconstruites en utilisant ' num2str(q) ' composantes principales'],'Position',[0.33*L,0,0.67*L,H]);
 colormap(gray);
 for k = 1:n
	img = reshape(X_reconstruit(:,k),[nb_lignes,nb_colonnes]);
	subplot(nb_individus,nb_postures,k);
	imagesc(img);
	hold on;
	axis image;
	axis off;
	title(['Image reconstruite ',num2str(k)]);
end

% Calcul de la RMSE entre images originales et images reconstruites :
% A DECOMMENTER/COMPLETER
valeurs_RMSE = [];
valeurs_q = [];
for q = 1:n-1
	Wq  = W(:,1:q);
	CP = X*Wq;
	X_reconstruit = Wq*CP';
	ecart_quadratique_moyen = sum(diag((X-X_reconstruit')*(X-X_reconstruit')'))/(n*p);
	valeurs_RMSE = [valeurs_RMSE ; sqrt(ecart_quadratique_moyen)];
	valeurs_q = [valeurs_q ; q];
end

% Trace du graphe de la RMSE en fonction du nombre q de composantes :
% A DECOMMENTER
figure('Name','RMSE en fonction du nombre de composantes principales','Position',[0,0,0.33*L,0.3*L]);
plot(valeurs_q,valeurs_RMSE,'r+','MarkerSize',8,'LineWidth',2);
hx = xlabel('$q$','FontSize',20);
set(hx,'Interpreter','Latex');
hy = ylabel('RMSE','FontSize',20);
