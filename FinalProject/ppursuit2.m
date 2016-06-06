
function [y,k] = ppursuit2(h, eta, tol, mxi, x)
[m,n] = size(x);

%pre-process data with PCA using SVD

%principal components are in U
[U,S,V] = svd(x,0);
%project data
z = U'*x;

%scale z to unit variance
for i=1:m
    z(i,:)=z(i,:)/std(z(i,:));
end

%duplicate matrix to insert sound vectors for return value
sounds = z;

for mixture = 1:4
    
    %%ppursuit
    %generate 4 random values in range 0 to 2pi
    r = 0 + (2*pi - 0).*rand(4,1);
    n = norm(r);
    %set w to unit-norm vector
    w = r / n;
    
    
    
    k_prev = inf;
    k = eps;
    % maxiter = 400;
    maxiter = mxi;
    
    K = @(x)mean(x.^4);
    %Stop when the increase in K falls below
    %some relative change: abs((Knew - K) / K) > tol
    % or max iter is met
    i = 1;
    
    %use m for gradient vector
    [m,n] = size(z);
    
    while i <= maxiter && abs((k - k_prev)/k) > tol
        %project the data onto the unmixing vector
        %for one dimension
        y = w'*z;
        k_prev = k;
        %estimate kurtosis numerator
        % k = mean(y.^4);
        k = K(y);
        
        %Estimate the gradient vector from the changes in K
        %divided by the change in w (which is h)
        
        %put changes in K in a gradient vector(g)
        g = zeros(m,1);
        
        for i = 1:m
            h_vec = zeros(m,1);
            h_vec(i,1) = h;
            g(i,1) = (K((w + h_vec)'*z) - k)/h;
            
        end
        
        %take a step in the direction of g
        w = w + eta*g;
        %set w to unit norm
        w = w/norm(w);
        
        i = i + 1;
    end
    %end ppursuit
    z = z - w*y;
    %play sounds for testing
    sounds(mixture,:) = y;
%     soundsc(y);
%     pause(3);
    
end %end mixture loop

%return unmixed sounds
y = sounds;

end%end function