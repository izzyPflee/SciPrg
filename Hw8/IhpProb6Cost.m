function cost = IhpProb6Cost(p5,p6)
%return sum of distances between specified
%points

p1 = [0,0];
p2 = [1.8,0];
p3 = [1.5,1];
p4 = [0.3,1.6]; 

cost = 0;
%these distances shouldn't change
cost = cost + mydistance(p4,p1);
cost = cost + mydistance(p4,p3);
cost = cost + mydistance(p3,p2);

%distances dependent on guess parameters
cost = cost + mydistance(p1,p5);
cost = cost + mydistance(p4,p5);
cost = cost + mydistance(p5,p6);
cost = cost + mydistance(p3,p6);
cost = cost + mydistance(p2,p6);

end