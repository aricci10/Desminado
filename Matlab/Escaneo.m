<<<<<<< HEAD
function[z]=leer(puerto)
    global consola;
    fopen(puerto);
    while true
    z = fscanf(puerto,'%d');
=======
function Escaneo(puerto)
    global consola;
    while true
    z = fscanf(puerto,'%d');
    consola = z;
>>>>>>> origin/master
    end
end