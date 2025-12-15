%% ========================================================================
%% INITIALISATION =========================================================
clear;close all;clc;
%% ========================================================================
TypeCorde = 0;
ConditionsInitiales = 0;  % 0 : corde pincée ; 1 : corde frappée
ConditionsLimite = 0;     % 0 : corde encastrée-encastrée ; 1 : corde ressort-ressort
Aff = [1,1,1,3,1];        % Pour les différents affichages possible, se référer au rapport

% Parametres
[L,C,V,H,el,Nw,k,K,N0,wmax,dw]=ParamBis(TypeCorde,ConditionsLimite);
% Domaine modal
[n,kn,wn,Lamb,Per,Freq]=DomaineModal(Nw,L,C,k,K,N0,Aff(5),ConditionsLimite);
% Domaine spatial et temporel
[s,t]=DomaineSpTp(Per,Lamb,L,wmax,dw,ConditionsLimite);

if(ConditionsLimite == 1) % FREQUENCE PROPRES ET RE-DIMENSIONNALISATION DES DOMAINES
    [n,kn,wn,Lamb,Per,Freq]=DomaineModal(Nw,L,C,k,K,N0,0,0);
end

% Rq : dans une phase de bebeugage, il faut que [Nt,Ns,Nw] aient des valeurs
% raisonnables (<=1000) et si possible distinctes.
disp(['[Nt,Ns,Nw]=[' num2str([length(t),length(s),Nw]) ']'])

%% ========================================================================
%% ANALYSE MODALE =========================================================
% Modes propres
[Y,NormY2]=ModePropre(kn,s,Nw,n,K,N0,L,Aff(1),ConditionsLimite);
% Amplitude modale
[an,bn]=AmplitudeModale(L,el,kn,wn,n,H,V,NormY2,K,N0, ...
                        Aff(2),ConditionsInitiales,ConditionsLimite);
% Fonction en temps
T=FctTemporelle(Nw,wn,an,bn,t,Aff(3),ConditionsLimite);
% Deplacement
u=FctDeplacement(H,L,Y,T,s,t,Aff(4));

%% Bonus
% Film
Film(u,s,L,H,'corde.avi');
% Son
Son(u,t);
