%% Projistotu - Priorita operatoru

% zavorky ()
% transpozice ('), mocnina (^)
% nasobeni a deleni po prvku (.*), (./), (.\), maticove nasobeni a deleni (*), (/), (\)
% unarni plus (+), unarni minus (-), logicka negace (~)
% scitani (+), odcitani (-)
% relacni operatory (<), (<=), (>), (>=), (==), (~=)
% logicke AND (&), logické OR (|)
% operator prirazeni (=)

% QUIZ ktery se muze objevit v testu:
% A=3; B=6;
% (A~=B)&(2-B/A)
% Jaky bude vysledek: logicka 0 nebo 1?

%% Rozsirujici drobnosti

% figure - v zavorce definujeme cislo okna pro vykresleni napr. 2D grafu
figure(1)
plot([1,2],[1,2]);

figure(2)
plot([1,2],[2,2]);

% smaze obrazovku
clc;

% smaze obsah aktivniho figure
clf;

% zastavi beh programu na definovany pocet sekund napr. 2 sekundy
pause(2)

% vypis do command window
disp('Ahoj Svete!')

%% if then konstrukce

% ! Pozor !
% clear a clear all - vymaze vsechny promene, funkce a MEX linky
% taktez se muze objevit v testu otazka

clc;
clear;
clear all;

% definovani promennych ktere budeme pouzivat pro porovnavani
a = 5;
b = 5; 
c = 4;
d = 3;

% jednoducha konstrukce bez else, logika - pokud plati proved blok programu 
% A, pokud neplati neni osetreno
if( a == b )
    disp('a je rovno b');
end

% rozsirenejsi konstrukce s else, logika - pokud plati proved blok programu 
% A pokud neplati vse spadne do bloku programu B
if(a == b)

    % blok programu A
    disp('a je rovno b');

else
    
    % blok programu B
    disp('a neni rovno b');

end

% && = a soucasne
if (a == b && c == d)
    % proved blok programu
    disp('plati');
end

% || = a nebo
if (a == b || c == d)
    % proved blok programu
    disp('plati nebo');
end

% 1. vygeneruje cislo od 0 do 1
% 2. vynasobi 10 kdy dostaneme cisla od 0 do 10
% 3. zaokrouhli nami vygenerovane cislo
rnd = round(rand*10);
if(rnd / 2 == round(rnd/2))
    disp('jedna o sude');
else
    disp('jedna se o liche cislo');
end

%% transpose

% generovani 'nahodne' ctvercove matice 2x2 s hodnotami od 0 do 10
M = round(rand(2)*10)

% vse je transpozice viz matlab docs.
transpose(M)
M'

% porovnej jestli M1 transponovane je rovno mataci M netransponovane
M1 = transpose(M)
M == M1

%% komplexni cisla

% ! pozor ! 
% nezamenujte 2i s 2 * i - prvni varianta jednoznace urcuje komplexni cislo
% kde i reprezentuje imaginarni cast kdezto druha varinta bere i jako
% promennou a nasobime 2
K = [2 - 2i; 1]
K'

%% det, rank, inv, length, size
clear;
clc;

% 2x2 matice
M = [4, 7; 2, 7];

% determinant matice
det(M)

% generovani 'nahodne' ctvercove matice 4x4 s hodnotami od 0 do 10
N = round(rand(4)*10)

% inverze matice alternativa = N^(-1)
inv(N)

% hodnost matice
rank(N)

t = 1:100
% ziskame delku vektoru / matice
length(N)

% vhodnejsi pro matice je funkce size
size(N)

%% min, max, mean, median
clear;
clc;

a = [4,1:4]
min(a)
max(a)

% ! POZOR ! 
% Zde se omlouvam jestli sem to prehazoval nejak sem zpetne si to sam
% neuvedomoval. Diky

% prumerna hodnota
mean(a)

% stredni hodnota
median(a)

%% sort

% setrid vektor sestupne
sort(a,"descend")

% setrid vektor vzestupne
sort(a,"ascend")

%% sum, prod

% suma vektoru
sum(a)

% suma matice prvku
m = [1,4;3,4];
sum(m, 2)

% soucin matice prvku
prod(a)

%% rovnice
% zadani viz. tabule
A = [1,1;-1,2];
b = [3;5];

% zmena formatu na zlomky
% klasik
format rational
x = A\b
x = inv(A) * b
x = A^(-1) * b

% transpozice
x = (b' / A')'
x = (b'*inv(A'))'

% Cramerovo pravidlo 
A1=[b,A(:,2)];
A2=[A(:,1),b];

detA=det(A);
detA1=det(A1);
detA2=det(A2);

x1=detA1/detA
x2=detA2/detA

%% Priklad numero 1

clear;
clc;

% v tomto cviceni chceme 50 prvku oproti 2. cviceni kde bylo defaultne 100
% prvku
n = 50;

% delka jednotlivych ramen 
L1 = 1;
L2 = 0.8;

% v tomto cviceni pouzijeme linspace a vystup vlozime do matice 2x50
alfa = [linspace(0,180,n) * pi / 180; ...
   linspace(-90,90,n) * pi / 180];

% predpripravime si matice 3x50, do techto budeme zapisovat vysledky -
% urychli to beh programu
x = zeros(3,n);
y = zeros(3,n);

% stejne vzorce tak jako ve cviceni druhem avsak zapisujeme si do
% predprivanych matici x a y 
x(2,:) = L1 * cos(alfa(1,:));
y(2,:) = L1 * sin(alfa(1,:));

x(3,:) = L1 * cos(alfa(1,:)) + ...
    L2 * cos(alfa(1,:) + alfa(2,:));

y(3,:) = L1 * sin(alfa(1,:)) + ...
    L2 * sin(alfa(1,:) + alfa(2,:));

% vytvoreni prvniho okna do ktereho vykreslime graf, ktery je totozny ze
% druheho cviceni
figure(1)
plot(x(2,:),y(2,:),x(3,:),y(3,:))
% mrizka
grid on

% vytvoreni druheho okna do ktereho vykreslime graf s polohami kloubu
% vykreslime faze polohy ramene manipulatoru
% zkratky b - blue, o - red circle markers, 'r*' - red star, 
% 'g*' - green star 
figure(2)
hold on
plot(x,y,'b')
plot(0,0,'ro')
plot(x(2,:),y(2,:), 'r*')
plot(x(3,:),y(3,:), 'g*')
grid on
