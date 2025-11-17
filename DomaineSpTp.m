function [s,t]=DomaineSpTp(Per,Lamb,L)
% Domaine spatial
ds=min(Lamb)/20;% Pas en espace [m]
s=(0:ds:L);     % Echantillonage spatial [m]
% Domaine temporel
dt=min(Per)/20; % Pas en temps [s]
tmax=max(Per)*2;% Temps maximum de la simulation [s]
t=0:dt:tmax;    % Echantillonage temporel [s]