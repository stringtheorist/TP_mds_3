function Son(u, t)
    dt=t(2)-t(1);
    fs = 1/dt;

    % sound(u(30,:), fs);

    % Normaliser le déplacement dans l'intervalle [-1, 1]
    sound_data = u(30,:) / max(abs(u(30,:)));  

    % Lire le son
    sound(sound_data, fs);

    % Enregistrer dans un fichier
    audiowrite('sound.wav', sound_data, fs);
    clear sound_data fs;

end