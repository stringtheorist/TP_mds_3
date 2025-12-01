function [L,C,H,el,Nw,Aff]=Param(TypeCorde,ConditionsLimite)

% Chargement des parametres
[L,R,E,ro,Note,H,el,Nw,Aff]=ParamInit(TypeCorde,ConditionsLimite);

% Parametres intermediaires
[A,C,N0,Def]=ParamInter(R,L,ro,E,Note);


