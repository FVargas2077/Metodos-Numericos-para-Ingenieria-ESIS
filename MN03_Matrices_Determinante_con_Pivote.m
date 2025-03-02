%PROGRAMA DE DETERMINANTE DE UNA MATRIZ CON PIVOTE
clear,clc
n = input('Ingrese el orden de la matriz cuadrada (n): ');
A = zeros(n, n);
disp('Ingrese los elementos de la matriz fila por fila:');
for i = 1:n
    for j = 1:n
        A(i, j) = input(['A(', num2str(i), ',', num2str(j), '): ']);
    end
end
d = 1;
for i = 1:n-1
    d = d * A(i, i);
    p = A(i, i);
    for j = i:n
        A(i, j) = A(i, j) / p;
    end
    for j = i+1:n
        f = -A(j, i);
        for R = i:n
            A(j, R) = A(j, R) + f * A(i, R);
        end
    end
end
d = d * A(n, n);
disp('El determinante de la matriz es: ');
disp(d);