% PROGRAMA DE DETERMINANTE DE UNA MATRIZ SIN PIVOTE
clear,clc
n = input('Introduce el orden de la matriz cuadrada: ');
A = zeros(n, n);
disp('Ingrese los elementos de la matriz fila por fila:');
for i = 1:n
    for j = 1:n
        A(i, j) = input(['Ingrese el elemento A(', num2str(i), ',', num2str(j), '): ']);
    end
end

d = 1;

for i = 1:n-1
    for j = i+1:n
        f = -A(j,i) / A(i,i);
        for R = i:n
            A(j,R) = A(j,R) + f * A(i,R);
        end
    end
end

for i = 1:n
    d = d * A(i,i);
end

disp('La determinante de la matriz es: ');
disp(d);
