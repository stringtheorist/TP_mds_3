%% ========================================================================
%% INITIALISATION =========================================================
clear;close all;clc;
%% ========================================================================
Type=0;
% ConditionsInitiales = 1 : corde pincée ; 2 : corde frapée
ConditionsInitiales = 2; 
% Parametres
[L,C,V,H,el,Nw,Aff]=Param(Type);
% Domaine modal
[n,kn,wn,Lamb,Per,Freq]=DomaineModal(Nw,L,C);
% Domaine spatial et temporel
[s,t]=DomaineSpTp(Per,Lamb,L);
% Rq : dans une phase de bebeugage, il faut que [Nt,Ns,Nw] aient des valeurs 
% raisonnables (<=1000) et si possible distinctes.
disp(['[Nt,Ns,Nw]=[' num2str([length(t),length(s),Nw]) ']'])

%% ========================================================================
%% ANALYSE MODALE =========================================================
% Modes propres
Y=ModePropre(kn,s,Nw,Aff(1));
% Amplitude modale
[an,bn]=AmplitudeModale(L,el,kn,wn,n,H,V,Aff(2),ConditionsInitiales);
% Fonction en temps
T=FctTemporelle(Nw,wn,an,bn,t,Aff(3));
% Deplacement
u=FctDeplacement(H,L,Y,T,s,t,Aff(4));

%% ========================================================================
%% VALORISATION ===========================================================
%Type=1;Illustration(Type,u,s,t)
%Type=2;Illustration(Type,u,s,t)
%Type=3;Illustration(Type,u,s,t)
% D'autres valorisations peuvent etre envisagees, quelques propostion
% Film ?
% Son ?
% Autre ?
