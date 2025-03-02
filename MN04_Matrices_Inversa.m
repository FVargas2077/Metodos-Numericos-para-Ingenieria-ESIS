% PROGRAMA DE LA INVERSA DE UNA MATRIZ
clc,clear
n = input('Ingrese el orden de la matriz cuadrada: ');
A = zeros(n, n);
disp('Ingrese los elementos de la matriz fila por fila:');
for i = 1:n
    for j = 1:n
        A(i, j) = input(['Ingrese el elemento A(', num2str(i), ',', num2str(j), '): ']);
    end
end
if det(A) ~= 0
    C = eye(n);
    for i = 1:n
        p = A(i, i);
        for j = i:n
            A(i, j) = A(i, j) / p;
        end
        for j = 1:n
            C(i, j) = C(i, j) / p;
        end
        j=1;
        while j <= n
            if (j ~= n) || (i ~= j)
                if i ~= j
                    f = -A(j, i);
                    for R = i:n
                        A(j, R) = A(j, R) + f * A(i, R);
                    end
                    for R = 1:n
                        C(j, R) = C(j, R) + f * C(i, R);
                    end
                end
            end
            j=j+1;
        end
    end
    disp('La matriz inversa es:');
    disp(C);
else
    disp('La matriz no tiene inversa.');
end