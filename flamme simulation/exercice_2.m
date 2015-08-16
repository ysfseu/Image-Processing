clear;
close all;
load donnees;

% Degre :
d = 5;

% Modelisation de chaque silhouette par deux courbes de Bezier couplees :
% A DECOMMENTER/COMPLETER
delta = [];
figure('Name','Modelisation de chaque silhouette par deux courbes de Bezier couplees','Position',[0.33*L,0,0.67*L,H]);
for k = 1:n
	delta_estime = estimation_2(d,y,bords(:,1,k),beta_0,bords(:,2,k),gamma_0);
	beta_estime = [delta_estime(1:d-1); delta_estime(2*d-1)];
	gamma_estime = [delta_estime(d:2*(d-1)) ;delta_estime(2*d-1)];
	x_gauche = bezier(y,beta_0,beta_estime);
	x_droite = bezier(y,gamma_0,gamma_estime);

	plot(y,bords(:,1,k),'r-','LineWidth',2);
	axis(limites);
	axis ij;
	xlabel('$y$','FontSize',20,'Interpreter','Latex');
	ylabel('$x$','FontSize',20,'Interpreter','Latex','Rotation',0);
	hold on;
	plot(y,x_gauche,'b','LineWidth',2);
	plot(y,bords(:,2,k),'r-','LineWidth',2);
	plot(y,x_droite,'b','LineWidth',2);

	pause(0.5);
	hold off;
	delta = [delta ; delta_estime'];
end

save exercice_2;