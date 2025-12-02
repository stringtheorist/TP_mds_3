function [n,kn,wn,Lamb,Per,Freq]=DomaineModal(Nw,L,C,k,K,N0,ConditionsLimite)
% Domaine modal    
n=(1:Nw)';    % Indices modaux

switch ConditionsLimite
    case 0 % Corde Encastrée - Encastrée
        kn=n*pi/L;      % Nombres d'ondes [1/m] : corde fixee aux deux extremites

    case 1 % Corde Ressort - Ressort
        n=(1:10)';
        %% RELATION DE DISPERSION =================================================
        % k=sqrt(ro*A/N0)*w;
        %-> visualisation de la relation de dispersion
        % PAS IMPLEMENTE
        %% EQUATION TRANSCENDENTALE ===============================================
        Ka=k*L;
        dKa=Ka(2)-Ka(1);
        Xi=K*L/N0;
        F=2*Xi*Ka./(Xi^2+Ka.^2).*cos(Ka)+sin(Ka);
        %-> visualisation de la relation de dispersion
        % PAS IMPLEMENTE
        %% RECHERCHE DES RACINES DE L'EQUATION TRANSCENDENTALE ====================
        % On cherche d'abord numériquement une bonne approximation de ces racines
        signF=sign(F);
        diffsignF=diff(signF);
        [iKa]=find(abs(diffsignF)==2)+1;
        nmax=length(iKa);
        %-> visualisation de la relation de dispersion
        % PAS INPLEMENTE

        % On utilise ensuite un algorithme de cherche de zéros de fonctions.  avec 
        % Le domaine de recherche est situé dans un voisinage de l'approximation 
        % trouvée précédement. 
        %-> La fonction quadratique à minimiser
        fctFquad=@(Ka) (2*Xi*Ka./(Xi^2+Ka.^2).*cos(Ka)+sin(Ka)).^2;
        %-> La minimisation
        for n=1:nmax
            Kan(n)=fminbnd(@(KK) fctFquad(KK),Ka(iKa(n))-2*dKa,Ka(iKa(n))+2*dKa);    
        end
        %-> visualisation de la relation de dispersion
        % PAS INPLEMENTE

        kn=Kan'/L;      % Nombres d'ondes [1/m]

end

wn=C*kn;        % Pulsation [rad/s], relation de dispersion
Lamb=2*pi./kn;  % Longueur d'onde de chaque mode [m]
Per=2*pi./wn;   % Periode de chaque mode [s]
Freq=1./Per;    % Frequence de chaque mode [Hz]