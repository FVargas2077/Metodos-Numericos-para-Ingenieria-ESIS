% PROGRAMA PARA HALLAR GAUSS JORDAN
clc,clear
n = input('Ingrese el orden de la matriz cuadrada: ');
A = zeros(n, n);
disp('Ingrese los elementos de la matriz A fila por columna:');
for i = 1:n
    for j = 1:n
        A(i, j) = input(['Ingrese el elemento A(', num2str(i), ',', num2str(j), '): ']);
    end
end
b = zeros(n, 1);
disp('Ingrese los elementos del vector B:');
for i = 1:n
    b(i) = input(['Ingrese el elemento B(', num2str(i), '): ']);
end
for i = 1:n
    p = A(i, i);
    for j = i:n
        A(i, j) = A(i, j) / p;
    end
    b(i) = b(i) / p;
    j = 1;
    while j <= n
        if (j ~= n) || (j ~= i)
            if i ~= j
                f = -A(j, i);
                for R = i:n
                    A(j, R) = A(j, R) + f * A(i, R);
                end
                b(j) = b(j) + f * b(i);
            end
        end
        j = j + 1;
    end
end
disp('La solucion es: ');
disp(b);
