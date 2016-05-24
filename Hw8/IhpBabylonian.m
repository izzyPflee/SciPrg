function root = IhpBabylonian(n)
%return the sqrt root the parameter x, using the Babylonian method

%tolerance specified by HW8
tol = 0.0001;

%set initial guess
x_prev = 0;
x_next = 2;
while(abs(x_next - x_prev) > tol)
   
    x_prev = x_next;
    x_next = 0.5*(x_prev + n/x_prev);
end

root = x_next;
end