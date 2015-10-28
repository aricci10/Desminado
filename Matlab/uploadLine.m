function uploadLine(codeArray)
global s; %Using the desired port.
global posMatrix; %Using the global position matrix.
range = length(codeArray); %Length of gcode array.
for n=1:(range - 1)
    fprintf(s,'?'); %Checking current movement status.
    response = fscanf(s,'%s'); %The feedback from th CNC.
    response1= strrep(response,'<',''); %Some aesthetics changes.
    response2= strrep(response1,'>','');
    data = strsplit(response2,','); %Divide into the array of data.
    status = data(1); %Movement completition.
    
    %Parallel to the line uploading, the current position data is also
    %uploaded to the position matrix and position panel of the user
    %interface.
    xPos1 = data(2); %X position. Given with extra text, so it must be cleansed.
    xPos2 = strrep(xPos1,'WPos:','');
    xPos = str2num(xPos2); %Final X position.
    yPos = str2num(data(3)); %Y position
    currentPos = [xPos,yPos]; %Vector of current position. In mm.
    posMatrix = vertcat(posMatrix,currentPos); %Updating position matrix.
    
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
    
            
            
