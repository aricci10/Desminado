function saveAntennaSettings()
%Function designed to allow the saving of the antenna array general
%configuration for the user to access later.
global antennaPosMatrix;
global radiationCenterValue;
global arrayOrientation;

data1 = antennaPosMatrix;
data2 = radiationCenterValue;
data3 = arrayOrientation;
uisave({'data1','data2','data3'},'antennaConfiguration.mat');
end