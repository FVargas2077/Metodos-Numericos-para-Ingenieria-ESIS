% PROGRAMA DE SISTEMAS DE ECUACIONES NO LINEALES CON EL METODO DE NEWTON
clc;
clear;

n = input('Ingrese el orden del sistema: ');
er = input('Ingrese el error permisible: ');
num = input('Ingrese el numero maximo de iteraciones: ');
disp('Ingrese las funciones no lineales F(x):');
F = cell(1, n);
for i = 1:n
    func_str = input(sprintf('F(x)(%d) = ', i), 's');
    F{i} = str2func(['@(x,y) ' func_str]);
end
disp('Ingrese la matriz jacobiana JA(F(x)):');
JA = cell(n, n);
for i = 1:n
    for j = 1:n
        jac_str = input(sprintf('JA(F(x))(%d,%d) = ', i, j), 's');
        JA{i, j} = str2func(['@(x,y) ' jac_str]);
    end
end
X = zeros(n, 1);
disp('Ingrese la primera aproximacion X(0):');
for i = 1:n
    X(i) = input(sprintf('X(0)(%d) = ', i));
end
h = 1;
k = 0;

while k == 0
    J_val = zeros(n, n);
    F_val = zeros(n, 1);
    for i = 1:n
        F_val(i) = F{i}(X(1), X(2));
        for j = 1:n
            J_val(i, j) = JA{i, j}(X(1), X(2));
        end
    end
    S = -J_val \ F_val;
    Y = X;
    X = X + S;
    max_val = abs(S(1));
    for i = 2:n
        if abs(S(i)) > max_val
            max_val = abs(S(i));
        end
    end
    if max_val < er
        k = 1;
        disp('Conjunto solucion encontrado:');
        for i = 1:n
            fprintf('x(%d) = %.6f\n', i, X(i));
        end
    else
        if h < num
            h = h + 1;
        else
            k = 1;
            disp('No converge.');
            for i = 1:n
                fprintf('x(%d) = %.4f, y(%d) = %.4f\n', i, X(i), i, Y(i));
            end
        end
    end
end