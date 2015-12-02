function updateConsole()
%Function in charge of keeping the console variable size under control by
%erasing the initial content after a certain size limit has been reached.
global console;
actualSize = length(console);
if(actualSize > 10)
    console = console(actualSize - 0.5*actualSize:actualSize);
end
end