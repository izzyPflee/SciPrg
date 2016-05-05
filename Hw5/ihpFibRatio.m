function [a,b] = ihpFibRatio(val1,val2)
%returns the ratio b/a that converges within .001

v1 = val1;
v2 = val2;
prev_ratio = 0;
%init to a large value to enter while loop
cur_ratio  = v2/v1;
%test ratio of v1 and v2
while abs(cur_ratio - prev_ratio) > .001

%increment number
temp_v2 = v2+v1;
%assign new values
v1 = v2;
v2 = temp_v2;
prev_ratio = cur_ratio;

cur_ratio = v2/v1;

disp(cur_ratio - prev_ratio);

end

a = v2;
b = v1;