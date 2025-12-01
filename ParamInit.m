function [L,R,E,ro,Note,H,el,Nw,Aff]=ParamInit(TypeCorde,ConditionsLimite)

%% INITIALISATION =========================================================
    Aff = [1,1,1,3];        % Affichage si Aff > 0, si non Aff = 0
    % Geometrie : section cicrculaire
    L=1;            % Longueur [m]
    R=0.001;        % Rayon [m]
    % Materiau : acier
    E=210e9;        % Module de Young [Pa]
    ro=7800;        % Masse volumique [kg/m^3]
    % Tension : corde accordee sur le la-440
    Note=440;       % Frequence fondamentale [Hz]

switch ConditionsLimite
    case 0        
        % Excitation: corde pincee d'une hauteur H en s=el 
        H=L/5;          % Hauteur [m]
        el=L/4;         % poistion [m]
        % Domaine modal

        Nw=10;        % Nombre maximal de mode considere

    case 1 % Conditions limites : ressorts

        % Excitation: impacte ponctuel en s=el 
        V=C*2;          % Vitesse de l'impact [m/]
        el=L/6;         % Position de l'impact[m]
        K=15.1*pi*N0/L;  % Raideur du ressort appliqué en s=L [N/m]
        
        % Domaine modal
        nmax=10;        % Nombre maximal de mode considéré      
        n=(1:nmax)';    % Indices modaux

        % Domaine spectral
        kmax=2*pi/R/40; % Ainsi la plus petite longueur d'onde est ~ 20xR <<FAUX>>
        wmax=C*kmax;    % Plus grande longueur pulsation [rad/s] <<FAUX>>
        dw=(C*pi./L)/10;% Le pas dw est ~ 1/10 de min(pulsation d'une corde fixée aux deux extrémités) <<FAUX>>
        w=0:dw:wmax;    % Echantillonage en pulsation [rad/s]
        Nw=length(w);   % Nombre de points d'échantillonages en w

end
