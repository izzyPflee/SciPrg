function [Symbols,X,Y] = Ihp_parse_molecule(file_id)
%scans text file for @ATOM token and parses
%line based on format specified by hw 6

%read lines until we get to desired token
temp = fgetl(file_id);
begin_str = '@ATOM';

while(strcmp(temp, begin_str) ~= 1)
    temp = fgetl(file_id);
end
%read formatted lines from file
formatSpec = '%*d %2c %f %f %*f'; 
sizeA = [2 inf];
A = fscanf(file_id, formatSpec, sizeA);

%return values
Symbols = char(A(:,1:2:end));
X = A(1,2:2:end);
Y = A(2,2:2:end);

end
