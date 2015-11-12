function connectionTableFigure()
%Basic construction of the emergent figure that allows the user to input
%the connection matrix for the antenna array.
global t;
screenSize = get(groot,'ScreenSize');   %Setting the screen size of the current computer.
dims = [1 screenSize(4) screenSize(3)/1.8 screenSize(4)/3.5];
editableTable = [true true true true true true true true true true true true];
f = figure('Name','Connection Matrix','NumberTitle','off','Position',dims,...
    'ToolBar','none','MenuBar','none');%Basic figure parameters. 
data = createTable();
t = uitable(f,'Data',data,'ColumnEditable',editableTable,'Position',[45 35 40 40]);
t.Position(3) = t.Extent(3);
t.Position(4) = t.Extent(4);

%Defining the button that allows the user to save the current connection
%matrix stored in the table. This includes the callback function of saving
%with UISAVE.
function saveMatrix(hObject, handles)
    connectionMatrix1 = t.Data;                                            %Getting the user input.  
    connectionMatrix = cell2mat(connectionMatrix1);
    uisave('connectionMatrix');                                            %Saving the user input.
end

%Building the PUSH button.
btn = uicontrol('Style', 'pushbutton', 'String', 'Save',...
    'Position', [45 5 50 20],...
    'Callback', @saveMatrix,...
    'BackgroundColor','Green'); 
end