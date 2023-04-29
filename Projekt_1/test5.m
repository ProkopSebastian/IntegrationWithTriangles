function test5()
% Projekt 1, zadanie 52
% Sebastian Prokop, 320728
fprintf("Test szybkości działania w zależności od złożoności \n" + ...
    "testowanej funkcji, oraz od parametru wywołania n.\n")
fprintf("Wyliczanie wyników... Może zająć do 45 sekund...\n")
%f1 = @(x, y) x - x + 1;
f1 = @(x, y) ones(1,length(x));
f2 = @(x, y) x.*y;
f3 = @(x, y) x.^4 + y.^4 + 2.*x.*y + 1;


n1=5;
tic; P1Z52_SPR_integrangles(f1, n1); t1 = toc;
tic; P1Z52_SPR_integrangles(f2, n1); t2 = toc;
tic; P1Z52_SPR_integrangles(f3, n1); t3 = toc;
T1 = [t1;t2;t3];
n1=50;
tic; P1Z52_SPR_integrangles(f1, n1); t1 = toc;
tic; P1Z52_SPR_integrangles(f2, n1); t2 = toc;
tic; P1Z52_SPR_integrangles(f3, n1); t3 = toc;
T2 = [t1;t2;t3];
n1=500;
tic; P1Z52_SPR_integrangles(f1, n1); t1 = toc;
tic; P1Z52_SPR_integrangles(f2, n1); t2 = toc;
tic; P1Z52_SPR_integrangles(f3, n1); t3 = toc;
T3 = [t1;t2;t3];
n1=5000;
tic; P1Z52_SPR_integrangles(f1, n1); t1 = toc;
tic; P1Z52_SPR_integrangles(f2, n1); t2 = toc;
tic; P1Z52_SPR_integrangles(f3, n1); t3 = toc;
T4 = [t1;t2;t3];

fprintf("Kolumny odpowiadają kolejnym wartościom parametru n.\n" + ...
    "Wartości w tabeli to czas trwania obliczeń w sekundach.\n" + ...
    "Po lewej wymienione są wzory funkcji, których dotyczą obliczenia.\n")
Tgen = {'1'; 'xy'; 'x^4 + y^4 + 2xy + 1'};
T1_names = {'5'; '50'; '500'; '5000' };
T = table(T1,T2,T3,T4,RowNames=Tgen, VariableNames=T1_names);
disp(T);



