%% Ukol numero 1

% Uzivatel postupne zadava cisla, ktera se budou ukladat do pole R. Pri zadani cisla 0.123 
% se zadavani cisel ukonci, rovnez se zadavani ukonci pokud bude zadano cislo 10. 

R = [];
while 1
    x = input('Zadejte cislo: ');
    if x == 0.123 || x == 10
        break
    else
        R = [R, x];
    end
end

% Naprogramujte funkci mean ve vasem skriptu, tj. po nacteni cisel se provede 
% vypocet prumerne hodnoty dle vaseho vlastniho algoritmu.

mean_ = 1 / length(R) * sum(R);

% Zadanou posloupnost zobrazte jako bar graf.

bar(R);

% V danem grafu zobrazte horizontalni carou prumernou hodnotu.

yline(mean_,'r');

% V danem grafu zobrazte horizontalni carou median.

median_ = median(R);

yline(median_, 'g');

% Vytvorte popisku grafu

legend('data', 'mean', 'median');

%% Ukol numero 2

% Vytvorte program, ktery bude resit kvadratickou rovnici: 
%   - Pozadujeme zadani koeficientu kvadraticke rovnice z klavesnice.
%   - Pokud bude vysledek v realnem oboru, vykreslime dane reseni.

% Napoveda:
% Kvadraticka rovnice je tvaru ax^2 + bx + c = 0.
% Zadejte koeficient a: 10
% Zadejte koeficient b: -20
% Zadejte koeficient c: -30
% Bylo zadano: 10.0x^2+-20.0x+-30.0=0
% vypocteny koreny: 3, -1

% !! Reseni ukolu 2 !!

clear; 
clc;
clf;

disp('Kvadraticka rovnice je tvaru ax^2+bx+c=0.')
disp('-----------------------------------------')

a = input('Zadejte koeficient a: ');
b = input('Zadejte koeficient b: ');
c = input('Zadejte koeficient c: ');

fprintf('Bylo zadano: %3.1fx^2+%3.1fx+%3.1f=0 \n\n', a, b, c)

D=b*b-4*a*c;

% jede z moznych zpusobu, vyuziji funkci roots z minuleho cvika
p = [a,b,c];
X = roots(p);
disp('Vypocteny koreny:'), disp(X);

% druhy zpusob
% X(1,:)=(-b + sqrt(D)) / (2*a);
% X(2,:)=(-b - sqrt(D)) / (2*a);

x = sort(X);
t = linspace(real(x(1)) - 1, real(x(2)) + 1, 20);
y = polyval(p, t);

plot(t,y);

xlabel('x');
ylabel('y=p(x)');
hold on;
grid on;

% nalezeni vrcholu paraboly
dp = polyder(p);
dy = polyval(dp,t);
vrchol_x = roots(dp); 
vrchol_y = polyval(p, vrchol_x);
plot(t, dy, 'g:', vrchol_x, vrchol_y, 'k^');

if D >= 0
    % zobrazeni korenu
    plot(x, [0,0], 'r*')
    legend('p(x)', 'roots', 'dp/dx', 'vrchol' )
else
    legend('p(x)', 'dp/dx', 'vrchol') 
end

%% Ve cviceni

% V ramci cviceni byl probran datovy typ char, string
s1=input('vstup: ');
whos s1

% Pak bylo vysvetleno pouziti funkce save, load pro ukladani promennych ze
% workspace.

save('data2017')
load('data2017')

% Nasledovalo pouziti funkce mod pro identifikaci sudeho / licheho cisla
x = [1,2,3,4,5,6,7,8,9];
mod(x,2) == 0
mod(x,2) == 1

% Dale byl vysvetlen vystup formatovaného textu pomoci fprintf

% ridici sekvence
% \n new line (nový řádek)
% \b backspace
% \t horizontal tab
% \\ backslash
% %% znak procenta

% datovy typ konverze popis / funkce
% Integer, signed %d | %i Base 10
% Integer, uint %u        Base 10
%          %o             Base 8
%          %x | %X        Base 16
% Floating-point %f Fixed-point notation
%                %e |%E Exponential notation (exp tvar)
%                %g |%G Automaticka volba mezi %f a %g
% Characters %c Jeden znak (character)
%            %s Pole znaků (string)

fprintf('Zaklad prirozenych logaritmu e=%f',exp(1))


%% fprintf do souboru

% 'r' open file for reading
% 'w' open file for writing; discard existing contents
% 'a' open or create file for writing; append data to eof
% 'r+' open (do not create) file for reading and writing

fid = fopen('tabSin.txt','wt');

x = (0:45:360); 
y = sin(x/180*pi);

x(1,:) = x; 
x(2,:) = y;

fprintf(fid,'sin(x°) value \n');
fprintf(fid,'sin(%3i°)=%6.3f \n',x);

fclose(fid);
