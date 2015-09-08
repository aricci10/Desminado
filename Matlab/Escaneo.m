function Escaneo(puerto)
    global consola;
    while true
    z = fscanf(puerto,'%d');
    consola = z;
    end
end