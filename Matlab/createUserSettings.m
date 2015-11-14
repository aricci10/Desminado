function createUserSettings(hObject,handles)
%Function in charge of allowing the user to create his/her measurement
%settings of NAME, DATE and DESCRIPTION.
global globalUserInfo;
info = inputdlg({'Name','Date','Description'},'User Settings');
globalUserInfo = {info{1} info{2} info{3}};
h = findobj('Tag','userName');
set(h,'String',info{1});
end