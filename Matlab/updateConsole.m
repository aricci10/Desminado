function updateConsole()
%Function in charge of keeping the console variable size under control by
%erasing the initial content after a certain size limit has been reached.
global prueba;
actualSize = length(prueba);
if(actualSize > 10)
    prueba = prueba(actualSize - 10:actualSize);
end
end