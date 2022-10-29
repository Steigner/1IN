% Zadany polynom: 
% 2x^3 + 4x^2 + -6x + 0
% 

%% polynom "rucne"

clear;
clc;

p = [2, 4, -6, 0];

% x = 20;
% p(1)*x^3 + p(2)*x^2 + p(3)*x + p(4)

% x = [0,2,20];
x = (-3:0.1:3);
y = p(1)*x.^3 + p(2)*x.^2 + p(3)*x + p(4);

plot(x,y)

%% polyval

clear;
clc;

p = [2, 4, -6, 0];

% polyval(p,2)
% polyval(p,[0,2,20])
x = (-3:0.1:3);
y = polyval(p,x);

plot(x,y)

%% polyder, polyint

p = [2, 4, -6, 0];

% derivace polynomu
dp = polyder(p);

% integrace polynomu
ip = polyint(dp);

%% roots, poly
% poly - Polynomial with specified roots or characteristic polynomial

p = [2, 4, -6, 0];
R = roots(p);
P = poly(R);

% abychom meli vysledek stejny jako zadani, jelikoz se zadani dalo upravit
P = P * 2

x = linspace(-3,3);
y = polyval(p,x);

plot(x, y, R, [0;0;0], 'rx');
grid on;
legend('p(x)','roots');
xlabel('x');
ylabel('y');

%% Priklad na aproximaci dat polynomem
clear;
clc;

% vymazani grafu z figure! - clear figure
clf;

% simulace dat ziskanych merenim
x_min = -2;
x_max = 2;
n = 25;
x = linspace(x_min, x_max,n);
xf = linspace(x_min, x_max);
P_sim = [1, -1, 0];
y = polyval(P_sim,x) + rand(1,n);
plot(x, y, 'bo');
grid on

% aproximace dat polynomem druheho stupne
P = polyfit(x, y, 2);
yf = polyval(P, xf);
hold on;
plot(xf, yf, 'k')

% vypocet chyby aproximace
ya = polyval(P, x);
sse = sum((y-ya).^2);
disp('Chyba ' + string(sse));

% nalezeni extremu polynomu P
dP = polyder(P);
dy = polyval(dP, xf);
R = roots(dP);
plot(xf, dy, 'o')

% nalezeni extremu polynomu P
[hodnota, prvek] = min(yf);
plot(xf(prvek), hodnota,'g*')
xlabel('x')
ylabel('y')
legend('data', 'p', 'dP', 'extrem')
title('aproximace dat')
