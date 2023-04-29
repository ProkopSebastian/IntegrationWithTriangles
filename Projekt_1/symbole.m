% calki oznaczone na symbolach
syms x y u v
x = (u+v)/2;
y = (u-v)/2;
% fun = @(x) sin(x)
% integral(fun, 0, 2*pi)
f = @(x) x.^2*y;
I = integral(f, -1, 1)
