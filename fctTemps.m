%% Fonction test 1
%% INITIALISATION =========================================================
clear;close all;clc;

% Fonction en temps
for in=1:nmax
    % T_ij, avec i=>n et j=>t
    T(in,:)=an(in)*cos(wn(in)*t)+bn(in)*sin(wn(in)*t)/wn(in); 
end