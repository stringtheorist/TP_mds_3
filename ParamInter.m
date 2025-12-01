function [A,C,V,N0,Def]=ParamInter(R,L,ro,E,Note)

A=pi*R^2;       % Aire [m^2]
C=2*L*Note;     % Celerite [m/s]
V=2*C;          % Vitesse
N0=ro*A*C^2;    % Tension [N]
Def=N0/(E*A);   % Deformation [~]