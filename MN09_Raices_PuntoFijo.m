clear,clc
x(1) = input('Ingresa la aproximacion inicial: ');
e = input('Ingresa el error permisible: ');
num = input('Ingresa el numero maximo de iteraciones: ');
fr_str = input('Ingresa la funcion equivalente para f(x): ', 's');
fr = str2func(['@(x)', fr_str]);

i = 1;
k = 0;

while k == 0
    x(i+1) = fr(x(i));
    if abs(x(i+1) - x(i)) < e
        r = x(i+1);
        fprintf('La raiz buscada es: %.4f\n', r);
        k = 1;
    else
        if i < num
            i = i + 1;
        else
            fprintf('El metodo no converge: x(%d) = %.4f, x(%d) = %.4f\n', i, x(i+1), i-1, x(i));
            k = 1;
        end
    end
end
