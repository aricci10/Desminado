function saveUserSettings(hObject,handles)
%Function designed to allow the user to save the introduced settings as
%NAME, DATE and DESCRIPTION.
global globalUserInfo;
userSettings = globalUserInfo;
uisave('userSettings');
end