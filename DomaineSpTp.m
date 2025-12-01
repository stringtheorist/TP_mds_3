function [s,t]=DomaineSpTp(Per,Lamb,L,TypeCorde)

switch TypeCorde
    case 0
        % Domaine spatial
        ds=min(Lamb)/20;% Pas en espace [m]
        s=(0:ds:L);     % Echantillonage spatial [m]
        % Domaine temporel
        dt=min(Per)/20; % Pas en temps [s]
        tmax=max(Per)*2;% Temps maximum de la simulation [s]
        t=0:dt:tmax;    % Echantillonage temporel [s]
    case 1
        % Domaine spatial
        ds=0.001; % Pas en espace [m].  R=0.001 
        s=(0:ds:L); % Echantillonage spatial [m]
        % Domaine temporel
        dt=2*pi/(wmax/2);   % Pas en temps [s]
        tmax=2*pi/(dw);% Temps maximum de la simulation [s]
        t=0:dt:tmax;    % Echantillonage temporel [s]
end