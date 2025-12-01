function Son(u, t)
    dt=t(2)-t(1);
    fs = 1/dt;
    
    sound(u(30,:), fs);
    
    audiowrite('sound.wav',u(30,:),fs);
    
    clear y fs


end 