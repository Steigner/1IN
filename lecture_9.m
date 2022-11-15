%% subfunkce + global + factorial rekurze + fibonaci rekurze

clear;
clc;

R = fResult(1,2);
S = fSum(3,4);

global x
x = 10;
fGVar; 
x

X = fact(6);

F = fibonaci(10)
F_for = fibonaci_for(10)

function [f] = fibonaci_for(n)
    f(1) = 1;
    f(2) = 1;
    for i = 3:n
        f(i) = f(i-1) + f(i-2);
    end
    f = f(n);
end

function [f] = fibonaci(n)
    if n == 1 || n == 2
        f = 1;
    else
        f = fibonaci(n-1) + fibonaci(n-2);
    end
end

function [x] = fact(n)
    if n == 0
        x = 1;
    else
        x = n * fact(n-1);
    end
end

function fGVar
    global x
    x = 1;
end

function r = fResult(a,b)
    r1 = fSum(a,b);
    r2 = fProd(a,b);
    r = sprintf('\n %d + %d = %d \n %d * %d = %d \n', a,b,r1, a,b,r2);
end

function s = fSum(a, b)
    s = a + b;
end

function p = fProd(a, b)
    p = a * b;
end
