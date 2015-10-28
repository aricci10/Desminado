function uploadLine(codeArray)
global s; %Using the desired port.
range = length(codeArray); %Length of gcode array.
stop = false; %Checkbox for uploading the next line.
for n=1:(range - 1)
    fprintf(s,codeArray(n)); %Print each gcode line.
    while(stop == false)
        fprintf(s,'?'); %Checking current movement status.
        response = fscanf(s,'%s'); %The feedback from th CNC.
        response1= strrep(response,'<',''); %Some aesthetics changes.
        response2= strrep(response1,'>','');
        data = strsplit(response2,','); %Divide into the array of data.
        status = data(1); %Movement completition.
        comparison = strcmp(status,'Idle'); %Boolean of actual status.
        if(comparison == true
