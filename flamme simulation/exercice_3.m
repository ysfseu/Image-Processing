clear;
close all;
load exercice_2;

% Estimation des lois normales :
% A DECOMMENTER/COMPLETER
delta_moyen = mean(delta);
delta_centre = delta-ones(size(delta,1),1)*delta_moyen;
variance_covariance_delta = (delta_centre'*delta_centre)/n;
sigma_delta = diag(sqrt(variance_covariance_delta));

% Simulation de silhouettes par tirages aleatoires :
% A DECOMMENTER/COMPLETER
figure('Name','Simulation de silhouettes par tirages aleatoires','Position',[0.33*L,0,0.67*L,H]);
N = 15;			% Longueur de la sequence simulee
for k = 1:N
	delta_aleatoire = sigma_delta.*randn(size(delta,2),1)+delta_moyen';
	beta_aleatoire = [delta_aleatoire(1:d-1); delta_aleatoire(2*d-1)];
	gamma_aleatoire =[delta_aleatoire(d:2*(d-1)) ;delta_aleatoire(2*d-1)];
	x_gauche = bezier(y,beta_0,beta_aleatoire);
	x_droite = bezier(y,gamma_0,gamma_aleatoire);
    if 	length(find(x_gauche>x_droite))==0
        plot(x_droite,y,'Color','b','LineWidth',2);
        axis([limites(3:4) limites(1:2)]);
        xlabel('$x$','FontSize',20,'Interpreter','Latex');
        ylabel('$y$','FontSize',20,'Interpreter','Latex','Rotation',0);
        hold on;
        plot(x_gauche,y,'Color','b','LineWidth',2);
                
        for j = 1:p
            plot([x_gauche(j) x_droite(j)],[y(j) y(j)],'Color','b','LineWidth',2);
        end
    end

	pause(0.25);
	hold off;
end

save exercice_3;