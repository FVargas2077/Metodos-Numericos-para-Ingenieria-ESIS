% PROGRAMA PARA HALLAR METODO DE LA BISECCION
clc,clear
func_str = input('Ingrese la funcion f(x): ', 's');
f = str2func(['@(x)', func_str]);
a = input('Ingrese el valor del limite inferior a: ');
b = input('Ingrese el valor del limite superior b: ');
e = input('Ingrese el error permisible e: ');

k = 0;

while k == 0
    c = (a + b) / 2;

    if f(a) * f(c) <= 0
        if f(a) * f(c) == 0
            if f(a) == 0
                r = a;
            else
                r = c;
            end
            disp('La raiz aproximada es: ');
            disp(r);
            k = 1;
        else
            b = c;
        end
    else
        a = c;
    end

    if k == 0
        if abs(b - a) < e
            r = (a + b) / 2;
            disp('La raiz aproximada es: ');
            disp(r);
            k = 1;
        end
    end
end
