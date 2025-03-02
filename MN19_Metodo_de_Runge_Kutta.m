clc;
clear;
n = input('Ingrese el numero de subintervalos: ');
x0 = input('Ingrese el valor inicial de x: ');
y0 = input('Ingrese el valor inicial de y: ');
xn = input('Ingrese la abcisa donde se desea calcular y: ');
func_str = input('Ingrese la funcion f(x, y): ', 's');
f = str2func(['@(x, y)', func_str]);
H = (xn - x0) / n;
yi = y0;
xi = x0;
for i = 1:n
    K1 = f(xi, yi);
    K2 = f(xi + H/2, yi + H/2 * K1);
    K3 = f(xi + H/2, yi + H/2 * K2);
    K4 = f(xi + H, yi + H * K3);
    yi = yi + H/6 * (K1 + 2*K2 + 2*K3 + K4);
    xi = x0 + i * H;
end
fprintf('La ordenada aproximada es: %.4f\n', yi);
