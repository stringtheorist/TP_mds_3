function [n,kn,wn,Lamb,Per,Freq,s,t]=Domaine(Nw,L,C)
% Domaine modal    
n=(1:Nw)';    % Indices modaux
kn=n*pi/L;      % Nombres d'ondes [1/m] : corde fixee aux deux extremites
wn=C*kn;        % Pulsation [rad/s], relation de dispersion
Lamb=2*pi./kn;  % Longueur d'onde de chaque mode [m]
Per=2*pi./wn;   % Periode de chaque mode [s]
Freq=1./Per;    % Frequence de chaque mode [Hz]
% Domaine spatial
ds=min(Lamb)/20;% Pas en espace [m]
s=(0:ds:L);     % Echantillonage spatial [m]
% Domaine temporel
dt=min(Per)/20; % Pas en temps [s]
tmax=max(Per)*2;% Temps maximum de la simulation [s]
t=0:dt:tmax;    % Echantillonage temporel [s]