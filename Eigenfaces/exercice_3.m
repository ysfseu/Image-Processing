clear;
close all;
load exercice_1;

% Images originales :
numeros_images = 1:nb_postures:n;
nb_images = length(numeros_images);
images_originales = reshape(X(numeros_images,:)',nb_lignes,nb_colonnes,nb_images);

% Definition d'une bande situee au niveau des yeux :
% A DECOMMENTER
 ligne_centrale = 210;
 epaisseur_bande = 30;
 bande_noire = ligne_centrale-epaisseur_bande:ligne_centrale+epaisseur_bande;

% Mise a 0 des pixels situes a l'interieur de cette bande :
% A DECOMMENTER
 images_degradees = images_originales;
 images_degradees(bande_noire,:,:) = 0;

% Calcul des composantes principales de l'image degradee :
% A DECOMMENTER/COMPLETER
 CP_image_degradee = X*W;

% Calcul des composantes principales des images degradees, puis restauration :
% A DECOMMENTER/COMPLETER
 images_restaurees = images_degradees;
 for i = 1:nb_images
	image_degradee = images_degradees(:,:,i);
	CP_image_degradee = image_degradee(:)'*W;
    imgage_re=W*CP_image_degradee';
	images_restaurees(:,:,i) = reshape(imgage_re(:,i),nb_lignes,nb_colonnes,nb_images);
 end

% Affichage des images originales, degradees et restaurees :
% A DECOMMENTER
% figure('Name','Restauration d''images degradees','Position',[0.33*L,0,0.67*L,H]);
colormap(gray);
for i = 1:nb_images
	subplot(3,nb_images,i);
	imagesc(images_originales(:,:,i));
	hold on;
	axis image;
	axis off;
	title(['Image originale ' num2str(i,'%2d')]);
	subplot(3,nb_images,nb_images+i);
	imagesc(images_degradees(:,:,i));
	hold on;
	axis image;
	axis off;
	title(['Image degradee ' num2str(i,'%2d')]);
	subplot(3,nb_images,2*nb_images+i);
	imagesc(images_restaurees(:,:,i));
	hold on;
	axis image;
	axis off;
	title(['Image restauree ' num2str(i,'%2d')]);
end
