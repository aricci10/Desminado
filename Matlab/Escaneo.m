function[z]=leer(puerto)
    
    fopen(puerto);
    while true
    z = fscanf(puerto,'%d');
end