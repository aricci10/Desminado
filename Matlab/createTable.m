function [tableData] = createTable()
%The first scrpt that must be executed from the MATLAB terminal. It creates
%the initial data of the connection matrix, so that the user must only
%change the cells he/she desires. The created table will be sent to the
%"ans" local variable in the actual workspace, which will be then loaded to
%the table in the GUI.
data1 = {0 0 0 0 0 0 0 0 0 0 0 0 };
data2 = {0 0 0 0 0 0 0 0 0 0 0 0 };
data3 = {0 0 0 0 0 0 0 0 0 0 0 0 };
data4 = {0 0 0 0 0 0 0 0 0 0 0 0 };
data5 = {0 0 0 0 0 0 0 0 0 0 0 0 };
data6 = {0 0 0 0 0 0 0 0 0 0 0 0 };
data7 = {0 0 0 0 0 0 0 0 0 0 0 0 };
data8 = {0 0 0 0 0 0 0 0 0 0 0 0 };
data9 = {0 0 0 0 0 0 0 0 0 0 0 0 };
data10= {0 0 0 0 0 0 0 0 0 0 0 0 };
data11= {0 0 0 0 0 0 0 0 0 0 0 0 };
data12= {0 0 0 0 0 0 0 0 0 0 0 0 };
dataF = vertcat(data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12);
tableData = dataF;
end