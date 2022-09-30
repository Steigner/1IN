%% Artim. operatory

% aritmetické operace vracejí numerickou hodnotu
% smaz command window
clc;

% uvolni pamet ve workspace
clear;

a = 5;
b = 3;

% prirazeni do nedefinovane promene bez potlaceni vystupu
% a + b

% prirazeni do nedefinovane promene s potlacenim vystupu
% a - b;

% prikaz pro umocneni
% a ^ 0.5

% volani funkce sqrt() pro odmocneni na druhou 
sqrt(a)

% a * b
%
% Matrix left division
% a \ b
% 
% Matrix right division
% a / b
% 
% Matrix left = Matrix right division
% a \ b
% b / a

%% Logicke operatory

% logicka 0 = kdyz neplati
% logicka 1 = kdyz plati

% a == b
% a > b

% nerovna se a, b?
% a ~= b

% vygeneruj vektor od 1 do 6
p = 1:6
% jake prvky jsou vetsi jak 3?
% p > 3

% jaky prvek se rovna 5?
% p == 5 

%% Funkce linspace

% v1 = 1:5;
% linspace
v1 = linspace(0,4,5);
v2 = linspace(4,0,5);

% podle dokumentace defaultne vygeneruje 100 prvku
% y = linspace(0,4)

%% Matice

% vytvoreni matice 3x3
M = [1, 2, 3 ; 4, 5, 6; 7, 8, 9];

% pristup k prvkum z matice M
a11 = M(1,1);
a23 = M(2,3);

% pristup k radkum / sloupcum
r3 = M(3,:);
s2 = M(:,2);

% rozmezi
s23 = M(:, 2:3);

% vybirame dane sloupce 
s13 = M(:, [1,3]);

% matice vygenerovana pomoci generovani vektoru
M1 = [1:4;5:8]; 
M2 = [linspace(1,4,4); linspace(5,8,4)];

% vymazani sloupce 1
% M1(:,1) = [];

% prepsani prvku v prvnim sloupci matice na 0 
M1(:,1) = 0;

M_big = [M1;M1;M1];

% vypis do command window matici M
M

% nejpreve odecti prvky matice M - 5 a pak vytvor
% matici s puvodni matici M rozsirenou o nove modifikovanou
% matici M-5 ve sloupcich
% pridat jako radky: M = [M; M-5]
M = [M M-5]

% 5 - minutovy ukol
M = [1,2,3;4,5,6;7,8,9];
% Ukol: Rozsirte matici M o matici M ve sloupcich a vymazte prvni 3
% sloupce.
% Reseni:
M = [M M];
M(:,1:3) = [];

%% Funkce zeros, ones, eye ...

% funkce pro generovani matice 0
% Z = zeros(3);
% Z = zeros(5);
Z = zeros(4,5);

% funkce pro generovani matice 1
% stejny pristup jako u zeros
O = ones(3);

% funkce pro generovani jednotkove matice
% stejny pristup jako u zeros 
E = eye(3);

% funkce pro generovani jednotkove matice
% stejny pristup jako u zeros 
% round(R) = zaokrouhleni
R = rand(2,5);

% existuje i funkce pro vytvoreni matice diag
v = [1,2,3];
D = diag(v);

%% Priklad Numero 1

clc;
clear;

% amplituda
A1 = 1;
% frekvence
f1 = 1;
% pocatecni faze
phi1 = 0;

A2 = 2;
f2 = 2;
phi2 = -pi/2;

% s vyhodou pouziji funkci s 2 vstupnimi parametry, jelikoz defaultne
% generuje 100 prvku
t = linspace(0,1);

% ! pozor na t !
y1 = A1 * sin(2 * pi * f1 * t + phi1);
y2 = A2 * cos(2 * pi * f2 * t + phi2);

% alternativa = plot(t, y1, t, y2);
plot(t, [y1; y2]);

% mrizka on
grid on;

% nadpis 
title('gon. fce');

% popis x-ove osy
xlabel('t[s]');

% popis y-ove osy
ylabel('sin(t),cos(t)');


%% P. Numero 2

clc;
clear;

% delka ramen
L1 = 1;
L2 = 0.8;

% ! POZOR !
% Prevod na radiany = pi / 180 neboli take lze pouzit 2 * pi / 360
alfa1 = (0:180) * pi / 180;
alfa2 = (-90:90) * pi / 180;

% Pro vypocet dopredne kinematiky pouzivame zakladni trigonometrii
% trajektorie spojovaciho kloubu joint1
x1 = L1 * cos(alfa1);
y1 = L1 * sin(alfa1);
plot(x1,y1);
grid on;

% podrzime prvni graf, jelikoz chceme pridat jeste trajektorii
% end-effectoru
hold on;

x2 = L1 * cos(alfa1) + L2 * cos(alfa1 + alfa2);
y2 = L1 * sin(alfa1) + L2 * sin(alfa1 + alfa2);

% trajektorie end-effectoru
plot(x2,y2);