%% if elseif else, input
clear;
clc;

% funkce input() - vstupni parametr string se zpravou pro uzivatele
% resi se v command window
% Zruseni programu -> Command Window -> CTRL + C
x = input('Zadejte x: ');
y = input('Zadejte y: ');

if(x > y)
    disp('x je vetsi jak y');
elseif(x < y)
    disp('x je mensi jak y')
else
    disp('x se rovna y')
end

%% switch case, menu
clear;
clc;

% funkce menu() - vstupni parametr string se zpravou pro uzivatele, a
% option 1 ... option N
volba = menu('Jakou chcete vybrat funkci?','sin(x)','cos(x)');

% vektor 1 po kroku 0.01 do pi 
x = (0:0.01:pi);

switch volba
    % je mozno psat na jeden radek
    case 1, plot(x, sin(x));
    % pro obsahlejsi blok programu lze zapsat na vice radku
    case 2
        plot(x,cos(x));
        grid on;
    otherwise, disp('spatna volba');
end

%% for loop
clear;
clc;

for i=1:4
    disp('Ahoj Svete!');
end

% for loop na jeden radek
% for i=1:5, disp('Ahoj z jednoho radku!'), end

% vektor pseudo-nahodnych cisel o velikost 5
x = rand(1,5);

% delka vektoru x
n = length(x);
xSum = 0;
for i=1:n
    xSum = xSum + x(i);
end
xSum

% xp = xSum / n;
% mean(x);

%% while loop
clear;
clc;

x = rand(1,5);
n = length(x);

i = 1;
xSum = 0;
while(n>=i)
    xSum = xSum + x(i);
    i = i + 1;
end
xSum

i = n;
xSum = 0;
while(i>0)
    xSum = xSum + x(i);
    i = i - 1;
end
xSum

%% break, continue
clear;
clc;

disp('Program pro soucet cisel, cislo -5 zastavi program, cislo 1 preskoci nad dalsi ietraci')
sumA = 0;
while(1)
    a = input('Zadejte cislo: ');
    if(a == 5)
        break
    elseif(a == 1)
        continue
    else
        disp('Zadana hodnota neni 5 ani 1');
        sumA = sumA + a;
    end
end
sumA

%% VÁŠ VYTVOŘENÝ PROGRAM Z HODINY

%% faktorial priklad - Big test task 3 example
% FOR LOOPS

clear;
clc;

n = input('Vypocet n!, zadejte n = ');

% FAKTORIAL dle: n!=1*2*...*(n-1)*n, def. 0!=1
% 1. method
fakt = 1;
for a=2:n
    fakt = fakt * a;
end

disp(['For - Metoda 1: ', num2str(fakt)]);

% FAKTORIAL dle: n!=n*(n-1)...2*1, def. 0!=1
% 2. method

% ! POZOR ! - úmyslně si přepisuju proměnnou fakt
fakt = n;
if(n~=0)
    fakt = n;
else
    fakt = 1;
end

for a=(n-1):-1:2
    fakt = fakt * a;
end

disp(['For - Metoda 2: ', num2str(fakt)]);

%% faktorial priklad - Big test task 3 example
% WHILE LOOPS

clear;
clc;

n = input('Vypocet n!, zadejte n = ');

% FAKTORIAL dle: n!=1*2*...*(n-1)*n, def. 0!=1
% 1. method
fakt = 1;
i = 1;
while(i<n)
    i = i + 1;
    fakt = fakt * i;
end

disp(['While - Metoda 1: ', num2str(fakt)]);

% FAKTORIAL dle: n!=1*2*...*(n-1)*n, def. 0!=1
% 2. method
% ! POZOR ! - úmyslně si přepisuju proměnnou fakt
fakt = 1;
i = 2;

while(i<=n)
    fakt = fakt * i;
    i = i + 1;
end

disp(['While - Metoda 2: ', num2str(fakt)]);

% FAKTORIAL dle: n!=n*(n-1)...2*1, def. 0!=1
% 3. method
% ! POZOR ! - úmyslně si přepisuju proměnnou fakt
fakt = 1;
i = n;

while(i > 0)
    fakt = fakt * i;
    i = i - 1;
end

disp(['While - Metoda 3: ', num2str(fakt)]);

%% P. Numero 1

clear;
clc; 

disp('Animace SCARA')

% pocet kroku motoru 
n = 50;

% parametry SCARA
L1 = 1;
L2 = 0.8;

% v tomto cviceni pouzijeme linspace a vystup vlozime do matice 2x50
alfa = [linspace(0,180,n) * pi / 180; ...
   linspace(-90,90,n) * pi / 180];

% inicializace viz cviceni 3.
x = zeros(3,n);
y = zeros(3,n);

% zapsani hodnot viz 3. cviceni
x(2,:) = L1 * cos(alfa(1,:));
y(2,:) = L1 * sin(alfa(1,:));

x(3,:) = L1 * cos(alfa(1,:)) + ...
    L2 * cos(alfa(1,:) + alfa(2,:));

y(3,:) = L1 * sin(alfa(1,:)) + ...
    L2 * sin(alfa(1,:) + alfa(2,:));

% rozsireni: simulace fazi polohy ramene manipulatoru
figure(1)
L=L1+L2;

% nastaveni limity os v grafu 
axis([-L,L,-L,L]);

% ! NOVINKA ! - animace pomoci for loop
for i=1:n
    % clear figure
    clf;
    % nastaveni limity os v grafu 
    axis([-L,L,-L,L])
    % drz graf + zapni mrizku
    hold on;
    grid on;
    
    % popis grafu a os
    title('manipulator');
    xlabel('x');
    ylabel('y');
    
    % vykresleni trajektorie
    plot(x(2,:),y(2,:),x(3,:),y(3,:));

    % vykresleni manipulatoru
    plot([x(1,i),x(2,i),x(3,i)], [y(1,i),y(2,i),y(3,i)],'b');
    
    % zakladna
    plot(0,0,'ko','linewidth',5)
    
    % vykresleni kloubu a effektoru jako značka 
    plot(x(2,i),y(2,i),'k.')
    plot(x(3,i),y(3,i),'kd')
    
    % zastavi beh programu na 0.1s
    pause(0.1)
end