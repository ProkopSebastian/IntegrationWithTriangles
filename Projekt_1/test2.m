function test2()
% Projekt 1, zadanie 52
% Sebastian Prokop, 320728
fprintf("Test 2\n");
fprintf("Badana metoda jest czwartego rzędu, dlatego wyniki otrzymane" + ...
    " dla wielomianów stopnia 4 \ni wyższych nie będą dokładne.\n" + ...
    "Wiadomo jednak jakie wartości błędu teoretycznie nie powinny " + ...
    "zostać przekroczone. \nŻeby badać, czy błąd jest niewiększy od " + ...
    "maksymalnego teoretycznego, można podzielić \notrzymany błąd przez " + ...
    "teoretyczny. Jeżeli w wyniku otrzymamy liczbę mniejszą niż 1, \nbędzie " + ...
    "to oznaczać, że dokładność jest dobra.\n")
fprintf("Obliczenia są wykonywane dla n = 100\n")

f = cell(6,1);
f{1} = @(x, y) x.^4;
f{2} = @(x, y) x.^2.*y.^2;
f{3} = @(x, y) x.^5;
f{4} = @(x, y) x.^2.*y.^3;
f{5} = @(x, y) x.^4 + y.^4 + 2.*x.*y + 1;
f{6} = @(x, y) x.^6;

poprawne_wyniki = [2/15;1/45;0;0;34/15;1/14]; % -- tu wpisać wyliczone ręcznie wartości
wynik_funkcji = zeros(6,1);
for i=1:6
    wynik_funkcji(i) = P1Z52_SPR_integrangles(f{i}, 100);
end
MaksBlad = [1e-8; 1e-8; 1e-8; 1e-8; 1e-8; 1e-8];
NazwyKolumn = {'Wzór funkcji', 'Poprwny wynik', 'Wynik programu', 'Błąd','Błąd/MaksBłąd'};
blad = abs(wynik_funkcji - poprawne_wyniki);
VarNames = {'f1';'f2';'f3';'f4';'f5';'f6'};
funkcja = categorical({'x^4'; 'x^2 * y^2'; 'x^5'; 'x^2 * y^3'; 'x^4 + y^4 + 2xy + 1';'x^6'});
ratio = blad ./ MaksBlad;
T = table(funkcja,poprawne_wyniki,wynik_funkcji,blad,ratio, 'RowNames', VarNames, ...
    'VariableNames', NazwyKolumn);
disp(T);

