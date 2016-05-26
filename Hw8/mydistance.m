function dist = mydistance(x1, x2)

    temp_dist = (x2(1,1) - x1(1,1)).^2 + (x2(1,2) - x1(1,2)).^2;
    temp_dist = sqrt(temp_dist);
    dist = temp_dist;
end