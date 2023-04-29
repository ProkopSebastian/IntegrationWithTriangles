function test4()
% Projekt 1, zadanie 52
% Sebastian Prokop, 320728
fprintf("Test 4 - sprawdzanie dokładności przybliżenia dla funkcji " + ...
    "innych niż \nwielomianowe dla różnych wartości parametru 'n'.\n\n")
f1 = @(x, y) cos(2*x);
f2 = @(x, y) sin(2*x);
f3 = @(x, y) exp(x);
f4 = @(x, y) cos(pi*x/2);
i = 1;
fun0=[
P1Z52_SPR_integrangles(f1, i);
P1Z52_SPR_integrangles(f2, i);
P1Z52_SPR_integrangles(f3, i);
P1Z52_SPR_integrangles(f4, i);];
i = 10;
fun1=[
P1Z52_SPR_integrangles(f1, i);
P1Z52_SPR_integrangles(f2, i);
P1Z52_SPR_integrangles(f3, i);
P1Z52_SPR_integrangles(f4, i);];
i=314;
fun2=[
P1Z52_SPR_integrangles(f1, i);
P1Z52_SPR_integrangles(f2, i);
P1Z52_SPR_integrangles(f3, i);
P1Z52_SPR_integrangles(f4, i);];
i=1000;
fun3=[
P1Z52_SPR_integrangles(f1, i);
P1Z52_SPR_integrangles(f2, i);
P1Z52_SPR_integrangles(f3, i);
P1Z52_SPR_integrangles(f4, i);];
popr = [2*sin(1)*sin(1); 0; 2*(exp(1)-1)^2/exp(1); 16/pi^2];
err0 = abs(fun0-popr);
err1 = abs(fun1-popr);
err2 = abs(fun2-popr);
err3 = abs(fun3-popr);


Tgen = {'Przybliżenie'; 'Poprawny'; 'Błąd'};
T1_names = {'cos(2x)'; 'sin(2x)'; 'exp(x)'; 'cos(pi/2x)' };
T0 = table(fun0, popr, err0,RowNames=T1_names, VariableNames=Tgen);
T1 = table(fun1, popr, err1,RowNames=T1_names, VariableNames=Tgen);
T2 = table(fun2, popr, err2,RowNames=T1_names, VariableNames=Tgen);
T3 = table(fun3, popr, err3,RowNames=T1_names, VariableNames=Tgen);

fprintf("n = 1\n");
disp(T0);
fprintf("Wciśnij dowolny klawisz żeby wyświetlić wartości dla innego 'n'\n\n");
pause();
fprintf("n = 10\n");
disp(T1);
fprintf("Wciśnij dowolny klawisz żeby wyświetlić wartości dla innego 'n'\n\n");
pause();
fprintf("n = 314\n");
disp(T2);
fprintf("Wciśnij dowolny klawisz żeby wyświetlić wartości dla innego 'n'\n\n");
pause();
fprintf("n = 1000\n");
disp(T3);
