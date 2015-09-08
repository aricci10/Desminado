function[z]=leer(puerto)
    global consola;
    fopen(puerto);
    while true
    z = fscanf(puerto,'%d');
    end
end