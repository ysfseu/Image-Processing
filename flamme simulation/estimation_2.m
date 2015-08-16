function delta_estime = estimation_2(d,y,x_gauche,beta_0,x_droite,gamma_0)

% A DECOMMENTER/COMPLETER
p = length(y);
for j = 1:p
	for i = 1:d
		A(j,i) = nchoosek(d,i)*y(j)^i*(1-y(j))^(d-i);
	end
end
F(1:p,:) = [A(:,1:d-1) zeros(size(A,1),size(A,2)-1) A(:,d)];
F(p+1:2*p,:) = [zeros(size(A,1),size(A,2)-1) A];
D = x_gauche-beta_0.*nchoosek(d,0).*(y.^0).*(ones(size(y))-y).^d;
E = x_droite-gamma_0.*nchoosek(d,0).*(y.^0).*(ones(size(y))-y).^d;
G = [D ; E];

delta_estime = F\G;
