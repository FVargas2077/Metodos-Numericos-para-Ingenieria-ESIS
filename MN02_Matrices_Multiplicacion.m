% PROGRAMA DE MULTIPLICACION DE MATRICES
clear,clc
m = input('Introduce el numero de filas de la primera matriz (m): ');
n = input('Introduce el numero de columnas de la primera matriz (n): ');
p = input('Introduce el numero de filas de la segunda matriz (p): ');
q = input('Introduce el numero de columnas de la segunda matriz (q): ');

if n == p
    A = zeros(m, n);
    B = zeros(p, q);

    disp('Introduce los elementos de la matriz A:');
    for i = 1:m
        for j = 1:n
            A(i, j) = input(['A(', num2str(i), ',', num2str(j), '): ']);
        end
    end
    disp('Introduce los elementos de la matriz B:');
    for i = 1:p
        for j = 1:q
            B(i, j) = input(['B(', num2str(i), ',', num2str(j), '): ']);
        end
    end
    C = zeros(m, q);
    for i = 1:m
        for j = 1:q
            C(i, j) = 0;
            for R = 1:n
                C(i, j) = C(i, j) + A(i, R) * B(R, j);
            end
        end
    end

    disp('El resultado de la multiplicacion de A y B es:');
    disp(C);
else
    disp('No se puede multiplicar, el numero de columnas de A no coincide con el numero de filas de B.');
end