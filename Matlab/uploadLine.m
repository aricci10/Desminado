function uploadLine(codeArray)
global s; %Using the desired port.
range = length(codeArray); %Length of gcode array.
for n=1:(range - 1)
    fprintf(s,'?'); %Checking current movement status.
    response = fscanf(s,'%s'); %The feedback from th CNC.
    response1= strrep(response,'<',''); %Some aesthetics changes.
    response2= strrep(response1,'>','');
    data = strsplit(response2,','); %Divide into the array of data.
    status = data(1); %Movement completition.
    comparison = strcmp(status,'Idle'); %Boolean of actual status.
    stop = true; %Checbox condition.
    while(stop == true) %Checking availability.
        if(comparison == true) %Succesful case.
            fprintf(s,codeArray(n)); %Print each gcode linea from file.
            stop = false; %Update availability.
        end
    end
    response = fscanf(s,'%s'); %Inmedeate response from the CNC.
    %The response from the CNC must be checked for any error present. When,
    %and if, sucha error appears, the uploading process will inmediately
    %stop.
    success = 'ok'; %The only successful case.
    comparison2 = strcmp(response,success); %Verifyin success.
    if(comparison2 == false)
        badLinePos = n; %Number of line.
        badLine = codeArray(badLinePos); %The bad line.
        message1= strcat('There is a mistake at line:',' ',badLinePos); %The error message. Part 1.
        message2=strvcat(message1,badLine); %Final message to be displayed.
        errordlg(message2,'Error in Uploaded Trajectory'); %Explaining the error.
        break
    end
        
end
    
            
            
