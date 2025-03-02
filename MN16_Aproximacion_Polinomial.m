clc;
clear;
n = input('Ingrese el numero de puntos muestrales: ');
m = input('Ingrese el grado del polinomio de aproximacion: ');
x = zeros(1, n);
y = zeros(1, n);
S = 0;
for i = 1:n
    x(i) = input(['Ingrese el valor de x(', num2str(i), '): ']);
    y(i) = input(['Ingrese el valor de y(', num2str(i), '): ']);
    S = S + y(i);
end
S_k = zeros(1, 2 * m + 1);
for k = 0:2 * m
    for i = 1:n
        S_k(k + 1) = S_k(k + 1) + x(i)^k;
    end
end
C = zeros(m + 1, 1);
for k = 0:m
    for i = 1:n
        C(k + 1) = C(k + 1) + x(i)^k * y(i);
    end
end
D = zeros(m + 1, m + 1);
for i = 1:m + 1
    for j = 1:m + 1
        D(i, j) = S_k(i + j - 1);
    end
end
A = D \ C;
fprintf('El polinomio de aproximacion es:\n');
for k = 0:m
    if k == 0
        fprintf('y = %.4f', A(k + 1));
    else
        fprintf(' + %.4fx^%d', A(k + 1), k);
    end
end
fprintf('\n');
SM = 0;
SR = 0;
YR = S / n;
for i = 1:n
    SM = SM + (y(i) - YR)^2;
    YP = 0;
    for k = 0:m
        YP = YP + A(k + 1) * x(i)^k;
    end
    SR = SR + (y(i) - YP)^2;
end
RR = (SM - SR) / SM;
R = sqrt(RR);
fprintf('RR: Coeficiente de dispersion: %.4f\n', RR);
fprintf('R: Coeficiente de correlacion: %.4f\n', R);