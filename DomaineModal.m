function [n,kn,wn,Lamb,Per,Freq]=DomaineModal(Nw,L,C,k,K,N0,Aff)
global ConditionsLimite;
% Domaine modal
n=(1:Nw)';    % Indices modaux

switch ConditionsLimite
    case 0 % Corde Encastrée - Encastrée
        kn=n*pi/L;      % Nombres d'ondes [1/m] : corde fixee aux deux extremites

    case 1 % Corde Ressort - Ressort
        Kan = Transcendentale(Nw,L,k,K,N0,Aff);
        kn=Kan'/L;      % Nombres d'ondes [1/m]

end

wn=C*kn;        % Pulsation [rad/s], relation de dispersion
Lamb=2*pi./kn;  % Longueur d'onde de chaque mode [m]
Per=2*pi./wn;   % Periode de chaque mode [s]
Freq=1./Per;    % Frequence de chaque mode [Hz]
