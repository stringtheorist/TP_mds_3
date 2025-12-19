function [an,bn]=AmplitudeModale(L,el,kn,wn,n,H,V,normY2,K,N0,Aff)
global ConditionsInitiales ConditionsLimite;
switch ConditionsLimite
    case 0 % CL : Encastrée - Encastrée
        switch ConditionsInitiales
            case 0 % Corde pincée
                an = 2*H./(n*pi)*L/(L-el).*sin(kn*el)./(kn*el);
                bn = zeros(size(n));

            case 1 % Corde frappée
                an = zeros(size(n));
                bn = 2*V*H/L*sin(kn*el);
        end
    case 1 % Ressort - Ressort
        switch ConditionsInitiales
            case 0 % Corde pincée
                % Essais des amplitudes mais qui ne font pas ce qu on attendrait d eux
                % Cas 1
                % an = H*V*(l/el*(cos(kn*el)./kn.^2 + K/N0*sin(kn*el)./kn.^3 - 1./kn.^2) ...
                %      1/(el-L)*(cos(kn*L)./kn.^2 + K/N0*sin(kn*L)./kn.^3 - cos(kn*el)./kn.^2 - K/N0*sin(kn*el)./kn.^3));
                % Cas 2
                % an = pi/L*V*H./normY2.*((cos(kn*L) + 2*K./(N0*kn).*sin(kn*L) + 1)./((pi/L)^2-kn.^2) ...
                %      N0/K*(sin(kn*L)./kn - cos(kn*L)./kn.^2 + 1./kn.^2));
                %
                % bn =zeros(size(n));

            case 1 % Corde frappée
                an=zeros(size(n));
                bn=L*V*(cos(kn.*el)+K/N0*sin(kn.*el)./kn)./normY2;
        end

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
        title('Amplitudes an');
        %bn
        figure(2);subplot(1,2,2);
        stem(wn,abs(bn),'LineWidth',2)
        xlabel('wn [rad/s]')
        ylabel('|bn| [m]')
        set(gca,'FontSize',24)
        title('Amplitudes bn');
    otherwise
        disp('Aff dois etre égale 0,1');
end
