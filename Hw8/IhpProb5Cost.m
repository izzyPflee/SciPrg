function rms_error =IhpProb5Cost(vec)

a = vec(1);
b = vec(2);

R = cos(linspace(0,(pi/4),128));
I = sin(linspace(0,(pi/4),128));

m_approx = a*R + b*I;
%subtract from unit circle to get magnitude error
m_approx = 1 - m_approx;

%make error positive
m_approx = m_approx .^ 2;

%average of error
m_approx = sum(m_approx)/128;

%approximate error around entire circle by mult by 8
%pi/4 * 8 = 2pi
m_approx = m_approx * 8;

rms_error = m_approx;
end