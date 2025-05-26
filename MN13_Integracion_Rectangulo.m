% PROGRAMA DEL METODO DEL RECTANGULO
clear,clc
n = input('Ingrese el numero de particiones: ');
x0 = input('Ingrese el valor de x(0) (inicio del intervalo): ');
xn = input('Ingrese el valor de x(n) (fin del intervalo): ');

funcion_str = input('Ingrese la funcion f(x) a integrar: ', 's');
f = str2func(['@(x) ' funcion_str]);
h = (xn - x0) / n;
s = 0;
x = zeros(1, n);

for i = 1:n
    x(i) = x0 + (i - 1) * h;
    s = s + f(x(i));
end

I = h * s;

fprintf('El valor aproximado de la integral es: %.4f\n', I);
