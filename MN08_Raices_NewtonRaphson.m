clc;
clear;
x(1) = input('Ingrese la aproximacion inicial: ');
e = input('Ingrese el error permisible: ');
num = input('Ingrese el numero maximo de iteraciones: ');
funcion_str = input('Ingrese la funcion f(x): ', 's');
f = str2func(['@(x) ' funcion_str]);
derivada_str = input('Ingrese la derivada f''(x): ', 's');
df = str2func(['@(x) ' derivada_str]);
i = 1;
k = 0;
while k == 0
    x(i+1) = x(i) - f(x(i)) / df(x(i));
    if abs(x(i+1) - x(i)) < e
        r = x(i+1);
        fprintf('La raiz buscada es: %.4f\n', r);
        k = 1;
    else
        if i < num
            i = i + 1;
        else
            fprintf('El metodo no converge: x(%d) = %.4f, x(%d) = %.4f\n', i, x(i+1), i-1, x(i));
            k = 1;
        end
    end
end