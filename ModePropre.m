function [Y,normY2]=ModePropre(kn,s,Nw,Aff,ConditionsLimite)

switch ConditionsLimite
    case 0
        for in=1:Nw
            % Y_ij, avec i=>n et j=>s
            Y(in,:)=sin(kn(in)*s); 
        end
    case 1
        for in=1:nmax
             % Y_ij, avec i=>n et j=>s
            Y(in,:)=cos(kn(in).*s)+K/N0*sin(kn(in).*s)./kn(in);    % Y_ij, avec i=>n et j=>s
            % Norme au carré de chaque mode (obtenu via calcul formel) 
            normY2(in,:)=(2*(K^2.*kn(in)*L+K*N0+kn(in)*L*N0^2)-2*K*N0*cos(2*kn(in)*L)+(N0^2-K^2).*sin(2*kn(in)*L))./(4*kn(in)*N0^2);
            end
    end

switch Aff
    case 0   % => Aucun affichage
    case 1   % => visualisation de quelques modes propres
        
        figure(1);
        plot(s,Y([1:3 Nw],:),'LineWidth',2)
        xlabel('s [m]')
        title('Mode Propre')
        legend('n=1','n=2','n=3','n=Nw')
        set(gca,'FontSize',24)
end

