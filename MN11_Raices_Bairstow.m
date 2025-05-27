% METODO DE BAIRSTOW
% CREDITOS:
% * Nestor Alarcon Luque (Desarrollador Principal)
% * Fabian Vargas Quispe (Desarrollador de Interfaz de Usuario y Tester)
clc, clear;
n = input('Introduce el orden de la matriz: ');
error = input('Ingresa el error permisible (e): ');
num = input('Ingresa el numero maximo de iteraciones: ');

disp('Ingresa vector de coeficientes: ');
for i=1:n+1
    a(i) = input(['Ingrese A(', num2str(i-1), '): ']);
end

u = input('Ingrese u: ');
v = input('Ingrese v: ');

k = 1;
j = 1;
m = n;

while n > 2
    if k > num
        u = input('Ingrese nuevo valor para u: ');
        v = input('Ingrese nuevo valor para v: ');
        k = 1;
    end

    b(1) = 0;
    b(2) = 0;

    for i = 3:n+3
        b(i) = a(i-2) + u * b(i-1) + v * b(i-2);
    end

    c(1) = 0;
    c(2) = 0;

    for i = 3:n+2
        c(i) = b(i) + u * c(i-1) + v * c(i-2);
    end

    D = ((b(n+3) * c(n) - b(n+2) * c(n+1)) / (c(n+1)^2 - c(n+2) * c(n)));
    E = ((b(n+2) * c(n+2) - b(n+3) * c(n+1)) / (c(n+1)^2 - c(n+2) * c(n)));

    u = u + D;
    v = v + E;

    if abs(D) < error && abs(E) < error

        x(j) = (u + (sqrt(u^2 + 4 * v))) / 2;
        x(j+1) = (u - (sqrt(u^2 + 4 * v))) / 2;
        j = j + 2;
        n = n - 2;
        for i = 1:n+1
            a(i) = b(i+2);
        end
        k = 1;
        u = input('Ingrese nuevo valor para u: ');
        v = input('Ingrese nuevo valor para v: ');
    else
        k = k + 1;
    end
end

if n > 1
    A1 = a(1);
    B1 = a(2);
    C1 = a(3);

    x(j) = (-B1 + sqrt(B1^2 - 4 * A1 * C1)) / (2 * A1);
    x(j+1) = (-B1 - sqrt(B1^2 - 4 * A1 * C1)) / (2 * A1);
else
    if n > 0
        x(j) = -b(4) / b(3);
    end
end

disp('Raíces encontradas:');
for i = 1:length(x)
    fprintf('x(%d) = %.4f\n', i, x(i));
end
