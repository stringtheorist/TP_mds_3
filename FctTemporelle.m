function T=FctTemporelle(Nw,wn,an,bn,t,Aff)

for in=1:Nw
    % T_ij, avec i=>n et j=>t
    T(in,:)=an(in)*cos(wn(in)*t)+bn(in)*sin(wn(in)*t)/wn(in); 
end

switch Aff
    case 0 % => Aucun affichage
    case 1 % => visualisation de T(t) pour quelques modes
        figure(3);
        plot(t,T([1:3 Nw],:),'LineWidth',2)
        xlabel('t [s]')
        legend('n=1','n=2','n=3','n=Nw')
        set(gca,'FontSize',24)
end
