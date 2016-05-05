function [a,b] = ihpFibRatio(val1,val2)
%returns the ratio a/b that converges within .001
%and whose ratio returns approx golden ratio 1.618

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

end

a = v2;
b = v1;