function uploadLine(codeArray)
%Function in charge of uploading succesive lines from a Gcode text file.
global s; %Using the desired port.
global posMatrix; %Using the global position matrix.
global delayTimeValue;
range = length(codeArray); %Length of gcode array.
for n=1:(range - 1)
    while(stop == true) %Checking availability.
        theData = askStatus(); %The STRING array of the current status.
        xPosition = str2num(theData(2));
        yPosition = str2num(theData(3));
        currentPos = [xPosition,yPosition]; %Vector of current position. In mm.
        posMatrix = vertcat(posMatrix,currentPos); %Updating position matrix.
    
        comparison = strcmp(theData(1),'Idle'); %Boolean of actual status.
        stop = true; %Checkbox condition.
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
    pause(delayTimeValue); %Waiting time/Delay in seconds.
end
end
        
    
            
            
