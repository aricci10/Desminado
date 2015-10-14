function [ comandosfinal ] = parametros(A,h,Sa,Sh,v)

Sx=Sa/A;
Sy=Sh/h;

n=40*Sa+40*Sh+5;

comandos=cell(n,1);

comandos{1}=['G21'];
comandos{2}=['G91'];
comandos{3}=['F' num2str(v)];

%Contador para la lista de comandos
i=4;

%multiplicador
m=1;

while i<=n 
    j=0;
    while j<Sa 
        comandos{i}=['G1X' num2str(m*Sx)];
        i=i+1;
        j=j+1;
    end
    
    comandos{i}=['G1Y' num2str(Sy)];
    i=i+1;
    
%Cambio de direccion
    m=(-1)*m;
end

% se entrega la lista de comandos
comandosfinal=char(comandos);



end

