% PROGRAMA PARA HALLAR TRIANGULACION SUPERIOR DE GAUSS
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

for i = 1:n-1
    p = A(i, i);
    for j=i:n
        A(i, j) = A(i, j) / p;
    end
    b(i) = b(i) / p;
    for j = i+1:n
        f = -A(j, i);
        for R = i:n
            A(j, R) = A(j, R) + f * A(i, R);
        end
        b(j) = b(j) + f * b(i);
    end
end

X = zeros(n, 1);
X(n) = b(n) / A(n, n);

for i = n-1:-1:1
    S = 0;
    for R = i+1:n
        S = S + A(i, R) * X(R);
    end
    X(i) = b(i) - S;
end

disp('La solucion es:');
disp(X);