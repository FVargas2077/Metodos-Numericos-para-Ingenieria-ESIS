clc;
clear;
n = input('Ingrese el numero de subintervalos: ');
x0 = input('Ingrese el valor inicial de x: ');
y0 = input('Ingrese el valor inicial de y: ');
xn = input('Ingrese la abcisa donde se desea calcular y: ');
func_str = input('Ingrese la funcion f(x, y): ', 's');
f = str2func(['@(x, y)', func_str]);
H = (xn - x0) / n;
yi=y0;
xi=x0;
for i = 1:n
    y_sig = yi + H * f(xi, yi);
    xi = x0 + i * H;
    yi = yi + H/2 * (f(xi - H, yi) + f(xi, y_sig));
end
fprintf('La ordenada aproximada es: %.4f\n', yi);