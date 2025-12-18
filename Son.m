function Son(u, t)
    dt=t(2)-t(1);
    fs = round(1/dt);
    
    % sound(u(30,:), fs);

    % Normaliser le déplacement dans l'intervalle [-1, 1]
    sound_data = u(100,:) / max(abs(u(100,:)));  
    tab=[];
    for i=1:500
        tab=[tab sound_data];
    end

    % Lire le son
    sound(tab, fs);

    % Enregistrer dans un fichier
    audiowrite('sound.wav', tab, fs);
    clear tab fs;

end