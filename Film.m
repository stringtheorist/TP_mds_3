function Film(u,s,L,H,name)
figure(6);               


v = VideoWriter(name);   
open(v) ;                        

Nt = size(u,2);

for j = 1:Nt
    
    plot(s, u(:,j), 'k');
    axis([0 L -H H]); axis equal;
    xlabel('s [m]');
    ylabel('u(s,t) [m]');
    title('déplacement de la corde')
    drawnow;                  
    
    frame = getframe(gcf);     
    writeVideo(v, frame);
end


close(v);

end