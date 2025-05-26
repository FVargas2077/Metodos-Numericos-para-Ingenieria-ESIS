% PROGRAMA DEL METODO DE TRAPECIO
clear,clc
n = input('Ingrese el numero de particiones: ');
x0 = input('Ingrese el valor de x(0): ');
xn = input('Ingrese el valor de x(n): ');
funcion_str = input('Ingrese la funcion f(x) a integrar: ', 's');
f = str2func(['@(x) ' funcion_str]);

h = (xn - x0) / n;

s = 0;
x = zeros(1, n);

for i = 2:n
    x(i) = x0 + (i - 1) * h;
    s = s + f(x(i));
end

I = (h / 2) * (f(x0) + 2 * s + f(xn));

fprintf('El valor aproximado de la integral es: %.4f\n', I);
