clc;
clear;
n = input('Ingrese el grado del polinomio: ');
XR = input('Ingrese el valor de la abscisa: ');
x = zeros(1, n+1);
y = zeros(1, n+1);
for i = 1:n+1
    fprintf('Ingrese x(%d): ', i-1);
    x(i) = input('');
    fprintf('Ingrese y(%d): ', i-1);
    y(i) = input('');
end
YR = 0;
for i = 1:n+1
    NL = 1;
    DL = 1;
    j=1;
    while j<=n+1
        if i~=j || j~=n+1
            if i==j
                j=j+1;
            end
            NL = NL * (XR - x(j));
            DL = DL * (x(i) - x(j));
        end
        j=j+1;
    end
    YR = YR + (NL / DL) * y(i);
end
fprintf('La ordenada estimada YR = %.4f\n', YR);