function [an,bn]=AmplitudeModale(L,el,kn,wn,n,H,Aff,ConditionLimite ...
    )

% Amplitude modale
switch ConditionLimite
    case 1 % Corde pincée
        an = 2*H./(n*pi)*L/(L-el).*sin(kn*el)./(kn*el);
        bn = zeros(size(n));
    case 2 % Corde frappée
        an = zeros(size(n));
        bn = 2*h./(n*pi).*sin(kn*el)./(L*wn);
end

switch Aff
    case 0 % Affiche rien
    case 1 % visualisation des amplitudes modales an et bn
        % an
        figure(2);subplot(1,2,1);
        stem(wn,abs(an),'LineWidth',2)
        xlabel('wn [rad/s]')
        ylabel('|an| [m]')
        set(gca,'FontSize',24)
        %bn
        figure(2);subplot(1,2,2);
        stem(wn,abs(bn),'LineWidth',2)
        xlabel('wn [rad/s]')
        ylabel('|an| [m]')
        set(gca,'FontSize',24)
    otherwise 
        disp('Aff dois etre égale 0,1');
end 


%% Amplitude modale
%an=zeros(size(n));
%bn=L*V*(cos(kn.*el)+K/N0*sin(kn.*el)./kn)./normY2;
%-> visualisation des amplitudes modales an
%figure(6);
%stem(Freq,abs(bn),'LineWidth',2)
%xlabel('fn [Hz]')
%ylabel('|bn| [m]')
%set(gca,'FontSize',24)