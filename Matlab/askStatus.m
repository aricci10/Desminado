function [status] = askStatus()
%This function asks the CNC its current status. Given that the response is
%given in a single string line and each component is needed separately,
%this function returns an array of such elemtns divided in STRING format.
global s; %Import the current port being used.

fprintf(s, '?'); %Ask for curretn status of the CNC.
response = fscanf(s,'%s'); %The current status as a string.
response1= strrep(response,'<',''); %Some aesthetics changes.
response2= strrep(response1,'>','');
data = strsplit(response2,','); %Divide into the array of data.
runStatus = data(1); %Movement completition.
xPos1 = data(2); %X position. Given with extra text, so it must be cleansed.
xPos2 = strrep(xPos1,'WPos:','');
xPos = xPos2; %Final X position.
yPos = data(3); %Y position

status = [runStatus, xPos, yPos]; %The array of running status and positions in string type.
end