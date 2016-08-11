i = 1;
for  i = 1:5
    temp = inputdlg('Enter space-separated coordinates:');
    c{i} = str2num(temp{:});
end

