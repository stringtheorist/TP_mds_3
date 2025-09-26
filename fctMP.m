function[Y]=fctMP(nmax)
for in=1:nmax
    % Y_ij, avec i=>n et j=>s
    Y(in,:)=sin(kn(in)*s); 
end
end