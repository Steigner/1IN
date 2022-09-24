%% - vytvoreni sekce(lze spoustet v Editor -> Run Section
%
% ! UPOZORNENI !
% Pri pouzivani sekci (%%) si davejte pozor na prepisovani promenych ve
% workspace !
% 
% Ve cviceni sem se o tom nezminil. V ramci prvniho cviceni jsme meli 
% velmi jednoduche priklady tudiz nebylo potreba resit promene ve workspace
% avsak pri slozitejsich programech si musite dat pozor aby jste si
% neprepisovali jiz drive deklarovane promene. V ramci prilozeneho scriptu,
% jsem pro demonstraci dopsal do sekci prikazy clear a clc, aby bylo jasne,
% ze kazda seke reprezentuje jednu ulohu.

% vymazani command window
clc;

% uvolneni pameti ve workspace
clear;

% vypis do command window ahoj
disp('ahoj');

% ; - potlaceni vystupu v commmand window

% vytvoreni promenne ktera je konstanta
a = 10.0;

%% Pocvicenicko

clc;
clear;

% generovani vektoru od 1 do 10 s krokem 1 a
% zapsani do promenne 'a'
a = 1:10;

% obdobne generujeme s krokem 0.5
b = 1:0.5:10;

% ^ = ctrl + alt + 3
% x1 = (1:10).^1.5;
x1 = (1:10).^2;

% odmocnina na 2 = sqrt()
x2 = sqrt((1:10));

% command window >> x1 - x2
t = x1 - x2;

% b - a >> error
% vektor 10 vs 19

%% P. Numero 1

clc;
clear;

% vyska a
a = 10;

% vyska c
c = 5;

% hmotnost m
m = 1;

% tihove zrychleni
g = 9.81;

% vysledek mechanicka prace
W = m * g * (a + c); 

% vektor vysek a
a = [0, 5, 10];

% vysledek vektor mechanickych praci
W = m * g * (a + c);

% [] = ctrl + alt + f

%% P. Numero 2
% zvolena funkce bude sinus

clc;
clear;

x = 0:7;

% volani funkce sin() se vstupem x
y = sin(x);

% zjisteni velikosti vektoru
% whos y
% whos x

% plot funkce - vykresleni 2D grafu
% prvni vstup x-ova osa, druhy vstup y-ova osa
% treti vstup barva, lze pouzivat zkratky, ci 
% vypsat primo jako parametr napr. 'Color', 'red'
% jak je pouzito dale v kodu
plot(x,y,'r');

% popis x-ove osy
xlabel("x-ova osa");

% popis y-ove osy
ylabel("y-ova osa");

% generuj vektor od 0 do 2PI s krokem PI/100
X = 0:pi/100:2*pi;
Y = sin(X);

plot(X,Y,'b');

% pridani mrizky do grafu
grid on

%% P. Numero 3

clc;
clear;

% casovy vektor
t = 0:0.01:0.5;
% perioda
T = 0.4;
% frekvence
f = 1/T;
% amplituda
A = 5;
% uhel natoceni
fi = pi/2;

y_harm = A * sin(2 * pi * f * t + fi);
plot(t, y_harm, 'Color', 'red');
grid on;

% nadpis grafu
title('graf harmonickeho kmitu');
% popis x-ove osy
xlabel('time');
% popis y-ove osy
ylabel('amplitude');

%% P. Numero 4 - Domaci Procvicovani

clc;
clear;

% generovani vektoru od -1 do 1 s krokem 0.1
x = -1:0.1:1;

% prikaz x' = provede prehozeni z radku do sloupce: 1x21 -> 21x1
% Bud se provede invertovani sloupce za radek
% u vektoru x nebo pak u vykreslovani vektoru 
% vysupnich funkci y u prikazu plot. Pokud
% nepovedete ani jedno >> Error using plot Vectors must be the same length.
% 
% Jak by to vypadalo?
% % x = x'; - zakomentete tento radek
% plot(x, [y1' y2' y3']); - prepiste tento

x = x';

% zadane exponencialni funkce
y1 = exp(x);
y2 = exp(2 * x);
y3 = exp(x / 2);

% zobrazeni grafu, agregovaná osa y
plot(x, [y1 y2 y3]);

% zobrazeni mrizky
grid on;

% nadpis grafu
title('Exponencialni funkce');

% popis os
xlabel('x');
ylabel('f(x)');
