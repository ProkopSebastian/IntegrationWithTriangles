function [res] = zmieniona(f, n)
% Projekt 1, zadanie 52
% Sebastian Prokop, 320728
% 
% Obliczanie całki podwójnej za pomocą kwadratury czwartego rzędu na 
% obszarze D = {(x,y) ∈ R^2: |x| + |y| <= 1} przy jego podziale na 4n^2 
% przystających trójkątów.
% Wejście: 
%	f	- uchwyt do funkcji, która będzie całkowana (powinna być napisana 
%         tak, żeby móc obliczać wartości dla wektora argumentów)
%	n	- liczba całkowita, dodatnia. Parametr określający na ile 
%         trójkątów (przystających) zostanie podzielony obszar - będzie 
%         podzielony na 4n^2 trójkątów.
% Wyjście:
% 	res	- wyliczona wartość całki 

P = 2/(4*n^2);
d2 = 1/n;
vA_x = linspace(-1, 0-d2, n);
vA_y = linspace(0, 1-d2, n);
vA_x = vA_x';
vA_y = vA_y';
vB_x = vA_x + d2;
vB_y = vA_y + d2;
vC_x = vA_x + 2*d2;
vD_y = vA_y - d2;
Sum = 0;

for i = 1:n
    partSum = 27*( f((vA_x+vB_x+vB_x)./3, (vA_y+vB_y+vA_y)./3) + ...
        f((vB_x+vC_x+vB_x)./3,(vB_y+vA_y+vA_y)./3) + ...
        f((vC_x+vB_x+vB_x)./3, (vA_y+vD_y+vA_y)./3) + ...
        f(((vA_x+vB_x+vB_x)./3), (vA_y+vD_y+vA_y)./3)) + ...
        6*( f(vA_x, vA_y) + f(vB_x, vB_y) + ...
        f(vC_x, vA_y) + f(vB_x, vD_y) ) + ...
        8*(f((vA_x+vB_x)./2, (vA_y+vB_y)./2) + ...
        f((vB_x+vC_x)./2, (vB_y+vA_y)./2) + ...
        f((vC_x+vB_x)./2, (vA_y+vD_y)./2) + ...
        f((vB_x+vA_x)./2, (vD_y+vA_y)./2) ) + ...
        16*(f((vA_x+vB_x)./2, (vA_y+vA_y)./2) + ...
        f((vB_x+vB_x)./2, (vB_y+vA_y)./2) + ...
        f((vC_x+vB_x)./2, (vA_y+vA_y)./2) + ...
        f((vB_x+vB_x)./2, (vD_y+vA_y)./2)) + 12*f(vB_x, vA_y);
    Sum = Sum + sum(partSum);
    vA_x = vA_x + d2;
    vA_y = vA_y - d2;
    vB_x = vB_x + d2;
    vB_y = vB_y - d2;
    vC_x = vC_x + d2;
    vD_y = vD_y - d2;
end
res = P*Sum/60;