%% char, ischar, strcmp, strcat, sprintf

A = 65;
pom = char(A);

T = (64:128);
char(T)

ischar(pom);

'ANO' == 'ONE'

strcmp('ANO','ANO')
strcat('Red','bull')

fprintf('Zaklad prirozenych logaritmu e = %.3d \n', exp(1));
pom2 = sprintf('Zaklad prirozenych logaritmu e = %f \n', exp(1))

%% diagram funkce
clear;
clc;

r = diagram


%% function
clear;
clc;

% ABS = 50;
% stat(ABS)
% 
% r = rand(1,10);
% [m, ~] = statistics(r)

x = rand(1,10);
y = rand(1,10);
q = rand(1,10);
z = rand(1,10);

% r = fc1(q,x,y)
r = fc2(y,z,q)

function [result] = fc2(y,z,q)
    N = length(y);
    M = length(q);
    s1 = 0;
    s2 = 0;
    for i=2:N-1
        s1 = s1 + (y(i) * y(i+1));
    end
    for i=2:M-1
        s2 = s2 + ((q(i) + z(i+1)) * ((5 - q(i-1) - z(i-1))));
    end
    result = s1 / s2;
end

function [result] = fc1(q,x,y)
    N = length(x);
    M = length(q);
    s = 0;
    for i = 1:N -1
        s = s + x(i) + 3*y(i+1);
    end
    p = 1;
    for i = 1:M
        p = p * q(i) * q(i);
    end
    result = s - p;
end

function [mean, stdev] = statistics(x)
    n = length(x);
    mean = sum(x) / n;
    stdev = sqrt(sum((x-mean).^2) / n);
end

function stat(x)
    disp(x)
end
