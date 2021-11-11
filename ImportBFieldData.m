function output = ImportBFieldData(filename, R_max)
%% Initialize variables.
delimiter = ' ';
startRow = 2;
%% Format for each line of text:
formatSpec = '%f%f%f%f%f%f%[^\n\r]';
%% Working on text file
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines' ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
fclose(fileID);
mfd = [dataArray{1:end-1}];
%% Output preparation
output = mfd(mfd(:,1).^2 + mfd(:,2).^2 + mfd(:,3).^2 <= R_max^2, :);
end

