function test1()
% Projekt 1, zadanie 52
% Sebastian Prokop, 320728
fprintf("Test 1\n");
fprintf("Badana metoda trójkątów jest czwartego rzędu, dlatego dla " + ...
    "wielomianów stopnia \nmniejszego niż 4 jej błąd powinien być zerowy. \n" + ...
    "Poniżej sprwadzane są wielomiany stanowiące bazę kanoniczną " + ...
    "wielomianów dwóch \nzmiennych stopnia mniejszego niż 4. Używane n = 1.\n ")

f = cell(10,1);
f{1} = @(x, y) x + 1 - x;
f{2} = @(x, y) x;
f{3} = @(x, y) x.^2;
f{4} = @(x, y) x.^3;
f{5} = @(x, y) y;
f{6} = @(x, y) y.^2;
f{7} = @(x, y) y.^3;
f{8} = @(x, y) x.*y;
f{9} = @(x, y) x.^2.*y;
f{10} = @(x, y) x.*y.^2;

poprawne_wyniki = [2;0;1/3;0;0;1/3;0;0;0;0]; % -- tu wpisać wyliczone ręcznie wartości
wynik_funkcji = zeros(10,1);
for i=1:10
    wynik_funkcji(i) = P1Z52_SPR_integrangles(f{i}, 1);
end
NazwyKolumn = {'Wzór funkcji', 'Poprawny wynik', 'Wynik funkcji', 'Błąd'};
blad = abs(wynik_funkcji - poprawne_wyniki);
VarNames = {'f1';'f2';'f3';'f4';'f5';'f6';'f7';'f8';'f9';'f10'};
funkcja = categorical({'1';'x';'x^2';'x^3';'y';'y^2';'y^3';'x*y';'x^2*y';'x*y^2';});
T = table(funkcja,poprawne_wyniki,wynik_funkcji,blad, 'RowNames', VarNames, ...
    'VariableNames', NazwyKolumn);
disp(T);