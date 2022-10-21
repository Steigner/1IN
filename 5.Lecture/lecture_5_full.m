%% ROZCVICKA
% ! Do prazdnych poli doplnte kod !

% Uzivatel zada cele cislo 0<N<11.
clc; 
clear;

while 1
    N=input('zadej cislo N: ');
    % Pokud uzivatel zada N v jinem rozsahu, nebo se 
    % nebude jednat o cele cislo, bude vyzvan k novemu 
    % zadani.
    if N > 0 && N < 11 && N == round(N)
        break
    end
end

% Pote se vygeneruje pole F tak, ze kazdy prvek svym 
% indexem n (poradovym cislem v poli) 
% pro n=1,2,...,N, bude odpovidat hodnote n!
% (pozn.: tj. F=[1! ... N!], 0! zde neuvazujeme)

% fakt je název pro pole F ze zadání

fakt(1) = 1; 
for n=1:N
    fakt(n+1) = fakt(n) * n;
end

% Program zobrazi pole F.

fakt

% Program vykresli hodnoty pole F do x-y grafu, 
% pricemz hodnoty prvku (osa y) pole F budou 
% zobrazeny jako kolecka, osa x bude predstavovat 
% hodnoty n.

figure(1)
hold on

for n=1:N
    plot(n,fakt(n),'bo')
end

% Program vykresli hodnoty pole F do x-y grafu, 
% pricemz hodnoty prvku pole F budou zobrazeny 
% jako kolecka pokud F(n)<121, jinak vykresli hodnoty 
% jako diamanty.

figure(2)
hold on

for n=1:N 
    if fakt(n) < 121
        plot(n, fakt(n), 'bo')
    else
        plot(n, fakt(n), 'bd')
    end
end

% Program vykresli hodnoty pole F do x-y grafu, 
% pricemz hodnoty prvku pole F budou zobrazeny 
% jako kolecka pro n liche a jako hvezdicky pro n sude.

figure(3)
hold on

for n=1:N
    if n/2 ~= round(n/2)
        plot(n, fakt(n), 'go')
    else 
        plot(n, fakt(n), 'g*')
    end
end

%  Program vykresli hodnoty pole F do grafu dle 
% predchoziho bodu, pricemz hodnoty osy y budou 
% prepocteny do logaritmickych souradnic.

figure(4)
hold on

x=1:2:N-1;
for n=x
    plot(n,log(fakt(n)),'ko')
    plot(n+1,log(fakt(n+1)),'k*')
end

%% PLOT

% !! Vypnout mrizu grid off 

x = (0:pi/20:2*pi);
y1 = sin(x);
y2 = cos(x);

plot(x,y1,'b--',x,y2,'r--');
grid on
legend('sin(x)','cos(x)');
xlabel('x');
ylabel('y');

%% Semilogy
% Vykresli souradnice x a y pomoci linearni stupnice na ose x a logaritmicke 
% stupnice o zakladu 10 na ose y.

figure(1)
plot(1:20,exp(1:20));

figure(2)
semilogy(1:20,exp(1:20));

%% Polar
% vykresli primku v polarnich souradnicich, pricemz theta(prvni vstupni parametr) 
% udava uhel v radianech a rho(druhy vstupni parametr) udava hodnotu polomeru 
% pro kazdy bod.

% t = (0:0.1:pi);
t = (0:pi/20:10*pi);
n = length(t);
% R = ones(1,n);
R = 0:1/n:1-1/n;

polar(t,R,'bo')

%% Bar
% Vytvori sloupcovy graf s jednim sloupcem pro kazdy prvek y

% bar([1 2 3])
bar([1 2; 2 3; 3 4])

%% Pie
% Vykresli kolacovy graf s pouzitim dat ve vstupnim vektoru x.

explode = [0 1 0 1 0 1];
pie([1 2 3 4 5 6],explode);

%% Hist
% Vypocita a zobrazi histogram datové rady.

x = rand(1,10000);
hist(x)

%% Sroubovice - Plot3D, subplot

clear;
clc;

t = linspace(0,10*pi,1e3);
r = 2;
b = 1/(2 * pi);
z = b * t;
x = r * cos(t);
y = r * sin(t);

figure(1)
title('Sroubovice')
% Subplot pracuje s figure, kde prvni parametr urcuje pocet radku, a druhy
% parametr urcuje pocet sloupcu v danem okne. Treti parametr jiz urcuje o
% kolikaty graf v posloupnosti se jedna. Bacha, je potreba definovat tolik
% subplot oken kolik budete chtit vykreslit grafu. tedy nemuze byt:
% subplot(1,2,1), subplot(1,2,2), subplot(1,2,3) >> Error

subplot(1,2,1)
plot3(x,y,z)
grid on

subplot(1,2,2)
plot3(x.*z,y.*z,z)
grid on

%% ! Meshgrid !

% Doplneni z hodiny
% Vraci souradnice 2-D mrizky na zaklade souradnic obsazenych ve vektorech 
% x a y.
% Vystupni hodnoty z meshgrid [X,Y] kde X je matice, kdy kazdy radek je kopii
% vstupniho vektoru x, a Y je matice, kde kazdy sloupec je kopii vektoru y. Mrizka 
% reprezentovana souradnicemi X a Y ma radky length(y) a sloupce length(x).
[X,Y] = meshgrid(1:5,5:10)
% vystupem tedy je matice X ktery ma 1 az 5 ve sloupci a ma 6 radku
% vystupem tedy je matice Y ktery ma 5 az 10 v radich a ma 6 sloupcu

%% Sombrero mesh, surf

dx = linspace(-8,8,50);
dy = dx;
[x,y] = meshgrid(dx,dy);

r = sqrt(x.^2 + y.^2);
z = sin(r)./r;

figure(1)
subplot(1,2,1)
% Vytvori sitovou plochu, coz je trojrozmerny povrch, ktery ma plne barvy okraju 
% a zadne barvy ploch.
mesh(x,y,z)

subplot(1,2,2)
% Vytvori trojrozmerny povrch, ktery ma plne barvy okraju 
% a plne barvy ploch.
surf(x,y,z)


