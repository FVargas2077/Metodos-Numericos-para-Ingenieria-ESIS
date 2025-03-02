clc;
clear;
n = input('Ingrese el numero de subintervalos: ');
x0 = input('Ingrese el valor de x(0): ');
xn = input('Ingrese el valor de x(n): ');
func_str = input('Ingrese la funcion f(x): ', 's');
f = str2func(['@(x)', func_str]);
h = (xn - x0) / n;
S1 = 0;
S2 = 0;
for i = 1:n-1
    xi = x0 + i * h;
    if mod(i, 2) == 0
        S2 = S2 + f(xi);
    else
        S1 = S1 + f(xi);
    end
end
I = (h / 3) * (f(x0) + 4 * S1 + 2 * S2 + f(xn));
fprintf('El valor aproximado de la integral es: %.4f\n', I);
