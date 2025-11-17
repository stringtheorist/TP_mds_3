function [L,R,E,ro,Note,H,el,Nw,Aff]=ParamInit
%% INITIALISATION =========================================================
Aff = [1,1,1];        % 
%Aff(1) pour ModePropre, affichage si Aff > 0, sinon Aff = 0
%Aff(2) pour AmplitudeModale, affichage si Aff > 0, sinon Aff = 0
%Aff(3) pour FctDeplacement, affichage si Aff > 0, sinon Aff = 0

% Geometrie : section cicrculaire
L=1;            % Longueur [m]
R=0.001;        % Rayon [m]
% Materiau : acier
E=210e9;        % Module de Young [Pa]
ro=7800;        % Masse volumique [kg/m^3]
% Tension : corde accordee sur le la-440
Note=440;       % Frequence fondamentale [Hz]
% Excitation: corde pincee d'une hauteur H en s=el 
H=L/5;          % Hauteur [m]
el=L/4;         % poistion [m]
% Domaine modal
Nw=10;        % Nombre maximal de mode considere