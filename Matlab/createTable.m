function [tableData] = createTable()
%The first scrpt that must be executed from the MATLAB terminal. It creates
%the initial data of the connection matrix, so that the user must only
%change the cells he/she desires. The created table will be sent to the
%"ans" local variable in the actual workspace, which will be then loaded to
%the table in the GUI.
data1 = {false false false false false false false false false false false false };
dataF = vertcat(data1,data1,data1,data1,data1,data1,data1,data1,data1,data1,data1,data1);
tableData = dataF;
end