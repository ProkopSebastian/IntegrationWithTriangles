function [f] = dwuzmienna(vect)
x = vect(:,1);
y = vect(:,2);
f = x.^4 + y.^4 - 4.*x.*y + 1;
% f = abs(x) + abs(y);
% x(:,1) = 1;
% y(:,1) = 1;
% f = x.*y;
%f = x.^4 + y.^4 + 1;
% e = 2.71;
% f = e.^(x + y);
%f = x .* y.^2;
%f = x.* y.^2;
