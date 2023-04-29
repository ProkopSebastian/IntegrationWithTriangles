function test3()
% Projekt 1, zadanie 52
% Sebastian Prokop, 320728
fprintf("Zależności dokładności od n.\n")
fprintf("Test sprawdza jak zmienia się błąd przybliżenia w zależności " + ...
    "od parametru n \n(ilości trójkątów na które jest dzielony obszar).\n")
fprintf("Druga kolumna zawiera wynik działania funkcji. Maks. błąd - " + ...
    "teoretyczna \nnajwiększa wartość błędu przybliżenia (jest zależna od n).\n")
fprintf("Wartość w kolumnie Błąd powinna być mniejsza niż w kolumnie Maks. błąd\n")
fprintf("Liczenie potrzebnych wartości... Może potrwać do 10 sekund... ")

lf = 4;
f = cell(lf,1);
f{1} = @(x, y) x.^4;
f{2} = @(x, y) x.^2.*y.^2;
f{3} = @(x, y) x.^4 + y.^4 + 2.*x.*y + 1;
f{4} = @(x, y) x.^6;

poprawne_wyniki = [2/15;1/45;34/15;1/14];
eny = [1; 10; 100; 1000];
li = length(eny); %liczba enów
wynik_funkcji = zeros(lf,li);
for j = 1:lf
    for i=1:li
        wynik_funkcji(i,j) = P1Z52_SPR_integrangles(f{j}, eny(i));
    end
end

Err = abs(wynik_funkcji - poprawne_wyniki');
Merr = zeros(li,1);
for i = 1:li
    Merr(i) = (eny(i))^-4;
end

T1_names = {'n'; 'x^4'; 'Błąd'; 'Maks. błąd' };
T1 = table(eny, wynik_funkcji(:,1), Err(:,1), Merr, VariableNames=T1_names);
T2_names = {'n'; 'x^2 * y^2'; 'Błąd'; 'Maks. błąd' };
T2 = table(eny, wynik_funkcji(:,2), Err(:,2), Merr, VariableNames=T2_names);
T3_names = {'n'; 'x^4 + y^4 + 2xy + 1'; 'Błąd'; 'Maks. błąd' };
T3 = table(eny, wynik_funkcji(:,3), Err(:,3), Merr, VariableNames=T3_names);
T4_names = {'n'; 'x^6'; 'Błąd'; 'Maks. błąd' };
T4 = table(eny, wynik_funkcji(:,4), Err(:,4), Merr, VariableNames=T4_names);

fprintf("Zrobione.\n")
disp(T1);
fprintf("(%d/%d) Wciśnij dowolny klawisz żeby wyświetlić kolejną funkcję\n\n", 1, lf);
pause();

disp(T2);
fprintf("(%d/%d) Wciśnij dowolny klawisz żeby wyświetlić kolejną funkcję\n\n", 2, lf);
pause();

disp(T3);
fprintf("(%d/%d) Wciśnij dowolny klawisz żeby wyświetlić kolejną funkcję\n\n", 3, lf);
pause();

disp(T4); 
%fprintf("(%d/%d) Wciśnij dowolny klawisz żeby wyświetlić kolejną funkcję\n", 4, lf);
%pause();




