% PROGRAMA DE SUMA DE MATRICES
clear,clc
m = input('Introduce el numero de filas (m): ');
n = input('Introduce el numero de columnas (n): ');

A = zeros(m, n);
B = zeros(m, n);

disp('Introduce los elementos de la matriz A:');
for i = 1:m
    for j = 1:n
        A(i, j) = input(['A(', num2str(i), ',', num2str(j), '): ']);
    end
end

disp('Introduce los elementos de la matriz B:');
for i = 1:m
    for j = 1:n
        B(i, j) = input(['B(', num2str(i), ',', num2str(j), '): ']);
    end
end

C = zeros(m, n);

for i = 1:m
    for j = 1:n
        C(i, j) = A(i, j) + B(i, j);
    end
end

disp('La suma de las matrices A y B es:');
disp(C);